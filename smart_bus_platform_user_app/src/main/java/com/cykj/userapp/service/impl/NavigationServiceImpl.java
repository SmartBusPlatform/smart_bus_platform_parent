package com.cykj.userapp.service.impl;

import com.cykj.pojo.*;
import com.cykj.userapp.mapper.CityLineMapper;
import com.cykj.userapp.mapper.CitySiteMapper;
import com.cykj.userapp.service.NavigationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class NavigationServiceImpl implements NavigationService {
    @Autowired
    CitySiteMapper citySiteMapper;
    @Autowired
    CityLineMapper cityLineMapper;

    @Override
    public HashMap<String, Object> myLocationSite(String cityName, double longitude, double latitude,int startSiteId, int endSiteId,int type) {
        Distance userDistance = new Distance(longitude,latitude);
        List<CitySiteInfo> siteList = citySiteMapper.queryCitySiteByCityName(cityName);
        HashMap<String, Object> hashMap = new HashMap<>();

        //最近距离站点id,最近距离以及站点
        double nearestDistance = 0;
        int nearestSiteId = 0;

        if(type==1){
            if(siteList!=null){
                for (int i=0; i<siteList.size(); i++){
                    Distance siteDistance = new Distance(siteList.get(i).getxPosition(),siteList.get(i).getyPosition());
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

                if(nearestSiteId!=0){
                    int id;
                    if(startSiteId!=0){
                        id = startSiteId;
                    }else{
                        id = endSiteId;
                    }
                    if(nearestSiteId!=id){
                        List<UserToSiteRoute> startRouteList = new ArrayList<>();
                        List<UserToSiteRoute> endRouteList = new ArrayList<>();
                        if(endSiteId!=0){
                            System.out.println(nearestSiteId+","+endSiteId);
                            startRouteList =  cityLineMapper.findStartLineBySiteId(nearestSiteId,endSiteId);
                            endRouteList = cityLineMapper.findEndLineBySiteId(nearestSiteId,endSiteId);
                        }else{
                            startRouteList =  cityLineMapper.findStartLineBySiteId(nearestSiteId,startSiteId);
                            endRouteList = cityLineMapper.findEndLineBySiteId(nearestSiteId,startSiteId);
                        }

                        if (startRouteList!=null&&startRouteList.size()>0){
                            for (int i=0; i<startRouteList.size(); i++){
                                startRouteList.get(i).setMiddleSiteList(citySiteMapper.findSiteByLineIdIndex(startRouteList.get(i)));
                                startRouteList.get(i).setDistance((int)nearestDistance);
                            }
                        }
                        if (endRouteList!=null&&endRouteList.size()>0){
                            for (int i=0; i<endRouteList.size(); i++){
                                endRouteList.get(i).setMiddleSiteList(citySiteMapper.findSiteByLineIdIndex(endRouteList.get(i)));
                                endRouteList.get(i).setDistance((int)nearestDistance);
                            }
                        }

                        CitySite citySite = citySiteMapper.querySiteBySiteId(id);
                        hashMap.put("endSite",citySite);
                        hashMap.put("startRouteList",startRouteList);
                        hashMap.put("endRouteList",endRouteList);
                    }else{
                        CitySite citySite = citySiteMapper.querySiteBySiteId(id);
                        hashMap.put("endSite",citySite);
                        hashMap.put("startRouteList","");
                        hashMap.put("endRouteList","");
                    }
                }
            }
        }else{
            List<UserToSiteRoute> startRouteList = new ArrayList<>();
            List<UserToSiteRoute> endRouteList = new ArrayList<>();
            if(endSiteId!=0){
                startRouteList =  cityLineMapper.findStartLineBySiteId(startSiteId,endSiteId);
                endRouteList = cityLineMapper.findEndLineBySiteId(startSiteId,endSiteId);
            }else{
                startRouteList =  cityLineMapper.findStartLineBySiteId(startSiteId,startSiteId);
                endRouteList = cityLineMapper.findEndLineBySiteId(startSiteId,startSiteId);
            }

            if (startRouteList!=null&&startRouteList.size()>0){
                for (int i=0; i<startRouteList.size(); i++){
                    startRouteList.get(i).setMiddleSiteList(citySiteMapper.findSiteByLineIdIndex(startRouteList.get(i)));
                }
            }
            if (endRouteList!=null&&endRouteList.size()>0){
                for (int i=0; i<endRouteList.size(); i++){
                    endRouteList.get(i).setMiddleSiteList(citySiteMapper.findSiteByLineIdIndex(endRouteList.get(i)));
                    endRouteList.get(i).setDistance((int)nearestDistance);
                }
            }

//            CitySite citySite = citySiteMapper.querySiteBySiteId(id);
//            hashMap.put("endSite",citySite);
            hashMap.put("startRouteList",startRouteList);
            hashMap.put("endRouteList",endRouteList);
        }

        return hashMap;
    }

    @Override
    public HashMap<String, Object> q(Navigation navigation) {
        Distance startPosition = new Distance(navigation.getStartX(),navigation.getStartY());
        Distance endPosition = new Distance(navigation.getEndX(),navigation.getEndY());
        List<CitySiteInfo> siteList = citySiteMapper.queryCitySiteByCityName(navigation.getCityName());
        HashMap<String, Object> hashMap = new HashMap<>();

        //最近距离站点id,最近距离以及站点
        double startDistance = 0;
        int startSiteId = 0;
        double endDistance = 0;
        int endSiteId = 0;

        if(siteList!=null) {
            for (int i = 0; i < siteList.size(); i++) {
                Distance siteDistance = new Distance(siteList.get(i).getxPosition(), siteList.get(i).getyPosition());
                //开始站点
                if (startSiteId == 0) {
                    startDistance = startPosition.getDistance(startPosition, siteDistance);
                    startSiteId = siteList.get(i).getId();
                } else {
                    //如果当前的距离小于最近距离
                    if (startPosition.getDistance(startPosition, siteDistance) < startDistance) {
                        //改变最近距离
                        startDistance = startPosition.getDistance(startPosition, siteDistance);
                        startSiteId = siteList.get(i).getId();
                    }
                }

                //结束站点
                if (endSiteId == 0) {
                    endDistance = endPosition.getDistance(endPosition, siteDistance);
                    endSiteId = siteList.get(i).getId();
                } else {
                    //如果当前的距离小于最近距离
                    if (endPosition.getDistance(endPosition, siteDistance) < endDistance) {
                        //改变最近距离
                        endDistance = endPosition.getDistance(endPosition, siteDistance);
                        endSiteId = siteList.get(i).getId();
                    }
                }
            }
        }

        System.out.println("结束最近站点id："+endSiteId);
        if(startSiteId!=0&&endSiteId!=0){
            List<UserToSiteRoute> startRouteList =  cityLineMapper.findStartLineBySiteId(startSiteId,endSiteId);
            List<UserToSiteRoute> endRouteList = cityLineMapper.findEndLineBySiteId(startSiteId,endSiteId);

            if(endRouteList.size()==0&&startRouteList.size()==0){
                List<LineChild> startSiteLineList = cityLineMapper.queryLineBySite(startSiteId);
                List<LineChild> endSiteLineList = cityLineMapper.queryLineBySite(endSiteId);

                if(startSiteLineList.size()==0){
                    List<LineSite> lineSiteList = cityLineMapper.findOneLineBySiteId(endSiteId);
                    List<CitySiteInfo> allSite = new ArrayList<>();
                    double startDistance2 = 0;  //最近站点的距离
                    int startSiteId2 = 0;   //最近站点的id
                    for (int i=0; i<lineSiteList.size();i++){
                        allSite = citySiteMapper.queryAllSiteByLineIdProId(lineSiteList.get(i));
                    }

                    if(allSite!=null){
                        CitySite citySite =  citySiteMapper.querySiteBySiteId(startSiteId);
                        Distance startSitePosition = new Distance(citySite.getxPosition(),citySite.getyPosition());
                        for (int i = 0; i < allSite.size(); i++) {
                            Distance endSiteDistance = new Distance(allSite.get(i).getxPosition(), allSite.get(i).getyPosition());
                            if (startSiteId2 == 0) {
                                startDistance2 = startSitePosition.getDistance(startSitePosition, endSiteDistance);
                                startSiteId2 = allSite.get(i).getId();
                            } else {
                                //如果当前的距离小于最近距离
                                if (startSitePosition.getDistance(startSitePosition, endSiteDistance) < startDistance2) {
                                    //改变最近距离
                                    startDistance2 = startSitePosition.getDistance(startSitePosition, endSiteDistance);
                                    startSiteId2 = allSite.get(i).getId();
                                }
                            }
                        }

                        System.out.println("中间站点："+startSiteId2);
                        if(startSiteId2!=endSiteId){
                            CitySite start = new CitySite("起始位置",navigation.getStartX(),navigation.getStartY());
                            CitySite end = new CitySite("结束位置",navigation.getEndX(),navigation.getEndY());
                            CitySite startSite =  citySiteMapper.querySiteBySiteId(startSiteId);

                            List<UserToSiteRoute> startRouteList2 =  cityLineMapper.findStartLineBySiteId(startSiteId2,endSiteId);
                            List<UserToSiteRoute> endRouteList2 = cityLineMapper.findEndLineBySiteId(startSiteId2,endSiteId);

                            System.out.println(startRouteList2.size());
                            System.out.println(endRouteList2.size());
                            CitySite endSite =  citySiteMapper.querySiteBySiteId(startSiteId);
                            hashMap.put("start",start);
                            hashMap.put("end",end);
                        }else{
                            CitySite start = new CitySite("起始位置",navigation.getStartX(),navigation.getStartY());
                            CitySite end = new CitySite("结束位置",navigation.getEndX(),navigation.getEndY());
                            hashMap.put("start",start);
                            hashMap.put("end",end);
                        }
                    }else{
//                        CitySite startSite =  citySiteMapper.querySiteBySiteId(startSiteId);
//                        CitySite endSite =  citySiteMapper.querySiteBySiteId(startSiteId);
                        CitySite start = new CitySite("起始位置",navigation.getStartX(),navigation.getStartY());
                        CitySite end = new CitySite("结束位置",navigation.getEndX(),navigation.getEndY());
                        hashMap.put("start",start);
                        hashMap.put("end",end);
                    }

                }else if(endSiteLineList.size()==0){

                }else{

                }
            }
        }

        return hashMap;
    }
}
