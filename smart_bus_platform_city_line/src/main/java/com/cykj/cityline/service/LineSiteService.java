package com.cykj.cityline.service;

import com.cykj.pojo.LineChild;
import com.cykj.pojo.LineSite;
import com.cykj.util.Result;

import java.util.List;
import java.util.Map;

public interface LineSiteService {
    /**
     * 查询线路站点关系
     */
    public Map<String,Object> findLineSiteByLineId(LineChild lineChild);
    /**
     * 修改线路站点关系
     */
    public Result updLineSiteByLineId(LineChild lineChild);

}
