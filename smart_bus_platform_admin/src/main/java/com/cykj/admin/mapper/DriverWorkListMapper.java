package com.cykj.admin.mapper;

import com.cykj.pojo.Bus;
import com.cykj.pojo.DriverWork;
import com.cykj.pojo.DriverWorkInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface DriverWorkListMapper {
    //根据日期查询本周七天的上班情况
    List<DriverWorkInfo> renderDriverWorkTable(HashMap<String, Object> map);

    //插入排班（休假）数据
    int setVacation(DriverWork driverWork);

    //查询本地空闲可排班使用的车辆
    List<Bus> selectCityBus(HashMap<String,Object> map);

    //插入排班（上班）数据
    int setDriverWork(DriverWork driverWork);
}
