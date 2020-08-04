package com.cykj.admin.service.impl;

import com.cykj.admin.mapper.OpinionMapper;
import com.cykj.admin.service.OpinionService;
import com.cykj.pojo.LayuiData;
import com.cykj.pojo.OpinionInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class OpinionServiceImpl implements OpinionService {

    @Autowired
    private OpinionMapper opinionMapper;

    @Override
    public LayuiData selectOpinionList(HashMap<String, Object> map) {

        List<OpinionInfo> opinionInfos = opinionMapper.selectOpinionList(map);
        LayuiData layuiData = new LayuiData();
        if (opinionInfos != null || opinionInfos.size() != 0) {
            layuiData.setData(opinionInfos);
            layuiData.setCount(opinionInfos.size());
            layuiData.setCode(0);
        }
        return layuiData;
    }

    @Override
    public int insertReplyContent(OpinionInfo opinionInfo) {

        int i = opinionMapper.insertReplyContent(opinionInfo);
        return i;
    }

    @Override
    public int insertResultContent(OpinionInfo opinionInfo) {
        int i = opinionMapper.insertResultContent(opinionInfo);
        return i;
    }
}
