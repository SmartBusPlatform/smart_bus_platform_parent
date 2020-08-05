package com.cykj.cityline;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@MapperScan(basePackages = {"com.cykj.cityline.mapper"})
@EnableEurekaClient
@EnableTransactionManagement
public class SmartBusPlatformCityLineApplication {

    public static void main(String[] args) {
        SpringApplication.run(SmartBusPlatformCityLineApplication.class, args);
    }

}
