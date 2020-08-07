package com.cykj.cityline.service;

import com.cykj.pojo.*;
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
    /**
     * 删除线路
     */
    public int delLineById(LineChild lineChild) throws Exception;
    /**
     * 根据城市id查找线路，确保没有冗余的线路名
     * @param line
     * @return
     */
    public Line findLineByCityId(Line line);
    /**
     * 修改线路信息
     * @param line
     * @return
     */
    public Result updLineByLineId(Line line);

}
