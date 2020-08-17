package com.cykj.userapp.service;

import com.cykj.pojo.AdvertiserInfo;
import org.springframework.stereotype.Service;

import java.util.List;

public interface AdvertiserService {
    //查询首页轮播的广告
    List<AdvertiserInfo> queryCarouselAdvertiser();
}
