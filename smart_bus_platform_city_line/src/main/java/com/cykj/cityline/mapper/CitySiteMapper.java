package com.cykj.cityline.mapper;

import com.cykj.pojo.AreasChild;
import com.cykj.pojo.CitySite;
import com.cykj.pojo.CitySiteChild;

import java.util.HashMap;
import java.util.List;

public interface CitySiteMapper {

    /**
     *  根据根据城市分页查询站点名，x坐标，y坐标，经过线路
     * @param map
     * @return
     */
    public List<CitySiteChild> findCitySiteByCityId(HashMap<String, Object> map);
}
