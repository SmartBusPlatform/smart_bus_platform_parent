package com.cykj.userapp.controller;


import com.alibaba.fastjson.JSON;
import com.cykj.pojo.Navigation;
import com.cykj.userapp.service.NavigationService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping(value = "navigation")
@RestController
public class NavigationController {
    @Autowired
    NavigationService navigationService;

    @RequestMapping(value = "myLocationSite")
    //我的位置到指定站点的路线规划
    public Object myLocationSite(@Param("cityName") String cityName, @Param("longitude") double longitude, @Param("latitude") double latitude,@Param("startSiteId") int startSiteId ,@Param("endSiteId") int endSiteId,@Param("type") int type){
        if (cityName!=null&&!"".equals(cityName)){
            return JSON.toJSONString(navigationService.myLocationSite(cityName,longitude,latitude,startSiteId,endSiteId,type));
        }else {
            return JSON.toJSONString("dataError");
        }
    }

    @RequestMapping(value = "q")
    //根据线路id和往返属性查询该线路所有站点
    public Object q(Navigation navigation){
        if (navigation!=null&&navigation.getCityName()!=null&&!"".equals(navigation.getCityName())){
            return JSON.toJSONString(navigationService.q(navigation));
        }else {
            return null;
        }
    }
}
