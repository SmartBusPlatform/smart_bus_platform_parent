package com.cykj.admin.service.impl;

import com.cykj.admin.mapper.BusMapper;
import com.cykj.admin.mapper.BusWorkMapper;
import com.cykj.admin.service.BusService;
import com.cykj.admin.service.BusWorkService;
import com.cykj.pojo.*;
import com.cykj.util.Result;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Service
public class BusWorkServiceImpl implements BusWorkService {
    @Autowired
    BusWorkMapper busWorkMapper;

    @Override
    public List<BusWorkInfo> queryBusWork(int id) {
        List<BusWorkInfo> list = busWorkMapper.queryBusWork(id);

        for (int i=0;i<list.size();i++){
            String[] arr = list.get(i).getDepartureTime().split(":");
            int branch = Integer.valueOf(arr[1])+list.get(i).getAllTime();
            if(branch>60){
                arr[0] = Integer.valueOf(arr[0])+1+"";
                if (branch-60<10){
                    arr[1] = "0"+(branch-60);
                }else{
                    arr[1] = branch-60+"";
                }
            }else if (branch==60){
                arr[0] = Integer.valueOf(arr[0])+1+"";
                arr[1] = "00";
            }else{
                arr[1] = branch+"";
            }
            list.get(i).setReturnArrivalTime(arr[0]+":"+arr[1]);
        }

        return list;
    }

    @Override
    public int insertBusWork(BusWorkInfo busWork) {
        List<BusWorkInfo> list = busWorkMapper.queryBusWork(busWork.getBusId());

        int isSuccess = 0;
        TimeServiceImpl timeService = new TimeServiceImpl();
        boolean isRunning = false;

        try {
            //循环判断当前时间段车辆是否在运行中
            for (int i=0; i<list.size(); i++){
                //判断开始时间是否在车辆运行的时间中
                if(timeService.belongCalendar(busWork.getStartTime()+":00",list.get(i).getDepartureTime(),
                        timeService.endTime(list.get(i).getDepartureTime(),list.get(i).getAllTime()))){
                    isRunning = true;
                    break;
                }
                //判断返程到站时间是否在车辆运行的时间中
                if(timeService.belongCalendar(timeService.endTime(busWork.getStartTime(),busWork.getAllTime())
                        ,list.get(i).getDepartureTime(), timeService.endTime(list.get(i).getDepartureTime(),list.get(i).getAllTime()))){
                    isRunning = true;
                    break;
                }
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }

        if(isRunning){
            isSuccess = -9999;
        }else{
            isSuccess = busWorkMapper.insertBusWork(busWork);
        }

        return isSuccess;
    }
}
