package com.service.teststage.Config;

import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
public class TransactionConfig {
    // Configuration is handled by Spring Boot's auto-configuration
    // This class just enables explicit transaction management
} 