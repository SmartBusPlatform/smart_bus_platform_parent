package com.cykj.userapp.service;

import com.cykj.pojo.*;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

public interface AroundService {
    //查询用户周边站点和广告
    HashMap<String,List> queryAroundSiteAdvertiser(String cityName,double longitude,double latitude);
    //查询用户周边站点和线路
    List<CitySiteInfo> queryAroundLineSite(String cityName, double longitude, double latitude);
    //查询同名站点
    List<CitySite> querySameSiteBySiteName(String siteName);
    //查询指定站点和线路
    List<LineChild> querySiteLineBySiteId(int siteId);
    //查询指定站点和线路信息
    HashMap<String,Object> queryLineSiteByLineId(LineChild lineChild);
}
