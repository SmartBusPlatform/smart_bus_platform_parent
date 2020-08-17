package com.cykj.admin.service;


import com.cykj.pojo.AdminInfo;
import com.cykj.pojo.LayuiData;

import java.util.HashMap;

public interface DriverWorkService {

    LayuiData selectDriverList(HashMap<String, Object> map);

    String updateDriver(AdminInfo adminInfo);

    LayuiData selectWorkload(HashMap<String, Object> map);
}
