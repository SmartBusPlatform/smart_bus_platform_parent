package com.cykj.smart_bus_platform_admin.controller;

import com.cykj.pojo.Advertiser;
import com.cykj.smart_bus_platform_admin.service.AdvertiserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping(value = "advertiser")
@RestController
public class AdvertiserController{
    @Autowired
    AdvertiserService advertiserService;

    @RequestMapping(value = "queryAdvertiser")
    //查询广告，id为空就查全部
    public Object queryAdvertiser(@RequestParam("id")String id){
        if(id==null){
            id = "";
        }

        Advertiser advertiser = advertiserService.queryAdvertiser(id);

        return advertiser;
    }

    @RequestMapping(value = "insertAdvertiser")
    //新增广告
    public String insertAdvertiser(Advertiser advertiser){
        if (advertiser!=null){
            int isSuccess = advertiserService.insertAdvertiser(advertiser);

            if (isSuccess!=0){
                return "success";
            }else{
                return "error";
            }
        }else{
            return "error";
        }
    }
}
