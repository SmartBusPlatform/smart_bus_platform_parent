package com.cykj.admin.controller;

import com.cykj.admin.service.DriverWorkService;
import com.cykj.pojo.AdminInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("driverWorkController")
@Controller
public class DriverWorkController {

    @Autowired
    private DriverWorkService driverWorkService;

    @RequestMapping("selectDriverList")
    @ResponseBody
    public String selectDriverList(String cityId, String name, String phone, String site) {
        AdminInfo adminInfo = new AdminInfo();
        adminInfo.setAreasId(cityId);

        driverWorkService.selectDriverList(adminInfo);

        return null;
    }

}
