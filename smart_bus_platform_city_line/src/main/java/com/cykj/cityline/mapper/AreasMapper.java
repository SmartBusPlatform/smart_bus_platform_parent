package com.cykj.cityline.mapper;

import com.cykj.pojo.AreasChild;

import java.util.HashMap;
import java.util.List;

public interface AreasMapper {
    /**
     *  根据城市或省份分页查询省份、城市、站点数量、线路数量
     * @param map
     * @return
     */
    public List<AreasChild> findAreasByPage(HashMap<String, Object> map);
}
