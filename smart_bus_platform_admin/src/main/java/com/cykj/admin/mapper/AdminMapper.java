package com.cykj.smart_bus_platform_admin.mapper;

import com.cykj.pojo.Admin;
import com.cykj.smart_bus_platform_admin.bean.MenuInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AdminMapper {

    List<MenuInfo> selectRoleMenus(@Param("roleId") int roleId);

}
