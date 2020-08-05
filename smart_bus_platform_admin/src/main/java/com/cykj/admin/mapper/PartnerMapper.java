package com.cykj.admin.mapper;

import com.cykj.pojo.Parameter;
import com.cykj.pojo.Partner;
import com.cykj.pojo.PartnerInfo;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface PartnerMapper {
    //查询广告商类型
    List<Parameter> queryPartnerType();
    //查询广告商
    List<PartnerInfo> queryPartner(HashMap<String, Object> map);
    //查询单个广告商
    Partner queryOnePartner(@Param("partner") String partner, @Param("id") int id);
    //新增广告商
    int insertPartner(Partner partner);
    //修改、模拟删除广告商
    int changePartner(Partner partner);
}
