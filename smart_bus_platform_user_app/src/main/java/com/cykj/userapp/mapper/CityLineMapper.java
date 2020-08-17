package com.cykj.userapp.mapper;

import com.cykj.pojo.LineChild;
import com.cykj.pojo.Times;
import com.cykj.pojo.UserToSiteRoute;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CityLineMapper {
    //根据站点查线路
    List<LineChild> queryLineBySite(int siteId);
    //根据线路id查询线路发车时刻
    List<Times> queryLineTimeByLineId(@Param("lineId") int lineId,@Param("propertyId") int propertyId);
    //根据线路id查询线路发车时刻
    LineChild queryLineInfByLineId(@Param("lineId") int lineId);
    //根据两个线路id查询他们共同的始程线路
    List<UserToSiteRoute> findStartLineBySiteId(@Param("startSiteId") int startSiteId,@Param("endSiteId") int endSiteId);
    //根据两个线路id查询他们共同的返程线路
    List<UserToSiteRoute> findEndLineBySiteId(@Param("startSiteId") int startSiteId,@Param("endSiteId") int endSiteId);
}
