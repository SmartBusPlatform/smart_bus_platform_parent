package com.cykj.admin.service.impl;

import com.cykj.admin.mapper.AddRedisMapper;
import com.cykj.admin.service.AddRedisService;
import com.cykj.pojo.Fee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AddRedisServiceImpl implements AddRedisService {

    @Autowired
    private AddRedisMapper mapper;

    @Override
    public int insertTestData(Fee fee) {
        int i = mapper.insertTestData(fee);
        return i;
    }
}
