package com.cykj.admin.controller;

import com.alibaba.fastjson.JSON;
import com.cykj.admin.service.BusService;
import com.cykj.admin.service.BusWorkService;
import com.cykj.pojo.Bus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

@RequestMapping(value = "busWork")
@RestController
public class BusWorkController {
    @Autowired
    BusWorkService busWorkService;

    @RequestMapping(value = "queryBusWork")
    //查询巴士排班，id为空就提示错误
    public Object queryBusByPage(HttpServletRequest request){
        if(request.getParameter("id")!=null&&!"".equals(request.getParameter("id"))){
            return JSON.toJSONString(busWorkService.queryBusWork(Integer.valueOf(request.getParameter("id"))));
        }
        return JSON.toJSONString("dataError");
    }
}
