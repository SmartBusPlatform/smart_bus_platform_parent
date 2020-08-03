package com.cykj.cityline.service.impl;

import com.cykj.cityline.mapper.AreasMapper;
import com.cykj.cityline.service.AreasService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.cykj.pojo.AreasChild;
import com.cykj.pojo.PageBean;
import com.cykj.util.Result;

import java.util.HashMap;
import java.util.List;

@Service
public class AreasServiceImpl implements AreasService {
    @Autowired
    private AreasMapper areasMapper;

    @Override
    public Result findAreasByPage(HashMap<String, Object> map, int startSize, int pageSize) {
        PageHelper.startPage(startSize, pageSize);
        List<AreasChild> areasList = areasMapper.findAreasByPage(map);
        Result result = new Result();
        if(areasList==null){
            result.setStatus(201);
            result.setMsg("查询失败");
            return result;
        }
        PageInfo<AreasChild> pageInfo = new PageInfo<AreasChild>(areasList);
        PageBean<AreasChild> pageBean = new PageBean<>(startSize,pageInfo.getPageSize(),pageInfo.getTotal());
        pageBean.setList(areasList);
        result.setStatus(200);
        result.setData(pageBean);
        return result;
    }

    @Override
    public Result findAreasByType(int type) {
        List<AreasChild> areasChildList = areasMapper.findAreasByType(type);
        Result result = new Result();
        if(areasChildList==null){
            result.setStatus(201);
            result.setMsg("查无此类型");
            return result;
        }
        result.setStatus(200);
        result.setData(areasChildList);
        return result;
    }

    @Override
    public Result insArea(AreasChild areasChild) {
        AreasChild areas = areasMapper.findAreaByCityName(areasChild);
        Result result = new Result();
        if(areas==null){
            int num = areasMapper.insArea(areasChild);

            if(num==1){
                result.setStatus(200);
                result.setMsg("新增城市成功");
                return result;
            }
            result.setStatus(201);
            result.setMsg("新增城市失败");
        }else{
            result.setStatus(201);
            result.setMsg("当前城市已存在，请重新输入");
        }

        return result;
    }

    @Override
    public Result updAreaById(AreasChild areasChild) {
        AreasChild areas = areasMapper.findAreaByCityName(areasChild);
        Result result = new Result();
        if(areas==null){
            int num = areasMapper.updAreaById(areasChild);

            if(num==1){
                result.setStatus(200);
                result.setMsg("更新城市成功");
                return result;
            }
            result.setStatus(201);
            result.setMsg("更新城市失败");
        }else{
            result.setStatus(201);
            result.setMsg("当前城市已存在，请重新输入");
        }

        return result;
    }

    @Override
    public AreasChild findAreaByCityName(AreasChild areasChild) {

        return areasMapper.findAreaByCityName(areasChild);
    }
}
