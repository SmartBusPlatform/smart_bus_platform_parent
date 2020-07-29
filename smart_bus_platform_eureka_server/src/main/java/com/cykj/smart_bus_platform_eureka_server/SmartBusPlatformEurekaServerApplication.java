package com.cykj.smart_bus_platform_eureka_server;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer
public class SmartBusPlatformEurekaServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(SmartBusPlatformEurekaServerApplication.class, args);
    }

}
