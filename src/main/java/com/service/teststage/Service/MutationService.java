package com.service.teststage.Service;

import com.github.benmanes.caffeine.cache.Cache;
import com.github.benmanes.caffeine.cache.Caffeine;
import com.service.teststage.Entity.*;
import com.service.teststage.Repository.AdresseLocalRepository;
import com.service.teststage.Repository.AdresseRepository;
import com.service.teststage.Repository.DispositionParcelleRepository;
import com.service.teststage.Repository.MutationRepository;
import com.service.teststage.dto.MutationDTO;
import jakarta.persistence.criteria.Predicate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.PageRequest;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.cache.annotation.Cacheable;

import java.math.BigDecimal;
import java.util.*;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.TimeUnit;
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
    @Autowired
    private EntityManager entityManager;
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
    private final Cache<String, List<MutationDTO>> mutationCache = Caffeine.newBuilder()
        .maximumSize(10000)
        .expireAfterWrite(10, TimeUnit.MINUTES)
        .build();

    public List<MutationDTO> getMutationsByAdresseId(Integer idadresse) {

        List<Mutation> mutations = mutationRepository.findByAdresseId(idadresse);

        return mutations.stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }

    @Async("taskExecutor")
    @Cacheable(value = "mutations", key = "#novoieStr + '-' + #voie", unless = "#result == null")
    public CompletableFuture<List<MutationDTO>> searchMutations(String novoieStr, String voie) {
        String cacheKey = novoieStr + "-" + voie;
        List<MutationDTO> cachedResult = mutationCache.getIfPresent(cacheKey);
        if (cachedResult != null) {
            return CompletableFuture.completedFuture(cachedResult);
        }

        final Integer[] finalNovoie = {null};
        final String[] finalBtq = {null};
        final String[] finalTypvoie = {null};
        final String[] finalVoieRestante = {null};

        // Process novoieStr
        if(novoieStr != null && !novoieStr.trim().isEmpty()) {
            Matcher matcher = Pattern.compile("^(\\d+)([A-Za-z]*)$").matcher(novoieStr.trim());
            if(matcher.find()) {
                String numeroPart = matcher.group(1);
                try {
                    finalNovoie[0] = Integer.parseInt(numeroPart);
                } catch (NumberFormatException ignored) {}

                String complement = matcher.group(2);
                if(complement != null && !complement.isEmpty()) {
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

        // Process voie
        if(voie != null && !voie.trim().isEmpty()) {
            String voieTrimmed = voie.trim().toUpperCase();
            
            for (Map.Entry<String, String> entry : TYPE_VOIE_MAPPING.entrySet()) {
                String typeVoieKey = entry.getKey();
                if (voieTrimmed.startsWith(typeVoieKey)) {
                    finalTypvoie[0] = entry.getValue();
                    voieTrimmed = voieTrimmed.substring(typeVoieKey.length()).trim();
                    break;
                }
            }

            finalVoieRestante[0] = voieTrimmed;
        }

        // Optimized query using native SQL with pagination
        StringBuilder sql = new StringBuilder();
        sql.append("WITH ranked_mutations AS (")
           .append("  SELECT DISTINCT m.idmutation, m.datemut, m.valeurfonc, m.idnatmut, m.coddep, m.sterr, ")
           .append("         ROW_NUMBER() OVER (ORDER BY m.datemut DESC) as rn ")
           .append("  FROM dvf.mutation m ")
           .append("  INNER JOIN dvf.adresse_local al ON m.idmutation = al.idmutation ")
           .append("  INNER JOIN dvf.adresse a ON al.idadresse = a.idadresse ")
           .append("  WHERE 1=1 ");

        List<Object> params = new ArrayList<>();
        int paramIndex = 1;

        if (finalNovoie[0] != null) {
            sql.append("AND a.novoie = ?").append(paramIndex++).append(" ");
            params.add(finalNovoie[0]);
        }

        if (finalBtq[0] != null) {
            sql.append("AND UPPER(a.btq) = UPPER(?").append(paramIndex++).append(") ");
            params.add(finalBtq[0]);
        }

        if (finalTypvoie[0] != null) {
            sql.append("AND UPPER(a.typvoie) = UPPER(?").append(paramIndex++).append(") ");
            params.add(finalTypvoie[0]);
        }

        if (finalVoieRestante[0] != null) {
            sql.append("AND a.voie ILIKE ?").append(paramIndex++).append(" ");
            params.add("%" + finalVoieRestante[0] + "%");
        }

        sql.append(") ")
           .append("SELECT * FROM ranked_mutations WHERE rn <= 100");

        // Execute the query
        Query query = entityManager.createNativeQuery(sql.toString(), Mutation.class);
        for (int i = 0; i < params.size(); i++) {
            query.setParameter(i + 1, params.get(i));
        }

        @SuppressWarnings("unchecked")
        List<Mutation> mutations = query.getResultList();

        // Convert to DTOs using parallel stream for better performance
        List<MutationDTO> result = mutations.parallelStream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());

        // Cache the result
        mutationCache.put(cacheKey, result);

        return CompletableFuture.completedFuture(result);
    }

    public List<MutationDTO> searchMutationsByStreetAndCommune(String street, String commune) {
        if (street == null || street.trim().isEmpty() || commune == null || commune.trim().isEmpty()) {
            return Collections.emptyList();
        }

        String normalizedStreet = street.trim().toUpperCase();
        String normalizedCommune = commune.trim().toUpperCase();

        List<Adresse> addresses = adresseRepository.findAll((root, query, cb) -> {
            List<Predicate> predicates = new ArrayList<>();
            predicates.add(cb.equal(cb.upper(root.get("voie")), normalizedStreet));
            predicates.add(cb.equal(cb.upper(root.get("commune")), normalizedCommune));
            return cb.and(predicates.toArray(new Predicate[0]));
        });

        return addresses.stream()
                // For each address, extract the first non-null mutation from its related entities
                .map(adresse ->
                        Stream.concat(
                                        adresse.getAdresseLocals().stream(),
                                        adresse.getAdresseDispoparcs().stream()
                                )
                                .map(ae -> (ae instanceof AdresseLocal)
                                        ? ((AdresseLocal) ae).getMutation()
                                        : ((AdresseDispoparc) ae).getMutation()
                                )
                                .filter(Objects::nonNull)
                                .findFirst() // Get the first mutation for this address
                                .orElse(null) // If no mutation found, map to null
                )
                .filter(Objects::nonNull) // Remove addresses with no mutations
                .distinct() // Ensure mutations are unique (optional, depending on your needs)
                .map(this::convertToDTO)
                .collect(Collectors.toList());
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

        // Use Set for unique values
        Set<String> libtyplocSet = new HashSet<>();
        int nbpprincTotal = 0;
        Set<String> addresses = new HashSet<>();

        if (mutation.getAdresseLocals() != null) {
            for (AdresseLocal adresseLocal : mutation.getAdresseLocals()) {
                Local local = adresseLocal.getLocal();
                if (local != null) {
                    String type = local.getLibtyploc();
                    if (type != null && !type.trim().isEmpty()) {
                        libtyplocSet.add(type.trim().toUpperCase());
                    }
                    if (local.getNbpprinc() != null) {
                        nbpprincTotal += local.getNbpprinc();
                    }
                }
                
                // Add address
                if (adresseLocal.getAdresse() != null) {
                    addresses.add(formatAddress(adresseLocal.getAdresse()));
                }
            }
        }

        // Convert Set to List for DTO
        List<String> libtyplocList = new ArrayList<>(libtyplocSet);
        if (libtyplocList.size() > 1) {
            dto.setLibtyplocList(Collections.singletonList("BIEN MULTIPLE"));
        } else {
            dto.setLibtyplocList(libtyplocList);
        }

        dto.setNbpprincTotal(nbpprincTotal);
        dto.setAddresses(new ArrayList<>(addresses));

        // Get surface using cached query
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











