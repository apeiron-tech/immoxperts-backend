package com.service.teststage.Entity;

import jakarta.persistence.*;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "mutation")
public class Mutation {
    @Id
    private Integer idmutation;

    @Temporal(TemporalType.DATE)
    private Date datemut;

    @Column(name = "sterr")
    private BigDecimal sterr;

    @OneToMany(mappedBy = "mutation", fetch = FetchType.EAGER)
    private List<AdresseLocal> adresseLocals = new ArrayList<>();

    @OneToMany(mappedBy = "mutation", fetch = FetchType.EAGER)
    private List<AdresseDispoparc> adresseDispoparcs = new ArrayList<>();

    @Column(name = "valeurfonc", precision = 15, scale = 2)
    private BigDecimal valeurfonc;
    private Integer idnatmut;

    private String coddep;

    @Column(name = "vefa")
    private Boolean vefa; // Must be Boolean, NOT Double/Float



    public BigDecimal getSterr() {
        return sterr;
    }

    public List<AdresseDispoparc> getAdresseDispoparcs() {
        return adresseDispoparcs;
    }

    public void setAdresseDispoparcs(List<AdresseDispoparc> adresseDispoparcs) {
        this.adresseDispoparcs = adresseDispoparcs;
    }

    public void setSterr(BigDecimal sterr) {
        this.sterr = sterr;
    }

    // Getters and setters
    public Integer getIdmutation() {
        return idmutation;
    }

    public void setIdmutation(Integer idmutation) {
        this.idmutation = idmutation;
    }

    public Date getDatemut() {
        return datemut;
    }

    public void setDatemut(Date datemut) {
        this.datemut = datemut;
    }

    public BigDecimal getValeurfonc() {
        return valeurfonc;
    }

    public void setValeurfonc(BigDecimal valeurfonc) {
        this.valeurfonc = valeurfonc;
    }

    public Integer getIdnatmut() {
        return idnatmut;
    }
    public Boolean getVefa() {
        return vefa;
    }

    public void setVefa(Boolean vefa) {
        this.vefa = vefa;
    }
    public void setIdnatmut(Integer idnatmut) {
        this.idnatmut = idnatmut;
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
