package com.cykj.admin.service;


import com.cykj.pojo.AdminInfo;
import com.cykj.pojo.DriverWork;
import com.cykj.pojo.DriverWorkInfo;
import com.cykj.pojo.LayuiData;
import com.cykj.util.Result;

import java.sql.Driver;
import java.util.HashMap;

public interface DriverWorkService {

    LayuiData selectDriverList(HashMap<String, Object> map);

    String updateDriver(AdminInfo adminInfo);

    //车辆故障报停
    public Result failureStop(DriverWork driverWork);

    //车辆维修
    public Result vehicleMaintenace(DriverWork driverWork);

    //维修结束
    public Result endMaintenance(DriverWork driverWork);
    //车辆报废
    public Result vehicleScrapping(DriverWork driverWork);

    LayuiData selectWorkload(HashMap<String, Object> map);
}
