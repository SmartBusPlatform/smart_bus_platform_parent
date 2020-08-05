package com.cykj.admin.service;

import com.cykj.pojo.BusWorkInfo;
import com.cykj.pojo.TimesInfo;

import java.util.List;

public interface TimeService {
    //查询发车时刻
    List<TimesInfo> queryTime(int beginOrReturn);
}
