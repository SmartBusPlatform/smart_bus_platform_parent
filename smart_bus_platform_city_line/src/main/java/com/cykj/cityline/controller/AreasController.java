package com.cykj.cityline.controller;

import com.alibaba.fastjson.JSONObject;
import com.cykj.cityline.service.AreasService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.cykj.pojo.AreasChild;

import java.util.HashMap;

@RestController
public class AreasController {
    @Autowired
    private AreasService areasService;
    @RequestMapping("getAreasByPage")
    public String getAreasByPage(AreasChild areasChild, String startSize, String pageSize){
        int startNum;
        if(startSize!=null&&startSize.matches("[0,9]*")){
            startNum = Integer.parseInt(startSize);
        }else{
            startNum = 1;
        }
        int pageNum;
        if(pageSize!=null&&pageSize.matches("[0,9]*")){
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
        System.out.println(areasService.findAreasByPage(condition,startNum,pageNum));
        return JSONObject.toJSONString(areasService.findAreasByPage(condition,startNum,pageNum));
    }
}
