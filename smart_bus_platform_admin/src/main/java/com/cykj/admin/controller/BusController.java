package com.cykj.admin.controller;

import com.alibaba.fastjson.JSON;
import com.cykj.admin.service.BusService;
import com.cykj.pojo.Advertiser;
import com.cykj.pojo.Bus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

@RequestMapping(value = "bus")
@RestController
public class BusController {
    @Autowired
    BusService busService;

    @RequestMapping(value = "queryBusByPage")
    //分页查询巴士，id为空就查全部
    public Object queryBusByPage(HttpServletRequest request){
        int startNum;
        if(request.getParameter("page")!=null&&request.getParameter("page").matches("[0,9]*")){
            startNum = Integer.parseInt(request.getParameter("page"));
        }else{
            startNum = 1;
        }
        int pageNum;
        if(request.getParameter("limit")!=null&&request.getParameter("limit").matches("[0,9]*")){
            pageNum = Integer.parseInt(request.getParameter("limit"));
        }else{
            pageNum = 5;
        }

        HashMap<String,Object> condition = new HashMap<String, Object>();

        if(request.getParameter("id")!=null&&!"".equals(request.getParameter("id"))){
            condition.put("id",request.getParameter("id"));
        }
        if(request.getParameter("isFixedLine")!=null&&!"".equals(request.getParameter("isFixedLine"))){
            condition.put("isFixedLine",request.getParameter("isFixedLine"));
        }
        if(request.getParameter("lineName")!=null&&!"".equals(request.getParameter("lineName"))){
            condition.put("lineName",request.getParameter("lineName"));
        }
        if(request.getParameter("repairmanName")!=null&&!"".equals(request.getParameter("repairmanName"))){
            condition.put("repairmanName",request.getParameter("repairmanName"));
        }
        if(request.getParameter("number")!=null&&!"".equals(request.getParameter("number"))){
            condition.put("number",request.getParameter("number"));
        }
        if(request.getParameter("stateId")!=null&&!"".equals(request.getParameter("stateId"))){
            condition.put("stateId",request.getParameter("stateId"));
        }
        if(request.getParameter("cityId")!=null&&!"".equals(request.getParameter("cityId"))){
            condition.put("cityId",request.getParameter("cityId"));
        }

        return JSON.toJSONString(busService.queryBusByPage(condition,startNum,pageNum));
    }

    @RequestMapping(value = "changeBus")
    //修改，模拟删除巴士
    public Object changeBus(@RequestBody Bus bus){
        if (bus!=null){
            int isSuccess = busService.changeBus(bus);

            if (isSuccess!=0){
                if (isSuccess != -9999){
                    return JSON.toJSONString("success");
                }else if(isSuccess != -9998){
                    return JSON.toJSONString("upDataError");
                }else{
                    return JSON.toJSONString("repeat");
                }
            }else{
                return JSON.toJSONString("error");
            }
        }else{
            return JSON.toJSONString("upDataError");
        }
    }

    @RequestMapping(value = "insertBus")
    //新增巴士
    public Object insertBus(@RequestBody Bus bus){
        if (bus!=null){
            int isSuccess = busService.insertBus(bus);

            if (isSuccess!=0){
                if (isSuccess != -9999){
                    return JSON.toJSONString("success");
                }else if(isSuccess != -9998){
                    return JSON.toJSONString("upDataError");
                }else{
                    return JSON.toJSONString("repeat");
                }
            }else{
                return JSON.toJSONString("error");
            }
        }else{
            return JSON.toJSONString("upDataError");
        }
    }
}
