package com.cykj.admin.mapper;

import com.cykj.pojo.AdminInfo;
import com.cykj.pojo.DriverWork;
import com.cykj.pojo.DriverWorkInfo;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface DriverWorkMapper {

    //根据城市查询司机列表和总数据量
    List<AdminInfo> selectDriverList(HashMap<String,Object> map);

    int selectDriverListCount(HashMap<String, Object> map);

    //修改司机信息
    int updateDriver(AdminInfo adminInfo);

    //根据时间和司机id查询当前排班车辆
    public DriverWorkInfo findDriverWorkByDateAndAdId(@Param("driverWork") DriverWork driverWork,@Param("stateId") int stateId);
}
