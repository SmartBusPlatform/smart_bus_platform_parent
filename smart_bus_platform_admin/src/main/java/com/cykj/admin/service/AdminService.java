package com.cykj.admin.service;

import com.cykj.util.LayuiData;
import com.cykj.pojo.Admin;
import com.cykj.util.Result;

public interface AdminService {
    public Admin login(Admin admin);
    public LayuiData selectList(Admin admin, int page, int pageSize);
//    public Result update(Admin admin);

    //重置密码
    public Result resetPwd(Admin admin);
}
