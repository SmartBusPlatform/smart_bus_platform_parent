package com.cykj.admin.service.impl;

import com.cykj.admin.mapper.BusWorkMapper;
import com.cykj.admin.mapper.TimeMapper;
import com.cykj.admin.service.TimeService;
import com.cykj.pojo.BusWork;
import com.cykj.pojo.TimesInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class TimeServiceImpl implements TimeService {
    @Autowired
    TimeMapper timeMapper;

    @Override
    public List<TimesInfo> queryTime(BusWork busWork) {
        List<TimesInfo> list = timeMapper.queryTime(busWork);

        if(list!=null){
            for (int i=0; i<list.size(); i++){
                if(list.get(i).getRequiredTime()!=0&&list.get(i).getBusId()!=0){
                    try {
                        String strNowTime = new SimpleDateFormat("HH:mm:ss").format(new Date());
                        if(belongCalendar(strNowTime+":00",list.get(i).getTime()+":00",endTime(list.get(i).getTime(),list.get(i).getRequiredTime())+":00")){
                            list.get(i).setIsRun(1);
                        }else{
                            list.get(i).setIsRun(2);
                        }
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                }else{
                    list.get(i).setIsRun(3);
                }
            }
        }

        return list;
    }

    //判断时间是否在运行时间内
    public static boolean belongCalendar(String strNowTime,String strStartTime, String strEndTime) throws ParseException {
        Date nowTime = new SimpleDateFormat("HH:mm:ss").parse(strNowTime);
        Date endTime = new SimpleDateFormat("HH:mm:ss").parse(strEndTime);
        Date startTime = new SimpleDateFormat("HH:mm:ss").parse(strStartTime);

        return nowTime.getTime() >= startTime.getTime() && nowTime.getTime() <= endTime.getTime();
    }

    public static String endTime(String strStartTime, int strRequiredTime){
        String[] arr = strStartTime.split(":");
        int branch = Integer.valueOf(arr[1])+strRequiredTime;
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

        String strEndTime = arr[0]+":"+arr[1];

        return strEndTime;
    }
}
