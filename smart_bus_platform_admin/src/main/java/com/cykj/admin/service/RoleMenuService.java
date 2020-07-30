package com.cykj.admin.service;

import com.cykj.admin.bean.MenuInfo;
import com.cykj.pojo.Admin;


import java.util.List;

public interface RoleMenuService {

    List<MenuInfo> selectRoleMenus(Admin admin);
}
