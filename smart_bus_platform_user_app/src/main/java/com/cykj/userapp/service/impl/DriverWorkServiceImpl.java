package com.cykj.userapp.service.impl;

import com.cykj.pojo.LineChild;
import com.cykj.userapp.mapper.DriverWorkMapper;
import com.cykj.userapp.service.DriverWorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DriverWorkServiceImpl implements DriverWorkService {
    @Autowired
    private DriverWorkMapper driverWorkMapper;
    @Override
    public List<LineChild> findDiverWorkByIdAndDate(int adminId, String date) {
        return driverWorkMapper.findDiverWorkByIdAndDate(adminId,date);
    }
}
