package com.cykj.admin.service;

import com.cykj.pojo.Admin;

import java.util.List;

public interface MenuConfigService {

    Object selectMenuConfig(int roleId);

    String changeRoleMenuTable(int roleId, String beforeArr, String afterArr);

}
