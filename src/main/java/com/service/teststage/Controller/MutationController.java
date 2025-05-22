package com.service.teststage.Controller;

import com.service.teststage.Repository.MutationCustomRepository;
import com.service.teststage.Repository.MutationRepository;
import com.service.teststage.Service.MutationService;
import com.service.teststage.Service.PropertyStatisticsService;
import com.service.teststage.dto.CommuneStatsDTO;
import com.service.teststage.dto.MutationDTO;
import com.service.teststage.dto.PropertyStatisticsDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.concurrent.CompletableFuture;

@RestController
@RequestMapping("/api/mutations")
@CrossOrigin(origins = "*")
public class MutationController {
    private final PropertyStatisticsService propertyStatisticsService;

    @Autowired
    private MutationService mutationService;
    @Autowired
    private final MutationCustomRepository mutationRepository;

    public MutationController(PropertyStatisticsService propertyStatisticsService, MutationCustomRepository mutationRepository) {
        this.propertyStatisticsService = propertyStatisticsService;
        this.mutationRepository = mutationRepository;
    }

    @GetMapping("/by-address/{adresseId}")
    public ResponseEntity<List<MutationDTO>> getMutationsByAddress(
            @PathVariable Integer adresseId // Changed to Integer
    ) {
        List<MutationDTO> mutations = mutationService.getMutationsByAdresseId(adresseId);
        if(mutations.isEmpty()) {
            List<MutationDTO> mutations2 = mutationService.getMutationsByAdresseId2(adresseId);
            return ResponseEntity.ok(mutations2);
        }
        return ResponseEntity.ok(mutations);
    }
    @GetMapping("/by-voie/{voie}")
    public List<MutationDTO> getMutationsByVoie(@PathVariable String voie) {
        return mutationService.getMutationsByVoie(voie);
    }
    @GetMapping("/search")
    public CompletableFuture<ResponseEntity<List<MutationDTO>>> searchMutations(
            @RequestParam(required = false) String novoieStr,
            @RequestParam(required = false) String voie) {
        return mutationService.searchMutations(novoieStr, voie)
                .thenApply(ResponseEntity::ok)
                .exceptionally(ex -> ResponseEntity.internalServerError().build());
    }
    @GetMapping("/commune")
    public ResponseEntity<CommuneStatsDTO> getCommuneStats(
            @RequestParam("commune") String commune
    ) {
        return ResponseEntity.ok(
                mutationRepository.getStatsByCommune(commune)
        );
    }

    @GetMapping("/statistics/{commune}")
    public ResponseEntity<List<PropertyStatisticsDTO>> getPropertyStatistics(@PathVariable String commune) {
        List<PropertyStatisticsDTO> statistics = propertyStatisticsService.getPropertyStatisticsByCommune(commune);
        return ResponseEntity.ok(statistics);
    }

    @GetMapping("/mutations/by-street-and-commune")
    public ResponseEntity<List<MutationDTO>> searchMutationsByStreetAndCommune(
            @RequestParam("street") String street,
            @RequestParam("commune") String commune
    ) {
        List<MutationDTO> results = mutationService.searchMutationsByStreetAndCommune(street, commune);
        return ResponseEntity.ok(results);
    }
}