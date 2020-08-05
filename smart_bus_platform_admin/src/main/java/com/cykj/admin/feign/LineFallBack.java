package com.cykj.admin.feign;

import com.alibaba.fastjson.JSON;
import com.cykj.pojo.CitySite;
import com.cykj.pojo.Line;
import com.cykj.pojo.LineChild;
import com.cykj.util.Result;

public class LineFallBack implements LineFeign {

    @Override
    public String getLineByPage(Line line, String curPage, String pageSize) {
        Result result = new Result();
        result.setMsg("您的网络出现问题，请刷新");
        result.setStatus(202);
        return JSON.toJSONString(result);
    }

    @Override
    public String addLine(LineChild lineChild) {
        Result result = new Result();
        result.setMsg("您的网络出现问题，请刷新");
        result.setStatus(202);
        return JSON.toJSONString(result);
    }
//
//    @Override
//    public String updCitySiteByCityId(CitySite citySite) {
//        Result result = new Result();
//        result.setMsg("您的网络出现问题，请刷新");
//        result.setStatus(202);
//        return JSON.toJSONString(result);
//    }
}
