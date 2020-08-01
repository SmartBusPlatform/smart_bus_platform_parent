package com.cykj.admin.mapper;

import com.cykj.pojo.Admin;
import com.cykj.pojo.AdminInfo;
import com.cykj.pojo.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleConfigMapper {

    List<Role> selectRole();

    int addRole(@Param("roleName") String roleName);

    List<Admin> selectAdmin(AdminInfo adminInfo);

    int deleteRole(@Param("roleId") int id);

    int updateRole(Role role);
}
