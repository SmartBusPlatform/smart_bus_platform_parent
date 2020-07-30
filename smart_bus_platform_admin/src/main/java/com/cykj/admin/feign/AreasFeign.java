package com.cykj.admin.feign;

import com.cykj.pojo.AreasChild;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@FeignClient(value = "CITY-LINE")
@Component
public interface AreasFeign {
    @RequestMapping("areas/getAreasByPage")
    public String getAreasByPage(@RequestBody AreasChild areasChild, @RequestParam("startSize")String startSize, @RequestParam("pageSize")String pageSize);
}
