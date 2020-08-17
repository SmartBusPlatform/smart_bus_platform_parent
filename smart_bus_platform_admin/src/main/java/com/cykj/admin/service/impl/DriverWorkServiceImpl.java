package com.cykj.admin.service.impl;

import com.cykj.admin.bean.DriverWorkload;
import com.cykj.admin.mapper.DriverWorkMapper;
import com.cykj.admin.service.DriverWorkService;
import com.cykj.pojo.AdminInfo;
import com.cykj.pojo.LayuiData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Service
public class DriverWorkServiceImpl implements DriverWorkService {

    @Autowired
    private DriverWorkMapper mapper;

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
}
