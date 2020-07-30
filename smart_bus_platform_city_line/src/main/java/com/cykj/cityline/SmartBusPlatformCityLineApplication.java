package com.cykj.cityline;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@SpringBootApplication
@MapperScan(basePackages = {"com.cykj.cityline.mapper"})
@EnableEurekaClient
public class SmartBusPlatformCityLineApplication {

    public static void main(String[] args) {
        SpringApplication.run(SmartBusPlatformCityLineApplication.class, args);
    }

}
