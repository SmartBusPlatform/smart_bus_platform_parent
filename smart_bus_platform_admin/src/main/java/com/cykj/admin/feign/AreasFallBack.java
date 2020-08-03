package com.cykj.admin.feign;

import com.alibaba.fastjson.JSON;
import com.cykj.pojo.AreasChild;
import com.cykj.util.Result;

public class AreasFallBack implements AreasFeign {
    @Override
    public String getAreasByPage(AreasChild areasChild, String startSize, String pageSize) {
        Result result = new Result();
        result.setMsg("您的网络出现问题，请刷新");
        result.setStatus(202);
        return JSON.toJSONString(result);
    }

    @Override
    public String getAreasByType(AreasChild areasChild) {
        Result result = new Result();
        result.setMsg("您的网络出现问题，请刷新");
        result.setStatus(202);
        return JSON.toJSONString(result);
    }

    @Override
    public String addAreas(AreasChild areasChild) {
        Result result = new Result();
        result.setMsg("您的网络出现问题，请刷新");
        result.setStatus(202);
        return JSON.toJSONString(result);
    }

    @Override
    public String updAreaById(AreasChild areasChild) {
        Result result = new Result();
        result.setMsg("您的网络出现问题，请刷新");
        result.setStatus(202);
        return JSON.toJSONString(result);
    }

    @Override
    public String getAreaTree() {
        Result result = new Result();
        result.setMsg("您的网络出现问题，请刷新");
        result.setStatus(202);
        return JSON.toJSONString(result);
    }
}
