package com.cykj.cityline.service.impl;

import com.cykj.cityline.mapper.AddSiteRecordMapper;
import com.cykj.cityline.mapper.LineSiteMapper;
import com.cykj.cityline.service.LineSiteService;
import com.cykj.pojo.AddSiteRecord;
import com.cykj.pojo.CitySiteArr;
import com.cykj.pojo.LineChild;
import com.cykj.pojo.LineSite;
import com.cykj.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class LineSiteServiceImpl implements LineSiteService {
    @Autowired
    private LineSiteMapper lineSiteMapper;

    @Autowired
    private AddSiteRecordMapper addSiteRecordMapper;
    @Override
    public Map<String,Object> findLineSiteByLineId(LineChild lineChild) {
        List<CitySiteArr> lineSiteStartByLineId = lineSiteMapper.findLineSiteStartByLineId(lineChild);
        List<CitySiteArr> lineSiteBackByLineId = lineSiteMapper.findLineSiteBackByLineId(lineChild);
        Map<String,Object> map = new HashMap<>();
        map.put("start",lineSiteStartByLineId);
        map.put("back",lineSiteBackByLineId);


        return map;
    }

    @Override
    @Transactional
    public Result updLineSiteByLineId(LineChild lineChild) {
        List<CitySiteArr> start = lineSiteMapper.findLineSiteStartByLineId(lineChild);
        List<CitySiteArr> back = lineSiteMapper.findLineSiteBackByLineId(lineChild);
        StringBuffer stringBuffer1 = new StringBuffer("调整线路，线路名称:"+lineChild.getName()+",始程新增站点:");
        StringBuffer stringBuffer2 = new StringBuffer("调整线路，线路名称:"+lineChild.getName()+",返程新增站点:");
        StringBuffer stringBuffer3 = new StringBuffer("调整线路，线路名称:"+lineChild.getName()+",始程删除站点:");
        StringBuffer stringBuffer4 = new StringBuffer("调整线路，线路名称:"+lineChild.getName()+",返程删除站点:");
        boolean flag1=false;
        boolean flag2=false;
        boolean flag3=false;
        boolean flag4=false;
        int startNum=0;
        for (int i=0;i<start.size();i++){
            int k=0;
            for (int j=0;j<lineChild.getArrs().size();j++){
                if(start.get(i).getTitle()==lineChild.getArrs().get(j).getTitle()&&i==j){
                    startNum++;
                }
            }
        }
        for (int i=0;i<back.size();i++){
            int k=0;
            for (int j=0;j<lineChild.getResverArrs().size();j++){
                if(back.get(i).getTitle()==lineChild.getResverArrs().get(j).getTitle()&&i==j){
                    startNum++;
                }
            }
        }
        if(startNum==(start.size()+back.size())){
            Result result = new Result();
            result.setMsg("您提交的站点跟之前的站点无变化");
            result.setStatus(203);
            return result;
        }
        for (int i=0;i<start.size();i++){
            int k=0;
            for (int j=0;j<lineChild.getArrs().size();j++){
                if(start.get(i).getTitle()!=lineChild.getArrs().get(j).getTitle()){
                   k++;
                }
            }
            if(k==lineChild.getArrs().size()){
                stringBuffer3.append(lineChild.getArrs().get(i).getName()+",");
                flag3=true;
            }

        }
        for (int j=0;j<lineChild.getArrs().size();j++){
            int k=0;
            for (int i=0;i<start.size();i++) {
                if ( lineChild.getArrs().get(j).getTitle()!=start.get(i).getTitle() ) {
                    k++;
                }
            }
            if(k==start.size()){
                stringBuffer1.append(lineChild.getArrs().get(j).getName()+",");
                flag1=true;
            }
        }
        for (int i=0;i<back.size();i++){
            int k=0;
            for (int j=0;j<lineChild.getResverArrs().size();j++){
                if(back.get(i).getTitle()!=lineChild.getResverArrs().get(j).getTitle()){
                    k++;
                }
            }
            if(k==lineChild.getResverArrs().size()){
                stringBuffer4.append(lineChild.getResverArrs().get(i).getName()+",");
                flag4=true;
            }

        }
        for (int j=0;j<lineChild.getResverArrs().size();j++){
            int k=0;
            for (int i=0;i<back.size();i++) {
                if ( lineChild.getResverArrs().get(j).getTitle()!=back.get(i).getTitle() ) {
                    k++;
                }
            }
            if(k==back.size()){
                stringBuffer2.append(lineChild.getResverArrs().get(j).getName()+",");
                flag2=true;
            }
        }

        int num=lineSiteMapper.delLineSiteByLineId(lineChild);
        Result result = new Result();
        if(num>0){
            for (int k=0;k<lineChild.getArrs().size();k++){
                LineSite lineSite = new LineSite();
                lineSite.setLineId(lineChild.getLineId());
                lineSite.setPropertyId(1);
                lineSite.setStartIndex(k+1);
                lineSite.setSiteId(lineChild.getArrs().get(k).getTitle());
                num+=lineSiteMapper.insLineSite(lineSite);
            }
            for (int k=0;k<lineChild.getResverArrs().size();k++) {
                LineSite lineSite = new LineSite();
                lineSite.setLineId(lineChild.getLineId());
                lineSite.setPropertyId(2);
                lineSite.setBackIndex(k + 1);
                lineSite.setSiteId(lineChild.getResverArrs().get(k).getTitle());
                num += lineSiteMapper.insLineSite(lineSite);
            }
            if(flag1){
                addSiteRecordMapper.insAddSiteRecord(new AddSiteRecord(stringBuffer1.toString(),1  ));
            }
            if(flag2){
                addSiteRecordMapper.insAddSiteRecord(new AddSiteRecord(stringBuffer2.toString(),1  ));
            }
            if(flag3){
                addSiteRecordMapper.insAddSiteRecord(new AddSiteRecord(stringBuffer3.toString(),2  ));
            }
            if(flag4){
                addSiteRecordMapper.insAddSiteRecord(new AddSiteRecord(stringBuffer4.toString(),2  ));
            }



                result.setStatus(200);
                result.setMsg("修改成功");
                return result;
        }else{
            result.setStatus(201);
            result.setMsg("修改失败");
            return result;
        }

    }
}
