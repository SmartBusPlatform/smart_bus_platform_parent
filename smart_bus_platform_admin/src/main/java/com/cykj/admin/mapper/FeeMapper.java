package com.cykj.admin.mapper;

import com.cykj.admin.bean.FaceInfo;
import com.cykj.pojo.CitySiteChild;
import com.cykj.pojo.DriverWork;
import com.cykj.pojo.EchartData;
import com.cykj.pojo.Line;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


public interface FeeMapper {
    //跟据城市id查询线路收银
    public List<EchartData> findLineCashier(@Param("cityId") String cityId, @Param("startDate") String startDate, @Param("endDate") String endDate);

    //根据线路名查询线路得每个日期收银
    public List<EchartData> findLineCashierByName(@Param("cityId") String cityId ,@Param("lineName") String lineName,@Param("startDate") String startDate, @Param("endDate") String endDate);
    //根据线路名查询线路得每个时间段收银
    public List<EchartData> findLineCashierByNameAndTime(@Param("cityId") String cityId ,@Param("lineName") String lineName,@Param("time") String time);
    //根据城市id查询客流量
    public List<CitySiteChild> findSiteFlowByPage(@Param("cityId") String cityId , @Param("name") String name, @Param("flowNum") String flowNum);
    //根据城市id和线路id查询客浏览
    public List<EchartData> findSiteFlowByCityIdAndSiteId(@Param("cityId") String cityId , @Param("siteId") String siteId);
}
