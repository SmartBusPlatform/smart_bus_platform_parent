package com.cykj.admin.service.impl;

import com.cykj.admin.mapper.DriverWorkMapper;
import com.cykj.admin.service.DriverWorkService;
import com.cykj.pojo.AdminInfo;
import com.cykj.pojo.LayuiData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
