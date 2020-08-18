package com.cykj.userapp.service;

import com.cykj.pojo.CitySite;
import com.cykj.pojo.LineChild;
import com.cykj.pojo.LineSite;
import com.cykj.pojo.Navigation;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

public interface NavigationService {
    //我的位置到指定站点路线规划
    HashMap<String,Object> myLocationSite(Navigation navigation);
    //测试
    HashMap<String,Object> q(Navigation navigation);
    //模糊查询站点
    List<CitySite> querySiteBySiteName(String name);
    //模糊查询线路
    List<LineSite> findLineByLineName(String name);
    //模糊查询线路
    LineChild queryLineSiteByLineId(int id);
}
