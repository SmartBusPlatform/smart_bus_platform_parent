package com.cykj.service.impl;

import com.cykj.mapper.OpinionMapper;
import com.cykj.pojo.Opinion;
import com.cykj.service.OpinionService;
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
