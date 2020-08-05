package com.cykj.admin.service.impl;

import com.cykj.admin.mapper.AdvertiserMapper;
import com.cykj.admin.service.AdvertiserService;
import com.cykj.pojo.Advertiser;
import com.cykj.pojo.AdvertiserInfo;
import com.cykj.pojo.AreasChild;
import com.cykj.pojo.PageBean;
import com.cykj.util.Result;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Service
public class AdvertiserServiceImpl implements AdvertiserService {
    @Autowired
    AdvertiserMapper advertiserMapper;

    @Override
    public Result queryAdvertiserByPage(HashMap<String,Object> condition, int startSize, int pageSize) {
        PageHelper.startPage(startSize, pageSize);

        List<AdvertiserInfo> advertiserList = advertiserMapper.queryAdvertiser(condition);
        DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
        Advertiser nowAdvertiser = new Advertiser();

        //判断广告是否到期
        for (int i=0; i<advertiserList.size();i++){
            try {
                Date d1 = new Date();
                Date d2 = dateFormat.parse(advertiserList.get(i).getEndTime());
                if((d1.after(d2)||d1.equals(d2))&&advertiserList.get(i).getStateId()!=3&&advertiserList.get(i).getStateId()!=4){
                    nowAdvertiser.setId(advertiserList.get(i).getId());
                    nowAdvertiser.setStateId(3);
                    int q = advertiserMapper.changeAdvertiser(nowAdvertiser);
                    advertiserList.get(i).setStateId(3);
                    advertiserList.get(i).setStateName("到期");
                }else if(d1.before(d2)&&advertiserList.get(i).getStateId()==3){
                    nowAdvertiser.setId(advertiserList.get(i).getId());
                    nowAdvertiser.setStateId(1);
                    int q = advertiserMapper.changeAdvertiser(nowAdvertiser);
                    advertiserList.get(i).setStateId(1);
                    advertiserList.get(i).setStateName("启用");
                }
            } catch (ParseException e) {
                advertiserList = null;
                e.printStackTrace();
            }
        }

        Result result = new Result();
        if(advertiserList==null){
            result.setStatus(201);
            result.setMsg("查询失败");
        }else{
            PageInfo<AdvertiserInfo> pageInfo = new PageInfo<AdvertiserInfo>(advertiserList);
            PageBean<AdvertiserInfo> pageBean = new PageBean<>(startSize,pageInfo.getPageSize(),pageInfo.getTotal());
            pageBean.setList(advertiserList);
            result.setStatus(0);
            result.setData(pageBean);
        }
        return result;
    }

    @Override
    public List<AdvertiserInfo> queryAdvertiser(HashMap<String, Object> condition) {
        List<AdvertiserInfo> advertiserList = advertiserMapper.queryAdvertiser(condition);

        return advertiserList;
    }

    @Override
    public int insertAdvertiser(Advertiser advertiser) {
        advertiser.setReleaseTime(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
        int isSuccess = advertiserMapper.insertAdvertiser(advertiser);

        return isSuccess;
    }

    @Override
    public int changeAdvertiser(Advertiser advertiser) {
        int isSuccess = advertiserMapper.changeAdvertiser(advertiser);

        return isSuccess;
    }
}
