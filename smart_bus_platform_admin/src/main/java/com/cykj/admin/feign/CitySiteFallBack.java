package com.cykj.admin.feign;

import com.alibaba.fastjson.JSON;
import com.cykj.pojo.CitySite;
import com.cykj.pojo.CitySiteChild;
import com.cykj.util.Result;

public class CitySiteFallBack implements CitySiteFeign {
    @Override
    public String getCitySiteByPage(CitySite citySite, String curPage, String pageSize) {
        Result result = new Result();
        result.setMsg("您的网络出现问题，请刷新");
        result.setStatus(202);
        return JSON.toJSONString(result);
    }

    @Override
    public String addCitySite(CitySite citySite) {
        Result result = new Result();
        result.setMsg("您的网络出现问题，请刷新");
        result.setStatus(202);
        return JSON.toJSONString(result);
    }

    @Override
    public String updCitySiteByCityId(CitySite citySite) {
        Result result = new Result();
        result.setMsg("您的网络出现问题，请刷新");
        result.setStatus(202);
        return JSON.toJSONString(result);
    }

    @Override
    public String getCitySiteAllByCityId(CitySite citySite) {
        Result result = new Result();
        result.setMsg("您的网络出现问题，请刷新");
        result.setStatus(202);
        return JSON.toJSONString(result);
    }
}
