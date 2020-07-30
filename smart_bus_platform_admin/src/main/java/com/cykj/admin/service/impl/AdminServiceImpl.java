package com.cykj.smart_bus_platform_admin.service.impl;

import com.cykj.pojo.Admin;
import com.cykj.pojo.Menu;
import com.cykj.smart_bus_platform_admin.bean.MenuInfo;
import com.cykj.smart_bus_platform_admin.mapper.AdminMapper;
import com.cykj.smart_bus_platform_admin.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public List<MenuInfo> selectRoleMenus(Admin admin) {
        List<MenuInfo> list = adminMapper.selectRoleMenus(1);

//        MenuInfo menuInfo = new MenuInfo();
//        List<MenuInfo> menuInfoList = new ArrayList<>();
//        for (MenuInfo menuParent:list) {
//            if (menuParent.getMenuPid() == 0) {
//                menuInfo.setMenuName(menuParent.getMenuName());
//                List<Menu> menuList = new ArrayList<>();
//                for (MenuInfo menuSon : list) {
//                    if (menuSon.getMenuPid() == menuParent.getId()) {
//                        menuList.add(menuSon);
//                    }
//                }
//                menuInfo.setMenuList(menuList);
//            }
//            menuInfoList.add(menuInfo);
//        }
        return list;
    }
}
