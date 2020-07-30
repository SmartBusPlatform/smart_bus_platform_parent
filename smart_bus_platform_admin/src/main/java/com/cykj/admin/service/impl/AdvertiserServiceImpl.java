package com.cykj.admin.service.impl;

import com.cykj.admin.mapper.AdvertiserMapper;
import com.cykj.admin.service.AdvertiserService;
import com.cykj.pojo.Advertiser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdvertiserServiceImpl implements AdvertiserService {
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
