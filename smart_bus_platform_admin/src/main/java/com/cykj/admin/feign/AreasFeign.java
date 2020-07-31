package com.cykj.admin.feign;

import com.cykj.pojo.AreasChild;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@FeignClient(value = "CITY-LINE",fallback = AreasFallBack.class)
@Component
public interface AreasFeign {
    @RequestMapping("areas/getAreasByPage")
    public String getAreasByPage(@RequestBody AreasChild areasChild, @RequestParam("curPage") String startSize, @RequestParam("pageSize") String pageSize);

    @RequestMapping("areas/getAreasByType")
    public String getAreasByType(@RequestBody AreasChild areasChild);
    @RequestMapping("areas/addAreas")
    public String addAreas(@RequestBody AreasChild areasChild);
    @RequestMapping("areas/updAreaById")
    public String updAreaById(@RequestBody AreasChild areasChild);
}
