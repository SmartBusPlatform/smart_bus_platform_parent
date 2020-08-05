package com.cykj.admin.service;

import com.cykj.pojo.Advertiser;
import com.cykj.pojo.AdvertiserInfo;
import com.cykj.util.Result;

import java.util.HashMap;
import java.util.List;

public interface AdvertiserService {
    //分页查询广告
    public Result queryAdvertiserByPage(HashMap<String,Object> condition, int startSize, int pageSize);
    //查询广告
    public List<AdvertiserInfo> queryAdvertiser(HashMap<String,Object> condition);
    //新增广告
    public int insertAdvertiser(Advertiser advertiser);
    //修改广告
    public int changeAdvertiser(Advertiser advertiser);
}