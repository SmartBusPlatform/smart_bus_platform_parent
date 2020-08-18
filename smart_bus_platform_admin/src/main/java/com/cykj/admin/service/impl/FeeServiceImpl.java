package com.cykj.admin.service.impl;

import com.cykj.admin.mapper.FeeMapper;
import com.cykj.admin.service.FeeService;
import com.cykj.pojo.CitySiteChild;
import com.cykj.pojo.EchartData;
import com.cykj.pojo.PageBean;
import com.cykj.util.Result;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class FeeServiceImpl implements FeeService {

    @Autowired
    private FeeMapper feeMapper;
    @Override
    public List<EchartData> findLineCashier(String cityId, String startDate, String endDate) {
        return feeMapper.findLineCashier(cityId,startDate,endDate);
    }

    @Override
    public List<EchartData> findLineCashierByName(String cityId, String lineName, String startDate, String endDate) {
        return feeMapper.findLineCashierByName(cityId,lineName,startDate,endDate);
    }

    @Override
    public List<EchartData> findLineCashierByNameAndTime(String cityId, String lineName, String time) {
        return feeMapper.findLineCashierByNameAndTime(cityId,lineName,time);
    }

    @Override
    public Result findSiteFlowByPage(String cityId, String name, String flowNum, int startSize, int pageSize) {
        PageHelper.startPage(startSize, pageSize);
        List<CitySiteChild> citySiteChildList = feeMapper.findSiteFlowByPage(cityId,name,flowNum);
        com.cykj.util.Result result = new com.cykj.util.Result();
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
    public List<EchartData> findSiteFlowByCityIdAndSiteId(String cityId, String siteId) {
        return feeMapper.findSiteFlowByCityIdAndSiteId(cityId,siteId);
    }
}
