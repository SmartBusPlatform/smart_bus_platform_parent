package com.cykj.admin.controller;

import com.cykj.admin.feign.LineFeign;
import com.cykj.admin.feign.LineSiteFeign;
import com.cykj.pojo.Line;
import com.cykj.pojo.LineChild;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("lineSite")
public class LineSiteController {
    @Autowired
    private LineSiteFeign lineSiteFeign;

    @RequestMapping("getLineSiteByLineId")
    @ResponseBody
    public String getLineByPage(LineChild lineChild){
        return lineSiteFeign.getLineSiteByLineId(lineChild);
    }
//
    @RequestMapping("updLineSiteByLineId")
    @ResponseBody
    public String updLineSiteByLineId(@RequestBody LineChild lineChild){
        System.out.println("lineChild"+lineChild);
        return lineSiteFeign.updLineSiteByLineId(lineChild);
    }
}
