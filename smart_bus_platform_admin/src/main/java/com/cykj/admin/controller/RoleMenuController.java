package com.cykj.admin.controller;

import com.cykj.admin.service.RoleMenuService;
import com.cykj.pojo.Admin;
import com.cykj.admin.bean.MenuInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RequestMapping("adminController")
@Controller
public class RoleMenuController {

    @Autowired
    private RoleMenuService roleMenuService;

    @RequestMapping("selectRoleMenus")
    public String selectRoleMenus(HttpServletRequest request, Admin admin) {

        List<MenuInfo> menuInfos = roleMenuService.selectRoleMenus(admin);
        request.setAttribute("menus",menuInfos);

        return "adminMain";
    }

}
