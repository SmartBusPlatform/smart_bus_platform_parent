package com.cykj.admin.controller;

import com.alibaba.fastjson.JSON;
import com.cykj.admin.service.OpinionService;
import com.cykj.pojo.Admin;
import com.cykj.pojo.LayuiData;
import com.cykj.pojo.OpinionInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;


@RequestMapping("opinionController")
@Controller
public class OpinionController {

    @Autowired
    private OpinionService opinionService;

    //查询意见列表
    @RequestMapping("selectOpinionList")
    @ResponseBody
    public String selectOpinionList(int page, int limit, String startTime, String endTime, String userPhone, String adminAccount,String state) {
        HashMap<String,Object> map = new HashMap<>();
        map.put("startLimit", (page - 1) * limit);
        map.put("endLimit", limit);
        map.put("startTime", startTime);
        map.put("endTime", endTime);
        map.put("userPhone", userPhone);
        map.put("adminAccount", adminAccount);
        map.put("state", state);

        LayuiData layuiData = opinionService.selectOpinionList(map);

        return JSON.toJSONString(layuiData);
    }


    //插入管理员的意见回复
    @RequestMapping("insertReplyContent")
    @ResponseBody
    public String insertReplyContent(HttpServletRequest request,int id, String reply) {

        OpinionInfo opinionInfo = new OpinionInfo();
        Admin admin = (Admin) request.getSession().getAttribute("admin");

        if (admin == null) {
            return "error";
        }

        opinionInfo.setId(id);
        opinionInfo.setReplay(reply);
        opinionInfo.setAdminId(admin.getId());

        int i = opinionService.insertReplyContent(opinionInfo);
        if (i == 1) {
            return "success";
        }
        return "error";
    }

    @RequestMapping("insertResultContent")
    @ResponseBody
    public String insertResultContent(int id, String result) {

        OpinionInfo opinionInfo = new OpinionInfo();

        opinionInfo.setId(id);
        opinionInfo.setResult(result);

        int i = opinionService.insertResultContent(opinionInfo);
        if (i == 1) {
            return "success";
        }
        return "error";
    }


}
