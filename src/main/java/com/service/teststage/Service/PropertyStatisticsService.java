package com.service.teststage.Service;
import com.service.teststage.Repository.PropertyStatisticsRepository;
import com.service.teststage.dto.PropertyStatisticsDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Service
public class PropertyStatisticsService {

    private final PropertyStatisticsRepository propertyStatisticsRepository;

    @Autowired
    public PropertyStatisticsService(PropertyStatisticsRepository propertyStatisticsRepository) {
        this.propertyStatisticsRepository = propertyStatisticsRepository;
    }

    public List<PropertyStatisticsDTO> getPropertyStatisticsByCommune(String commune) {
        List<Object[]> results = propertyStatisticsRepository.getPropertyStatistics(commune);
        List<PropertyStatisticsDTO> statistics = new ArrayList<>();

        for (Object[] result : results) {
            String typeBien = (String) result[0];
            Long nombre = ((Number) result[1]).longValue();
            BigDecimal prixMoyen = new BigDecimal(result[2].toString());
            BigDecimal prixM2Moyen = new BigDecimal(result[3].toString());

            statistics.add(new PropertyStatisticsDTO(typeBien, nombre, prixMoyen, prixM2Moyen));
        }

        return statistics;
    }
}