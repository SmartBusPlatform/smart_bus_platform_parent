package com.cykj.userapp.service;

import com.cykj.pojo.*;

import java.util.HashMap;
import java.util.List;

public interface AroundService {
    //查询用户周边站点和广告
    HashMap<String,List> queryAroundSiteAdvertiser(String cityName,double longitude,double latitude);
    //查询用户周边站点和线路
    List<CitySiteInfo> queryAroundSiteLine(String cityName, double longitude, double latitude);
    //查询指定站点和线路
    List<LineChild> querySiteLineBySiteId(int siteId);
}
