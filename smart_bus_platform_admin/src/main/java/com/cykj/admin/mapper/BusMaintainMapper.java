package com.cykj.admin.mapper;

import com.cykj.pojo.BusMaintain;
import com.cykj.pojo.BusMaintainInfo;

import java.util.HashMap;
import java.util.List;

public interface BusMaintainMapper {
    List<BusMaintainInfo> queryBusMainTain(HashMap<String, Object> map);
    //新增维修记录
    public int insBusMainTain(BusMaintain busMaintain);
    //修改维修记录状态
    public int updBusMainTainByByBusId(BusMaintain busMaintain);
}
