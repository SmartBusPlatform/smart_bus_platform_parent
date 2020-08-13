package com.cykj.admin.mapper;

import com.cykj.pojo.Bus;
import com.cykj.pojo.BusInfo;
import com.cykj.pojo.StopBus;
import com.cykj.pojo.StopBusInfo;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface StopBusMapper {
    //查询停靠巴士
    List<StopBusInfo> queryStopBus(HashMap<String, Object> condition);
    //新增停靠巴士
    int insertStopBus(StopBus stopBus);
    //删除停靠巴士
    int deleteStopBus(int busId);
}
