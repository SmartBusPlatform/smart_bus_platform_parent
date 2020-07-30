package com.cykj.admin.controller;

import com.cykj.admin.feign.AreasFeign;
import com.cykj.pojo.AreasChild;
import com.cykj.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("areas")
public class AreasController {
    @Autowired
    private AreasFeign areasFeign;

    @RequestMapping("getAreasByPage")
    @ResponseBody
    public String getAreasByPage(AreasChild areasChild,String startSize, String pageSize){
        return areasFeign.getAreasByPage(areasChild,startSize,pageSize);
    }
}
