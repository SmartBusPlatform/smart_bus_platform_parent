package com.cykj.userapp.service;

import com.cykj.pojo.Opinion;

import java.util.List;

public interface OpinionService {
    //查询用户的意见建议
    public List<Opinion> queryOpinionByUserId(int userId);
    //新增用户的意见建议
    public String insertOpinion(Opinion opinion);

}
