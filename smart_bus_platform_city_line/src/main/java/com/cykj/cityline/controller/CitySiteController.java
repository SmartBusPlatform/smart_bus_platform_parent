package com.cykj.cityline.controller;

import com.alibaba.fastjson.JSON;
import com.cykj.cityline.service.AreasService;
import com.cykj.cityline.service.CitySiteService;
import com.cykj.pojo.AreasChild;
import com.cykj.pojo.CitySite;
import com.cykj.pojo.CitySiteChild;
import com.cykj.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("citySite")
public class CitySiteController {

    @Autowired
    private CitySiteService citySiteService;
    @RequestMapping("getCitySiteByPage")
    public String getCitySiteByPage(@RequestBody CitySite citySite, String curPage, String pageSize){
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
        if(citySite.getName()!=null&&!"".equals(citySite.getName())){
            condition.put("name",citySite.getName());
        }
        if(citySite.getCityId()!=0){
            condition.put("cityId",citySite.getCityId());
        }
        return JSON.toJSONString(citySiteService.findCitySiteByPage(condition,startNum,pageNum));
    }
    @RequestMapping("addCitySite")
    public String addCitySite(@RequestBody CitySite citySite){
        return JSON.toJSONString(citySiteService.insCitySite(citySite));
    }
    @RequestMapping("updCitySiteByCityId")
    public String  updCitySiteByCityId(@RequestBody CitySite citySite) {
        return JSON.toJSONString(citySiteService.updCitySiteByCityId(citySite));
    }
    @RequestMapping("getCitySiteAllByCityId")
    public String getCitySiteAllByCityId(@RequestBody CitySite citySite) {
        System.out.println("getCitySiteAllByCityId:"+citySite);
        return JSON.toJSONString(citySiteService.findCitySiteAllByCityId(citySite));
    }
}
