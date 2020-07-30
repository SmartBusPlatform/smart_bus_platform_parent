package com.cykj.admin.mapper;

import com.cykj.pojo.Advertiser;
import org.apache.ibatis.annotations.Param;

public interface AdvertiserMapper {

    //查询广告
    Advertiser queryAdvertiser(@Param("id") String id);
    //新增广告
    int insertAdvertiser(Advertiser advertiser);
}
