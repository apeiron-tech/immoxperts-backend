package com.service.teststage.Repository;

import com.service.teststage.dto.CommuneStatsDTO;

public interface MutationCustomRepository {
    CommuneStatsDTO getStatsByCommune(String commune);
}