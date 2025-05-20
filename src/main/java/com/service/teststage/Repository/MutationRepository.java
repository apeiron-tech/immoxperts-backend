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
            WITH RECURSIVE filtered_mutations AS (
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
            SELECT /*+ INDEX(m mutation_pkey) INDEX(al adresse_local_pkey) INDEX(ad adresse_dispoparc_pkey) INDEX(a adresse_pkey) SET statement_timeout = '60s' */ 
                   m.* 
            FROM mutation m
            WHERE m.idmutation IN (SELECT idmutation FROM filtered_mutations)
            ORDER BY m.datemut DESC
            """, 
            countQuery = """
            WITH RECURSIVE filtered_mutations AS (
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
            SELECT /*+ INDEX(m mutation_pkey) SET statement_timeout = '60s' */ COUNT(*) 
            FROM mutation m
            WHERE m.idmutation IN (SELECT idmutation FROM filtered_mutations)
            """,
            nativeQuery = true)
    Page<Mutation> findMutationsByStreetAndCommune(
            @Param("street") String street, 
            @Param("commune") String commune,
            Pageable pageable);

    @Query(value = """
            SELECT /*+ SET statement_timeout = '60s' */ m.* FROM mutation m
            JOIN adresse_local al ON m.idmutation = al.idmutation
            JOIN adresse a ON al.idadresse = a.idadresse
            WHERE UPPER(a.voie) = UPPER(:street)
            AND UPPER(a.commune) = UPPER(:commune)
            UNION
            SELECT m.* FROM mutation m
            JOIN adresse_dispoparc ad ON m.idmutation = ad.idmutation
            JOIN adresse a ON ad.idadresse = a.idadresse
            WHERE UPPER(a.voie) = UPPER(:street)
            AND UPPER(a.commune) = UPPER(:commune)
            ORDER BY datemut DESC
            """,
            countQuery = """
            SELECT /*+ SET statement_timeout = '60s' */ COUNT(*) FROM (
                SELECT DISTINCT m.idmutation FROM mutation m
                JOIN adresse_local al ON m.idmutation = al.idmutation
                JOIN adresse a ON al.idadresse = a.idadresse
                WHERE UPPER(a.voie) = UPPER(:street)
                AND UPPER(a.commune) = UPPER(:commune)
                UNION
                SELECT DISTINCT m.idmutation FROM mutation m
                JOIN adresse_dispoparc ad ON m.idmutation = ad.idmutation
                JOIN adresse a ON ad.idadresse = a.idadresse
                WHERE UPPER(a.voie) = UPPER(:street)
                AND UPPER(a.commune) = UPPER(:commune)
            ) subquery
            """,
            nativeQuery = true)
    Page<Mutation> findMutationsByStreetAndCommuneFull(
            @Param("street") String street,
            @Param("commune") String commune,
            Pageable pageable);
}