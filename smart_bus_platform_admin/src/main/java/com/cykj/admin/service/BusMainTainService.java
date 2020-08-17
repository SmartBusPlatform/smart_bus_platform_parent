package com.cykj.admin.service;

import com.cykj.pojo.Bus;
import com.cykj.pojo.BusMaintain;
import com.cykj.util.Result;

import java.util.HashMap;

public interface BusMainTainService {
    //分页查询巴士
    public Result queryBusMainTainByPage(HashMap<String, Object> condition, int startSize, int pageSize);

    //根据维修人员id查询维修车辆
    public Result queryBusMainTainByRepairId(HashMap<String, Object> condition);

    //新增维修记录
    public int insBusMainTain(BusMaintain busMaintain);

    //修改维修记录状态
    public int updBusMainTainByByBusId(BusMaintain busMaintain);
}
