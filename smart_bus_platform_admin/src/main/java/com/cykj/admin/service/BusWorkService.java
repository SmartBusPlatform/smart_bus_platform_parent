package com.cykj.admin.service;

import com.cykj.pojo.BusWork;
import com.cykj.pojo.BusWorkInfo;
import com.cykj.util.Result;

import java.util.List;

public interface BusWorkService {
    //查询巴士排班
    List<BusWorkInfo> queryBusWork(int id);
    //新增巴士排班
    int insertBusWork(BusWorkInfo busWork);
    //修改巴士排班
    int changeBusWork(BusWorkInfo busWork);
    //删除巴士排班
    int deleteBusWork(BusWork busWork);
    //查询排班
    public Result findBusWorkByLineId(BusWork busWork);
}
