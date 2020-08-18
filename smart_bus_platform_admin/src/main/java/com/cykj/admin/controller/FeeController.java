package com.cykj.admin.controller;

import com.alibaba.fastjson.JSON;
import com.cykj.admin.service.FeeService;
import com.cykj.pojo.EchartData;
import com.cykj.util.Result;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("fee")
public class FeeController {

    @Autowired
    private FeeService feeService;

    //跟据城市id查询线路收银
    @RequestMapping("getLineCashier")
    public String getLineCashier( String cityId,String startDate,String endDate){
        return JSON.toJSONString(feeService.findLineCashier(cityId, startDate, endDate));
    }

    @RequestMapping("getLineCashierByName")
    public String getLineCashierByName(String cityId, String lineName, String startDate, String endDate) {
        return JSON.toJSONString(feeService.findLineCashierByName(cityId,lineName,startDate,endDate));
    }

    @RequestMapping("getLineCashierByNameAndTime")
    public String findLineCashierByNameAndTime(String cityId, String lineName, String time) {
        return JSON.toJSONString(feeService.findLineCashierByNameAndTime(cityId,lineName,time));
    }
    @RequestMapping("getSiteFlowByPage")
    public String getSiteFlowByPage(String cityId, String name, String flowNum, String curPage, String pageSize){
        int startNum;
        if(curPage!=null&&curPage.matches("^\\d+$")){
            startNum = Integer.parseInt(curPage);
        }else{
            startNum = 1;
        }
        int pageNum;
        if(pageSize!=null&&pageSize.matches("^\\d+$")){
            pageNum = Integer.parseInt(pageSize);
        }else{
            pageNum = 5;
        }

        return JSON.toJSONString(feeService.findSiteFlowByPage(cityId,name,flowNum,startNum,pageNum));
    }
    @RequestMapping("getSiteFlowByCityIdAndSiteId")
    public String getSiteFlowByCityIdAndSiteId(String cityId, String siteId) {
        return JSON.toJSONString(feeService.findSiteFlowByCityIdAndSiteId(cityId,siteId));
    }
}
