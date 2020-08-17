package com.cykj.userapp.controller;

import com.alibaba.fastjson.JSON;
import com.cykj.pojo.DriverWork;
import com.cykj.pojo.LineChild;
import com.cykj.userapp.feign.DriverWorkFeign;
import com.cykj.userapp.service.DriverWorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("driverWorkController")
public class DriverWorkController {
    @Autowired
    private DriverWorkService driverWorkService;
    @Autowired
    private DriverWorkFeign driverWorkFeign;
    @RequestMapping("getDiverWorkByIdAndDate")
    public String getDiverWorkByIdAndDate(int adminId, String date) {
        return JSON.toJSONString(driverWorkService.findDiverWorkByIdAndDate(adminId,date));
    }
    //根据时间和司机id查询当前排班车辆
    @RequestMapping("failureStop")
    public String failureStop(DriverWork driverWork){
        return driverWorkFeign.failureStop(driverWork);
    }

    //维修车辆
    @RequestMapping("vehicleMaintenace")
    public String vehicleMaintenace(DriverWork driverWork){
        return driverWorkFeign.vehicleMaintenace(driverWork);
    }
    //维修结束
    @RequestMapping("endMaintenance")
    public String endMaintenance( DriverWork driverWork){
        return  driverWorkFeign.endMaintenance(driverWork);
    }
    @RequestMapping("vehicleScrapping")
    @ResponseBody
    public String vehicleScrapping( DriverWork driverWork) {
        return driverWorkFeign.vehicleScrapping(driverWork);
    }
}
