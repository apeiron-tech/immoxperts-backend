package com.service.teststage.Repository;

import com.service.teststage.Entity.DispositionParcelle;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.math.BigDecimal;
import java.util.List;

public interface DispositionParcelleRepository extends JpaRepository<DispositionParcelle, Integer> {
    @Query("SELECT COALESCE(SUM(d.dcntsol), 0) FROM DispositionParcelle d " +
            "WHERE d.iddispopar IN :iddispopars")
    BigDecimal sumDcntsolByIddispopars(@Param("iddispopars") List<Integer> iddispopars);
    @Query("SELECT COALESCE(SUM(d.dcntagri), 0) FROM DispositionParcelle d " +
            "WHERE d.iddispopar IN :iddispopars")
    BigDecimal sumDcntagrclByIddispopars(@Param("iddispopars") List<Integer> iddispopars);
}