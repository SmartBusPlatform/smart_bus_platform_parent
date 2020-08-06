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
    /**
     * 删除线路
     */
    public int delLineById(LineChild lineChild);

    /**
     * 根据城市id查找线路，确保没有冗余的线路名
     * @param line
     * @return
     */
    public LineChild findLineByCityId(Line line);

    /**
     * 修改站点信息
     * @param line
     * @return
     */
    public int updLineByLineId(Line line);
}
