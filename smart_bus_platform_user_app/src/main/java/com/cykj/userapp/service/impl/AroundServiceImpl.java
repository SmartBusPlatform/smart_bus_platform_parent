package com.cykj.userapp.service.impl;

import com.cykj.pojo.*;
import com.cykj.userapp.mapper.AdvertiserMapper;
import com.cykj.userapp.mapper.CityLineMapper;
import com.cykj.userapp.mapper.CitySiteMapper;
import com.cykj.userapp.service.AroundService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class AroundServiceImpl implements AroundService {
    @Autowired
    CitySiteMapper citySiteMapper;
    @Autowired
    AdvertiserMapper advertiserMapper;
    @Autowired
    CityLineMapper cityLineMapper;

    @Override
    public HashMap<String, List> queryAroundSiteAdvertiser(String cityName,double longitude,double latitude) {
        HashMap<String, List> hashMap = new HashMap<>();
        Distance userDistance = new Distance(longitude,latitude);

        List<CitySiteInfo> siteList = citySiteMapper.queryCitySiteByCityName(cityName);
        List<CitySiteInfo> newSiteList = new ArrayList<>();

        if(siteList!=null){
            for (int i=0; i<siteList.size(); i++){
                Distance siteDistance = new Distance(siteList.get(i).getxPosition(),siteList.get(i).getyPosition());
                if(userDistance.getDistance(userDistance,siteDistance)<1000){
                    newSiteList.add(siteList.get(i));
                }
            }
        }

        List<Advertiser> advertiserList = advertiserMapper.queryAllAdvertiser();
        List<Advertiser> newAdvertiserList = new ArrayList<>();

        if(siteList!=null) {
            for (int i = 0; i < advertiserList.size(); i++) {
                Distance siteDistance = new Distance(advertiserList.get(i).getAdvertiserX(), advertiserList.get(i).getAdvertiserY());
                if (userDistance.getDistance(userDistance, siteDistance) < 1000) {
                    newAdvertiserList.add(advertiserList.get(i));
                }
            }
        }

        hashMap.put("siteList",newSiteList);
        hashMap.put("advertiserList",newAdvertiserList);

        return hashMap;
    }

    @Override
    public List<CitySiteInfo> queryAroundSiteLine(String cityName, double longitude, double latitude) {
        Distance userDistance = new Distance(longitude,latitude);
        List<CitySiteInfo> siteList = citySiteMapper.queryCitySiteByCityName(cityName);
        List<CitySiteInfo> newSiteList = new ArrayList<>();

        if(siteList!=null){
            for (int i=0; i<siteList.size(); i++){
                Distance siteDistance = new Distance(siteList.get(i).getxPosition(),siteList.get(i).getyPosition());
                if(userDistance.getDistance(userDistance,siteDistance)<1000){
                    newSiteList.add(siteList.get(i));
                }
            }
        }

        for (int i=0; i<newSiteList.size(); i++){
            newSiteList.get(i).setLineList(cityLineMapper.queryLineBySite(newSiteList.get(i).getId()));
        }

        return newSiteList;
    }

    @Override
    public List<LineChild> querySiteLineBySiteId(int siteId) {
        List<LineChild> list = cityLineMapper.queryLineBySite(siteId);

        return list;
    }

}
