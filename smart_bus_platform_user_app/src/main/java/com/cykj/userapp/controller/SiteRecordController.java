package com.cykj.userapp.controller;

import com.cykj.pojo.SiteRecord;
import com.cykj.userapp.mapper.SiteRecordMapper;
import com.cykj.userapp.service.SiteRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RequestMapping(value = "siteRecord")
@RestController
public class SiteRecordController{
    @Autowired
    SiteRecordService siteRecordService;

    @RequestMapping(value = "querySiteRecordByCityName")
    public Object querySiteRecordByCityName(String cityName) {
        if(cityName!=null&&!"".equals(cityName)){
            List<SiteRecord> siteRecordList = siteRecordService.querySiteRecordByCityName(cityName);

            return siteRecordList;
        }else{
            return null;
        }
    }
}
