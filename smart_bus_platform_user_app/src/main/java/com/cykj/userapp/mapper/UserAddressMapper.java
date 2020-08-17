package com.cykj.userapp.mapper;

import com.cykj.pojo.Opinion;
import com.cykj.pojo.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserAddressMapper {
    //查询用户地址
    User queryUserAddress(int id);
    //修改用户的地址
    int changeUserAddress(User user);
}
