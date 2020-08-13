package com.cykj.userapp.mapper;

import com.cykj.pojo.SiteRecord;

import java.util.List;

public interface SiteRecordMapper {
    //根据城市名查询对应的站点更新记录
    List<SiteRecord> querySiteRecordByCityName(String cityName);
}
