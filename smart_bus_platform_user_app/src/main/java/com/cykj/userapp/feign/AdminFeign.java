package com.cykj.userapp.feign;

import com.alibaba.fastjson.JSON;
import com.cykj.pojo.Admin;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@FeignClient(value = "admin",contextId = "adminFeign")
@Component
public interface AdminFeign {
    @RequestMapping("adminControl/applogin")
    public String applogin(@RequestParam("account") String account, @RequestParam("password") String password,@RequestParam("code") String code);

    @RequestMapping("adminControl/resetPwd")
    public String resetPwd(@RequestBody Admin admin,@RequestParam("code") String code);
}
