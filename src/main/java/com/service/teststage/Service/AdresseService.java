package com.service.teststage.Service;

import com.service.teststage.Entity.Adresse;
import com.service.teststage.Repository.AdresseRepository;
import com.service.teststage.dto.AddressSearchDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Service
public class AdresseService {

    @Autowired
    private AdresseRepository adresseRepository;

    @Transactional(readOnly = true)
    public List<Adresse> searchAddresses(AddressSearchDTO searchDTO) {
        return adresseRepository.findBySearchCriteria(
                searchDTO.getVoie(),
                searchDTO.getCommune(),
                searchDTO.getCodepostal()
        );
    }

    @Transactional(readOnly = true)
    public Adresse getAdresseById(String id) {
        return adresseRepository.findById(Integer.valueOf(id)).orElse(null);
    }
}