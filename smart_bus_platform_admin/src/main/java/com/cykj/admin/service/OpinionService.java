package com.cykj.admin.service;

import com.cykj.pojo.LayuiData;
import com.cykj.pojo.OpinionInfo;

import java.util.HashMap;

public interface OpinionService {
    //查询意见列表和数据总量
    LayuiData selectOpinionList(HashMap<String, Object> map);
    //更新管理员的意见回复
    int insertReplyContent(OpinionInfo opinionInfo);
    //更新处理结果
    int insertResultContent(OpinionInfo opinionInfo);
}
