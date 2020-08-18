package com.cykj.userapp.controller;

import com.alibaba.fastjson.JSON;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.cykj.pojo.User;
import com.cykj.redis.util.RedisUtil;
import com.cykj.userapp.bean.SmsUtils;
import com.cykj.userapp.service.UserService;
import com.cykj.util.Result;
import com.netflix.client.ClientException;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@RequestMapping("user")
@Controller
public class UserController {
    @Autowired
    UserService userService;
    @Autowired
    private RedisUtil redisUtil;

    //登录
    @RequestMapping("userLogin")
    @ResponseBody
    public Object addOpinionImage(@Param("phone") long phone,@Param("yzCode") int yzCode) {
        Result result = new Result();
        String redisCode = (String) redisUtil.get("code");
        if(redisCode!=null&&!"".equals(redisCode)) {
            if (redisCode.equals(yzCode)) {
                User user = userService.queryUserByPhone(phone);
                if (user == null) {
                    User newUser = new User();
                    newUser.setPhone(phone);
                    newUser = userService.insertUser(newUser);
                    result.setData(newUser);
                    result.setStatus(200);
                } else {
                    if(user.getStateId()==2){
                        result.setData(user);
                        result.setStatus(200);
                    }else{
                        result.setMsg("用户被禁用或删除，无法登录");
                        result.setStatus(201);
                    }

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
    }

    //修改
    @RequestMapping("userChange")
    @ResponseBody
    public Object addOpinionImage(User user) {
        if(user!=null&&user.getId()!=0){
            int isSuccess = userService.changeUser(user);
            if(isSuccess!=0){
                return JSON.toJSONString("success");
            }else{
                return JSON.toJSONString("error");
            }
        }else{
            return JSON.toJSONString("error");
        }
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
