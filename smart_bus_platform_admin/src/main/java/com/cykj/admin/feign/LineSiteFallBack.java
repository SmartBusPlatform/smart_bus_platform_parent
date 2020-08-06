package com.cykj.admin.feign;

import com.alibaba.fastjson.JSON;
import com.cykj.pojo.LineChild;
import com.cykj.util.Result;

public class LineSiteFallBack implements  LineSiteFeign {
    @Override
    public String getLineSiteByLineId(LineChild lineChild) {
        Result result = new Result();
        result.setMsg("您的网络出现问题，请刷新");
        result.setStatus(202);
        return JSON.toJSONString(result);
    }

    @Override
    public String updLineSiteByLineId(LineChild lineChild) {
        Result result = new Result();
        result.setMsg("您的网络出现问题，请刷新");
        result.setStatus(202);
        return JSON.toJSONString(result);
    }
}
