package com.cykj.admin.controller;

import com.alibaba.fastjson.JSON;
import com.cykj.admin.service.BusWorkService;
import com.cykj.admin.service.TimeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@RequestMapping(value = "time")
@RestController
public class TimeController {
    @Autowired
    TimeService timeService;

    @RequestMapping(value = "queryTime")
    //查询时刻
    public Object queryTime(HttpServletRequest request){
        int beginOrReturn = 0;
        if(request.getParameter("beginOrReturn")!=null&&!"".equals(request.getParameter("beginOrReturn"))){
            beginOrReturn = Integer.valueOf(request.getParameter("beginOrReturn"));

            return JSON.toJSONString(timeService.queryTime(beginOrReturn));
        }else{
            return JSON.toJSONString("");
        }
    }
}
