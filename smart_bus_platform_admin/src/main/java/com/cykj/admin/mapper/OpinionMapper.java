package com.cykj.admin.mapper;

import com.cykj.pojo.OpinionInfo;

import java.util.HashMap;
import java.util.List;

public interface OpinionMapper {
    //查询意见列表
    List<OpinionInfo> selectOpinionList(HashMap<String, Object> map);

    //插入管理员的意见回复
    int insertReplyContent(OpinionInfo opinionInfo);

    //更新处理结果
    int insertResultContent(OpinionInfo opinionInfo);
}
