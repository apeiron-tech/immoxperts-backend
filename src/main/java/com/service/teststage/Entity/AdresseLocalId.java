package com.service.teststage.Entity;


import jakarta.persistence.Embeddable;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class AdresseLocalId implements Serializable {
    private Integer  idadresse;
    private Integer  iddispoloc;
    private Integer  idmutation;

    // Default constructor
    public AdresseLocalId() {}

    public AdresseLocalId(Integer  idadresse, Integer  iddispoloc, Integer  idmutation) {
        this.idadresse = idadresse;
        this.iddispoloc = iddispoloc;
        this.idmutation = idmutation;
    }

    // Getters and setters
    public Integer getIdadresse() {
        return idadresse;
    }

    public void setIdadresse(Integer  idadresse) {
        this.idadresse = idadresse;
    }

    public Integer  getIddispoloc() {
        return iddispoloc;
    }

    public void setIddispoloc(Integer  iddispoloc) {
        this.iddispoloc = iddispoloc;
    }

    public Integer  getIdmutation() {
        return idmutation;
    }

    public void setIdmutation(Integer  idmutation) {
        this.idmutation = idmutation;
    }

    // equals and hashCode methods
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        AdresseLocalId that = (AdresseLocalId) o;
        return Objects.equals(idadresse, that.idadresse) &&
                Objects.equals(iddispoloc, that.iddispoloc) &&
                Objects.equals(idmutation, that.idmutation);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idadresse, iddispoloc, idmutation);
    }
}