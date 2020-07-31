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

    /**
     * 根据城市类型查询所有城市
     * @param type
     * @return
     */
    public List<AreasChild> findAreasByType(int type);
    /**
     * 新增城市
     */
    public int insArea(AreasChild areasChild);

    /**
     * 修改城市信息
     * @param areasChild
     * @return
     */
    public int updAreaById(AreasChild areasChild);

    /**
     * 根据城市名查找城市，确保没有冗余的城市名
     * @param areasChild
     * @return
     */
    public AreasChild findAreaByCityName(AreasChild areasChild);
}
