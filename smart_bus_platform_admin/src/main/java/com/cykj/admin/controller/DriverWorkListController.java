package com.cykj.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

@RequestMapping("driverWorkListController")
@Controller
public class DriverWorkListController {


    @RequestMapping("renderDriverWorkTable")
    @ResponseBody
    public String renderDriverWorkTable(String curDate) {
        System.out.println(curDate);
        System.out.println(new Date().toString());
        System.out.println(new Date().toString() == curDate);
        return null;
    }
}
