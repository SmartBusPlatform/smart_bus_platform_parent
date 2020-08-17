package com.cykj.userapp.controller;

import com.alibaba.fastjson.JSON;
import com.cykj.pojo.Opinion;
import com.cykj.pojo.User;
import com.cykj.userapp.service.OpinionService;
import com.cykj.userapp.service.UserAddressService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;

@RequestMapping("userAddress")
@Controller
public class UserAddressController {

    @Autowired
    private UserAddressService userAddressService;

    //查询用户地址
    @RequestMapping("queryUserAddress")
    @ResponseBody
    public Object addOpinionImage(@Param("id") int id) {
        if(id!=0){
            return JSON.toJSONString(userAddressService.queryUserAddress(id));
        }else{
            return null;
        }
    }

    //修改用户地址
    @RequestMapping("changeUserAddress")
    @ResponseBody
    public String changeUserAddress(User user) {
        if(user!=null){
            return JSON.toJSONString(userAddressService.changeUserAddress(user));
        }else{
            return JSON.toJSONString("dataError");
        }
    }
}
