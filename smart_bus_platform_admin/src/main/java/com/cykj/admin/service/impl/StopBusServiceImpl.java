package com.cykj.admin.service.impl;

import com.cykj.admin.mapper.BusMapper;
import com.cykj.admin.mapper.StopBusMapper;
import com.cykj.admin.service.BusService;
import com.cykj.admin.service.StopBusService;
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
public class StopBusServiceImpl implements StopBusService {
    @Autowired
    StopBusMapper StopBusMapper;

    @Override
    public Result queryStopBusByPage(HashMap<String, Object> condition, int startSize, int pageSize) throws ParseException {
        PageHelper.startPage(startSize, pageSize);

        List<StopBusInfo> stopBusList = StopBusMapper.queryStopBus(condition);

        Result result = new Result();
        if(stopBusList==null){
            result.setStatus(201);
            result.setMsg("查询失败");
        }else{
            for (int i=0; i<stopBusList.size(); i++){
                Date date = new SimpleDateFormat("yyyy-MM-dd hh:mm").parse(stopBusList.get(i).getArrivalTime());
                stopBusList.get(i).setStopTime(formatDuring(date,new Date()));
            }
            PageInfo<StopBusInfo> pageInfo = new PageInfo<StopBusInfo>(stopBusList);
            PageBean<StopBusInfo> pageBean = new PageBean<>(startSize,pageInfo.getPageSize(),pageInfo.getTotal());
            pageBean.setList(stopBusList);
            result.setStatus(0);
            result.setData(pageBean);
        }
        return result;
    }

    @Override
    public int insertStopBus(StopBus stopBus) {
        int isSuccess = isSuccess = StopBusMapper.insertStopBus(stopBus);

        return isSuccess;
    }

    @Override
    public int deleteStopBus(int busId) {
        int isSuccess = isSuccess = StopBusMapper.deleteStopBus(busId);

        return isSuccess;
    }

    /**
     *
     * @param begin 时间段的开始
     * @param end   时间段的结束
     * @return  输入的两个Date类型数据之间的时间间格用* days * hours * minutes * seconds的格式展示
     * @author fy.zhang
     */
    public static String formatDuring(Date begin, Date end) {
        return formatDuring(end.getTime() - begin.getTime());
    }

    public static String formatDuring(long mss) {
        long day = mss / (1000 * 60 * 60 * 24);
        long hours = (mss % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60);
        long minutes = (mss % (1000 * 60 * 60)) / (1000 * 60);
        return day+ "天"+ hours + " 小时 " + minutes + " 分 ";
    }
}
