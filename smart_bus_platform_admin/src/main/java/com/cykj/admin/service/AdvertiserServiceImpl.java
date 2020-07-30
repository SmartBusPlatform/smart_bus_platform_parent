package com.cykj.smart_bus_platform_admin.service;

import com.cykj.pojo.Advertiser;
import com.cykj.smart_bus_platform_admin.mapper.AdvertiserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdvertiserServiceImpl implements AdvertiserService{
    @Autowired
    AdvertiserMapper advertiserMapper;

    @Override
    public Advertiser queryAdvertiser(String id) {
        Advertiser advertiser = advertiserMapper.queryAdvertiser(id);

        return advertiser;
    }

    @Override
    public int insertAdvertiser(Advertiser advertiser) {
        int q = advertiserMapper.insertAdvertiser(advertiser);
        return 0;
    }
}
