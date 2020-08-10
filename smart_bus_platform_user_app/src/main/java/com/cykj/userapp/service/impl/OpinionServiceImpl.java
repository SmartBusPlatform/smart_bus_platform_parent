package com.cykj.userapp.service.impl;

import com.cykj.userapp.mapper.OpinionMapper;
import com.cykj.pojo.Opinion;
import com.cykj.userapp.service.OpinionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OpinionServiceImpl implements OpinionService {

    @Autowired
    private OpinionMapper mapper;

    @Override
    public String addUserOpinion(Opinion opinion) {

        int i = mapper.addUserOpinion(opinion);
        if (i == 1) {
            return "success";
        }
        return "error";
    }
}
