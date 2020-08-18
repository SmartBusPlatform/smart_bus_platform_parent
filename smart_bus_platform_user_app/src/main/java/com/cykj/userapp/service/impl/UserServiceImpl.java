package com.cykj.userapp.service.impl;

import com.cykj.pojo.Opinion;
import com.cykj.pojo.User;
import com.cykj.userapp.mapper.OpinionMapper;
import com.cykj.userapp.mapper.UserMapper;
import com.cykj.userapp.service.OpinionService;
import com.cykj.userapp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;


    @Override
    public User queryUserByPhone(long phone) {
        User user = userMapper.queryUserByPhone(phone);

        return user;
    }

    @Override
    public User queryUserById(int id) {
        User user = userMapper.queryUserById(id);

        return user;
    }

    @Override
    public User insertUser(User user) {
        int isSuccess = userMapper.insertUser(user);
        User user1 = userMapper.queryUserById(user.getId());

        return user1;
    }

    @Override
    public int changeUser(User user) {
        int isSuccess = userMapper.changeUser(user);

        return isSuccess;
    }
}
