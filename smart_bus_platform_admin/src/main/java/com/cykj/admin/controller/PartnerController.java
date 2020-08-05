package com.cykj.admin.controller;

import com.alibaba.fastjson.JSON;
import com.cykj.admin.service.PartnerService;
import com.cykj.pojo.Parameter;
import com.cykj.pojo.Partner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@RequestMapping(value = "partner")
@RestController
public class PartnerController {
    @Autowired
    PartnerService partnerService;

    @RequestMapping(value = "queryPartnerType")
    public Object queryPartnerType(){
        List<Parameter> partnerType = partnerService.queryPartnerType();

        return JSON.toJSONString(partnerType);
    }

    @RequestMapping(value = "queryPartnerByPage")
    //查询广告商，id为空就查全部
    public Object queryPartnerByPage(HttpServletRequest request){
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
        if(request.getParameter("partner")!=null&&!"".equals(request.getParameter("partner"))){
            condition.put("partner",request.getParameter("partner"));
        }
        if(request.getParameter("cityId")!=null&&!"".equals(request.getParameter("cityId"))){
            condition.put("cityId",request.getParameter("cityId"));
        }
        if(request.getParameter("typeId")!=null&&!"".equals(request.getParameter("typeId"))){
            condition.put("typeId",request.getParameter("typeId"));
        }

        return JSON.toJSONString(partnerService.queryPartnerByPage(condition,startNum,pageNum));
    }

    @RequestMapping(value = "queryPartner")
    //查询广告商，id为空就查全部
    public Object queryPartner(HttpServletRequest request){
        HashMap<String,Object> condition = new HashMap<String, Object>();

        if(request.getParameter("id")!=null&&!"".equals(request.getParameter("id"))){
            condition.put("id",request.getParameter("id"));
        }
        if(request.getParameter("partner")!=null&&!"".equals(request.getParameter("partner"))){
            condition.put("partner",request.getParameter("partner"));
        }
        if(request.getParameter("cityId")!=null&&!"".equals(request.getParameter("cityId"))){
            condition.put("cityId",request.getParameter("cityId"));
        }
        if(request.getParameter("typeId")!=null&&!"".equals(request.getParameter("typeId"))){
            condition.put("typeId",request.getParameter("typeId"));
        }

        return JSON.toJSONString(partnerService.queryPartner(condition));
    }

    @RequestMapping(value = "insertPartner")
    //新增广告商
    public String insertPartner(@RequestBody Partner partner){
        if (partner!=null){
            int isSuccess = partnerService.insertPartner(partner);

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

    @RequestMapping(value = "changePartner")
    //修改，模拟删除广告商
    public String changePartner(@RequestBody Partner partner){
        if (partner!=null){
            int isSuccess = partnerService.changePartner(partner);

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
