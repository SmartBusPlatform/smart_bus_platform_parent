package com.cykj.cityline.service.impl;

import com.cykj.cityline.mapper.CitySiteMapper;
import com.cykj.cityline.service.CitySiteService;
import com.cykj.pojo.AreasChild;
import com.cykj.pojo.CitySiteChild;
import com.cykj.pojo.PageBean;
import com.cykj.util.Result;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class CitySiteServiceImpl implements CitySiteService {
    @Autowired
    private CitySiteMapper citySiteMapper;
    @Override
    public Result findCitySiteByCityId(HashMap<String, Object> map, int startSize, int pageSize) {
        PageHelper.startPage(startSize, pageSize);
        List<CitySiteChild> citySiteChildList = citySiteMapper.findCitySiteByCityId(map);
        Result result = new Result();
        if(citySiteChildList==null){
            result.setStatus(201);
            result.setMsg("查询失败");
            return result;
        }
        PageInfo<CitySiteChild> pageInfo = new PageInfo<CitySiteChild>(citySiteChildList);
        PageBean<CitySiteChild> pageBean = new PageBean<>(startSize,pageInfo.getPageSize(),pageInfo.getTotal());
        pageBean.setList(citySiteChildList);
        result.setStatus(200);
        result.setData(pageBean);
        return result;
    }
}
