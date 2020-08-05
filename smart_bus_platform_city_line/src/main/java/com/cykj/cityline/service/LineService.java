package com.cykj.cityline.service;

import com.cykj.pojo.CitySite;
import com.cykj.pojo.CitySiteArr;
import com.cykj.pojo.LineChild;
import com.cykj.util.Result;

import java.util.HashMap;
import java.util.List;

public interface LineService {

    /**
     *  根据城市分页查询线路名称，经站点数，每日运行班次数，线路再用车辆
     * @param map
     * @return
     */
    public Result findLinePage(HashMap<String, Object> map, int startSize, int pageSize);
    /**
     * 新增线路
     */
    public Result insLine(LineChild lineChild);
//    /**
//     * 根据城市id查找站点，确保没有冗余的站点名
//     * @param citySite
//     * @return
//     */
//    public  List<CitySite> findCitySiteByCityId(CitySite citySite);
//    /**
//     * 修改站点信息
//     * @param citySite
//     * @return
//     */
//    public Result updCitySiteByCityId(CitySite citySite);
}
