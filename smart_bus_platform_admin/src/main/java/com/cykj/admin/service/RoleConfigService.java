package com.cykj.admin.service;

import com.cykj.pojo.Role;

import java.util.List;

public interface RoleConfigService {

    //角色列表
    List<Role> selectRole();
    //新增角色
    int addRole(String roleName);
    //删除角色
    int deleteRole(int id);
    //修改角色名
    int updateRole(Role role);
}
