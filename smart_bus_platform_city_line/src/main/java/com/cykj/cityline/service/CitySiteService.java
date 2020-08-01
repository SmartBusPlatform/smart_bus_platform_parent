package com.cykj.cityline.service;

import com.cykj.pojo.CitySiteChild;
import com.cykj.util.Result;

import java.util.HashMap;
import java.util.List;

public interface CitySiteService {

    /**
     *  根据根据城市分页查询站点名，x坐标，y坐标，经过线路
     * @param map
     * @return
     */
    public Result findCitySiteByCityId(HashMap<String, Object> map, int startSize, int pageSize);
}
