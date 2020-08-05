package com.cykj.admin.feign;

import com.cykj.pojo.AreasChild;
import com.cykj.pojo.CitySite;
import com.cykj.pojo.CitySiteChild;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@FeignClient(value = "CITY-LINE",fallback = CitySiteFallBack.class,contextId = "citySiteFeign")
@Component
public interface CitySiteFeign {
    @RequestMapping("citySite/getCitySiteByPage")
    public String getCitySiteByPage(@RequestBody CitySite citySite, @RequestParam("curPage") String curPage, @RequestParam("pageSize") String pageSize);

    @RequestMapping("citySite/addCitySite")
    public String addCitySite(@RequestBody CitySite citySite);
    @RequestMapping("citySite/updCitySiteByCityId")
    public String updCitySiteByCityId(@RequestBody CitySite citySite);

    @RequestMapping("citySite/getCitySiteAllByCityId")
    public String getCitySiteAllByCityId(@RequestBody CitySite citySite);
    }

