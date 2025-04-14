package com.service.teststage.Service;



import com.service.teststage.Entity.*;
import com.service.teststage.Repository.AdresseLocalRepository;
import com.service.teststage.Repository.AdresseRepository;
import com.service.teststage.Repository.DispositionParcelleRepository;
import com.service.teststage.Repository.MutationRepository;
import com.service.teststage.dto.MutationDTO;
import jakarta.persistence.criteria.Predicate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    private String convertTypeVoie(String typvoie) {
        if (typvoie == null) return null;
        return TYPE_VOIE_MAPPING.getOrDefault(typvoie.toUpperCase(), typvoie);
    }
    public List<MutationDTO> searchMutations(String novoieStr, String voie) {
        // Extraction des composants avec des variables finales
        final Integer[] finalNovoie = {null};
        final String[] finalBtq = {null};
        final String[] finalTypvoie = {null};
        final String[] finalVoieRestante = {null};

        // Traitement de novoieStr
        if(novoieStr != null) {
            Matcher matcher = Pattern.compile("^(\\d*)(\\D*)$").matcher(novoieStr);
            if(matcher.find()) {
                String numeroPart = matcher.group(1);
                if(!numeroPart.isEmpty()) {
                    try {
                        finalNovoie[0] = Integer.parseInt(numeroPart);
                    } catch (NumberFormatException ignored) {}
                }
                finalBtq[0] = matcher.group(2).isEmpty() ? null : matcher.group(2);
            }
        }

        // Traitement de la voie
        if(voie != null) {
            String[] voieParts = voie.split(" ", 2);
            finalTypvoie[0] = TYPE_VOIE_MAPPING.getOrDefault(voieParts[0].toUpperCase(), voieParts[0]);
            finalVoieRestante[0] = voieParts.length > 1 ? voieParts[1] : null;
        }

        List<Adresse> addresses = adresseRepository.findAll((root, query, cb) -> {
            List<Predicate> predicates = new ArrayList<>();

            if(finalNovoie[0] != null) predicates.add(cb.equal(root.get("novoie"), finalNovoie[0]));
            if(finalBtq[0] != null) predicates.add(cb.equal(root.get("btq"), finalBtq[0]));
            if(finalTypvoie[0] != null) predicates.add(cb.equal(root.get("typvoie"), finalTypvoie[0]));
            if(finalVoieRestante[0] != null) predicates.add(cb.like(cb.lower(root.get("voie")), "%" + finalVoieRestante[0].toLowerCase() + "%"));

            return cb.and(predicates.toArray(new Predicate[0]));
        });

        return addresses.stream()
                .flatMap(adresse -> Stream.concat(
                        adresse.getAdresseLocals().stream(),
                        adresse.getAdresseDispoparcs().stream()
                ))
                .map(ae -> (ae instanceof AdresseLocal) ?
                        ((AdresseLocal) ae).getMutation() :
                        ((AdresseDispoparc) ae).getMutation())
                .distinct()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }







    public List<MutationDTO> getMutationsByVoie(String voie) {
        // Find addresses matching the voie (case-insensitive, partial match)
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

        // Set terrain value
        dto.setTerrain(mutation.getSterr());

        // Initialize lists and counters
        List<String> libtyplocList = new ArrayList<>();
        int nbpprincTotal = 0;
        List<String> addresses = new ArrayList<>();

        // Process AdresseLocal entries
        if (mutation.getAdresseLocals() != null) {
            // Collect property type and room count info
            for (AdresseLocal adresseLocal : mutation.getAdresseLocals()) {
                Local local = adresseLocal.getLocal();
                if (local != null) {
                    if (local.getLibtyploc() != null) {
                        libtyplocList.add(local.getLibtyploc());
                    }
                    if (local.getNbpprinc() != null) {
                        nbpprincTotal += local.getNbpprinc();
                    }
                }
            }

            // Collect addresses
            addresses.addAll(mutation.getAdresseLocals().stream()
                    .map(al -> formatAddress(al.getAdresse()))
                    .collect(Collectors.toList()));
        }

        // Process AdresseDispoparc entries
        if (mutation.getAdresseDispoparcs() != null) {
            // Only collect addresses for AdresseDispoparc
            List<String> dispoparcAddresses = mutation.getAdresseDispoparcs().stream()
                    .map(ad -> formatAddress(ad.getAdresse()))
                    .collect(Collectors.toList());
            addresses.addAll(dispoparcAddresses);

            // For specific cases, you might want to calculate terrain differently
            // This is similar to what your second convertToDTO method was doing
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

        // Set collected data to DTO
        dto.setLibtyplocList(libtyplocList);
        dto.setNbpprincTotal(nbpprincTotal);
        dto.setAddresses(addresses);

        // Set surface area - use your existing repository method
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











