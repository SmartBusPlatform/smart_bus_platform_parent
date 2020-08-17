package com.cykj.userapp.service.impl;

import com.cykj.pojo.Opinion;
import com.cykj.pojo.User;
import com.cykj.userapp.mapper.OpinionMapper;
import com.cykj.userapp.mapper.UserAddressMapper;
import com.cykj.userapp.service.OpinionService;
import com.cykj.userapp.service.UserAddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserAdressServiceImpl implements UserAddressService {

    @Autowired
    private UserAddressMapper userAddressMapper;

    @Override
    public User queryUserAddress(int id) {
        User user = userAddressMapper.queryUserAddress(id);

        return user;
    }

    @Override
    public String changeUserAddress(User user) {
        int isSuccess = userAddressMapper.changeUserAddress(user);

        if(isSuccess!=0){
            return "success";
        }else {
            return "error";
        }
    }
}
