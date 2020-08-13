package com.cykj.userapp.service.impl;

import com.cykj.pojo.CitySiteInfo;
import com.cykj.pojo.Distance;
import com.cykj.pojo.UserToSiteRoute;
import com.cykj.userapp.mapper.CityLineMapper;
import com.cykj.userapp.mapper.CitySiteMapper;
import com.cykj.userapp.service.NavigationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class NavigationServiceImpl implements NavigationService {
    @Autowired
    CitySiteMapper citySiteMapper;
    @Autowired
    CityLineMapper cityLineMapper;

    @Override
    public HashMap<String, Object> myLocationSite(String cityName, double longitude, double latitude, int endSiteId) {
        Distance userDistance = new Distance(longitude,latitude);
        List<CitySiteInfo> siteList = citySiteMapper.queryCitySiteByCityName(cityName);
        HashMap<String, Object> hashMap = new HashMap<>();

        //最近距离站点id,最近距离以及站点
        double nearestDistance = 0;
        int nearestSiteId = 0;

        if(siteList!=null){
            for (int i=0; i<siteList.size(); i++){
                Distance siteDistance = new Distance(siteList.get(i).getxPosition(),siteList.get(i).getyPosition());
                if(userDistance.getDistance(userDistance,siteDistance)<1000){
                    //第一次
                    if(nearestSiteId==0){
                        nearestDistance = userDistance.getDistance(userDistance,siteDistance);
                        nearestSiteId = siteList.get(i).getId();
                    }else{
                        //如果当前的距离小于最近距离
                        if(userDistance.getDistance(userDistance,siteDistance)<nearestDistance){
                            //改变最近距离
                            nearestDistance = userDistance.getDistance(userDistance,siteDistance);
                            nearestSiteId = siteList.get(i).getId();
                        }
                    }
                }
            }

            if(nearestSiteId!=0){
                List<UserToSiteRoute> startRouteList =  cityLineMapper.findStartLineBySiteId(nearestSiteId,endSiteId);
                List<UserToSiteRoute> endRouteList = cityLineMapper.findEndLineBySiteId(nearestSiteId,endSiteId);
                if (startRouteList!=null&&startRouteList.size()>0){
                    for (int i=0; i<startRouteList.size(); i++){
                        startRouteList.get(i).setMiddleSiteList(citySiteMapper.findSiteByLineIdIndex(startRouteList.get(i)));
                        startRouteList.get(i).setDistance(nearestDistance);
                    }
                }
                if (endRouteList!=null&&endRouteList.size()>0){
                    for (int i=0; i<endRouteList.size(); i++){
                        endRouteList.get(i).setMiddleSiteList(citySiteMapper.findSiteByLineIdIndex(endRouteList.get(i)));
                        endRouteList.get(i).setDistance(nearestDistance);
                    }
                }

                hashMap.put("startRouteList",startRouteList);
                hashMap.put("endRouteList",endRouteList);
            }
        }

        return hashMap;
    }
}
