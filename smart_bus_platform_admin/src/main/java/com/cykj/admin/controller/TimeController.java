package com.cykj.admin.controller;

import com.alibaba.fastjson.JSON;
import com.cykj.admin.service.BusWorkService;
import com.cykj.admin.service.TimeService;
import com.cykj.pojo.BusWork;
import com.cykj.pojo.TimesInfo;
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
        int lineId = 0;
        if(request.getParameter("beginOrReturn")!=null&&!"".equals(request.getParameter("beginOrReturn"))){
            beginOrReturn = Integer.valueOf(request.getParameter("beginOrReturn"));
        }
        if(request.getParameter("lineId")!=null&&!"".equals(request.getParameter("lineId"))){
            lineId = Integer.valueOf(request.getParameter("lineId"));
        }

        if(beginOrReturn!=0&&lineId!=0){
            BusWork busWork = new BusWork();
            busWork.setLineId(lineId);
            busWork.setStartBeginOrReturn(beginOrReturn);
            return JSON.toJSONString(timeService.queryTime(busWork));
        }else{
            return JSON.toJSONString("");
        }
    }
}
