package com.cykj.admin.feign;

import com.cykj.pojo.CitySite;
import com.cykj.pojo.Line;
import com.cykj.pojo.LineChild;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@FeignClient(value = "CITY-LINE",fallback = LineFallBack.class,contextId = "lineFeign")
@Component
public interface LineFeign {
    @RequestMapping("line/getLineByPage")
    public String getLineByPage(@RequestBody Line line, @RequestParam("curPage") String curPage, @RequestParam("pageSize") String pageSize);

    @RequestMapping("line/addLine")
    public String addLine(@RequestBody LineChild lineChild);
    @RequestMapping("line/delLineById")
    public String delLineById(@RequestBody LineChild lineChild);
    @RequestMapping("line/updLineByLineId")
    public String updLineByLineId(@RequestBody Line line);
    }

