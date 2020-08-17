package com.cykj.userapp.service;

import com.cykj.pojo.User;

import java.util.List;

public interface UserAddressService {
    //查询用户的意见建议
    User queryUserAddress(int id);
    //新增用户的意见建议
    String changeUserAddress(User user);
}
