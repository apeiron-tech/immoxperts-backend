package com.service.teststage.Repository;


import com.service.teststage.Entity.AdresseLocal;
import com.service.teststage.Entity.AdresseLocalId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.math.BigDecimal;

public interface AdresseLocalRepository extends JpaRepository<AdresseLocal, AdresseLocalId> {
    @Query("SELECT SUM(l.sbati) FROM Local l WHERE l.idmutation = :idMutation")
    BigDecimal surfaceMutaion(@Param("idMutation") Integer idMutation);




}