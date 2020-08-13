package com.cykj.userapp.controller;


import com.alibaba.fastjson.JSON;
import com.cykj.userapp.service.NavigationService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping(value = "navigation")
@RestController
public class NavigationController {
    @Autowired
    NavigationService navigationService;

    @RequestMapping(value = "myLocationSite")
    //我的位置到指定站点的路线规划
    public Object myLocationSite(@Param("cityName") String cityName, @Param("longitude") double longitude, @Param("latitude") double latitude, @Param("endSiteId") int endSiteId){
        if (cityName!=null&&!"".equals(cityName)&&endSiteId>0){
            return JSON.toJSONString(navigationService.myLocationSite(cityName,longitude,latitude,endSiteId));
        }else {
            return JSON.toJSONString("dataError");
        }
    }
}
