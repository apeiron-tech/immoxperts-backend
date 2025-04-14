package com.service.teststage.Config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOrigins("http://localhost:3000")
                .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS");

         registry.addMapping("/**")
                .allowedOrigins("https://immoxperts.apeiron-tech.dev")
                .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS");
        
         registry.addMapping("/**")
                .allowedOrigins("https://mapbox.com")
                .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS"); 
            
        registry.addMapping("/**")
                .allowedOrigins("https://events.mapbox.com")
                .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS"); 

    }
}