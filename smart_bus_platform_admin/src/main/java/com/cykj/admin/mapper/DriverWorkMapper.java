package com.cykj.admin.mapper;

import com.cykj.admin.bean.DriverWorkload;
import com.cykj.pojo.AdminInfo;

import java.util.HashMap;
import java.util.List;

public interface DriverWorkMapper {

    //根据城市查询司机列表和总数据量
    List<AdminInfo> selectDriverList(HashMap<String,Object> map);

    int selectDriverListCount(HashMap<String, Object> map);

    //修改司机信息
    int updateDriver(AdminInfo adminInfo);

    //查询司机工作量
    List<DriverWorkload> selectWorkload(HashMap<String, Object> map);

}
