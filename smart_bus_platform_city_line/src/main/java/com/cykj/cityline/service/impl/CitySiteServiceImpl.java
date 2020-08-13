package com.cykj.cityline.service.impl;

import com.cykj.cityline.mapper.AreasMapper;
import com.cykj.cityline.mapper.CitySiteMapper;
import com.cykj.cityline.service.CitySiteService;
import com.cykj.pojo.AreasChild;
import com.cykj.pojo.CitySite;
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
    @Autowired
    private AreasMapper areasMapper;
    @Override
    public Result findCitySiteByPage(HashMap<String, Object> map, int startSize, int pageSize) {
        PageHelper.startPage(startSize, pageSize);
        List<CitySiteChild> citySiteChildList = citySiteMapper.findCitySiteByPage(map);
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

    @Override
    public Result insCitySite(CitySite citySite) {
        List<CitySite> citySiteRes = citySiteMapper.findCitySiteByCityId(citySite);
        Result result = new Result();
        System.out.println(citySite);
        if(citySiteRes.size()<2){
            int num = citySiteMapper.insCitySite(citySite);

            if(num==1){
                result.setStatus(200);
                result.setMsg("新增站点成功");
                return result;
            }
            result.setStatus(201);
            result.setMsg("新增站点失败");
        }else{
            result.setStatus(201);
            result.setMsg("当前站点已存在，请重新输入");
        }

        return result;
    }

    @Override
    public List<CitySite> findCitySiteByCityId(CitySite citySite) {
        return citySiteMapper.findCitySiteByCityId(citySite);
    }

    @Override
    public Result updCitySiteByCityId(CitySite citySite) {
        List<CitySite> citySiteList = citySiteMapper.findCitySiteByCityId(citySite);
        Result result = new Result();
        if(citySiteList.size()==1){
            if(citySiteList.get(0).getxPosition()==citySite.getxPosition()&&citySiteList.get(0).getxPosition()==citySite.getyPosition()){
                result.setStatus(201);
                result.setMsg("当前站点已存在，请重新输入");
            }
        }
        if(citySiteList.size()<2){
            int num = citySiteMapper.updCitySiteByCityId(citySite);

            if(num==1){
                result.setStatus(200);
                result.setMsg("更新站点成功");
                return result;
            }
            result.setStatus(201);
            result.setMsg("更新站点失败");
        }else{
            result.setStatus(201);
            result.setMsg("当前站点已存在，请重新输入");
        }

        return result;
    }

    @Override
    public List<CitySite> findCitySiteAllByCityId(CitySite citySite) {
        return citySiteMapper.findCitySiteByCityId(citySite);
    }

    @Override
    public Result findCitySiteByCityIdLikeName(CitySiteChild citySiteChild) {
        Result result = new Result();
        if(citySiteChild!=null){
            if(citySiteChild.getCityName()!=null&&citySiteChild.getName()!=null&&!citySiteChild.getName().equals("")){
                AreasChild areasChild = new AreasChild();
                areasChild.setCityName(citySiteChild.getCityName());
                AreasChild areasChild1 = areasMapper.findAreaByCityName(areasChild);
                if(areasChild1!=null){
                    citySiteChild.setCityId(areasChild1.getId());
                    List<CitySite> citySiteByCityIdLikeName = citySiteMapper.findCitySiteByCityIdLikeName(citySiteChild);
                    result.setStatus(200);
                    result.setData(citySiteByCityIdLikeName);
                    return result;
                }
            }
        }
        result.setStatus(201);
        result.setMsg("查无此站点");
        return null;
    }
}
