package com.cykj.admin.controller;

import com.alibaba.fastjson.JSON;
import com.cykj.admin.service.BusMainTainService;
import com.cykj.admin.service.BusService;
import com.cykj.pojo.Bus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

@RequestMapping(value = "busMainTain")
@RestController
public class BusMainTainController {
    @Autowired
    BusMainTainService busMainTainService;

    @RequestMapping(value = "queryBusMainTainByPage")
    //分页查询巴士，id为空就查全部
    public Object queryBusByPage(HttpServletRequest request){
        int startNum;
        if(request.getParameter("page")!=null&&request.getParameter("page").matches("^\\d+$")){
            startNum = Integer.parseInt(request.getParameter("page"));
        }else{
            startNum = 1;
        }
        int pageNum;
        if(request.getParameter("limit")!=null&&request.getParameter("limit").matches("^\\d+$")){
            pageNum = Integer.parseInt(request.getParameter("limit"));
        }else{
            pageNum = 5;
        }

        HashMap<String,Object> condition = new HashMap<String, Object>();

        if(request.getParameter("id")!=null&&!"".equals(request.getParameter("id"))){
            condition.put("id",request.getParameter("id"));
        }
        if(request.getParameter("number")!=null&&!"".equals(request.getParameter("number"))){
            condition.put("number",request.getParameter("number"));
        }
        if(request.getParameter("cityId")!=null&&!"".equals(request.getParameter("cityId"))){
            condition.put("cityId",request.getParameter("cityId"));
        }

        return JSON.toJSONString(busMainTainService.queryBusMainTainByPage(condition,startNum,pageNum));
    }
}
