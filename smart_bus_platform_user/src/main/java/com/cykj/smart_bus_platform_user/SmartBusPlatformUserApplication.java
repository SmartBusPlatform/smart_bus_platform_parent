package com.cykj.smart_bus_platform_user;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@SpringBootApplication(scanBasePackages = {"com.cykj.smart_bus_platform_redis","com.cykj.smart_bus_platform_user"})
@MapperScan(basePackages = {"com.cykj.smart_bus_platform_user.mapper"})
@EnableEurekaClient
public class SmartBusPlatformUserApplication {

    public static void main(String[] args) {
        SpringApplication.run(SmartBusPlatformUserApplication.class, args);
    }

}
