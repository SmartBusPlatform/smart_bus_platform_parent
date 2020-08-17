package com.cykj.userapp.controller;

import com.alibaba.fastjson.JSON;
import com.cykj.pojo.Opinion;
import com.cykj.pojo.User;
import com.cykj.userapp.bean.FTPParam;
import com.cykj.userapp.service.OpinionService;
import com.cykj.util.FtpUtil;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@RequestMapping("opinion")
@Controller
public class OpinionController {

    @Autowired
    private OpinionService opinionService;

    //查询用户意见建议
    @RequestMapping("queryOpinionByUserId")
    @ResponseBody
    public Object addOpinionImage(@Param("userId") int userId) {
        if(userId!=0){
            return JSON.toJSONString(opinionService.queryOpinionByUserId(userId));
        }else{
            return null;
        }
    }

    //插入用户投诉建议
    @RequestMapping("insertOpinion")
    @ResponseBody
    public String insertOpinion(Opinion opinion ) {
        if(opinion!=null){
            opinion.setOpinionTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
            return JSON.toJSONString(opinionService.insertOpinion(opinion));
        }else{
            return JSON.toJSONString("dataError");
        }
    }
}
