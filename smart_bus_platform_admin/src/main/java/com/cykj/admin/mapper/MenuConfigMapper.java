package com.cykj.admin.mapper;


import com.cykj.pojo.LayUITree;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MenuConfigMapper {

    //查询所有的菜单
    List<LayUITree> selectAllMenus();

    //根据下拉框选择的角色查询对应的菜单
    List<Integer> selectRoleMenuId(int roleId);

    /**
     * 菜单配置完成保存菜单的业务，insertRoleMenu：插入新增的权限菜单。deleteRoleMenu：删除去除的权限菜单
     */
    int insertRoleMenu(@Param("roleId")int roleId, @Param("list")List<Integer> insertList);

    int deleteRoleMenu(@Param("roleId")int roleId, @Param("list")List<Integer> deleteList);

}
