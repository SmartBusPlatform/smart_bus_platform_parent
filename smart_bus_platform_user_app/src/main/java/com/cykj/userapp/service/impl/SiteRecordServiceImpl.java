package com.cykj.userapp.service.impl;

import com.cykj.pojo.AdvertiserInfo;
import com.cykj.pojo.SiteRecord;
import com.cykj.userapp.mapper.AdvertiserMapper;
import com.cykj.userapp.mapper.SiteRecordMapper;
import com.cykj.userapp.service.AdvertiserService;
import com.cykj.userapp.service.SiteRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SiteRecordServiceImpl implements SiteRecordService {
    @Autowired
    SiteRecordMapper siteRecordMapper;


    @Override
    public List<SiteRecord> querySiteRecordByCityName(String cityName) {
        List<SiteRecord> siteRecordList = siteRecordMapper.querySiteRecordByCityName(cityName);

        return siteRecordList;
    }
}
