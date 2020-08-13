package com.cykj.admin.mapper;

import com.cykj.admin.bean.FaceInfo;
import com.cykj.pojo.DriverWork;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FaceMapper {
    //司机出站打卡
    DriverWork driverSign(FaceInfo faceInfo);

    int addDepartureTime(int busId);
}
