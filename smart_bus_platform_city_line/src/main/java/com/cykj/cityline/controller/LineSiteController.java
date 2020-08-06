package com.cykj.cityline.controller;

import com.alibaba.fastjson.JSON;
import com.cykj.cityline.service.LineSiteService;
import com.cykj.pojo.LineChild;
import com.cykj.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("lineSite")
public class LineSiteController {

    @Autowired
    private LineSiteService lineSiteService;
    @RequestMapping("getLineSiteByLineId")
    public String getLineSiteByLineId(@RequestBody LineChild lineChild) {
        return JSON.toJSONString(lineSiteService.findLineSiteByLineId(lineChild));
    }
    @RequestMapping("updLineSiteByLineId")
    public String updLineSiteByLineId(@RequestBody LineChild lineChild){
        System.out.println("aaaa:"+lineChild);
        return JSON.toJSONString(lineSiteService.updLineSiteByLineId(lineChild));
    }
}
