package com.cykj.smart_bus_platform_admin.controller;

import com.cykj.pojo.Admin;
import com.cykj.smart_bus_platform_admin.bean.MenuInfo;
import com.cykj.smart_bus_platform_admin.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RequestMapping("adminController")
@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("selectRoleMenus")
    public String selectRoleMenus(HttpServletRequest request, Admin admin) {

        List<MenuInfo> menuInfos = adminService.selectRoleMenus(admin);
        request.setAttribute("menus",menuInfos);

        return "adminMain";
    }

}
