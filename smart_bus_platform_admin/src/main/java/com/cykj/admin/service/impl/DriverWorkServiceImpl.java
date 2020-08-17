package com.cykj.admin.service.impl;

import com.cykj.admin.mapper.BusMaintainMapper;
import com.cykj.admin.mapper.BusMapper;
import com.cykj.admin.bean.DriverWorkload;
import com.cykj.admin.mapper.DriverWorkMapper;
import com.cykj.admin.service.DriverWorkService;
import com.cykj.pojo.*;
import com.cykj.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Service
public class DriverWorkServiceImpl implements DriverWorkService {

    @Autowired
    private DriverWorkMapper mapper;
    @Autowired
    private BusMapper busMapper;
    @Autowired
    private BusMaintainMapper busMaintainMapper;
    @Override
    public LayuiData selectDriverList(HashMap<String, Object> map) {

        List<AdminInfo> driverList = mapper.selectDriverList(map);
        int i = mapper.selectDriverListCount(map);

        LayuiData layuiData = new LayuiData();
        if (i != 0) {
            layuiData.setCode(0);
            layuiData.setCount(i);
            layuiData.setData(driverList);
        }
        return layuiData;
    }

    @Override
    public String updateDriver(AdminInfo adminInfo) {

        int i = mapper.updateDriver(adminInfo);
        if (i == 1) {
            return "success";
        }
        return "error";
    }

//查询司机工作量
    @Override
    public LayuiData selectWorkload(HashMap<String, Object> map) {
        //根据时间戳格式化日期
        long timestamp = (long) map.get("timestamp");
        Date date = new Date(timestamp);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String strDate = format.format(date);

        map.put("strDate", strDate);
        List<DriverWorkload> list = mapper.selectWorkload(map);

        LayuiData layuiData = new LayuiData();
        if (list != null && list.size() != 0) {
            layuiData.setData(list);
            layuiData.setCode(0);
        }

        return layuiData;
    }
    @Override
    public Result failureStop(DriverWork driverWork) {
        Result result = new Result();
        DriverWorkInfo driverWorkInfo = mapper.findDriverWorkByDateAndAdId(driverWork,1);
        if(driverWorkInfo!=null){
            Bus bus = new Bus();
            bus.setId(driverWorkInfo.getBusId());;
            bus.setStateId(2);
            int i = busMapper.changeBus(bus);
            if(i==1){
                result.setStatus(200);
                result.setMsg(driverWorkInfo.getBusNumber()+"已经停用");
                return result;
            }else{
                result.setStatus(201);
                result.setMsg(driverWorkInfo.getBusNumber()+"停用失败");
                return result;
            }
        }
        result.setStatus(201);
        result.setMsg("当前司机无车辆可用");
        return result;
    }

    @Override
    @Transactional
    public Result vehicleMaintenace(DriverWork driverWork) {
        Result result = new Result();
        //等待维修的车辆
        DriverWorkInfo driverWorkInfo = mapper.findDriverWorkByDateAndAdId(driverWork,2);
        if(driverWorkInfo!=null){
            Bus bus = new Bus();
            bus.setId(driverWorkInfo.getBusId());;
            bus.setStateId(3);
            int i = busMapper.changeBus(bus);
            if(i==1){
                BusMaintain busMaintain = new BusMaintain();
                busMaintain.setBusId(driverWorkInfo.getBusId());
                busMaintain.setStateId(1);
                int num = busMaintainMapper.insBusMainTain(busMaintain);
                if(num==1){
                    result.setStatus(200);
                    result.setMsg(driverWorkInfo.getBusNumber()+"正在维修中");
                    return result;
                }else{
                    result.setStatus(201);
                    result.setMsg("网络异常，请刷新");
                    return result;
                }

            }else{
                 result.setStatus(201);
                result.setMsg("网络异常，请刷新");
                return result;
            }
        }
        result.setStatus(201);
        result.setMsg("当前司机无车辆故障等待维修");
        return result;
    }

    @Override
    @Transactional
    public Result endMaintenance(DriverWork driverWork) {
        Result result = new Result();
        if(driverWork!=null&&driverWork.getBusId()!=0){
            Bus bus = new Bus();
            bus.setId(driverWork.getBusId());;
            bus.setStateId(1);
            int i = busMapper.changeBus(bus);
            if(i==1){
                BusMaintain busMaintain = new BusMaintain();
                busMaintain.setBusId(driverWork.getBusId());
                busMaintain.setStateId(2);
                int num = busMaintainMapper.updBusMainTainByByBusId(busMaintain);
                if(num==1){
                    result.setStatus(200);
                    result.setMsg("该车辆维修结束");
                    return result;
                }else{
                    result.setStatus(201);
                    result.setMsg("网络异常，请刷新");
                    return result;
                }
            }else{
                result.setStatus(201);
                result.setMsg("网络异常，请刷新");
                return result;
            }
        }
        result.setStatus(201);
        result.setMsg("数据出错，请刷新");
        return result;
    }

    public Result vehicleScrapping(DriverWork driverWork){
        Result result = new Result();
        if(driverWork!=null&&driverWork.getBusId()!=0){
            Bus bus = new Bus();
            bus.setId(driverWork.getBusId());;
            bus.setStateId(4);
            int i = busMapper.changeBus(bus);
            if(i==1){
                BusMaintain busMaintain = new BusMaintain();
                busMaintain.setBusId(driverWork.getBusId());
                busMaintain.setStateId(2);
                int num = busMaintainMapper.updBusMainTainByByBusId(busMaintain);
                if(num==1){
                    result.setStatus(200);
                    result.setMsg("该车辆已经报废");
                    return result;
                }else{
                    result.setStatus(201);
                    result.setMsg("网络异常，请刷新");
                    return result;
                }
            }else{
                result.setStatus(201);
                result.setMsg("网络异常，请刷新");
                return result;
            }
        }
        result.setStatus(201);
        result.setMsg("数据出错，请刷新");
        return result;
    }
}
