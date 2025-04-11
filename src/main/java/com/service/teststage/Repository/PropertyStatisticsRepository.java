package com.service.teststage.Repository;


import com.service.teststage.Entity.Mutation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PropertyStatisticsRepository extends JpaRepository<Mutation, Long> {

    @Query(value = """
            SELECT
                type_bien as typeBien,
                COUNT(*) AS nombre,
                ROUND(AVG(valeurfonc)::NUMERIC) AS prixMoyen,
                ROUND(AVG(prix_m2)::NUMERIC) AS prixM2Moyen
            FROM (
                 SELECT
                     m.idmutation,
                     m.valeurfonc,
                     CASE
                         WHEN COUNT(l.iddispoloc) >= 2 THEN 'Bien Multiple'
                         ELSE MAX(l.libtyploc)
                         END AS type_bien,
                     CASE
                         WHEN SUM(l.sbati) > 0 THEN m.valeurfonc / SUM(l.sbati)
                         ELSE NULL
                         END AS prix_m2
                 FROM (
                          SELECT
                              al.idmutation,
                              mut.valeurfonc
                          FROM adresse a
                                   JOIN adresse_local al ON a.idadresse = al.idadresse
                                   JOIN mutation mut ON al.idmutation = mut.idmutation
                          WHERE UPPER(a.commune) = UPPER(:commune)
                            AND UPPER(mut.libnatmut) = UPPER('Vente')
                          GROUP BY al.idmutation, mut.valeurfonc
                      ) m
                          JOIN adresse_local al ON m.idmutation = al.idmutation
                          JOIN local l ON al.iddispoloc = l.iddispoloc
                 GROUP BY m.idmutation, m.valeurfonc
             ) subquery
            WHERE prix_m2 IS NOT NULL
            GROUP BY type_bien
            """, nativeQuery = true)
    List<Object[]> getPropertyStatistics(@Param("commune") String commune);
}