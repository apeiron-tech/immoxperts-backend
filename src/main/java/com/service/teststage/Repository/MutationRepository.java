package com.service.teststage.Repository;


import com.service.teststage.Entity.Mutation;
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
}