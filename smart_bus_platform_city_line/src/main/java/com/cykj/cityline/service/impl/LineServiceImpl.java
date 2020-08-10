package com.cykj.cityline.service.impl;

import com.cykj.cityline.mapper.AddSiteRecordMapper;
import com.cykj.cityline.mapper.CitySiteMapper;
import com.cykj.cityline.mapper.LineMapper;
import com.cykj.cityline.mapper.LineSiteMapper;
import com.cykj.cityline.service.CitySiteService;
import com.cykj.cityline.service.LineService;
import com.cykj.pojo.*;
import com.cykj.util.Result;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;

@Service
public class LineServiceImpl implements LineService {
    @Autowired
    private LineMapper lineMapper;
    @Autowired
    private LineSiteMapper lineSiteMapper;
    @Autowired
    private AddSiteRecordMapper addSiteRecordMapper;
    @Override
    public Result findLinePage(HashMap<String, Object> map, int startSize, int pageSize){
        PageHelper.startPage(startSize, pageSize);
        List<LineChild> lineChildList = lineMapper.findLinePage(map);
        Result result = new Result();
        if(lineChildList==null){
            result.setStatus(201);
            result.setMsg("查询失败");
            return result;
        }
        PageInfo<LineChild> pageInfo = new PageInfo<LineChild>(lineChildList);
        PageBean<LineChild> pageBean = new PageBean<>(startSize,pageInfo.getPageSize(),pageInfo.getTotal());
        pageBean.setList(lineChildList);
        result.setStatus(200);
        result.setData(pageBean);
        return result;
    }


    @Transactional
    @Override
    public Result insLine(LineChild lineChild) {
        int num = lineMapper.insLine(lineChild);
        int line_id=num;
        Result result = new Result();
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append("新增线路,");
        if(num!=0){
            stringBuffer.append("线路名:"+lineChild.getName()+",始程站点:");
            for (int k=0;k<lineChild.getArrs().size();k++){
                LineSite lineSite = new LineSite();
                lineSite.setLineId(lineChild.getId());
                lineSite.setPropertyId(1);
                lineSite.setStartIndex(k+1);
                lineSite.setSiteId(lineChild.getArrs().get(k).getTitle());
                num+=lineSiteMapper.insLineSite(lineSite);
                stringBuffer.append(lineChild.getArrs().get(k).getName()+",");
            }
            stringBuffer.append("返程站点:");
            for (int k=0;k<lineChild.getResverArrs().size();k++){
                LineSite lineSite = new LineSite();
                lineSite.setLineId(lineChild.getId());
                lineSite.setPropertyId(2);
                lineSite.setBackIndex(k+1);
                lineSite.setSiteId(lineChild.getResverArrs().get(k).getTitle());
                num+=lineSiteMapper.insLineSite(lineSite);
                stringBuffer.append(lineChild.getResverArrs().get(k).getName());
                if(k!=lineChild.getResverArrs().size()-1){
                    stringBuffer.append(",");
                }
            }
            if(num!=(1+lineChild.getArrs().size()+lineChild.getResverArrs().size())){

                result.setStatus(201);
                result.setMsg("新增失败");
                return result;
            }else{
                AddSiteRecord  addSiteRecord = new AddSiteRecord();
                addSiteRecord.setStateId(1);
                addSiteRecord.setContent(stringBuffer.toString());
                addSiteRecordMapper.insAddSiteRecord(addSiteRecord);
                result.setStatus(200);
                result.setMsg("新增成功");
                return result;
            }
        }else{
            result.setStatus(201);
            result.setMsg("新增失败");
            return result;
        }
    }
    /**
     * 删除线路
     */
    @Transactional
    public int delLineById(LineChild lineChild) throws  Exception{
        int num = lineSiteMapper.delLineSiteByLineId(lineChild);
        if(num>0){
           num+=lineMapper.delLineById(lineChild);
        }
        return num;
    }

    @Override
    public LineChild findLineByCityId(Line line) {
        return lineMapper.findLineByCityId(line);
    }

    public Result updLineByLineId(Line line) {
                LineChild lineByCityId = lineMapper.findLineByCityId(line);
        Result result = new Result();
        if(lineByCityId==null){
            int num = lineMapper.updLineByLineId(line);

            if(num==1){
                result.setStatus(200);
                result.setMsg("更新线路信息成功");
                return result;
            }
            result.setStatus(201);
            result.setMsg("更新线路信失败");
        }else{
            result.setStatus(201);
            result.setMsg("当前线路名已存在，请重新输入");
        }

        return result;
    }

//
//    @Override
//    public Result insCitySite(CitySite citySite) {
//        List<CitySite> citySiteRes = citySiteMapper.findCitySiteByCityId(citySite);
//        Result result = new Result();
//        System.out.println(citySite);
//        if(citySiteRes.size()<2){
//            int num = citySiteMapper.insCitySite(citySite);
//
//            if(num==1){
//                result.setStatus(200);
//                result.setMsg("新增站点成功");
//                return result;
//            }
//            result.setStatus(201);
//            result.setMsg("新增站点失败");
//        }else{
//            result.setStatus(201);
//            result.setMsg("当前站点已存在，请重新输入");
//        }
//
//        return result;
//    }
//
//    @Override
//    public List<CitySite> findCitySiteByCityId(CitySite citySite) {
//        return citySiteMapper.findCitySiteByCityId(citySite);
//    }
//
//    @Override
//    public Result updCitySiteByCityId(CitySite citySite) {
//        List<CitySite> citySiteList = citySiteMapper.findCitySiteByCityId(citySite);
//        Result result = new Result();
//        if(citySiteList.size()<2){
//            int num = citySiteMapper.updCitySiteByCityId(citySite);
//
//            if(num==1){
//                result.setStatus(200);
//                result.setMsg("更新站点成功");
//                return result;
//            }
//            result.setStatus(201);
//            result.setMsg("更新站点失败");
//        }else{
//            result.setStatus(201);
//            result.setMsg("当前站点已存在，请重新输入");
//        }
//
//        return result;
//    }
}
