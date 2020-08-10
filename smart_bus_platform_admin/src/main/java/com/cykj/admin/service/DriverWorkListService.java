package com.cykj.admin.service;

import com.cykj.admin.bean.DriverJS;
import com.cykj.pojo.Bus;
import com.cykj.pojo.DriverWork;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;

public interface DriverWorkListService {

    List<DriverJS> renderDriverWorkTable(HashMap<String,Object> condition) throws ParseException;

    String setVacation(DriverWork driverWork);

    List<Bus> selectCityBus(HashMap<String, Object> map);

    String setDriverWork(DriverWork driverWork);
}
