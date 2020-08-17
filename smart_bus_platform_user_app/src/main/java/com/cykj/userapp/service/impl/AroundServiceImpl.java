package com.cykj.userapp.service.impl;

import com.cykj.pojo.*;
import com.cykj.userapp.mapper.AdvertiserMapper;
import com.cykj.userapp.mapper.CityLineMapper;
import com.cykj.userapp.mapper.CitySiteMapper;
import com.cykj.userapp.service.AroundService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
    public List<CitySiteInfo> queryAroundLineSite(String cityName, double longitude, double latitude) {
        Distance userDistance = new Distance(longitude,latitude);
        List<CitySiteInfo> siteList = citySiteMapper.queryCitySiteByCityName(cityName);
        List<CitySiteInfo> newSiteList = new ArrayList<>();

        if(siteList!=null){
            for (int i=0; i<siteList.size(); i++){
                Distance siteDistance = new Distance(siteList.get(i).getxPosition(),siteList.get(i).getyPosition());
                double distance = userDistance.getDistance(userDistance,siteDistance);
                if(distance<1000){
                    siteList.get(i).setDistance((int)distance);
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
    public List<CitySite> querySameSiteBySiteName(String siteName) {
        List<CitySite> list = citySiteMapper.querySameSiteBySiteName(siteName);

        return list;
    }

    @Override
    public List<LineChild> querySiteLineBySiteId(int siteId) {
        List<LineChild> list = cityLineMapper.queryLineBySite(siteId);

        return list;
    }

    @Override
    public HashMap<String, Object> queryLineSiteByLineId(LineChild lineChild) {
        //获取线路基本信息
        LineChild lineInf = cityLineMapper.queryLineInfByLineId(lineChild.getLineId());
        //获取线路发车时刻
        List<Times> timeList = cityLineMapper.queryLineTimeByLineId(lineChild.getLineId(),lineChild.getPropertyId());
        if (timeList!=null&&timeList.size()!=0){
            //将发车时刻第一个赋给基本信息的第一次发车
            lineInf.setFirstTime(timeList.get(0).getTime());
            //最后一次发车
            lineInf.setLastTime(timeList.get(timeList.size()-1).getTime());
            //当前发车
            boolean isSuccess = true;
            for (int i=0; i<timeList.size(); i++){
                try {
                    if(compare(timeList.get(i).getTime())){
                        lineInf.setNowTime(timeList.get(i).getTime());
                        isSuccess = false;
                        break;
                    }
                } catch (ParseException e) {
                    e.printStackTrace();
                }
            }
            if (isSuccess){
                lineInf.setNowTime("明天"+timeList.get(0).getTime());
            }
        }else{
            lineInf.setFirstTime("暂无");
            lineInf.setLastTime("暂无");
            lineInf.setNowTime("暂无");
        }

        List<CitySiteArr> siteList = citySiteMapper.findLineSiteStartByLineId(lineChild);
        if(siteList!=null&&siteList.size()!=0){
            lineInf.setEndSiteName(siteList.get(siteList.size()-1).getName());
        }

        HashMap<String,Object> hashMap = new HashMap<>();
        hashMap.put("lineInf",lineInf);
        hashMap.put("siteList",siteList);

        return hashMap;
    }

    //比较时间的方法
    public boolean compare(String time2) throws ParseException
    {

        SimpleDateFormat sdf=new SimpleDateFormat("hh:mm");
        //将字符串形式的时间转化为Date类型的时间
        Date a= sdf.parse(sdf.format(new Date()));
        Date b=sdf.parse(time2);
        //Date类的一个方法，如果a早于b返回true，否则返回false
        if(a.before(b))
            return true;
        else
            return false;
    }
}
