package com.cykj.smart_bus_platform_admin;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableEurekaClient
@EnableFeignClients
@MapperScan(basePackages = {"com.cykj.smart_bus_platform_admin.mapper"})
public class SmartBusPlatformAdminApplication {

    public static void main(String[] args) {
        SpringApplication.run(SmartBusPlatformAdminApplication.class, args);
    }

}
