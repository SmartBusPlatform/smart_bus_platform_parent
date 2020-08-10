package com.cykj.userapp.mapper;

import com.cykj.pojo.LineChild;

import java.util.List;

public interface CityLineMapper {
    //根据站点查线路
    List<LineChild> queryLineBySite(int siteId);
}
