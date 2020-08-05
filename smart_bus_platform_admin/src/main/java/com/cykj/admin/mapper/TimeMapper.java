package com.cykj.admin.mapper;

import com.cykj.pojo.BusWorkInfo;
import com.cykj.pojo.TimesInfo;

import java.util.List;

public interface TimeMapper {
    //查询发车时刻
    List<TimesInfo> queryTime(int beginOrReturn);
}
