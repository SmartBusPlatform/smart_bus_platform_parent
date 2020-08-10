package com.cykj.userapp.controller;

import com.alibaba.fastjson.JSON;
import com.cykj.pojo.AdvertiserInfo;
import com.cykj.userapp.service.AdvertiserService;
import org.apache.http.HttpResponse;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@RequestMapping(value = "advertiser")
@RestController
public class AdvertiserController {
    @Autowired
    AdvertiserService advertiserService;

    @RequestMapping(value = "queryCarouselAdvertiser")
    //分页查询广告，id为空就查全部
    public Object queryCarouselAdvertiser(){
        return JSON.toJSONString(advertiserService.queryCarouselAdvertiser());
    }
}
