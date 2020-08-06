package com.cykj.cityline.service;

import com.cykj.pojo.AreasChild;
import com.cykj.pojo.CitySite;
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
    public Result findCitySiteByPage(HashMap<String, Object> map, int startSize, int pageSize);
    /**
     * 新增站点
     */
    public Result insCitySite(CitySite citySite);
    /**
     * 根据城市id查找站点，确保没有冗余的站点名
     * @param citySite
     * @return
     */
    public  List<CitySite> findCitySiteByCityId(CitySite citySite);
    /**
     * 修改站点信息
     * @param citySite
     * @return
     */
    public Result updCitySiteByCityId(CitySite citySite);

    /**
     * 根据id查询该城市所有站点
     */
    public List<CitySite> findCitySiteAllByCityId(CitySite citySite);

}
