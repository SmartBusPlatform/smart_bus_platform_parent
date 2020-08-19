package com.cykj.admin.controller;

import com.cykj.admin.Alipay.MultiThreadingService;
import com.cykj.pojo.Fee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("simulationController")
public class SimulationController {

    @Autowired
    private MultiThreadingService multiThreadingService;

    @RequestMapping("simulationAdd")
    @ResponseBody
    public String simulationAdd(int number) {

        Fee fee = new Fee();
        int busId = (int) (Math.random() * 20 + 8);
        int userId = (int) (Math.random() *11 + 1);
        int lineId = (int) (Math.random() * 20 + 18);

        fee.setBusId(busId);
        fee.setSiteId(26);
        fee.setLineId(lineId);
        fee.setUserId(userId);
        fee.setFeeTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        multiThreadingService.simulationData(fee, number);

        return "OK";
    }
}
