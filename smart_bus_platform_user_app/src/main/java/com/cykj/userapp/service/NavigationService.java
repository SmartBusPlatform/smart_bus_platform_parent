package com.cykj.userapp.service;

import org.springframework.stereotype.Service;

import java.util.HashMap;

public interface NavigationService {
    //我的位置到指定站点路线规划
    HashMap<String,Object> myLocationSite(String cityName, double longitude, double latitude, int endSiteId);
}
