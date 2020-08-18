package com.cykj.userapp.service;

import com.cykj.pojo.Opinion;
import com.cykj.pojo.User;

import java.util.List;

public interface UserService {
    //电话查询用户
    public User queryUserByPhone(long phone);
    //ID查询用户
    public User queryUserById(int id);
    //新增用户
    public User insertUser(User user);
    //修改用户
    public int changeUser(User user);
}
