package com.cykj.userapp.mapper;

import com.cykj.pojo.*;

import java.util.List;

public interface CitySiteMapper {
    //查询城市站点
    List<CitySiteInfo> queryCitySiteByCityName(String cityName);
    //查询对应线路ID的所有站点
    List<CitySiteArr> findLineSiteStartByLineId(LineChild lineChild);
    //根据线路id和往返程属性id以及索引范围来查询站点
    List<CitySiteArr> findSiteByLineIdIndex(UserToSiteRoute userToSiteRoute);
}
