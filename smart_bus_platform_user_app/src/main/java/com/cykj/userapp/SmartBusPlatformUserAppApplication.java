package com.cykj.userapp;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.circuitbreaker.EnableCircuitBreaker;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableEurekaClient
@EnableFeignClients
@EnableCircuitBreaker //开启断路器
@MapperScan(basePackages = {"com.cykj.userapp.mapper"})
public class SmartBusPlatformUserAppApplication {

    public static void main(String[] args) {
        SpringApplication.run(SmartBusPlatformUserAppApplication.class, args);
    }

}
