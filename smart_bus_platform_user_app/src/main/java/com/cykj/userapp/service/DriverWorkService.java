package com.cykj.userapp.service;

import com.cykj.pojo.LineChild;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DriverWorkService {
    //根据司机id和日期查询排班
    List<LineChild> findDiverWorkByIdAndDate(int adminId , String date);
}
