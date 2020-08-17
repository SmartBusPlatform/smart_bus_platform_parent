package com.cykj.userapp.feign;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;

@FeignClient(value = "CITY-LINE",fallback = AreasFallBack.class,contextId = "areasFeign")
public interface AreasFeign {

    @RequestMapping("areas/getAreasAll")
    public  String getAreasAll();
}
