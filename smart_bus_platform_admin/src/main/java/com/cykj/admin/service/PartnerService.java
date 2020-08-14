package com.cykj.admin.service;

import com.cykj.pojo.Parameter;
import com.cykj.pojo.Partner;
import com.cykj.pojo.PartnerInfo;
import com.cykj.util.Result;

import java.util.HashMap;
import java.util.List;

public interface PartnerService {
    //查询广告商类型
    public List<Parameter> queryPartnerType();
    //分页查询广告商
    public Result queryPartnerByPage(HashMap<String, Object> condition, int startSize, int pageSize);
    //查询所有广告商
    public List<PartnerInfo> queryPartner(HashMap<String, Object> condition);
    //新增广告商
    public int insertPartner(Partner partner);
    //修改、模拟删除广告商
    public int changePartner(Partner partner);
}