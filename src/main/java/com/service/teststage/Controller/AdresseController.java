package com.service.teststage.Controller;


import com.service.teststage.Entity.Adresse;
import com.service.teststage.Service.AdresseService;
import com.service.teststage.dto.AddressSearchDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/adresses")
public class AdresseController {

    @Autowired
    private AdresseService adresseService;

    @PostMapping("/search")
    public ResponseEntity<List<Adresse>> searchAddresses(@RequestBody AddressSearchDTO searchDTO) {
        List<Adresse> results = adresseService.searchAddresses(searchDTO);
        return ResponseEntity.ok(results);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Adresse> getAdresseById(@PathVariable String id) {
        Adresse adresse = adresseService.getAdresseById(id);
        if (adresse == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(adresse);
    }
}
