package com.cykj.cityline.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.cykj.cityline.service.AreasService;
import com.cykj.util.Result;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.cykj.pojo.AreasChild;

import java.util.HashMap;

@RestController
@RequestMapping("areas")
public class AreasController {
    @Autowired
    private AreasService areasService;
    @RequestMapping("getAreasByPage")
    public String getAreasByPage(@RequestBody AreasChild areasChild, String curPage, String pageSize){
        int startNum;
        if(curPage!=null&&curPage.matches("^\\d+$")){
            startNum = Integer.parseInt(curPage);
        }else{
            startNum = 1;
        }
        int pageNum;
        if(pageSize!=null&&pageSize.matches("^\\d+$")){
            pageNum = Integer.parseInt(pageSize);
        }else{
            pageNum = 5;
        }
        HashMap<String,Object> condition = new HashMap<String, Object>();
        condition.put("type",1);
        if(areasChild.getCityName()!=null&&!"".equals(areasChild.getCityName())){
            condition.put("cityName",areasChild.getCityName());
        }
        if(areasChild.getProvinceName()!=null&&!"".equals(areasChild.getProvinceName())){
            condition.put("provinceName",areasChild.getProvinceName());
        }
        return JSON.toJSONString(areasService.findAreasByPage(condition,startNum,pageNum));
    }
    @RequestMapping("getAreasByType")
    public String getAreasByType(@RequestBody AreasChild areasChild){
        return JSON.toJSONString(areasService.findAreasByType(areasChild.getType()));
    }

    @RequestMapping("addAreas")
    public String  insArea(@RequestBody AreasChild areasChild) {
        return JSON.toJSONString(areasService.insArea(areasChild));
    }

    @RequestMapping("updAreaById")
    public String  updAreaById(@RequestBody AreasChild areasChild) {
        return JSON.toJSONString(areasService.updAreaById(areasChild));
    }
    @RequestMapping("getAreaTree")
    public String findAreaTree() {
        return JSON.toJSONString(areasService.findAreaTree());
    }
}
