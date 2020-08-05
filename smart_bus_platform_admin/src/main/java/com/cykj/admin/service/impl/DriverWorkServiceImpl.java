package com.cykj.admin.service.impl;

import com.cykj.admin.mapper.DriverWorkMapper;
import com.cykj.admin.service.DriverWorkService;
import com.cykj.pojo.AdminInfo;
import com.cykj.pojo.LayuiData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DriverWorkServiceImpl implements DriverWorkService {

    @Autowired
    private DriverWorkMapper mapper;

    @Override
    public LayuiData selectDriverList(AdminInfo adminInfo) {

        mapper.selectDriverList(adminInfo);


        return null;
    }
}
