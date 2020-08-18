package com.cykj.userapp.controller;

import com.alibaba.fastjson.JSON;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.cykj.pojo.Admin;
import com.cykj.redis.config.RedisConfig;
import com.cykj.redis.util.RedisUtil;
import com.cykj.userapp.bean.SmsUtils;
import com.cykj.userapp.feign.AdminFeign;
import com.cykj.util.Result;
import com.netflix.client.ClientException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.rmi.server.RemoteServer;

@Controller
@RequestMapping("adminControl")
public class AdminController {
    @Autowired
    private AdminFeign adminFeign;
    @Autowired
    private RedisUtil redisUtil;
    @RequestMapping("applogin")
    @ResponseBody
    public String applogin( String account,  String password,String code){

        return adminFeign.applogin(account,password,code);
    }

    @RequestMapping("resetPwd")
    @ResponseBody
    public String resetPwd(Admin admin,String code){
        return adminFeign.resetPwd(admin,code);
    }

    @RequestMapping("getVerCode")
    @ResponseBody
    public String getVerCode(String tel , HttpServletRequest request){
        Result result = new Result();
        if(tel!=null&&tel!=""){
            SmsUtils.setNewcode();
            String code = Integer.toString(SmsUtils.getNewcode());
            SendSmsResponse sendSmsResponse = null;
            try {
                 sendSmsResponse = SmsUtils.sendSms(tel, code);
            } catch (ClientException e) {
                e.printStackTrace();
            } catch (com.aliyuncs.exceptions.ClientException e) {
                e.printStackTrace();
            }
            System.out.println(sendSmsResponse.getCode());
            System.out.println(sendSmsResponse.getMessage());
            System.out.println(sendSmsResponse.getBizId());
            System.out.println(sendSmsResponse.getRequestId());
            if(sendSmsResponse.getMessage().equals("OK")){
                result.setStatus(200);
                result.setMsg("短信发送成功");
//                HttpSession session = request.getSession();
//                session.setAttribute("code",code);
                redisUtil.set("code",code,60);
                return JSON.toJSONString(result);
            }else{
                result.setStatus(201);
                result.setMsg("短信发送失败");
                return JSON.toJSONString(result);
            }
        }else{
            result.setStatus(201);
            result.setMsg("短信发送失败");
            return JSON.toJSONString(result);
        }
    }
}
