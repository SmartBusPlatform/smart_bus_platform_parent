package com.cykj.admin.controller;

import com.alibaba.fastjson.JSON;
import com.cykj.admin.service.BusService;
import com.cykj.admin.service.BusWorkService;
import com.cykj.pojo.Bus;
import com.cykj.pojo.BusWork;
import com.cykj.pojo.BusWorkInfo;
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

    @RequestMapping(value = "insertBusWork")
    //查询巴士排班，id为空就提示错误
    public Object insertBusWork(@RequestBody BusWorkInfo busWork){
        if(busWork!=null){
            int isSuccess = busWorkService.insertBusWork(busWork);
            if(isSuccess!=0){
                if(isSuccess==-9999){
                    return JSON.toJSONString("busIsRunning");
                }else{
                    return JSON.toJSONString("success");
                }
            }else{
                return JSON.toJSONString("error");
            }
        }else{
            return JSON.toJSONString("dataError");
        }
    }
}
