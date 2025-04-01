package com.service.teststage.Entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.math.BigDecimal;

@Entity
@Table(name = "disposition_parcelle")
public class DispositionParcelle {
    @Id
    private Integer iddispopar;
    private BigDecimal dcntagri ;
    private BigDecimal dcntsol; // Land size

    public BigDecimal getDcntsol() {
        return dcntsol;
    }

    public void setDcntsol(BigDecimal dcntsol) {
        this.dcntsol = dcntsol;
    }

    public BigDecimal getDcntagri() {
        return dcntagri;
    }

    public void setDcntagri(BigDecimal dcntagri) {
        this.dcntagri = dcntagri;
    }

    public Integer getIddispopar() {
        return iddispopar;
    }

    public void setIddispopar(Integer iddispopar) {
        this.iddispopar = iddispopar;
    }
}