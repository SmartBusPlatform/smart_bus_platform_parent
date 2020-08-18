package com.cykj.admin.controller;

import com.cykj.admin.Alipay.MultiThreadingService;
import com.cykj.pojo.Fee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("simulationController")
public class SimulationController {

    @Autowired
    private MultiThreadingService multiThreadingService;

    @RequestMapping("simulationAdd")
    public String simulationAdd(int number) {

        for (int i = 0; i < number; i++) {
            Fee fee = new Fee();

            int busId = (int) (Math.random() * 20+8);
            int userId = (int) (Math.random() * 11);
            int lineId = (int) (Math.random() * 20+18);

            fee.setBusId(busId);
            fee.setSiteId(26);
            fee.setLineId(lineId);
            fee.setUserId(userId);


            multiThreadingService.simulationData(fee);

        }

    }
}
