package com.service.teststage.Entity;

import jakarta.persistence.*;

@Entity
@Table(name = "adresse_dispoparc")
public class AdresseDispoparc {


    @Id
    @Column(name = "iddispopar")
    private Integer iddispopar;
    @ManyToOne
    @JoinColumn(name = "idadresse") // Correct column name
    private Adresse adresse; // Must match the Adresse entity

    @ManyToOne
    @JoinColumn(name = "idmutation")
    private Mutation mutation;
    public Mutation getMutation() {
        return mutation;
    }

    public void setMutation(Mutation mutation) {
        this.mutation = mutation;
    }

    public Integer getIddispopar() {
        return iddispopar;
    }

    public void setIddispopar(Integer iddispopar) {
        this.iddispopar = iddispopar;
    }

    public Adresse getAdresse() {
        return adresse;
    }

    public void setAdresse(Adresse adresse) {
        this.adresse = adresse;
    }
}