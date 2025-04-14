package com.service.teststage.dto;

import lombok.Getter;
import lombok.Setter;


public class CommuneStatsDTO {
    private String commune;
    private long maisons;
    private long appartements;
    private long locauxCommerciaux;
    private long terrains;
    private long biensMultiples;

    public long getBiensMultiples() {
        return biensMultiples;
    }

    public void setBiensMultiples(long biensMultiples) {
        this.biensMultiples = biensMultiples;
    }

    public long getTerrains() {
        return terrains;
    }

    public void setTerrains(long terrains) {
        this.terrains = terrains;
    }

    public long getLocauxCommerciaux() {
        return locauxCommerciaux;
    }

    public void setLocauxCommerciaux(long locauxCommerciaux) {
        this.locauxCommerciaux = locauxCommerciaux;
    }

    public long getAppartements() {
        return appartements;
    }

    public void setAppartements(long appartements) {
        this.appartements = appartements;
    }

    public long getMaisons() {
        return maisons;
    }

    public void setMaisons(long maisons) {
        this.maisons = maisons;
    }

    public String getCommune() {
        return commune;
    }

    public void setCommune(String commune) {
        this.commune = commune;
    }
}