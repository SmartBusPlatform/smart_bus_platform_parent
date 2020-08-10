package com.cykj.userapp.mapper;

import com.cykj.pojo.AdvertiserInfo;
import com.cykj.pojo.CitySite;
import com.cykj.pojo.CitySiteInfo;

import java.util.List;

public interface CitySiteMapper {
    //查询城市站点
    List<CitySiteInfo> queryCitySiteByCityName(String cityName);
}
