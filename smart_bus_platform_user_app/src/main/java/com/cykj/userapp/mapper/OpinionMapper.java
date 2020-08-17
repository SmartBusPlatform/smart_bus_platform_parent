package com.cykj.userapp.mapper;

import com.cykj.pojo.Opinion;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface OpinionMapper {
    //查询用户的意见建议
    List<Opinion> queryOpinionByUserId(int userId);
    //新增用户的意见建议
    int insertOpinion(Opinion opinion);
}
