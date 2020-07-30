package com.cykj.smart_bus_platform_admin.service;

import com.cykj.pojo.Admin;
import com.cykj.smart_bus_platform_admin.bean.MenuInfo;

import java.util.List;

public interface AdminService {

    List<MenuInfo> selectRoleMenus(Admin admin);
}
