package com.service.teststage.Controller;



import com.service.teststage.Repository.MutationCustomRepository;
import com.service.teststage.Repository.MutationRepository;
import com.service.teststage.Service.MutationService;
import com.service.teststage.Service.PropertyStatisticsService;
import com.service.teststage.dto.CommuneStatsDTO;
import com.service.teststage.dto.MutationDTO;
import com.service.teststage.dto.PropertyStatisticsDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/mutations")
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
    public List<MutationDTO> searchMutations(
            @RequestParam(required = false) String novoie, // Changé en String
            @RequestParam(required = false) String voie) {

        return mutationService.searchMutations(novoie, voie);
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
    public ResponseEntity<Page<MutationDTO>> searchMutationsByStreetAndCommune(
            @RequestParam("street") String street,
            @RequestParam("commune") String commune,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size,
            @RequestParam(defaultValue = "datemut") String sortBy,
            @RequestParam(defaultValue = "DESC") String direction
    ) {
        Sort.Direction sortDirection = Sort.Direction.fromString(direction);
        Pageable pageable = PageRequest.of(page, size, Sort.by(sortDirection, sortBy));
        
        Page<MutationDTO> results = mutationService.searchMutationsByStreetAndCommune(street, commune, pageable);
        return ResponseEntity.ok(results);
    }


}