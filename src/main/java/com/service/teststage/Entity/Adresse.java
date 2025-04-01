package com.service.teststage.Entity;


import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "adresse")
public class Adresse {
    @Id
    private Integer idadresse;
    @OneToMany(mappedBy = "adresse")
    private List<AdresseDispoparc> adresseDispoparcs = new ArrayList<>();

    private Integer novoie;      // Integer (matches database `integer` type)
    private String btq;          // String (matches `varchar(1)`)
    private String typvoie;      // String (matches `varchar(4)`)
    private String codvoie;      // String (matches `varchar(4)`)
    private String voie;         // String (matches `varchar(254)`)
    private String codepostal;   // String (matches `varchar(5)`)
    private String commune;      // String (matches `varchar(45)`)

    public String getTypvoie() {
        return typvoie;
    }

    public List<AdresseDispoparc> getAdresseDispoparcs() {
        return adresseDispoparcs;
    }

    public void setAdresseDispoparcs(List<AdresseDispoparc> adresseDispoparcs) {
        this.adresseDispoparcs = adresseDispoparcs;
    }

    public String getBtq() {
        return btq;
    }

    public void setBtq(String btq) {
        this.btq = btq;
    }

    public void setTypvoie(String typvoie) {
        this.typvoie = typvoie;
    }

    public String getCodvoie() {
        return codvoie;
    }

    public void setCodvoie(String codvoie) {
        this.codvoie = codvoie;
    }

    private String coddep;
    @OneToMany(mappedBy = "adresse")
    private List<AdresseLocal> adresseLocals;

    // Getters and setters
    public Integer getIdadresse() {
        return idadresse;
    }

    public void setIdadresse(Integer idadresse) {
        this.idadresse = idadresse;
    }

    public Integer getNovoie() {
        return novoie;
    }

    public void setNovoie(Integer novoie) {
        this.novoie = novoie;
    }

    public String getVoie() {
        return voie;
    }

    public void setVoie(String voie) {
        this.voie = voie;
    }

    public String getCodepostal() {
        return codepostal;
    }

    public void setCodepostal(String codepostal) {
        this.codepostal = codepostal;
    }

    public String getCommune() {
        return commune;
    }

    public void setCommune(String commune) {
        this.commune = commune;
    }

    public String getCoddep() {
        return coddep;
    }

    public void setCoddep(String coddep) {
        this.coddep = coddep;
    }

    public List<AdresseLocal> getAdresseLocals() {
        return adresseLocals;
    }

    public void setAdresseLocals(List<AdresseLocal> adresseLocals) {
        this.adresseLocals = adresseLocals;
    }
}