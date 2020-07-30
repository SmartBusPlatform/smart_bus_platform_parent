package com.cykj.cityline.service;

import com.cykj.util.Result;

import java.util.HashMap;

public interface AreasService {
    /**
     *  根据城市或省份分页查询省份、城市、站点数量、线路数量
     * @param map
     * @return
     */
    public Result findAreasByPage(HashMap<String, Object> map, int startSize, int pageSize);
}
