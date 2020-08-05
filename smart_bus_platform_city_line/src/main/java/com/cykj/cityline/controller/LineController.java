package com.cykj.cityline.controller;

import com.alibaba.fastjson.JSON;
import com.cykj.cityline.service.CitySiteService;
import com.cykj.cityline.service.LineService;
import com.cykj.pojo.CitySite;
import com.cykj.pojo.Line;
import com.cykj.pojo.LineChild;
import com.cykj.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;

@RestController
@RequestMapping("line")
public class LineController {

    @Autowired
    private LineService lineService;
    @RequestMapping("getLineByPage")
    public String getLineByPage(@RequestBody Line line, String curPage, String pageSize){
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
        if(line.getName()!=null&&!"".equals(line.getName())){
            condition.put("name",line.getName());
        }
        if(line.getCityId()!=0){
            condition.put("cityId",line.getCityId());
        }
        return JSON.toJSONString(lineService.findLinePage(condition,startNum,pageNum));
    }
    @RequestMapping("addLine")
    public String insLine(@RequestBody LineChild lineChild) {
        return JSON.toJSONString(lineService.insLine(lineChild));
    }
//    @RequestMapping("updCitySiteByCityId")
//    public String  updCitySiteByCityId(@RequestBody CitySite citySite) {
//        return JSON.toJSONString(citySiteService.updCitySiteByCityId(citySite));
//    }
}
