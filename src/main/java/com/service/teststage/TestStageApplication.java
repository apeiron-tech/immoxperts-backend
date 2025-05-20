package com.service.teststage;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.retry.annotation.EnableRetry;

@SpringBootApplication
@EnableRetry
public class TeststageApplication {

    public static void main(String[] args) {
        SpringApplication.run(TeststageApplication.class, args);
    }

}
