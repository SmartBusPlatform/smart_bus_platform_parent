package com.cykj.cityline.service.impl;

import com.cykj.cityline.mapper.LineSiteMapper;
import com.cykj.cityline.service.LineSiteService;
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
    @Override
    public Map<String,Object> findLineSiteByLineId(LineChild lineChild) {
        List<LineSite> lineSiteStartByLineId = lineSiteMapper.findLineSiteStartByLineId(lineChild);
        List<LineSite> lineSiteBackByLineId = lineSiteMapper.findLineSiteBackByLineId(lineChild);
        Map<String,Object> map = new HashMap<>();
        map.put("start",lineSiteStartByLineId);
        map.put("back",lineSiteBackByLineId);


        return map;
    }

    @Override
    @Transactional
    public Result updLineSiteByLineId(LineChild lineChild) {
        System.out.println("abacbcbacbabcbabacbab");
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
            for (int k=0;k<lineChild.getResverArrs().size();k++){
                LineSite lineSite = new LineSite();
                lineSite.setLineId(lineChild.getLineId());
                lineSite.setPropertyId(2);
                lineSite.setBackIndex(k+1);
                lineSite.setSiteId(lineChild.getResverArrs().get(k).getTitle());
                num+=lineSiteMapper.insLineSite(lineSite);
            }
                result.setStatus(200);
                result.setMsg("新增成功");
                return result;
        }else{
            result.setStatus(201);
            result.setMsg("新增失败");
            return result;
        }

    }
}
