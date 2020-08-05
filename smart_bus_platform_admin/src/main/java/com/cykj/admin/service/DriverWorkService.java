package com.cykj.admin.service;

import com.cykj.pojo.AdminInfo;
import com.cykj.pojo.LayuiData;

public interface DriverWorkService {

    LayuiData selectDriverList(AdminInfo adminInfo);
}
