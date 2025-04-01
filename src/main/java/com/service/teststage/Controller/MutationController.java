package com.service.teststage.Controller;



import com.service.teststage.Service.MutationService;
import com.service.teststage.dto.MutationDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/mutations")
public class MutationController {

    @Autowired
    private MutationService mutationService;

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
}