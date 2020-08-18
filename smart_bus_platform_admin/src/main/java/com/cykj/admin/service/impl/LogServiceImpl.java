package com.cykj.admin.service.impl;

import com.cykj.admin.mapper.LogMapper;
import com.cykj.admin.service.LogService;
import com.cykj.pojo.LogInfo;
import com.cykj.pojo.PageBean;
import com.cykj.util.Result;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LogServiceImpl implements LogService {
    @Autowired
    private LogMapper logMapper;
    @Override
    public int insert(LogInfo logInfo) {
        return logMapper.insert(logInfo);
    }

    @Override
    public Result findAll(int startSize, int pageSize) {
        PageHelper.startPage(startSize, pageSize);

        List<LogInfo> logInfos = logMapper.findAll();
        Result result = new Result();
        if(logInfos==null){
            result.setStatus(201);
            result.setMsg("查询失败");
            return result;
        }
        PageInfo<LogInfo> pi=new PageInfo<LogInfo>(logInfos);
        PageBean<LogInfo> pageBean = new PageBean<LogInfo>(startSize,pi.getPageSize(),pi.getTotal());
        pageBean.setList(pi.getList());
        result.setStatus(200);
        result.setData(pageBean);
        return result;
    }
}
