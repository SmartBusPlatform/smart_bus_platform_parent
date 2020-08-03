package com.cykj.admin.feign;

import com.cykj.pojo.CitySite;
import com.cykj.pojo.CitySiteChild;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@FeignClient(value = "CITY-LINE",fallback = CitySiteFallBack.class,contextId = "citySiteFeign")
@Component
public interface CitySiteFeign {
    @RequestMapping("citySite/getCitySiteByCityId")
    public String getCitySiteByCityId(@RequestBody CitySite citySite, @RequestParam("curPage") String curPage, @RequestParam("pageSize") String pageSize);
}
