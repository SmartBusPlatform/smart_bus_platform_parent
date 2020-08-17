package com.cykj.userapp.feign;

import org.apache.ibatis.annotations.Param;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@FeignClient(value = "admin",contextId ="busMainTain")
@Component
public interface BusMainTainFeign {

    @RequestMapping("busMainTain/getBusMainTainByRepairId")
    public String  queryBusMainTainByRepairId(@RequestParam("repairmanId") String  repairmanId, @RequestParam("number")String string);
}
