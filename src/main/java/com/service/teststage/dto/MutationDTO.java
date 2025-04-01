package com.service.teststage.dto;


import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class MutationDTO {


    private Integer idmutation;
    private Date datemut;
    private BigDecimal valeurfonc;
    private Integer idnatmut;
    private String coddep;

    private List<String> libtyplocList;  // List of all libtyploc values
    private Integer nbpprincTotal;       // Sum of all nbpprinc values

    private List<String> addresses;
    private BigDecimal Surface;

    private BigDecimal Terrain;


    public List<String> getLibtyplocList() {
        return libtyplocList;
    }

    public void setLibtyplocList(List<String> libtyplocList) {
        this.libtyplocList = libtyplocList;
    }

    public Integer getNbpprincTotal() {
        return nbpprincTotal;
    }
    public BigDecimal getTerrain() {
        return Terrain;
    }

    public void setTerrain(BigDecimal terrain) {
        this.Terrain = terrain;
    }

    public void setNbpprincTotal(Integer nbpprincTotal) {
        this.nbpprincTotal = nbpprincTotal;
    }




    public BigDecimal getSurface() {
        return Surface;
    }

    public void setSurface(BigDecimal surface) {
        Surface = surface;
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

    public void setIdnatmut(Integer idnatmut) {
        this.idnatmut = idnatmut;
    }

    public String getCoddep() {
        return coddep;
    }

    public void setCoddep(String coddep) {
        this.coddep = coddep;
    }

    public List<String> getAddresses() {
        return addresses;
    }

    public void setAddresses(List<String> addresses) {
        this.addresses = addresses;
    }
}