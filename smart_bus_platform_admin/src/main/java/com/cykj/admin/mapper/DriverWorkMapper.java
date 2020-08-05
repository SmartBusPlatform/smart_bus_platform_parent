package com.cykj.admin.mapper;

import com.cykj.pojo.AdminInfo;

import java.util.List;

public interface DriverWorkMapper {

    //根据城市查询司机列表和总数据量
    List<AdminInfo> selectDriverList(AdminInfo adminInfo);

}
