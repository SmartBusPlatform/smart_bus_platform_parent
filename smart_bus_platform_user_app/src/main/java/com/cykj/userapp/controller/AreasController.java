package com.cykj.userapp.controller;

import com.alibaba.fastjson.JSON;
import com.cykj.userapp.feign.AreasFeign;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


@RequestMapping("areas")
@Controller
public class AreasController {
    @Autowired
    private AreasFeign areasFeign;
    @RequestMapping("getAreasAll")
    @ResponseBody
    public  String getAreasAll(){
        return areasFeign.getAreasAll();
    }
}
