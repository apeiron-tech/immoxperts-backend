package com.service.teststage.Repository;


import com.service.teststage.Entity.Mutation;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface MutationRepository extends JpaRepository<Mutation, String> {
    @Query("SELECT DISTINCT m FROM Mutation m " +
            "JOIN m.adresseLocals al " +
            "WHERE al.adresse.idadresse = :idadresse")
    List<Mutation> findByAdresseId(@Param("idadresse") Integer idadresse);


    @Query("SELECT DISTINCT m FROM Mutation m " +
            "JOIN m.adresseLocals al " +
            "WHERE al.adresse.idadresse = :idadresse")
    List<Mutation> findByAdresseLocalId(@Param("idadresse") Integer idadresse);

    @Query("SELECT DISTINCT m FROM Mutation m " +
            "JOIN m.adresseDispoparcs ad " +
            "WHERE ad.adresse.idadresse = :idadresse") // Navigate through Adresse entity
    List<Mutation> findByAdresseDispoParcId(@Param("idadresse") Integer idadresse);
    @Query(value = """
            WITH filtered_mutations AS (
                SELECT DISTINCT m.idmutation
                FROM mutation m
                JOIN adresse_local al ON m.idmutation = al.idmutation
                JOIN adresse a ON al.idadresse = a.idadresse
                WHERE UPPER(a.voie) = UPPER(:street)
                AND UPPER(a.commune) = UPPER(:commune)
                UNION
                SELECT DISTINCT m.idmutation
                FROM mutation m
                JOIN adresse_dispoparc ad ON m.idmutation = ad.idmutation
                JOIN adresse a ON ad.idadresse = a.idadresse
                WHERE UPPER(a.voie) = UPPER(:street)
                AND UPPER(a.commune) = UPPER(:commune)
            )
            SELECT /*+ MAX_EXECUTION_TIME(30000) */ m.* 
            FROM mutation m
            WHERE m.idmutation IN (SELECT idmutation FROM filtered_mutations)
            """, 
            countQuery = """
            WITH filtered_mutations AS (
                SELECT DISTINCT m.idmutation
                FROM mutation m
                JOIN adresse_local al ON m.idmutation = al.idmutation
                JOIN adresse a ON al.idadresse = a.idadresse
                WHERE UPPER(a.voie) = UPPER(:street)
                AND UPPER(a.commune) = UPPER(:commune)
                UNION
                SELECT DISTINCT m.idmutation
                FROM mutation m
                JOIN adresse_dispoparc ad ON m.idmutation = ad.idmutation
                JOIN adresse a ON ad.idadresse = a.idadresse
                WHERE UPPER(a.voie) = UPPER(:street)
                AND UPPER(a.commune) = UPPER(:commune)
            )
            SELECT /*+ MAX_EXECUTION_TIME(30000) */ COUNT(*) 
            FROM mutation m
            WHERE m.idmutation IN (SELECT idmutation FROM filtered_mutations)
            """,
            nativeQuery = true)
    Page<Mutation> findMutationsByStreetAndCommune(
            @Param("street") String street, 
            @Param("commune") String commune,
            Pageable pageable);
}