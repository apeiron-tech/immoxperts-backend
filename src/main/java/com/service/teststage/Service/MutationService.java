package com.service.teststage.Service;



import com.service.teststage.Entity.*;
import com.service.teststage.Repository.AdresseLocalRepository;
import com.service.teststage.Repository.AdresseRepository;
import com.service.teststage.Repository.DispositionParcelleRepository;
import com.service.teststage.Repository.MutationRepository;
import com.service.teststage.dto.MutationDTO;
import jakarta.persistence.criteria.Predicate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.retry.annotation.Backoff;
import org.springframework.retry.annotation.Retryable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.transaction.annotation.Isolation;

import java.math.BigDecimal;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Service
@CacheConfig(cacheNames = "mutations")
public class MutationService {

    @Autowired
    private MutationRepository mutationRepository;
    @Autowired
    private AdresseLocalRepository adresseLocalRepository;
    @Autowired
    private AdresseRepository adresseRepository;
    @Autowired
    private DispositionParcelleRepository dispositionParcelleRepository;
    private static final Map<String, String> TYPE_VOIE_MAPPING = Map.ofEntries(
            Map.entry("COURS", "CRS"),
            Map.entry("BOULEVARD", "BD"),
            Map.entry("AVENUE", "AV"),
            Map.entry("RUE", "RUE"),
            Map.entry("PLACE", "PL"),
            Map.entry("PASSAGE", "PASS"),
            Map.entry("IMPASSE", "IMP"),
            Map.entry("ALLEE", "ALL"),
            Map.entry("CHEMIN", "CHE"),
            Map.entry("ROUTE", "RTE"),
            Map.entry("SQUARE", "SQ"),
            Map.entry("GALERIE", "GAL"),
            Map.entry("RESIDENCE", "RES"),
            Map.entry("QUAI", "QUAI"),
            Map.entry("QUARTIER ", "QRT")
    );
    public List<MutationDTO> getMutationsByAdresseId(Integer idadresse) {

        List<Mutation> mutations = mutationRepository.findByAdresseId(idadresse);

        return mutations.stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }

   public List<MutationDTO> searchMutations(String novoieStr, String voie) {
        // Early return if both inputs are empty
        if ((novoieStr == null || novoieStr.trim().isEmpty()) && 
            (voie == null || voie.trim().isEmpty())) {
            return Collections.emptyList();
        }

        // Parse number and complement in one pass
        final Integer novoie;
        final String btq;
        {
            Integer parsedNovoie = null;
            String parsedBtq = null;
            
            if (novoieStr != null && !novoieStr.trim().isEmpty()) {
                String trimmed = novoieStr.trim();
                int i = 0;
                while (i < trimmed.length() && Character.isDigit(trimmed.charAt(i))) {
                    i++;
                }
                if (i > 0) {
                    try {
                        parsedNovoie = Integer.parseInt(trimmed.substring(0, i));
                        if (i < trimmed.length()) {
                            String complement = trimmed.substring(i).toUpperCase();
                            if (complement.equals("B") || complement.equals("BIS")) {
                                parsedBtq = "BIS";
                            } else if (complement.equals("T") || complement.equals("TER")) {
                                parsedBtq = "TER";
                            } else {
                                parsedBtq = complement;
                            }
                        }
                    } catch (NumberFormatException ignored) {
                        // Keep null values
                    }
                }
            }
            novoie = parsedNovoie;
            btq = parsedBtq;
        }

        // Process voie more efficiently
        final String typvoie;
        final String voieRestante;
        {
            String foundTypvoie = null;
            String foundVoieRestante = null;
            
            if (voie != null && !voie.trim().isEmpty()) {
                String voieTrimmed = voie.trim().toUpperCase();
                
                for (Map.Entry<String, String> entry : TYPE_VOIE_MAPPING.entrySet()) {
                    String typeVoieKey = entry.getKey();
                    if (voieTrimmed.startsWith(typeVoieKey)) {
                        foundTypvoie = entry.getValue();
                        foundVoieRestante = voieTrimmed.substring(typeVoieKey.length()).trim();
                        break;
                    }
                }
                
                if (foundTypvoie == null && voieTrimmed.contains(" ")) {
                    String firstWord = voieTrimmed.split(" ", 2)[0];
                    foundTypvoie = TYPE_VOIE_MAPPING.getOrDefault(firstWord, firstWord);
                    foundVoieRestante = voieTrimmed.substring(firstWord.length()).trim();
                }
            }
            
            typvoie = foundTypvoie;
            voieRestante = foundVoieRestante;
        }

        // Use Set to avoid duplicates more efficiently
        Set<Mutation> uniqueMutations = new HashSet<>();
        int pageNumber = 0;
        final int pageSize = 1000;
        boolean hasMorePages = true;

        while (hasMorePages) {
            Pageable pageable = PageRequest.of(pageNumber, pageSize);
            
            // Build predicates more efficiently
            Page<Adresse> addressPage = adresseRepository.findAll((root, query, cb) -> {
                List<Predicate> predicates = new ArrayList<>(4); // Pre-allocate with expected size

                if (novoie != null) {
                    predicates.add(cb.equal(root.get("novoie"), novoie));
                }

                if (btq != null) {
                    predicates.add(cb.equal(cb.upper(root.get("btq")), btq));
                }

                if (typvoie != null) {
                    predicates.add(cb.equal(cb.upper(root.get("typvoie")), typvoie));
                }

                if (voieRestante != null) {
                    predicates.add(cb.like(cb.upper(root.get("voie")), "%" + voieRestante + "%"));
                }

                return predicates.isEmpty() ? cb.conjunction() : cb.and(predicates.toArray(new Predicate[0]));
            }, pageable);

            // Process addresses in a single pass
            for (Adresse adresse : addressPage.getContent()) {
                if (adresse.getAdresseLocals() != null) {
                    for (AdresseLocal al : adresse.getAdresseLocals()) {
                        if (al.getMutation() != null) {
                            uniqueMutations.add(al.getMutation());
                        }
                    }
                }
                if (adresse.getAdresseDispoparcs() != null) {
                    for (AdresseDispoparc adp : adresse.getAdresseDispoparcs()) {
                        if (adp.getMutation() != null) {
                            uniqueMutations.add(adp.getMutation());
                        }
                    }
                }
            }

            hasMorePages = addressPage.hasNext();
            pageNumber++;
        }

        // Convert to DTOs
        List<MutationDTO> result = new ArrayList<>(uniqueMutations.size());
        for (Mutation mutation : uniqueMutations) {
            result.add(convertToDTO(mutation));
        }
        
        return result;
    }

    @Cacheable(
        value = "mutations",
        key = "#street + '-' + #commune + '-' + #pageable.pageNumber + '-' + #pageable.pageSize + '-' + #pageable.sort",
        unless = "#result == null || #result.isEmpty()",
        condition = "#street != null && #commune != null"
    )
    @Retryable(
        value = { Exception.class },
        maxAttempts = 3,
        backoff = @Backoff(delay = 1000, multiplier = 2)
    )
    @Transactional(readOnly = true, isolation = Isolation.READ_COMMITTED)
    public Page<MutationDTO> searchMutationsByStreetAndCommune(String street, String commune, Pageable pageable) {
        if (street == null || street.trim().isEmpty() || commune == null || commune.trim().isEmpty()) {
            return Page.empty(pageable);
        }

        String normalizedStreet = street.trim().toUpperCase();
        String normalizedCommune = commune.trim().toUpperCase();

        try {
            // First try to get data from materialized view
            Page<Mutation> mutations = mutationRepository.findMutationsByStreetAndCommune(
                normalizedStreet, 
                normalizedCommune,
                pageable
            );

            if (mutations.isEmpty()) {
                // If no results in materialized view, try the full query
                mutations = mutationRepository.findMutationsByStreetAndCommuneFull(
                    normalizedStreet,
                    normalizedCommune,
                    pageable
                );
            }

            return mutations.map(this::convertToDTO);
        } catch (Exception e) {
            // Log the error
            System.err.println("Error searching mutations: " + e.getMessage());
            throw new RuntimeException("Error searching mutations", e);
        }
    }
    public List<MutationDTO> getMutationsByVoie(String voie) {

        List<Adresse> addresses = adresseRepository.findByVoieContainingIgnoreCase(voie);

        // Collect unique mutations from these addresses
        return addresses.stream()
                .flatMap(adresse -> adresse.getAdresseLocals().stream())
                .map(AdresseLocal::getMutation)
                .distinct()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }


    private MutationDTO convertToDTO(Mutation mutation) {
        MutationDTO dto = new MutationDTO();
        dto.setIdmutation(mutation.getIdmutation());
        dto.setDatemut(mutation.getDatemut());
        dto.setValeurfonc(mutation.getValeurfonc());
        dto.setIdnatmut(mutation.getIdnatmut());
        dto.setCoddep(mutation.getCoddep());
        dto.setTerrain(mutation.getSterr());

        List<String> libtyplocList = new ArrayList<>();
        int nbpprincTotal = 0;
        List<String> addresses = new ArrayList<>();

        if (mutation.getAdresseLocals() != null) {
            for (AdresseLocal adresseLocal : mutation.getAdresseLocals()) {
                Local local = adresseLocal.getLocal();
                if (local != null) {
                    String type = local.getLibtyploc();
                    if (type != null && !type.trim().isEmpty()) {
                        // Normalize casing and trim
                        libtyplocList.add(type.trim().toUpperCase());
                    }
                    if (local.getNbpprinc() != null) {
                        nbpprincTotal += local.getNbpprinc();
                    }
                }
            }

            addresses.addAll(mutation.getAdresseLocals().stream()
                    .map(al -> formatAddress(al.getAdresse()))
                    .collect(Collectors.toList()));
        }



        dto.setLibtyplocList(libtyplocList);

        if (mutation.getAdresseDispoparcs() != null) {
            List<String> dispoparcAddresses = mutation.getAdresseDispoparcs().stream()
                    .map(ad -> formatAddress(ad.getAdresse()))
                    .collect(Collectors.toList());
            addresses.addAll(dispoparcAddresses);

            if (addresses.isEmpty() && mutation.getSterr() == null) {
                BigDecimal dcntsolSum = mutation.getAdresseDispoparcs().isEmpty()
                        ? BigDecimal.ZERO
                        : dispositionParcelleRepository.sumDcntsolByIddispopars(
                        mutation.getAdresseDispoparcs().stream()
                                .map(AdresseDispoparc::getIddispopar)
                                .collect(Collectors.toList())
                );

                BigDecimal dcntagrSum = mutation.getAdresseDispoparcs().isEmpty()
                        ? BigDecimal.ZERO
                        : dispositionParcelleRepository.sumDcntagrclByIddispopars(
                        mutation.getAdresseDispoparcs().stream()
                                .map(AdresseDispoparc::getIddispopar)
                                .collect(Collectors.toList())
                );

                dto.setTerrain(dcntagrSum.add(dcntsolSum));
            }
        }
        List<String> normalized = libtyplocList.stream()
                .filter(Objects::nonNull)
                .map(s -> s.trim().toUpperCase())
                .distinct()
                .collect(Collectors.toList());

        if (normalized.size() > 1) {
            dto.setLibtyplocList(Collections.singletonList("BIEN MULTIPLE"));
        } else {
            dto.setLibtyplocList(normalized);
        }


        dto.setNbpprincTotal(nbpprincTotal);
        dto.setAddresses(addresses);

        // Surface
        BigDecimal total = adresseLocalRepository.surfaceMutaion(mutation.getIdmutation());
        dto.setSurface(total != null ? total : BigDecimal.valueOf(0));

        return dto;
    }

    private String formatAddress(Adresse adresse) {
        return Stream.of(
                        adresse.getNovoie(),
                        adresse.getBtq(),
                        adresse.getTypvoie(),
                        adresse.getVoie(),
                        adresse.getCodepostal(),
                        adresse.getCommune()
                )
                .filter(Objects::nonNull)
                .map(Object::toString)
                .collect(Collectors.joining(" "));
    }







    public List<MutationDTO> getMutationsByAdresseId2(Integer idadresse) {
        // Get mutations from both sources

        List<Mutation> mutationsDispo = mutationRepository.findByAdresseDispoParcId(idadresse);

        // Combine and deduplicate
        Set<Mutation> uniqueMutations = new LinkedHashSet<>();

        uniqueMutations.addAll(mutationsDispo);

        // Calculate land sizes
        return uniqueMutations.stream()
                .map(mutation -> {
                    // Get land size for mutations from adresse_dispoparc
                    BigDecimal dcntsolSum = mutation.getAdresseDispoparcs().isEmpty()
                            ? BigDecimal.ZERO
                            : dispositionParcelleRepository.sumDcntsolByIddispopars(
                            mutation.getAdresseDispoparcs()
                                    .stream()
                                    .map(AdresseDispoparc::getIddispopar)
                                    .collect(Collectors.toList())
                    );


                    // Get land size for mutations from adresse_dispoparc
                    BigDecimal dcntagrSum = mutation.getAdresseDispoparcs().isEmpty()
                            ? BigDecimal.ZERO
                            : dispositionParcelleRepository.sumDcntagrclByIddispopars(
                            mutation.getAdresseDispoparcs()
                                    .stream()
                                    .map(AdresseDispoparc::getIddispopar)
                                    .collect(Collectors.toList())
                    );
                    dcntsolSum=dcntagrSum.add(dcntsolSum);
                    return convertToDTO(mutation, dcntsolSum);
                })
                .collect(Collectors.toList());
    }

    private MutationDTO convertToDTO(Mutation mutation, BigDecimal dcntsolSum) {
        MutationDTO dto = new MutationDTO();
        // Existing mappings
        dto.setIdmutation(mutation.getIdmutation());
        dto.setDatemut(mutation.getDatemut());

        dto.setValeurfonc(mutation.getValeurfonc());
        dto.setTerrain(dcntsolSum);
        if (mutation.getAdresseDispoparcs() != null) {
            dto.setAddresses(mutation.getAdresseDispoparcs().stream()
                    .map(al -> formatAddress(al.getAdresse()))
                    .collect(Collectors.toList()));
        }
        return dto;
    }
}











