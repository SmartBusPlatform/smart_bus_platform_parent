package com.cykj.admin.service;

import com.cykj.util.LayuiData;
import com.cykj.pojo.Admin;

public interface AdminService {
    public Admin login(Admin admin);
    public LayuiData selectList(Admin admin, int page, int pageSize);
}
