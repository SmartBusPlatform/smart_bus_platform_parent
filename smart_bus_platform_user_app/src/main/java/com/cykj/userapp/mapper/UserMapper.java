package com.cykj.userapp.mapper;

import com.cykj.pojo.User;

public interface UserMapper {
    User queryUserByPhone(long phone);
    User queryUserById(int id);
    int insertUser(User user);
    int changeUser(User user);
}
