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
    public Object myLocationSite(Navigation navigation){
        if (navigation!=null){
            return JSON.toJSONString(navigationService.myLocationSite(navigation));
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

    @RequestMapping(value = "querySiteBySiteName")
    //根据线路id和往返属性查询该线路所有站点
    public Object querySiteBySiteName(@Param("name") String name){
        if (name!=null&&!name.equals("")){
            return JSON.toJSONString(navigationService.querySiteBySiteName(name));
        }else {
            return null;
        }
    }

    @RequestMapping(value = "queryLineByLineName")
    //根据线路id和往返属性查询该线路所有站点
    public Object queryLineByLineName(@Param("name") String name){
        if (name!=null&&!name.equals("")){
            return JSON.toJSONString(navigationService.findLineByLineName(name));
        }else {
            return null;
        }
    }

    @RequestMapping(value = "queryLineSiteByLineId")
    //根据线路id和往返属性查询该线路所有站点
    public Object queryLineSiteByLineId(@Param("id") int id){
        if (id!=0){
            return JSON.toJSONString(navigationService.queryLineSiteByLineId(id));
        }else {
            return null;
        }
    }
}
