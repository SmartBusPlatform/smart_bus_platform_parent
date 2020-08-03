package com.cykj.admin.controller;

import com.cykj.admin.feign.AreasFeign;
import com.cykj.pojo.AreasChild;
import com.cykj.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("areas")
public class AreasController {
    @Autowired
    private AreasFeign areasFeign;

    @RequestMapping("getAreasByPage")
    @ResponseBody
    public String getAreasByPage(AreasChild areasChild,String curPage, String pageSize){
        System.out.println("curPage:"+curPage);
        return areasFeign.getAreasByPage(areasChild,curPage,pageSize);
    }

    @RequestMapping("getProvinceNameAll")
    @ResponseBody
    public String getProvinceNameAll(AreasChild areasChild){
        return areasFeign.getAreasByType(areasChild);
    }
    @RequestMapping("addAreas")
    @ResponseBody
    public String addAreas(AreasChild areasChild){
        return areasFeign.addAreas(areasChild);
    }
    @RequestMapping("updAreaById")
    @ResponseBody
    public String updAreaById(AreasChild areasChild){
        return areasFeign.updAreaById(areasChild);
    }
    @RequestMapping("getAreaTree")
    @ResponseBody
    public String getAreaTree(AreasChild areasChild){
        return areasFeign.getAreaTree();
    }
}
