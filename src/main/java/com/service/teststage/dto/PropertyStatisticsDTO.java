package com.service.teststage.dto;


import java.math.BigDecimal;

public class PropertyStatisticsDTO {
    private String typeBien;
    private Long nombre;
    private BigDecimal prixMoyen;
    private BigDecimal prixM2Moyen;

    public PropertyStatisticsDTO() {}

    public PropertyStatisticsDTO(String typeBien, Long nombre, BigDecimal prixMoyen, BigDecimal prixM2Moyen) {
        this.typeBien = typeBien;
        this.nombre = nombre;
        this.prixMoyen = prixMoyen;
        this.prixM2Moyen = prixM2Moyen;
    }

    // Getters and setters
    public String getTypeBien() { return typeBien; }
    public void setTypeBien(String typeBien) { this.typeBien = typeBien; }

    public Long getNombre() { return nombre; }
    public void setNombre(Long nombre) { this.nombre = nombre; }

    public BigDecimal getPrixMoyen() { return prixMoyen; }
    public void setPrixMoyen(BigDecimal prixMoyen) { this.prixMoyen = prixMoyen; }

    public BigDecimal getPrixM2Moyen() { return prixM2Moyen; }
    public void setPrixM2Moyen(BigDecimal prixM2Moyen) { this.prixM2Moyen = prixM2Moyen; }
}