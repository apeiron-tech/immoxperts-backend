package com.service.teststage.Entity;

// RealEstateStat.java
public record RealEstateStat(
        String typeBien,
        Integer nombre,
        Double prixMoyen,
        Double prixAuM2Moyen
) {}