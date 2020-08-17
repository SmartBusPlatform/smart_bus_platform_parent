package com.cykj.userapp.service.impl;

import com.cykj.userapp.mapper.OpinionMapper;
import com.cykj.pojo.Opinion;
import com.cykj.userapp.service.OpinionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OpinionServiceImpl implements OpinionService {

    @Autowired
    private OpinionMapper opinionMapper;

    @Override
    public List<Opinion> queryOpinionByUserId(int userId) {
        List<Opinion> opinionList = opinionMapper.queryOpinionByUserId(userId);

        return opinionList;
    }

    @Override
    public String insertOpinion(Opinion opinion) {

        int i = opinionMapper.insertOpinion(opinion);
        if (i!=0) {
            return "success";
        }else{
            return "error";
        }
    }
}
