package com.cykj.admin.service.impl;

import com.cykj.admin.mapper.BusMaintainMapper;
import com.cykj.admin.service.BusMainTainService;
import com.cykj.pojo.BusMaintainInfo;
import com.cykj.pojo.PageBean;
import com.cykj.util.Result;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class BusMainTainServiceImpl implements BusMainTainService {
    @Autowired
    BusMaintainMapper busMaintainMapper;

    @Override
    public Result queryBusMainTainByPage(HashMap<String, Object> condition, int startSize, int pageSize) {
        PageHelper.startPage(startSize, pageSize);

        List<BusMaintainInfo> busMainTainList = busMaintainMapper.queryBusMainTain(condition);

        Result result = new Result();
        if(busMainTainList==null){
            result.setStatus(201);
            result.setMsg("查询失败");
        }else{
            PageInfo<BusMaintainInfo> pageInfo = new PageInfo<BusMaintainInfo>(busMainTainList);
            PageBean<BusMaintainInfo> pageBean = new PageBean<>(startSize,pageInfo.getPageSize(),pageInfo.getTotal());
            pageBean.setList(busMainTainList);
            result.setStatus(0);
            result.setData(pageBean);
        }
        return result;
    }
}
