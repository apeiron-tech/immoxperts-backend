package com.service.teststage.Service;

import com.service.teststage.Entity.Adresse;
import com.service.teststage.Repository.AdresseRepository;
import com.service.teststage.Repository.LotRepository;
import com.service.teststage.dto.AddressSearchDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;
@Service
public class LotService {
    private final LotRepository lotRepository;

    public LotService(LotRepository lotRepository) {
        this.lotRepository = lotRepository;
    }


}