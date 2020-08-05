package com.cykj.admin.mapper;

import com.cykj.pojo.BusMaintainInfo;

import java.util.HashMap;
import java.util.List;

public interface BusMaintainMapper {
    List<BusMaintainInfo> queryBusMainTain(HashMap<String, Object> map);
}
