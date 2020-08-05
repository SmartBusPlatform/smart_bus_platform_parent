package com.cykj.cityline.mapper;

import com.cykj.pojo.*;

import java.util.HashMap;
import java.util.List;

public interface LineMapper {

    /**
     *  根据城市分页查询线路名称，经站点数，每日运行班次数，线路再用车辆
     * @param map
     * @return
     */
    public List<LineChild> findLinePage(HashMap<String, Object> map);
//    /**
//     * 新增线路
//     */
    public int insLine(LineChild lineChild);
//
//    /**
//     * 根据城市id查找站点，确保没有冗余的站点名
//     * @param citySite
//     * @return
//     */
//    public List<Line> findLineByCityId(CitySite citySite);
//
//    /**
//     * 修改站点信息
//     * @param citySite
//     * @return
//     */
//    public int updCitySiteByCityId(CitySite citySite);
}
