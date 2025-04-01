package com.service.teststage.Repository;



import com.service.teststage.Entity.Adresse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import java.util.List;

public interface AdresseRepository extends JpaRepository<Adresse, Integer>, JpaSpecificationExecutor<Adresse> {
    @Query("SELECT a FROM Adresse a WHERE " +
            "(:voie IS NULL OR a.voie LIKE %:voie%) AND " +
            "(:commune IS NULL OR a.commune LIKE %:commune%) AND " +
            "(:codepostal IS NULL OR a.codepostal = :codepostal)")
    List<Adresse> findBySearchCriteria(
            @Param("voie") String voie,
            @Param("commune") String commune,
            @Param("codepostal") String codepostal
    );
    List<Adresse> findByNovoieAndVoieAndCodepostalAndCommune(
            Integer novoie,  // Changed to Integer
            String voie,
            String codepostal,
            String commune
    );
    List<Adresse> findByVoieContainingIgnoreCase(String voie);
}