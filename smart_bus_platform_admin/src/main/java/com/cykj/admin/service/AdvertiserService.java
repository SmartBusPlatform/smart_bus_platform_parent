package com.cykj.smart_bus_platform_admin.service;

import com.cykj.pojo.Advertiser;

public interface AdvertiserService {
    //查询广告
    public Advertiser queryAdvertiser(String id);

    //新增广告
    public int insertAdvertiser(Advertiser advertiser);
}
