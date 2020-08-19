package com.cykj.admin.controller;

import com.alibaba.fastjson.JSON;
import com.cykj.admin.bean.CookieUtils;
import com.cykj.admin.service.AdminService;
import com.cykj.redis.util.RedisUtil;
import com.cykj.util.LayuiData;
import com.cykj.util.Result;
import com.cykj.util.ResultUtil;
import com.cykj.pojo.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;
import java.util.UUID;

@SuppressWarnings("all")
@Controller
@RequestMapping("/adminControl")
public class AdminControl {
    @Autowired
    private AdminService adminService;
    @Autowired
    private RedisUtil redisUtil;
    //登录
    @RequestMapping(value = "/login")
    @ResponseBody
    public String login(HttpServletRequest request, HttpServletResponse response) {
        String account = request.getParameter("account");
        String password = request.getParameter("password");
        Admin admin = new Admin();
        admin.setAccount(account);
        admin.setPassword(password);
        admin = adminService.login(admin);
        Result result = new Result();
        Map<String, Object> map = null;
        if(admin!=null){
            if(admin.getStateId()==2){
                result.setStatus(200);
                result.setMsg("登录成功");
                String token= UUID.randomUUID().toString();
                admin.setPassword(null);
                redisUtil.set(token,JSON.toJSONString(admin));
                CookieUtils.setCookie(request, response, "admin_token", token);
            }else{
                result.setStatus(201);
                result.setMsg("该账号已被禁用");
            }
        }else{
            result.setStatus(201);
            result.setMsg("账号或密码错误");
        }
//        if (admin != null || admin.getStateId() == 1) {
//            System.out.println(admin);
//            map = ResultUtil.success();
//            request.getSession().setAttribute("admin", admin);
//
//        } else {
//            System.out.println("登录失败");
//            map = ResultUtil.fail("登录失败");
//        }
        return JSON.toJSONString(result);
    }

    //登录
    @RequestMapping(value = "/applogin")
    @ResponseBody
    public String applogin(@RequestBody Admin admin,String code ,String loginState) {
        Result result = new Result();
        if("sms".equals(loginState)){
            String  redisCode = (String) redisUtil.get("code");
            if(redisCode!=null&&!"".equals(redisCode)){
                if(redisCode.equals(code)){
                    admin = adminService.login(admin);
                    System.out.println(admin);
                    if (admin != null) {
                        if(admin.getStateId() == 2){
                            admin.setPassword(null);
                            result.setData(admin);
                            result.setStatus(200);
                        }else {
                            result.setStatus(201);
                            result.setMsg("该用户被禁止登录");
                        }

                    } else {
                        result.setStatus(201);
                        result.setMsg("账号或密码错误");
                    }


                }else{
                    result.setMsg("验证码错误");
                    result.setStatus(201);
                }
            }else{
                result.setMsg("验证码失效");
                result.setStatus(201);
            }

            return JSON.toJSONString(result);
        }else if("account".equals(loginState)){
                    admin = adminService.login(admin);
                    System.out.println(admin);
                    if (admin != null) {
                        if(admin.getStateId() == 2){
                            admin.setPassword(null);
                            result.setData(admin);
                            result.setStatus(200);
                        }else {
                            result.setStatus(201);
                            result.setMsg("该用户被禁止登录");
                        }

                    } else {
                        result.setStatus(201);
                        result.setMsg("账号或密码错误");
                    }
            return JSON.toJSONString(result);
        }else{

            result.setStatus(201);
            result.setMsg("网络出错请重试");
            return JSON.toJSONString(result);

        }

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

    @RequestMapping("resetPwd")
    @ResponseBody
    public String resetPwd(@RequestBody Admin admin,String code){
        String  redisCode = (String) redisUtil.get("code");
        Result result = new Result();
        if(redisCode!=null&&!"".equals(redisCode)){
            if(redisCode.equals(code)){
                redisUtil.del("code");
                return JSON.toJSONString(adminService.resetPwd(admin));
            }else{
                result.setMsg("验证码错误");
                result.setStatus(201);
                return  JSON.toJSONString(result);
            }
        }else{
            result.setMsg("验证码失效");
            result.setStatus(201);
            return  JSON.toJSONString(result);
        }

    }

}
