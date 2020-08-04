package com.cykj.admin.service;

import com.cykj.pojo.Bus;
import com.cykj.util.Result;

import java.util.HashMap;

public interface BusMainTainService {
    //分页查询巴士
    public Result queryBusMainTainByPage(HashMap<String, Object> condition, int startSize, int pageSize);
}
