package com.cykj.admin.controller;

import com.cykj.admin.feign.AreasFeign;
import com.cykj.admin.feign.CitySiteFeign;
import com.cykj.pojo.AreasChild;
import com.cykj.pojo.CitySite;
import com.cykj.pojo.CitySiteChild;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("citySite")
public class CitySiteController {
    @Autowired
    private CitySiteFeign citySiteFeign;

    @RequestMapping("getCitySiteByPage")
    @ResponseBody
    public String getCitySiteByPage(CitySite citySite, String curPage, String pageSize){
        return citySiteFeign.getCitySiteByPage(citySite,curPage,pageSize);
    }
    @RequestMapping("addCitySite")
    @ResponseBody
    public String addCitySite(CitySite citySite){
        return citySiteFeign.addCitySite(citySite);
    }
    @RequestMapping("updCitySiteByCityId")
    @ResponseBody
    public String updCitySiteByCityId(CitySite citySite){
        return citySiteFeign.updCitySiteByCityId(citySite);
    }
    @RequestMapping("getCitySiteAllByCityId")
    @ResponseBody
    public String getCitySiteAllByCityId(CitySite citySite){
        return citySiteFeign.getCitySiteAllByCityId(citySite);
    }
}
