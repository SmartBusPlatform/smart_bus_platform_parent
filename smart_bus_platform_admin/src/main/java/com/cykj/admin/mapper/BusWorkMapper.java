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
}
