package com.cykj.admin.service.impl;

import com.cykj.admin.mapper.PartnerMapper;
import com.cykj.admin.service.PartnerService;
import com.cykj.pojo.*;
import com.cykj.util.Result;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class PartnerServiceImpl implements PartnerService {
    @Autowired
    PartnerMapper partnerMapper;

    @Override
    public List<Parameter> queryPartnerType() {
        List<Parameter> partnerTypeList = partnerMapper.queryPartnerType();

        return partnerTypeList;
    }

    @Override
    public Result queryPartnerByPage(HashMap<String,Object> condition, int startSize, int pageSize) {
        PageHelper.startPage(startSize, pageSize);
        List<PartnerInfo> partnerList = partnerMapper.queryPartner(condition);
        Result result = new Result();
        if(partnerList==null){
            result.setStatus(201);
            result.setMsg("查询失败");
            return result;
        }
        PageInfo<PartnerInfo> pageInfo = new PageInfo<PartnerInfo>(partnerList);
        PageBean<PartnerInfo> pageBean = new PageBean<>(startSize,pageInfo.getPageSize(),pageInfo.getTotal());
        pageBean.setList(partnerList);
        result.setStatus(0);
        result.setData(pageBean);
        return result;
    }

    @Override
    public List<PartnerInfo> queryPartner(HashMap<String, Object> condition) {
        List<PartnerInfo> partnerList = partnerMapper.queryPartner(condition);

        return partnerList;
    }

    @Override
    public int insertPartner(Partner partner) {
        int isSuccess = 0;
        if (partner.getPartner()!=null&&!"".equals(partner.getPartner())){
            Partner isPartner = partnerMapper.queryOnePartner(partner.getPartner(),0);

            if(isPartner==null){
                isSuccess = partnerMapper.insertPartner(partner);
            }else{
                isSuccess = -9999;
            }
        }else{
            isSuccess = -9998;
        }

        return isSuccess;
    }

    @Override
    public int changePartner(Partner partner) {
        int isSuccess = 0;
        if (partner.getPartner()!=null&&!"".equals(partner.getPartner())){
            Partner isPartner = partnerMapper.queryOnePartner(partner.getPartner(),partner.getId());
            if(isPartner==null){
                isSuccess = partnerMapper.changePartner(partner);
            }else{
                isSuccess = -9999;
            }
        }else{
            isSuccess = partnerMapper.changePartner(partner);
        }

        return isSuccess;
    }
}
