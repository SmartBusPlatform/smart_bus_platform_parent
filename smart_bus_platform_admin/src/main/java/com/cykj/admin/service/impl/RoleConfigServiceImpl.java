package com.cykj.admin.service.impl;

import com.cykj.admin.mapper.RoleConfigMapper;
import com.cykj.admin.service.RoleConfigService;
import com.cykj.pojo.Admin;
import com.cykj.pojo.AdminInfo;
import com.cykj.pojo.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@EnableTransactionManagement
public class RoleConfigServiceImpl implements RoleConfigService {

    @Autowired
    private RoleConfigMapper roleConfigMapper;

    @Override
    public List<Role> selectRole() {
        List<Role> roles = roleConfigMapper.selectRole();
        return roles;
    }

    @Override
    public int addRole(String roleName) {
        int i = roleConfigMapper.addRole(roleName);
        return i;
    }

    @Override
    @Transactional
    public int deleteRole(int id) {
        AdminInfo adminInfo = new AdminInfo();
        adminInfo.setId(id);
        List<Admin> admins = roleConfigMapper.selectAdmin(adminInfo);
        if (admins == null || admins.size() == 0) {
            int i = roleConfigMapper.deleteRole(id);
            return i;
        }
        return 0;
    }

    @Override
    public int updateRole(Role role) {
        int i = roleConfigMapper.updateRole(role);
        return i;
    }
}
