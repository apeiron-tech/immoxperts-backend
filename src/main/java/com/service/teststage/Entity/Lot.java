package com.service.teststage.Entity;

import jakarta.persistence.*;

import java.math.BigDecimal;

@Entity
@Table(name = "lot")
public class Lot {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer iddispolot;


    @ManyToOne
    @JoinColumn(name = "idmutation")
    private Mutation mutation;

    @Column(name = "scarrez", precision = 15, scale = 2)  // Matches NUMERIC type
    private BigDecimal scarrez;  // Use BigDecimal for precise decimal values

    // Other fields (nolot, coddep, etc.) and relationships...

    // Getters and setters
    public BigDecimal getScarrez() {
        return scarrez;
    }

    public void setScarrez(BigDecimal scarrez) {
        this.scarrez = scarrez;
    }
}