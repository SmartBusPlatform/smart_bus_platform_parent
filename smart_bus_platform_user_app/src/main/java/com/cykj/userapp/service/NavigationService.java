package com.cykj.userapp.service;

import com.cykj.pojo.Navigation;
import org.springframework.stereotype.Service;

import java.util.HashMap;

public interface NavigationService {
    //我的位置到指定站点路线规划
    HashMap<String,Object> myLocationSite(String cityName, double longitude, double latitude,int startSiteId, int endSiteId,int type);
    //测试
    HashMap<String,Object> q(Navigation navigation);
}
