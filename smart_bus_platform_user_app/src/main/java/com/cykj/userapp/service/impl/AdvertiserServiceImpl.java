package com.cykj.userapp.service.impl;

import com.cykj.pojo.AdvertiserInfo;
import com.cykj.userapp.mapper.AdvertiserMapper;
import com.cykj.userapp.service.AdvertiserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdvertiserServiceImpl implements AdvertiserService {
    @Autowired
    AdvertiserMapper advertiserMapper;

    @Override
    public List<AdvertiserInfo> queryCarouselAdvertiser() {
        List<AdvertiserInfo> advertiserList = advertiserMapper.queryCarouselAdvertiser();
        for (int i=0; i<advertiserList.size();i++){
            advertiserList.get(i).setImage("http://localhost:8081/advertiser/queryAdvertiserImage?id="+advertiserList.get(i).getId());
        }

        return advertiserList;
    }
}
