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
import java.util.*;

@Service
public class BusWorkServiceImpl implements BusWorkService {
    @Autowired
    BusWorkMapper busWorkMapper;
    @Autowired
    BusMapper busMapper;

    @Override
    public List<BusWorkInfo> queryBusWork(int id) {
        List<BusWorkInfo> list = busWorkMapper.queryBusWork(id);

        for (int i=0;i<list.size();i++){
            String[] arr = list.get(i).getDepartureTime().split(":");
            int branch = Integer.valueOf(arr[1])+list.get(i).getAllTime();
            if(branch>60){
                if(branch>120){
                    arr[0] = Integer.valueOf(arr[0])+2+"";
                    if (branch-120<10){
                        arr[1] = "0"+(branch-120);
                    }else{
                        arr[1] = branch-120+"";
                    }
                }else{
                    arr[0] = Integer.valueOf(arr[0])+1+"";
                    if (branch-60<10){
                        arr[1] = "0"+(branch-60);
                    }else{
                        arr[1] = branch-60+"";
                    }
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
        boolean isRunning = busIsRunning(busWork);
        int isSuccess = 0;

        if(isRunning){
            isSuccess = -9999;
        }else{
            isSuccess = busWorkMapper.insertBusWork(busWork);
            if (busWork.getWorkType()==1){
                Bus bus = new Bus();
                bus.setId(busWork.getBusId());
                bus.setIsFixedLine("是");
                isSuccess = busMapper.changeBus(bus);
            }
        }

        return isSuccess;
    }

    @Override
    public int changeBusWork(BusWorkInfo busWork) {
//        List<BusWorkInfo> list = busWorkMapper.queryBusWork(busWork.getBusId());
//
//        int isSuccess = 0;
//        TimeServiceImpl timeService = new TimeServiceImpl();
//        boolean isRunning = false;
//
//        if(list!=null){
//            try {
//                //循环判断当前时间段车辆是否在运行中
//                for (int i=0; i<list.size(); i++){
//                    //判断整点是否在运行时间内
//                    if(busWork.getStartTime().equals(list.get(i).getDepartureTime())&&timeService.endTime(busWork.getStartTime(),busWork.getAllTime()).equals(timeService.endTime(list.get(i).getDepartureTime(),list.get(i).getAllTime()))){
//                        isRunning = true;
//                        break;
//                    }
//                    //判断开始时间是否在车辆运行的时间中
//                    if(timeService.belongCalendar(busWork.getStartTime()+":00",list.get(i).getDepartureTime(),
//                            timeService.endTime(list.get(i).getDepartureTime(),list.get(i).getAllTime()))){
//                        isRunning = true;
//                        break;
//                    }
//                    //判断返程到站时间是否在车辆运行的时间中
//                    if(timeService.belongCalendar(timeService.endTime(busWork.getStartTime(),busWork.getAllTime())
//                            ,list.get(i).getDepartureTime(), timeService.endTime(list.get(i).getDepartureTime(),list.get(i).getAllTime()))){
//                        isRunning = true;
//                        break;
//                    }
//                }
//            } catch (ParseException e) {
//                e.printStackTrace();
//            }
//        }
        boolean isRunning = busIsRunning(busWork);
        int isSuccess = 0;

        if(isRunning){
            isSuccess = -9999;
        }else{
            isSuccess = busWorkMapper.changeBusWork(busWork);
            Bus bus = new Bus();
            bus.setId(busWork.getBusId());
            bus.setIsFixedLine("是");
            isSuccess = busMapper.changeBus(bus);
        }

        return isSuccess;

    }

    @Override
    public int deleteBusWork(BusWork busWork) {
        int isSuccess = busWorkMapper.deleteBusWork(busWork);

        return isSuccess;
    }

    @Override
    public Result findBusWorkByLineId(BusWork busWork) {
        Map<String,Object> maps = new HashMap<>();
        Result result = new Result();
        if(busWork!=null){
            List<BusWorkInfo> busWorkInfoList =busWorkMapper.findBusWorkByLineId(busWork);
            result.setData(busWorkInfoList);
            result.setStatus(200);
            return result;
        }
        result.setMsg("数据格式有误");
        result.setStatus(201);
        return result;
    }

    public boolean busIsRunning(BusWorkInfo busWork){
        List<BusWorkInfo> list = busWorkMapper.queryBusWork(busWork.getBusId());

        List<BusRest> busRestList = new LinkedList<>();
        int isSuccess = 0;
        TimeServiceImpl timeService = new TimeServiceImpl();
        boolean isRunning = true;

        if(list!=null&&list.size()>0){
            if(list.size()>1){
                for(int i=0; i<list.size(); i++){
                    String startTime = list.get(i).getDepartureTime();
                    if(i==0){
                        if(!startTime.equals("6:00")){
                            BusRest busRest = new BusRest("6:00",startTime);
                            busRestList.add(busRest);
                        }
                    }else if(i==list.size()-1){
                        try {
                            String preEndTime = timeService.endTime(list.get(i-1).getDepartureTime(),list.get(i-1).getAllTime());
                            BusRest busRest = new BusRest(preEndTime,startTime);
                            busRestList.add(busRest);
                            String endTime = timeService.endTime(startTime,list.get(i).getAllTime());
                            Date time2 = new SimpleDateFormat("yyyy-hh-mm HH:dd").parse("2020-8-16 "+endTime);
                            Date time = new SimpleDateFormat("yyyy-hh-mm HH:dd").parse("2020-8-16 "+"21:40");
                            if(time2.getTime()<time.getTime()){
                                BusRest busRest2 = new BusRest(endTime,"21:40");
                                busRestList.add(busRest2);
                            }
                        } catch (ParseException e) {
                            e.printStackTrace();
                        }
                    }else{
                        //上一个结束时间到这一个的开始时间
                        String preEndTime = timeService.endTime(list.get(i-1).getDepartureTime(),list.get(i-1).getAllTime());
                        BusRest busRest = new BusRest(preEndTime,startTime);
                        busRestList.add(busRest);
                    }
                }
            }else{
                String startTime = list.get(0).getDepartureTime();
                if(startTime.equals("6:00")){
                    BusRest busRest = new BusRest("6:00","21:40");
                    busRestList.add(busRest);
                }else{
                    BusRest busRest = new BusRest("6:00",startTime);
                    BusRest busRest2 = new BusRest(timeService.endTime(startTime,list.get(0).getAllTime()),"21:40");
                    busRestList.add(busRest);
                    busRestList.add(busRest2);
                }
            }
        }else{
            isRunning = false;
        }


        if (busRestList!=null&&list.size()>0){
            for (int i=0; i<busRestList.size(); i++){
                //判断开始时间是否在车辆休息的时间中
                try {
                    System.out.println("开始时间："+busWork.getStartTime()+":00");
                    System.out.println("结束时间："+timeService.endTime(busWork.getStartTime(),busWork.getAllTime()));
                    System.out.println("当前开始时间："+busRestList.get(i).getStartTime()+":00");
                    System.out.println("当前结束时间："+busRestList.get(i).getEndTime()+":00");

                    if(timeService.belongCalendar(busWork.getStartTime()+":00",busRestList.get(i).getStartTime()+":00"
                            ,busRestList.get(i).getEndTime()+":00")&&timeService.belongCalendar(timeService.endTime(busWork.getStartTime(),busWork.getAllTime())+":00"
                            ,busRestList.get(i).getStartTime()+":00",busRestList.get(i).getEndTime()+":00")){
                        isRunning = false;
                        break;
                    }
                } catch (ParseException e) {
                    e.printStackTrace();
                }
            }
        }

        return isRunning;
    }
}
