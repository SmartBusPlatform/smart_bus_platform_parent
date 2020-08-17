package com.cykj.userapp.feign;

import com.cykj.pojo.DriverWork;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@FeignClient(value = "admin",contextId = "driverWork")
@Component
public interface DriverWorkFeign {

    @RequestMapping("driverWorkController/failureStop")
    public String  failureStop(@RequestBody DriverWork driverWork);
    @RequestMapping("driverWorkController/vehicleMaintenace")
    public String vehicleMaintenace(@RequestBody DriverWork driverWork);
    @RequestMapping("driverWorkController/endMaintenance")
    public String endMaintenance(@RequestBody DriverWork driverWork);
    @RequestMapping("driverWorkController/vehicleScrapping")
    public String vehicleScrapping(@RequestBody DriverWork driverWork);
}
