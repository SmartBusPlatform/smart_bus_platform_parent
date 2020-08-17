package com.cykj.admin.controller;

import com.alibaba.fastjson.JSON;
import com.cykj.admin.service.AdminService;
import com.cykj.util.LayuiData;
import com.cykj.util.Result;
import com.cykj.util.ResultUtil;
import com.cykj.pojo.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

@SuppressWarnings("all")
@Controller
@RequestMapping("/adminControl")
public class AdminControl {
    @Autowired
    private AdminService adminService;

    //登录
    @RequestMapping(value = "/login")
    @ResponseBody
    public Object login(HttpServletRequest request, HttpServletResponse response) {
        String account = request.getParameter("account");
        String password = request.getParameter("password");
        Admin admin = new Admin();
        admin.setAccount(account);
        admin.setPassword(password);
        admin = adminService.login(admin);
        Map<String, Object> map = null;
        if (admin != null || admin.getStateId() == 1) {
            System.out.println(admin);
            map = ResultUtil.success();
            request.getSession().setAttribute("admin", admin);

        } else {
            System.out.println("登录失败");
            map = ResultUtil.fail("登录失败");
        }
        return JSON.toJSONString(map);
    }

    //登录
    @RequestMapping(value = "/applogin")
    @ResponseBody
    public Object applogin(String account,String password) {

        Admin admin = new Admin();
        admin.setAccount(account);
        admin.setPassword(password);
        admin = adminService.login(admin);
        Result result = new Result();
        if (admin != null && admin.getStateId() == 1) {
            admin.setPassword(null);
            result.setData(admin);
            result.setStatus(200);
        } else {
           result.setStatus(201);
           result.setData("账号或密码错误");
        }
        return JSON.toJSONString(result);
    }
    //列表layui
    @RequestMapping(value = "/adminList")
    @ResponseBody
    public String adminList(HttpServletRequest request, HttpServletResponse response) {

        response.setContentType("text/html;charset=utf-8");

        String pageStr = request.getParameter("page");//页码
        String pageSizeStr = request.getParameter("limit");//每页记录数
        String trueName = request.getParameter("trueName");
        String adminName = request.getParameter("adminName");

        //String password = request.getParameter("pwd");
        System.out.println("adminName:" + adminName + " trueName:" + trueName + "start:" + pageStr + " pageSize:" + pageSizeStr);
        Admin admin = new Admin();
        admin.setName(trueName);
        admin.setAccount(adminName);
        LayuiData layuiData = adminService.selectList(admin, Integer.parseInt(pageStr), Integer.parseInt(pageSizeStr));
        //response.getWriter().write(JSON.toJSONString(layuiData));
        return JSON.toJSONString(layuiData);
    }

}
