package com.cykj.userapp.controller;

import com.alibaba.fastjson.JSON;
import com.cykj.userapp.service.AdvertiserService;
import com.cykj.userapp.service.AroundService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@RequestMapping(value = "around")
@RestController
public class AroundController {
    @Autowired
    AroundService aroundService;

    @RequestMapping(value = "queryAroundSiteAdvertiser")
    //查询周围1000米的广告和站点
    public Object queryAroundSiteAdvertiser(@Param("cityName") String cityName,@Param("longitude") double longitude,@Param("latitude") double latitude){
        if (cityName!=null&&!"".equals(cityName)){
            return JSON.toJSONString(aroundService.queryAroundSiteAdvertiser(cityName,longitude,latitude));
        }else {
            return JSON.toJSONString("dataError");
        }
    }

    @RequestMapping(value = "queryAroundLineSite")
    //查询周围1000米的广告和站点
    public Object queryAroundLineSite(@Param("cityName") String cityName,@Param("longitude") double longitude,@Param("latitude") double latitude){
        if (cityName!=null&&!"".equals(cityName)){
            return JSON.toJSONString(aroundService.queryAroundSiteLine(cityName,longitude,latitude));
        }else {
            return JSON.toJSONString("dataError");
        }
    }

    @RequestMapping(value = "querySiteLineBySiteId")
    //根据站点id查带该站点的线路
    public Object querySiteLineBySiteId(@Param("siteId") int siteId){
        if (siteId!=0){
            return JSON.toJSONString(aroundService.querySiteLineBySiteId(siteId));
        }else {
            return JSON.toJSONString("dataError");
        }
    }
}
