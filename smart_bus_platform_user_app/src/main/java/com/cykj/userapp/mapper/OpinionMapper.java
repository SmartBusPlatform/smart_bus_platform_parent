package com.cykj.userapp.mapper;

import com.cykj.pojo.Opinion;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OpinionMapper {

    int addUserOpinion(Opinion opinion);

}