package com.cykj.admin.controller;

import com.alibaba.fastjson.JSON;
import com.cykj.admin.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("log")
public class LogController {

    @Autowired
    private LogService logService;
    @RequestMapping("findLog")
    public String findLog(String curPage, String pageSize){
        int startNum;
        if(curPage!=null&&curPage.matches("^\\d+$")){
            startNum = Integer.parseInt(curPage);
        }else{
            startNum = 1;
        }
        int pageNum;
        if(pageSize!=null&&pageSize.matches("^\\d+$")){
            pageNum = Integer.parseInt(pageSize);
        }else{
            pageNum = 5;
        }
        return JSON.toJSONString(logService.findAll(startNum,pageNum));
    }
}
