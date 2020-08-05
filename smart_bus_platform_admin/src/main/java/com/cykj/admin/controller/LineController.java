package com.cykj.admin.controller;

import com.cykj.admin.feign.CitySiteFeign;
import com.cykj.admin.feign.LineFeign;
import com.cykj.pojo.CitySite;
import com.cykj.pojo.CitySiteArr;
import com.cykj.pojo.Line;
import com.cykj.pojo.LineChild;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("line")
public class LineController {
    @Autowired
    private LineFeign lineFeign;

    @RequestMapping("getLineByPage")
    @ResponseBody
    public String getLineByPage(Line line, String curPage, String pageSize){
        return lineFeign.getLineByPage(line,curPage,pageSize);
    }
    @RequestMapping("addLine")
    @ResponseBody
    public String addCitySite(@RequestBody LineChild lineChild){
        System.out.println("lineChild"+lineChild);
        return lineFeign.addLine(lineChild);
    }
//    @RequestMapping("updCitySiteByCityId")
//    @ResponseBody
//    public String updCitySiteByCityId(CitySite citySite){
//        return citySiteFeign.updCitySiteByCityId(citySite);
//    }
}
