package com.cykj.admin.feign;

import com.cykj.pojo.LineChild;
import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;
import com.netflix.hystrix.contrib.javanica.annotation.HystrixProperty;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@FeignClient(value = "CITY-LINE",fallback = LineSiteFallBack.class,contextId = "lineSite")
@Component
public interface LineSiteFeign {
    @RequestMapping("lineSite/getLineSiteByLineId")
    public String getLineSiteByLineId(@RequestBody LineChild lineChild);
    @RequestMapping("lineSite/updLineSiteByLineId")
//    @HystrixCommand(fallbackMethod = "updLineSiteByLineId", commandProperties = {
//            @HystrixProperty(name = "execution.isolation.thread.timeoutInMilliseconds", value = "9000") })
    public String updLineSiteByLineId(@RequestBody LineChild lineChild);
}
