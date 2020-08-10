package com.cykj.admin.service;

import com.cykj.pojo.StopBus;
import com.cykj.util.Result;

import java.text.ParseException;
import java.util.HashMap;

public interface StopBusService {
    //查询停靠巴士
    Result queryStopBusByPage(HashMap<String, Object> condition, int startSize, int pageSize) throws ParseException;
    //新增停靠巴士
    int insertStopBus(StopBus stopBus);
    //删除停靠巴士
    int deleteStopBus(int busId);
}
