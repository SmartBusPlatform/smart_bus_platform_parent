package com.cykj.admin.service;

import com.cykj.pojo.Bus;
import com.cykj.util.Result;

import java.util.HashMap;

public interface BusService {
    //分页查询巴士
    public Result queryBusByPage(HashMap<String,Object> condition, int startSize, int pageSize);
    //修改巴士
    public int changeBus(Bus bus);
    //新增巴士
    public int insertBus(Bus bus);
}
