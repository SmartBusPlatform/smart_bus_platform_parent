package com.cykj.admin.service.impl;

import com.cykj.admin.bean.MenuInfo;
import com.cykj.admin.service.RoleMenuService;
import com.cykj.pojo.Admin;
import com.cykj.admin.mapper.RoleMenuMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleMenuServiceImpl implements RoleMenuService {

    @Autowired
    private RoleMenuMapper roleMenuMapper;

    @Override
    public List<MenuInfo> selectRoleMenus(Admin admin) {
        List<MenuInfo> list = roleMenuMapper.selectRoleMenus(1);

        return list;
    }
}
