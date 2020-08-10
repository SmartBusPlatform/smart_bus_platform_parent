package com.cykj.admin.mapper;

import com.cykj.pojo.Bus;
import com.cykj.pojo.BusInfo;
import com.cykj.pojo.BusWork;
import com.cykj.pojo.BusWorkInfo;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface BusWorkMapper {
    //查询巴士排班
    List<BusWorkInfo> queryBusWork(int id);
    //新增巴士排班
    int insertBusWork(BusWorkInfo busWork);
    //修改巴士排班
    int changeBusWork(BusWorkInfo busWork);
    //删除巴士排班
    int deleteBusWork(BusWork busWork);
    //查询线路班次
    public List<BusWorkInfo> findBusWorkByLineId(BusWork busWork);
}
