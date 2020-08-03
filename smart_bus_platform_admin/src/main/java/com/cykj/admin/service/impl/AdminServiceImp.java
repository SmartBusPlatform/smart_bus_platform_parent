package com.cykj.admin.service.impl;

import com.cykj.admin.mapper.AdminMapper;
import com.cykj.admin.service.AdminService;
import com.cykj.util.LayuiData;
import com.cykj.pojo.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImp implements AdminService {
    @Autowired
    public AdminMapper adminMapper;

    @Override
    public Admin login(Admin admin) {
        Admin adminLogin = null;

        adminLogin = adminMapper.login(admin);
        return adminLogin;
    }

    @Override
    public LayuiData selectList(Admin admin, int page, int pageSize) {
        int start = (page - 1) * pageSize;//计算出起始查询位置
        if(start<0)
            start=0;
        List<Admin> list = adminMapper.selectAdminList(admin, start, pageSize);
        int count = adminMapper.selectListCount(admin);

        LayuiData layuiData = new LayuiData();
        if (list.size() > 0) {
            layuiData.setCode(0);
            layuiData.setMsg("");
            layuiData.setCount(count);
            layuiData.setData(list);
            System.out.println(admin);
        } else {
            layuiData.setCode(1);
            layuiData.setMsg("查询失败");
        }
        return layuiData;
    }
}
