package com.cykj.admin.controller;

import com.alibaba.fastjson.JSON;
import com.cykj.admin.service.BusWorkService;
import com.cykj.admin.service.StopBusService;
import com.cykj.pojo.BusWork;
import com.cykj.pojo.BusWorkInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.util.HashMap;

@RequestMapping(value = "stopBus")
@RestController
public class StopBusController {
    @Autowired
    StopBusService stopBusService;

    @RequestMapping(value = "queryStopBusByPage")
    //查询停站巴士，城市id为空就提示错误
    public Object queryStopBusByPage(HttpServletRequest request) throws ParseException {
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

        if(request.getParameter("cityId")!=null&&!"".equals(request.getParameter("cityId"))){
            condition.put("cityId",request.getParameter("cityId"));

            if(request.getParameter("siteName")!=null&&!"".equals(request.getParameter("siteName"))){
                condition.put("siteName",request.getParameter("siteName"));
            }
            if(request.getParameter("busNumber")!=null&&!"".equals(request.getParameter("busNumber"))){
                condition.put("busNumber",request.getParameter("busNumber"));
            }

            return JSON.toJSONString(stopBusService.queryStopBusByPage(condition,startNum,pageNum));

        }else{
            return JSON.toJSONString("cityNull");
        }
    }

    @RequestMapping(value = "deleteStopBus")
    //删除停站bus
    public Object deleteStopBus(@Param("busId") int busId){
        if(busId!=0){
            int isSuccess = stopBusService.deleteStopBus(busId);

            if(isSuccess!=0){
                return JSON.toJSONString("success");
            }else{
                return JSON.toJSONString("error");
            }
        }else{
            return JSON.toJSONString("dataError");
        }
    }
}
