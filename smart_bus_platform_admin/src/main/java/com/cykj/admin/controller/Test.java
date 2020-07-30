package com.cykj.admin.controller;

import com.alibaba.fastjson.JSON;
import jdk.nashorn.internal.scripts.JS;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Test {

    @RequestMapping("test")
    public String  test(){
       return JSON.toJSONString("test");
    }
}
