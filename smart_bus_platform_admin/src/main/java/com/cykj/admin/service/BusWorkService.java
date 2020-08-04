package com.cykj.admin.service;

import com.cykj.pojo.BusWorkInfo;
import java.util.List;

public interface BusWorkService {
    //查询巴士排班
    List<BusWorkInfo> queryBusWork(int id);
}
