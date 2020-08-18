package com.cykj.userapp.service.impl;

import com.cykj.pojo.*;
import com.cykj.userapp.mapper.CityLineMapper;
import com.cykj.userapp.mapper.CitySiteMapper;
import com.cykj.userapp.service.NavigationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class NavigationServiceImpl implements NavigationService {
    @Autowired
    CitySiteMapper citySiteMapper;
    @Autowired
    CityLineMapper cityLineMapper;

    @Override
    public HashMap<String, Object> myLocationSite(Navigation navigation) {
        //查出当前城市所有的站点
        List<CitySiteInfo> allSite = citySiteMapper.queryCitySiteByCityName(navigation.getCityName());
        //定义坐标类
        Distance distance = new Distance();     //提供方法的类
        HashMap<String, Object> hashMap = new HashMap<>();

        //我的位置到某某站点
        if (navigation.getStartID()==0&&navigation.getEndID()!=0){
            Distance myDistance = new Distance(navigation.getStartX(),navigation.getStartY());   //我的位置坐标类
            //定义距离和车站id
            double myLatelyDistance = 0;     //a离最近站点的距离
            int myLatelySiteId = 0;          //a最近的站点id

            if(allSite!=null){
                //不为空，则for循环算出我的位置最近的车站id以及距离
                for(int i=0; i<allSite.size();i++){
                    //站点的坐标类
                    Distance siteDistance = new Distance(allSite.get(i).getxPosition(),allSite.get(i).getyPosition());   //a位置的坐标类
                    //我的位置附近站点
                    if(i==0){
                        //第一次循环，最近距离、id都为第一个的距离和id
                        myLatelyDistance = distance.getDistance(myDistance,siteDistance);
                        myLatelySiteId = allSite.get(i).getId();
                    }else{
                        //当前距离小于最小距离，则最小距离为当前的距离
                        double nowDistance = distance.getDistance(myDistance,siteDistance);
                        if(nowDistance<myLatelyDistance){
                            myLatelyDistance = nowDistance;
                            myLatelySiteId = allSite.get(i).getId();
                        }
                    }
                }

                if(myLatelySiteId!=navigation.getEndID()){
                    //获取直达线路
                    HashMap<String,List<UserToSiteRoute>> lineMap = getDirectLine(myLatelySiteId,navigation.getEndID());

                    if(lineMap.get("startLine").size()>0||lineMap.get("returnLine").size()>0){
                        //如果有直达
                        CitySite endSite = citySiteMapper.querySiteBySiteId(navigation.getEndID());
                        navigation.setEndX(endSite.getxPosition());
                        navigation.setEndY(endSite.getyPosition());
                        hashMap.put("navigation",navigation);
                        hashMap.put("startNavigation",lineMap.get("startLine"));
                        hashMap.put("returnNavigation",lineMap.get("returnLine"));
                        hashMap.put("type","1");
                    }else{
                        //如果没有，那直接步行
                        CitySite endSite = citySiteMapper.querySiteBySiteId(navigation.getEndID());
                        navigation.setEndX(endSite.getxPosition());
                        navigation.setEndY(endSite.getyPosition());
                        hashMap.put("navigation",navigation);
                        hashMap.put("type","0");
                    }
                }else{
                    //如果最近站点等于结束站点，那直接步行
                    CitySite endSite = citySiteMapper.querySiteBySiteId(navigation.getEndID());
                    navigation.setEndX(endSite.getxPosition());
                    navigation.setEndY(endSite.getyPosition());
                    hashMap.put("navigation",navigation);
                    hashMap.put("type","0");
                }
            }
        //某某站点到我的位置
        }else if(navigation.getStartID()!=0&&navigation.getEndID()==0){
            Distance myDistance = new Distance(navigation.getEndX(),navigation.getEndY());   //我的位置坐标类
            //定义距离和车站id
            double myLatelyDistance = 0;     //最近站点的距离
            int myLatelySiteId = 0;          //最近站点的id

            if(allSite!=null){
                //不为空，则for循环算出我的位置最近的车站id以及距离
                for(int i=0; i<allSite.size();i++){
                    //站点的坐标类
                    Distance siteDistance = new Distance(allSite.get(i).getxPosition(),allSite.get(i).getyPosition());
                    //我的位置附近站点
                    if(i==0){
                        //第一次循环，最近距离、id都为第一个的距离和id
                        myLatelyDistance = distance.getDistance(siteDistance,myDistance);
                        myLatelySiteId = allSite.get(i).getId();
                    }else{
                        //当前距离小于最小距离，则最小距离为当前的距离
                        double nowDistance = distance.getDistance(siteDistance,myDistance);
                        if(nowDistance<myLatelyDistance){
                            myLatelyDistance = nowDistance;
                            myLatelySiteId = allSite.get(i).getId();
                        }
                    }
                }

                if(myLatelySiteId!=navigation.getStartID()){
                    //获取直达线路
                    HashMap<String,List<UserToSiteRoute>> lineMap = getDirectLine(navigation.getStartID(),myLatelySiteId);

                    if(lineMap.get("startLine").size()>0||lineMap.get("returnLine").size()>0){
                        //如果有直达
                        CitySite startSite = citySiteMapper.querySiteBySiteId(navigation.getStartID());
                        navigation.setStartX(startSite.getxPosition());
                        navigation.setStartY(startSite.getyPosition());
                        hashMap.put("navigation",navigation);
                        hashMap.put("startNavigation",lineMap.get("startLine"));
                        hashMap.put("returnNavigation",lineMap.get("returnLine"));
                        hashMap.put("type","1");
                    }else{
                        //如果没有，那直接步行
                        CitySite startSite = citySiteMapper.querySiteBySiteId(navigation.getStartID());
                        navigation.setStartX(startSite.getxPosition());
                        navigation.setStartY(startSite.getyPosition());
                        hashMap.put("navigation",navigation);
                        hashMap.put("type","0");
                    }
                }else{
                    //如果最近站点等于结束站点，那直接步行
                    CitySite startSite = citySiteMapper.querySiteBySiteId(navigation.getStartID());
                    navigation.setStartX(startSite.getxPosition());
                    navigation.setStartY(startSite.getyPosition());
                    hashMap.put("navigation",navigation);
                    hashMap.put("type","0");
                }
            }
        }else if(navigation.getStartID()!=0&&navigation.getEndID()!=0){
            if(navigation.getStartID()!=navigation.getEndID()){
                //获取直达线路
                HashMap<String,List<UserToSiteRoute>> lineMap = getDirectLine(navigation.getStartID(),navigation.getEndID());

                if(lineMap.get("startLine").size()>0||lineMap.get("returnLine").size()>0){
                    //如果有直达
                    CitySite startSite = citySiteMapper.querySiteBySiteId(navigation.getStartID());
                    CitySite endSite = citySiteMapper.querySiteBySiteId(navigation.getEndID());
                    navigation.setStartX(startSite.getxPosition());
                    navigation.setStartY(startSite.getyPosition());
                    navigation.setEndX(endSite.getxPosition());
                    navigation.setEndY(endSite.getyPosition());
                    hashMap.put("navigation",navigation);
                    hashMap.put("startNavigation",lineMap.get("startLine"));
                    hashMap.put("returnNavigation",lineMap.get("returnLine"));
                    hashMap.put("type","1");
                }else{
                    //如果没有，那直接步行
                    CitySite startSite = citySiteMapper.querySiteBySiteId(navigation.getStartID());
                    CitySite endSite = citySiteMapper.querySiteBySiteId(navigation.getEndID());
                    navigation.setStartX(startSite.getxPosition());
                    navigation.setStartY(startSite.getyPosition());
                    navigation.setEndX(endSite.getxPosition());
                    navigation.setEndY(endSite.getyPosition());
                    hashMap.put("navigation",navigation);
                    hashMap.put("type","0");
                }
            }else{
                //如果最近站点等于结束站点，那直接步行
                CitySite endSite = citySiteMapper.querySiteBySiteId(navigation.getEndID());
                navigation.setEndX(endSite.getxPosition());
                navigation.setEndY(endSite.getyPosition());
                hashMap.put("navigation",navigation);
                hashMap.put("type","0");
            }
        }
        return hashMap;
    }

    @Override
    public HashMap<String, Object> q(Navigation navigation) {
        //两个位置不是站点
        if(navigation.getEndID()==0&&navigation.getStartID()==0){
            //获取最近站点
            HashMap<String,Integer> siteMap = getLatelySite(navigation);
            if(siteMap!=null){
                int aSiteId = siteMap.get("a"); //a站点id
                int bSiteId = siteMap.get("b"); //b站点id

                //查询是否有直达线路
                HashMap<String,List<UserToSiteRoute>> lineMap = getDirectLine(aSiteId,bSiteId);
                if(lineMap.get("startLine").size()==0&&lineMap.get("returnLine").size()==0){
                    //没有直达线路,那就查询a站点所有线路和b站点所有线路相交的那条线路
                    HashMap<String,Integer> idMap = getCrossLine(aSiteId,bSiteId);
                    System.out.println("没有直达");
                    System.out.println(idMap);
                    if(idMap!=null){
                        int aLineId = idMap.get("aLineId");
                        int bLineId = idMap.get("bLineId");
                        int siteId = idMap.get("siteId");

                    }else{
                        HashMap<String, Object> hashMap = new HashMap<>();
                        hashMap.put("navigation",navigation);
                        hashMap.put("type",lineMap.get("0"));
                        return hashMap;
                    }
                }else{
                    //有直达线路,直接返回
                    HashMap<String, Object> hashMap = new HashMap<>();
                    hashMap.put("navigation",navigation);
                    hashMap.put("startNavigation",lineMap.get("startLine"));
                    hashMap.put("returnNavigation",lineMap.get("returnLine"));
                    hashMap.put("type",lineMap.get("1"));
                    System.out.println(hashMap);
                    return hashMap;
                }
            }else{
                //如果等于空，要么是直接走最短，要么是没有站点
            }
        }

        return null;
    }

    @Override
    public List<CitySite> querySiteBySiteName(String name) {
        List<CitySite> list = citySiteMapper.querySameSiteBySiteName(name);

        return list;
    }

    @Override
    public List<LineSite> findLineByLineName(String name) {
        List<LineSite> list = cityLineMapper.findLineByLineName(name);
        return list;
    }

    @Override
    public LineChild queryLineSiteByLineId(int id) {
        LineChild lineChild = new LineChild();
        lineChild.setArrs(citySiteMapper.queryLineSiteByLineIdProId(id,1));
        lineChild.setResverArrs(citySiteMapper.queryLineSiteByLineIdProId(id,2));

        return lineChild;
    }

    //获取最近站点
    public HashMap<String,Integer> getLatelySite(Navigation navigation){
        //查出当前城市所有的站点
        List<CitySiteInfo> allSite = citySiteMapper.queryCitySiteByCityName(navigation.getCityName());
        //定义坐标类
        Distance distance = new Distance();     //提供方法的类
        Distance aDistance = new Distance(navigation.getStartX(),navigation.getStartY());   //a位置的坐标类
        Distance bDistance = new Distance(navigation.getEndX(),navigation.getEndY());   //b位置的坐标类
        //定义距离和车站id
        double aLatelyDistance = 0;     //a离最近站点的距离
        int aLatelySiteId = 0;          //a最近的站点id
        double bLatelyDistance = 0;     //b离最近站点的距离
        int bLatelySiteId = 0;          //b最近的站点id
        //判断城市站点是否为空
        if(allSite!=null){
            //不为空，则for循环算出两个位置最近的车站id以及距离
            for(int i=0; i<allSite.size();i++){
                //站点的坐标类
                Distance siteDistance = new Distance(allSite.get(i).getxPosition(),allSite.get(i).getyPosition());   //a位置的坐标类
                //a站点
                if(i==0){
                    //第一次循环，最近距离、id都为第一个的距离和id
                    aLatelyDistance = distance.getDistance(aDistance,siteDistance);
                    aLatelySiteId = allSite.get(i).getId();
                }else{
                    //当前距离小于最小距离，则最小距离为当前的距离
                    double nowDistance = distance.getDistance(aDistance,siteDistance);
                    if(nowDistance<aLatelyDistance){
                        aLatelyDistance = nowDistance;
                        aLatelySiteId = allSite.get(i).getId();
                    }
                }
                //b站点
                if(i==0){
                    //第一次循环，最近距离、id都为第一个的距离和id
                    bLatelyDistance = distance.getDistance(bDistance,siteDistance);
                    bLatelySiteId = allSite.get(i).getId();
                }else{
                    //当前距离小于最小距离，则最小距离为当前的距离
                    double nowDistance = distance.getDistance(bDistance,siteDistance);
                    if(nowDistance<bLatelyDistance){
                        bLatelyDistance = nowDistance;
                        bLatelySiteId = allSite.get(i).getId();
                    }
                }
            }

            //将a到b的距离和a到a站点b到b站点的距离比较,a到b如果小的话直接走就完事了没必要搭车
            double abDistance = distance.getDistance(aDistance,bDistance);
            if(abDistance>aLatelyDistance+bLatelyDistance){
                HashMap<String,Integer> hashMap = new HashMap<>();
                hashMap.put("a",aLatelySiteId);
                hashMap.put("b",bLatelySiteId);
                return hashMap;
            }else{
                return null;
            }
        }else{
            //为空，返回空
            return null;
        }
    }

    //获取直达线路
    public HashMap<String,List<UserToSiteRoute>> getDirectLine(int aSiteId,int bSiteId){
        //先查始程是否有在一条路线上
        List<UserToSiteRoute> startLine = cityLineMapper.findStartLineBySiteId(aSiteId,bSiteId);
        //再查返程是否有在一条路线上
        List<UserToSiteRoute> returnLine = cityLineMapper.findEndLineBySiteId(aSiteId,bSiteId);

        //如果在一条线路上，查询中间站点
        if(startLine!=null){
            for (int i=0; i<startLine.size(); i++){
                List<CitySiteArr> middleSite = citySiteMapper.findSiteByLineIdIndex(startLine.get(i));
                startLine.get(i).setMiddleSiteList(middleSite);
            }
        }
        if(returnLine!=null){
            for (int i=0; i<returnLine.size(); i++){
                List<CitySiteArr> middleSite = citySiteMapper.findSiteByLineIdIndex(returnLine.get(i));
                returnLine.get(i).setMiddleSiteList(middleSite);
            }
        }

        HashMap<String,List<UserToSiteRoute>> hashMap = new HashMap<>();
        hashMap.put("startLine",startLine);
        hashMap.put("returnLine",returnLine);

        return hashMap;
    }

    //获取a站点和b站点相交的线路
    public HashMap<String,Integer> getCrossLine(int aSiteId,int bSiteId){
        //获取a站点的线路
        List<LineSite> aAllLine= cityLineMapper.findOneLineBySiteId(aSiteId);
        //获取b站点的线路
        List<LineSite> bAllLine= cityLineMapper.findOneLineBySiteId(bSiteId);

        if(aAllLine!=null&&bAllLine!=null){
            //查询a站点所有线路对应的所有站点
            List<CitySiteInfo> aLineAllSite = new ArrayList<>();
            for (int i=0; i<aAllLine.size(); i++){
                aLineAllSite.addAll(citySiteMapper.queryAllSiteByLineIdProId(aAllLine.get(i)));
            }
            //查询b站点所有线路对应的所有站点
            List<CitySiteInfo> bLineAllSite = new ArrayList<>();
            for (int i=0; i<bAllLine.size(); i++){
                bLineAllSite.addAll(citySiteMapper.queryAllSiteByLineIdProId(bAllLine.get(i)));
            }

            //定义a线路id，b线路id，站点id来接收两线路的交叉点
            int aLineId = 0;
            int bLineId = 0;
            int siteId = 0;
            for (int i=0; i<aLineAllSite.size();i++){
                for (int j=0; j<bLineAllSite.size(); j++){
                    if(aLineAllSite.get(i).getId()==bLineAllSite.get(i).getId()){
                        aLineId = aLineAllSite.get(i).getLineId();
                        bLineId = bLineAllSite.get(i).getLineId();
                        siteId = aLineAllSite.get(i).getId();
                        break;
                    }
                }
            }

            if(aLineId!=0&&bLineId!=0&&siteId!=0){
                HashMap<String,Integer> hashMap = new HashMap<>();
                hashMap.put("aLineId",aLineId);
                hashMap.put("bLineId",bLineId);
                hashMap.put("siteId",siteId);
                return hashMap;
            }else{
                return null;
            }

        }else{
            return null;
        }
    }
}
