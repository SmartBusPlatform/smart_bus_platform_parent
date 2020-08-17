package com.cykj.userapp.controller;

import com.cykj.userapp.feign.BusMainTainFeign;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("busMainTain")
public class BusMainTainController {
    @Autowired
    private BusMainTainFeign busMainTainFeign;
    @RequestMapping("getBusMainTainByRepairId")
    @ResponseBody
    public String  queryBusMainTainByRepairId(String  repairmanId,String number){
        return busMainTainFeign.queryBusMainTainByRepairId(repairmanId,number);
    }
}
