package com.cykj.userapp.controller;

import com.alibaba.fastjson.JSON;
import com.cykj.pojo.LineChild;
import com.cykj.userapp.service.DriverWorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("driverWork")
public class DriverWorkController {
    @Autowired
    private DriverWorkService driverWorkService;
    @RequestMapping("getDiverWorkByIdAndDate")
    public String getDiverWorkByIdAndDate(int adminId, String date) {
        return JSON.toJSONString(driverWorkService.findDiverWorkByIdAndDate(adminId,date));
    }
}
