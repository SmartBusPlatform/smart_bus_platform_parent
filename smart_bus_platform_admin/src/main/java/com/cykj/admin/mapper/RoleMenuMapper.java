package com.cykj.admin.mapper;

import com.cykj.admin.bean.MenuInfo;
import com.cykj.pojo.Admin;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface RoleMenuMapper {

    List<MenuInfo> selectRoleMenus(@Param("roleId") int roleId);

}
