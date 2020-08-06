package com.cykj.cityline.mapper;

import com.cykj.pojo.CitySiteArr;
import com.cykj.pojo.Line;
import com.cykj.pojo.LineChild;
import com.cykj.pojo.LineSite;

import java.util.HashMap;
import java.util.List;

public interface LineSiteMapper {

//    /**
//     * 新增线路站点关系
//     */
    public int insLineSite(LineSite lineSite);

    /**
     * 删除线路站点关系
     */
    public int delLineSiteByLineId(LineChild lineChild);

    /**
     * 查询线路站点关系,始程
     */
    public List<LineSite> findLineSiteStartByLineId(LineChild lineChild);
    /**
     * 查询线路站点关系,返程
     */
    public List<LineSite> findLineSiteBackByLineId(LineChild lineChild);

}
