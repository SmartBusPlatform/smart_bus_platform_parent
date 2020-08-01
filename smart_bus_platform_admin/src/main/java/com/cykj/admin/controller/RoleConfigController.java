package com.cykj.admin.controller;


import com.alibaba.fastjson.JSON;
import com.cykj.admin.service.RoleConfigService;
import com.cykj.pojo.LayuiData;
import com.cykj.pojo.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RequestMapping("roleConfigController")
@Controller
public class RoleConfigController {

    @Autowired
    private RoleConfigService roleConfigService;

    @RequestMapping("selectRole")
    @ResponseBody
    public String selectRole() {

        List<Role> roles = roleConfigService.selectRole();
        LayuiData layuiData = new LayuiData();
        if (roles != null && roles.size() != 0) {
            layuiData.setCode(0);
            layuiData.setCount(roles.size());
            layuiData.setData(roles);
        }
        return JSON.toJSONString(layuiData);
    }

    @RequestMapping("addRole")
    @ResponseBody
    public String addRole(@RequestParam String roleName){
        System.out.println(roleName);
        int i = roleConfigService.addRole(roleName);
        if (i != 0) {
            return "success";
        }
        return "error";
    }

    @RequestMapping("deleteRole")
    @ResponseBody
    public String deleteRole(int id) {
        System.out.println(id);
        int i = roleConfigService.deleteRole(id);
        if (i == 1) {
            return "success";
        } else if (i == 0){
            return "isUsed";
        }
        return "error";
    }

    @RequestMapping("updateRole")
    @ResponseBody
    public String updateRole(int id, String name) {
        Role role = new Role();
        role.setId(id);
        role.setName(name);
        int i = roleConfigService.updateRole(role);
        if (i == 1) {
            return "success";
        }
        return "error";
    }
}
