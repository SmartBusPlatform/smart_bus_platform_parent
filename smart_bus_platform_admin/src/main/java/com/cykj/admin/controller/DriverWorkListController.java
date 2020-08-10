package com.cykj.admin.controller;

import com.alibaba.fastjson.JSON;
import com.cykj.admin.bean.DriverJS;
import com.cykj.admin.service.DriverWorkListService;
import com.cykj.pojo.Bus;
import com.cykj.pojo.DriverWork;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@RequestMapping("driverWorkListController")
@Controller
public class DriverWorkListController {

    @Autowired
    private DriverWorkListService service;

    /**先查询本周的所有日期再查询对应的数据*/
    //查本周的所有日期
    @RequestMapping("getWeekDate")
    @ResponseBody
    public String getWeekDate(long timestamp) {
        Date mdate = new Date(timestamp);
        int b = mdate.getDay();
        Date fdate;
        List<String> weekList = new ArrayList<>();
        Long fTime = timestamp - b * 24 * 3600000;
        for (int a = 1; a <= 7; a++) {
            fdate = new Date();
            fdate.setTime(fTime + (a * 24 * 3600000));
            weekList.add(a-1, new SimpleDateFormat("yyyy-MM-dd").format(fdate));
        }
        return JSON.toJSONString(weekList);
    }

    //查本周的所有数据
    @RequestMapping("renderDriverWorkTable")
    @ResponseBody
    public String renderDriverWorkTable(int cityId, long timestamp) throws ParseException {

        HashMap<String, Object> condition = new HashMap<>();
//        condition.put("page", (page - 1) * limit);
//        condition.put("limit", limit);
        condition.put("cityId", cityId);
        condition.put("timestamp", timestamp);


        List<DriverJS> list = service.renderDriverWorkTable(condition);


        return JSON.toJSONString(list);
    }


    //插入休假的数据
    @RequestMapping("setVacation")
    @ResponseBody
    public String setVacation(int driverId, String date) {
        DriverWork driverWork = new DriverWork();
        driverWork.setAdminId(driverId);
        driverWork.setWorkDate(date);
        driverWork.setIsWork(0);
        String s = service.setVacation(driverWork);
        return s;
    }

    //查询本地的公交车数据
    @RequestMapping("selectCityBus")
    @ResponseBody
    public String selectCityBus(int cityId, String date) {

        HashMap<String,Object> map = new HashMap<>();
        map.put("cityId", cityId);
        map.put("date", date);

        List<Bus> buses = service.selectCityBus(map);

        return JSON.toJSONString(buses);
    }


    @RequestMapping("setDriverWork")
    @ResponseBody
    public String setDriverWork(int driverId, int busId, String date) {
        DriverWork driverWork = new DriverWork();
        driverWork.setIsWork(1);
        driverWork.setWorkDate(date);
        driverWork.setAdminId(driverId);
        driverWork.setBusId(busId);

        String str = service.setDriverWork(driverWork);


        return str;
    }
}
