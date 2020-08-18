package com.cykj.admin.service;

import com.cykj.pojo.CitySiteChild;
import com.cykj.pojo.EchartData;
import com.cykj.util.Result;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


public interface FeeService {
    //跟据城市id查询线路收银
    public List<EchartData> findLineCashier(String cityId, String startDate, String endDate);

    //根据线路名查询线路得每天收银
    public List<EchartData> findLineCashierByName(String cityId, String lineName, String startDate, String endDate);

    //根据线路名查询线路得每个时间段收银
    public List<EchartData> findLineCashierByNameAndTime( String cityId ,String lineName, String time);
    //根据城市id查询客流量
    public Result findSiteFlowByPage(String cityId , String name, String flowNum, int startSize, int pageSize);
    //根据城市id和线路id查询客浏览
    public List<EchartData> findSiteFlowByCityIdAndSiteId( String cityId ,  String siteId);
}
