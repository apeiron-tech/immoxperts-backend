package com.service.teststage.Repository;

import com.service.teststage.Entity.Lot;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.math.BigDecimal;

public interface LotRepository extends JpaRepository<Lot, Integer> {

}