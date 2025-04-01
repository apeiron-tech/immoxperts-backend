package com.service.teststage.Entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.*;

import java.math.BigDecimal;


@Entity
    @Table(name = "local")
    public class Local {


        @Id
        private Integer  iddispoloc;

        private Integer  idmutation;
    @Column(name = "sbati", precision = 15, scale = 2)  // Matches NUMERIC type
    private BigDecimal sbati;  // Use BigDecimal for precise decimal values

        private String  libtyploc;
        private Integer nbpprinc;

    public BigDecimal getSbati() {
        return sbati;
    }

    public void setSbati(BigDecimal sbati) {
        this.sbati = sbati;
    }

    public Integer getNbpprinc() {
            return nbpprinc;
        }

        public void setNbpprinc(Integer nbpprinc) {
            this.nbpprinc = nbpprinc;
        }

        public String getLibtyploc() {
            return libtyploc;
        }

        public void setLibtyploc(String libtyploc) {
            this.libtyploc = libtyploc;
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
    }

