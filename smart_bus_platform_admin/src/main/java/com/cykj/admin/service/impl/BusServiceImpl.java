package com.cykj.admin.service.impl;

import com.cykj.admin.mapper.BusMapper;
import com.cykj.admin.service.BusService;
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
public class BusServiceImpl implements BusService {
    @Autowired
    BusMapper busMapper;

    @Override
    public Result queryBusByPage(HashMap<String, Object> condition, int startSize, int pageSize) {
        PageHelper.startPage(startSize, pageSize);

        List<BusInfo> busList = busMapper.queryBus(condition);
        DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
        Bus nowBus = new Bus();

        for (int i=0; i<busList.size();i++){
            if(busList.get(i).getUserTimeRatio()!=0){
                busList.get(i).setUserTimeRatioStr(Integer.parseInt(new java.text.DecimalFormat("0").format(busList.get(i).getUserTimeRatio()))+"%");
            }else{
                busList.get(i).setUserTimeRatioStr("暂无");
            }
            try {
                Date d1 = new Date();
                Date d2 = dateFormat.parse(busList.get(i).getEndTime());
                if((d1.after(d2)||d1.equals(d2))&&busList.get(i).getStateId()!=4&&busList.get(i).getStateId()!=5){
                    nowBus.setId(busList.get(i).getId());
                    nowBus.setStateId(4);
                    int q = busMapper.changeBus(nowBus);
                    busList.get(i).setStateId(4);
                    busList.get(i).setStateName("报废停用");
                }
            } catch (ParseException e) {
                busList = null;
                e.printStackTrace();
            } catch (Exception e2){
                busList = null;
                e2.printStackTrace();
            }
        }

        Result result = new Result();
        if(busList==null){
            result.setStatus(201);
            result.setMsg("查询失败");
        }else{
            PageInfo<BusInfo> pageInfo = new PageInfo<BusInfo>(busList);
            PageBean<BusInfo> pageBean = new PageBean<>(startSize,pageInfo.getPageSize(),pageInfo.getTotal());
            pageBean.setList(busList);
            result.setStatus(0);
            result.setData(pageBean);
        }
        return result;
    }

    @Override
    public int changeBus(Bus bus) {
        int isSuccess = 0;
        if (bus.getNumber()!=null&&!"".equals(bus.getNumber())){
            Bus isBus = busMapper.queryOneBus(bus.getNumber(),bus.getId());

            if(isBus==null){
                isSuccess = busMapper.changeBus(bus);
            }else{
                isSuccess = -9999;
            }
        }else{
            isSuccess = -9998;
        }

        return isSuccess;
    }

    @Override
    public int insertBus(Bus bus) {
        int isSuccess = 0;
        if (bus.getNumber()!=null&&!"".equals(bus.getNumber())){
            Bus isBus = busMapper.queryOneBus(bus.getNumber(),0);

            if(isBus==null){
                bus.setProductionTime(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
                isSuccess = busMapper.insertBus(bus);
            }else{
                isSuccess = -9999;
            }
        }else{
            isSuccess = -9998;
        }

        return isSuccess;
    }

    @Override
    public Result findBusByLineId(Line line) {
        Result result = new Result();
        if(line!=null){
            List<BusChild> busChildList = busMapper.findBusByLineId(line);
            result.setData(busChildList);
            result.setStatus(200);
            return  result;
        }
        result.setMsg("数据格式有误");
        result.setStatus(201);
        return result;
    }
}
