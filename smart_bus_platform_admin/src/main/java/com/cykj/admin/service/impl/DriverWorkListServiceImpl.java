package com.cykj.admin.service.impl;

import com.cykj.admin.bean.DriverJS;
import com.cykj.admin.mapper.DriverWorkListMapper;
import com.cykj.admin.service.DriverWorkListService;
import com.cykj.pojo.Bus;
import com.cykj.pojo.DriverWork;
import com.cykj.pojo.DriverWorkInfo;
import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class DriverWorkListServiceImpl implements DriverWorkListService {

    @Autowired
    private DriverWorkListMapper mapper;

    @Override
    public List<DriverJS> renderDriverWorkTable(HashMap<String, Object> condition) throws ParseException {
        long timestamp = (long) condition.get("timestamp");
        //获取前台发来的日期
        Date mdate = new Date(timestamp);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

        String jsDate = format.format(mdate);

//        String curDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        condition.put("jsDate", jsDate);
        List<DriverWorkInfo> driverWorkInfos = mapper.renderDriverWorkTable(condition);

        //重新封装数据
        List<DriverJS> list = new ArrayList<>();

        Calendar c = Calendar.getInstance();
        for (DriverWorkInfo driverWorkInfo : driverWorkInfos) {
            DriverJS driverJS = new DriverJS();
            System.out.println("driverWorkInfo=" + driverWorkInfo.getDriverName());

            driverJS.setDriverId(driverWorkInfo.getAdminId());
            driverJS.setDriverName(driverWorkInfo.getDriverName());

            for (Object obj : driverWorkInfo.getList()) {
                //转换为实体类，并将日期的string转为date格式，用Calendar算出是星期几
                DriverWorkInfo info = (DriverWorkInfo) obj;
                String str = info.getWorkDate();
                c.setTime(format.parse(str));
                int weekDay = c.get(Calendar.DAY_OF_WEEK);
                switch (weekDay) {
                    case 2:
                        if (info.getIsWork() == 0) {
                            driverJS.setMonday("休息");
                        } else if (info.getIsWork() == 1) {
                            driverJS.setMonday(info.getBusNumber());
                        }
                        break;
                    case 3:
                        if (info.getIsWork() == 0) {
                            driverJS.setTuesday("休息");
                        } else if (info.getIsWork() == 1) {
                            driverJS.setTuesday(info.getBusNumber());
                        }
                        break;
                    case 4:
                        if (info.getIsWork() == 0) {
                            driverJS.setWednesday("休息");
                        } else if (info.getIsWork() == 1) {
                            driverJS.setWednesday(info.getBusNumber());
                        }
                        break;
                    case 5:
                        if (info.getIsWork() == 0) {
                            driverJS.setThursday("休息");
                        } else if (info.getIsWork() == 1) {
                            driverJS.setThursday(info.getBusNumber());
                        }
                        break;
                    case 6:
                        if (info.getIsWork() == 0) {
                            driverJS.setFriday("休息");
                        } else if (info.getIsWork() == 1) {
                            driverJS.setFriday(info.getBusNumber());
                        }
                        break;
                    case 7:
                        if (info.getIsWork() == 0) {
                            driverJS.setSaturday("休息");
                        } else if (info.getIsWork() == 1) {
                            driverJS.setSaturday(info.getBusNumber());
                        }
                        break;
                    case 1:
                        if (info.getIsWork() == 0) {
                            driverJS.setSunday("休息");
                        } else if (info.getIsWork() == 1) {
                            driverJS.setSunday(info.getBusNumber());
                        }
                        break;
                }

                System.out.println("info=" + info.getBusNumber());
                System.out.println("info=" + info.getWorkDate());

//                if (info.getWorkDate())
            }
            list.add(driverJS);
        }
        //根据指定日期获取本周所有日期
//        int b = mdate.getDay();
//        Date fdate;
//        List<String> weekList = new ArrayList<>();
//        Long fTime = timestamp - b * 24 * 3600000;
//        for (int a = 1; a <= 7; a++) {
//            fdate = new Date();
//            fdate.setTime(fTime + (a * 24 * 3600000));
//            weekList.add(a-1, new SimpleDateFormat("yyyy-MM-dd").format(fdate));
//        }
//
//        condition.put("workInfo", driverWorkInfos);
//        condition.put("weekList", weekList);

        return list;
    }

    //插入休假数据
    @Override
    public String setVacation(DriverWork driverWork) {
        int i = mapper.setVacation(driverWork);
        if (i == 1) {
            return "success";
        }
        return "error";
    }

    @Override
    public List<Bus> selectCityBus(HashMap<String, Object> map) {
        List<Bus> buses = mapper.selectCityBus(map);
        return buses;
    }

    @Override
    public String setDriverWork(DriverWork driverWork) {
        int i = mapper.setDriverWork(driverWork);
        if (i == 1) {
            return "success";
        }
        return "error";
    }
}


