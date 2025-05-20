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
import org.springframework.data.domain.Pageable;
import org.springframework.retry.annotation.Backoff;
import org.springframework.retry.annotation.Retryable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Service
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
        final Integer[] finalNovoie = {null};
        final String[] finalBtq = {null};
        final String[] finalTypvoie = {null};
        final String[] finalVoieRestante = {null};

        // Traitement amélioré de novoieStr pour gérer les cas comme "68B" ou "68bis"
        if(novoieStr != null && !novoieStr.trim().isEmpty()) {
            // Nouveau pattern qui capture le numéro et les éventuels compléments (bis, ter, etc.)
            Matcher matcher = Pattern.compile("^(\\d+)([A-Za-z]*)$").matcher(novoieStr.trim());
            if(matcher.find()) {
                String numeroPart = matcher.group(1);
                try {
                    finalNovoie[0] = Integer.parseInt(numeroPart);
                } catch (NumberFormatException ignored) {}

                String complement = matcher.group(2);
                if(complement != null && !complement.isEmpty()) {
                    // Normalisation des compléments (bis, ter, etc.)
                    if(complement.equalsIgnoreCase("B") || complement.equalsIgnoreCase("BIS")) {
                        finalBtq[0] = "BIS";
                    } else if(complement.equalsIgnoreCase("T") || complement.equalsIgnoreCase("TER")) {
                        finalBtq[0] = "TER";
                    } else {
                        finalBtq[0] = complement.toUpperCase();
                    }
                }
            }
        }

        // Traitement amélioré de la voie
        if(voie != null && !voie.trim().isEmpty()) {
            String voieTrimmed = voie.trim();

            // Détection du type de voie (RUE, AVENUE, etc.)
            for (Map.Entry<String, String> entry : TYPE_VOIE_MAPPING.entrySet()) {
                String typeVoieKey = entry.getKey();
                // Vérifier si la voie commence par le type (avec un espace ou non)
                Pattern pattern = Pattern.compile("^" + typeVoieKey + "\\s+|^" + typeVoieKey + "$",
                        Pattern.CASE_INSENSITIVE);
                Matcher matcher = pattern.matcher(voieTrimmed);
                if (matcher.find()) {
                    finalTypvoie[0] = entry.getValue();
                    // Retirer le type de voie pour garder juste le nom
                    voieTrimmed = voieTrimmed.substring(matcher.end()).trim();
                    break;
                }
            }

            // Si le type de voie n'a pas été identifié mais qu'il y a un premier mot
            if (finalTypvoie[0] == null && voieTrimmed.contains(" ")) {
                String firstWord = voieTrimmed.split(" ", 2)[0];
                finalTypvoie[0] = TYPE_VOIE_MAPPING.getOrDefault(firstWord.toUpperCase(), firstWord);
                voieTrimmed = voieTrimmed.substring(firstWord.length()).trim();
            }

            // Gérer le cas spécial où la voie contient "DE"
            if (voieTrimmed.toUpperCase().startsWith("DE ")) {
                finalVoieRestante[0] = voieTrimmed;
            } else {
                finalVoieRestante[0] = voieTrimmed;
            }
        }

        // Requête avec les critères filtrés
        List<Adresse> addresses = adresseRepository.findAll((root, query, cb) -> {
            List<Predicate> predicates = new ArrayList<>();

            if(finalNovoie[0] != null) {
                predicates.add(cb.equal(root.get("novoie"), finalNovoie[0]));
            }

            if(finalBtq[0] != null) {
                // Recherche insensible à la casse pour le complément
                predicates.add(cb.equal(cb.upper(root.get("btq")), finalBtq[0].toUpperCase()));
            }

            if(finalTypvoie[0] != null) {
                // Recherche insensible à la casse pour le type de voie
                predicates.add(cb.equal(cb.upper(root.get("typvoie")), finalTypvoie[0].toUpperCase()));
            }

            if(finalVoieRestante[0] != null) {
                // Recherche partielle insensible à la casse pour le nom de voie
                predicates.add(cb.like(cb.upper(root.get("voie")),
                        "%" + finalVoieRestante[0].toUpperCase() + "%"));
            }

            return predicates.isEmpty() ? cb.conjunction() : cb.and(predicates.toArray(new Predicate[0]));
        });

        // Transformation en DTOs
        return addresses.stream()
                .flatMap(adresse -> Stream.concat(
                        adresse.getAdresseLocals().stream(),
                        adresse.getAdresseDispoparcs().stream()
                ))
                .map(ae -> (ae instanceof AdresseLocal) ?
                        ((AdresseLocal) ae).getMutation() :
                        ((AdresseDispoparc) ae).getMutation())
                .filter(Objects::nonNull) // Ajout d'une sécurité pour éviter les mutations null
                .distinct()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }


    @Retryable(
        value = { Exception.class },
        maxAttempts = 3,
        backoff = @Backoff(delay = 1000, multiplier = 2)
    )
    @Transactional(readOnly = true)
    public Page<MutationDTO> searchMutationsByStreetAndCommune(String street, String commune, Pageable pageable) {
        if (street == null || street.trim().isEmpty() || commune == null || commune.trim().isEmpty()) {
            return Page.empty(pageable);
        }

        String normalizedStreet = street.trim().toUpperCase();
        String normalizedCommune = commune.trim().toUpperCase();

        try {
            Page<Mutation> mutations = mutationRepository.findMutationsByStreetAndCommune(
                normalizedStreet, 
                normalizedCommune,
                pageable
            );

            return mutations.map(this::convertToDTO);
        } catch (Exception e) {
            // Log the error
            System.err.println("Error searching mutations: " + e.getMessage());
            throw e; // Re-throw to trigger retry
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











