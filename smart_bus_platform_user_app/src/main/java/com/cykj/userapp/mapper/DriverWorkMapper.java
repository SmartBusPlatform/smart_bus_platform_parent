package com.cykj.userapp.mapper;

import com.cykj.pojo.AdminInfo;
import com.cykj.pojo.LineChild;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface DriverWorkMapper {

    //根据司机id和日期查询排班
    List<LineChild> findDiverWorkByIdAndDate(@Param("adminId") int adminId , @Param("date") String date);

}
