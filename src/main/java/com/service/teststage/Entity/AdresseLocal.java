package com.service.teststage.Entity;


import jakarta.persistence.*;
@Entity
@Table(name = "adresse_local")
public class AdresseLocal {
    @EmbeddedId
    private AdresseLocalId id;

    @ManyToOne
    @MapsId("idadresse") // Maps to Integer now
    @JoinColumn(name = "idadresse")
    private Adresse adresse;

    // FIX: Add insertable/updatable=false to prevent column duplication
    @ManyToOne
    @JoinColumn(name = "iddispoloc", insertable = false, updatable = false)
    private Local local;

    @ManyToOne
    @MapsId("idmutation")
    @JoinColumn(name = "idmutation")
    private Mutation mutation;

    private String coddep;
    // Getters and setters
    public AdresseLocalId getId() {
        return id;
    }

    public void setId(AdresseLocalId id) {
        this.id = id;
    }

    public Adresse getAdresse() {
        return adresse;
    }

    public void setAdresse(Adresse adresse) {
        this.adresse = adresse;
    }

    public Local getLocal() {
        return local;
    }

    public void setLocal(Local local) {
        this.local = local;
    }

    public Mutation getMutation() {
        return mutation;
    }

    public void setMutation(Mutation mutation) {
        this.mutation = mutation;
    }

    public String getCoddep() {
        return coddep;
    }

    public void setCoddep(String coddep) {
        this.coddep = coddep;
    }
}