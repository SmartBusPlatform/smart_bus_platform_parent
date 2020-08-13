package com.cykj.userapp.mapper;

import com.cykj.pojo.Advertiser;
import com.cykj.pojo.AdvertiserInfo;

import java.util.List;

public interface AdvertiserMapper {
    //查询首页轮播的广告
    List<AdvertiserInfo> queryCarouselAdvertiser();
    //查询所有广告
    List<Advertiser> queryAllAdvertiser();
}
