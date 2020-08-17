package com.cykj.admin.mapper;

import com.cykj.pojo.Advertiser;
import com.cykj.pojo.AdvertiserInfo;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface AdvertiserMapper {
    //查询广告
    List<AdvertiserInfo> queryAdvertiser(HashMap<String, Object> map);
    //新增广告
    int insertAdvertiser(Advertiser advertiser);
    //修改广告
    int changeAdvertiser(Advertiser advertiser);
    //根据广告商id修改广告
    int changeAdvertiserStateByPartnerId(@Param("stateId") int stateId,@Param("partnerId")int partnerId);
}
