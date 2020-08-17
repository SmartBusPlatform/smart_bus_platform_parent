package com.cykj.admin.controller;

import com.alibaba.fastjson.JSON;
import com.cykj.admin.service.DriverWorkService;
import com.cykj.pojo.AdminInfo;
import com.cykj.pojo.DriverWork;
import com.cykj.pojo.LayuiData;
import com.cykj.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;

@RequestMapping("driverWorkController")
@Controller
public class DriverWorkController {

    @Autowired
    private DriverWorkService driverWorkService;

    //查询司机列表
    @RequestMapping("selectDriverList")
    @ResponseBody
    public String selectDriverList(String cityId, String name, String phone, String site, int page, int limit) {

        HashMap<String, Object> map = new HashMap<>();
        map.put("cityId", cityId);
        map.put("name", name);
        map.put("phone", phone);
        map.put("site", site);
        map.put("page", (page-1)*limit);
        map.put("limit", limit);

        LayuiData layuiData = driverWorkService.selectDriverList(map);

        return JSON.toJSONString(layuiData);
    }

    //修改单个司机信息
    @RequestMapping("updateDriver")
    @ResponseBody
    public String updateDriver(int id, String name, String phone) {

        AdminInfo adminInfo = new AdminInfo();
        adminInfo.setId(id);
        adminInfo.setName(name);
        adminInfo.setPhone(phone);

        String str = driverWorkService.updateDriver(adminInfo);
        return str;
    }
    //根据时间和司机id查询当前排班车辆
    @RequestMapping("failureStop")
    @ResponseBody
    public String failureStop(@RequestBody DriverWork driverWork){
        return JSON.toJSONString(driverWorkService.failureStop(driverWork));
    }

    //查询单个司机工作量
    @RequestMapping("selectWorkload")
    @ResponseBody
    public String selectWorkload(int driverId, long timestamp) {
        HashMap<String, Object> map = new HashMap<>();
        map.put("driverId", driverId);
        map.put("timestamp", timestamp);
        LayuiData layuiData = driverWorkService.selectWorkload(map);
        return JSON.toJSONString(layuiData);
    }

    @RequestMapping("vehicleMaintenace")
    @ResponseBody
    public String vehicleMaintenace(@RequestBody DriverWork driverWork){
        return JSON.toJSONString(driverWorkService.vehicleMaintenace(driverWork));
    }
    @RequestMapping("endMaintenance")
    @ResponseBody
    public String endMaintenance(@RequestBody DriverWork driverWork) {
        return JSON.toJSONString(driverWorkService.endMaintenance(driverWork));
    }
    @RequestMapping("vehicleScrapping")
    @ResponseBody
    public String vehicleScrapping(@RequestBody DriverWork driverWork) {
        return JSON.toJSONString(driverWorkService.vehicleScrapping(driverWork));
    }
}
