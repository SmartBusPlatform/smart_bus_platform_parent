package com.cykj.userapp.mapper;

import com.cykj.pojo.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CitySiteMapper {
    //查询城市站点
    List<CitySiteInfo> queryCitySiteByCityName(String cityName);
    //查询对应线路ID的所有站点
    List<CitySiteArr> findLineSiteStartByLineId(LineChild lineChild);
    //根据线路id和往返程属性id以及索引范围来查询站点
    List<CitySiteArr> findSiteByLineIdIndex(UserToSiteRoute userToSiteRoute);
    //查询同名站点
    List<CitySite> querySameSiteBySiteName(String siteName);
    //根据线路id属性id查询线路的所有站点
    List<CitySiteInfo> queryAllSiteByLineIdProId(LineSite lineSite);
    //查询站点
    CitySite querySiteBySiteId(int siteId);
    //模糊查询站点
    List<CitySite> querySiteBySiteName(String name);
    //根据线路id属性id查询线路的所有站点
    List<CitySiteArr> queryLineSiteByLineIdProId(@Param("lineId") int lineId,@Param("propertyId") int propertyId);
}
