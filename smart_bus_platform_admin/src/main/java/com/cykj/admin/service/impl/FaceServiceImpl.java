package com.cykj.admin.service.impl;

import com.cykj.admin.bean.FaceInfo;
import com.cykj.admin.mapper.FaceMapper;
import com.cykj.admin.service.FaceService;
import com.cykj.pojo.DepartureTime;
import com.cykj.pojo.DriverWork;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FaceServiceImpl implements FaceService {

    @Autowired
    private FaceMapper mapper;

    //司机出站打卡
    @Override
    public int driverSign(FaceInfo faceInfo) {

        //先查询当天司机对应排班的公交车
        DriverWork driverWork = mapper.driverSign(faceInfo);
        if (driverWork != null) {
            int i = mapper.addDepartureTime(driverWork.getBusId());
            if (i == 1) {
                return 1;
            }
        }
        return 0;
    }
}
