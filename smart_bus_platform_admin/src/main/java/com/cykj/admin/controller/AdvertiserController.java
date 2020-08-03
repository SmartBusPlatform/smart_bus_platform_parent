package com.cykj.admin.controller;

import com.alibaba.fastjson.JSON;
import com.cykj.admin.service.AdvertiserService;
import com.cykj.pojo.Advertiser;
import com.cykj.pojo.AdvertiserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

@RequestMapping(value = "advertiser")
@RestController
public class AdvertiserController{
    @Autowired
    AdvertiserService advertiserService;

    @RequestMapping(value = "queryAdvertiserByPage")
    //分页查询广告，id为空就查全部
    public Object queryAdvertiserByPage(HttpServletRequest request){
        int startNum;
        if(request.getParameter("page")!=null&&request.getParameter("page").matches("[0,9]*")){
            startNum = Integer.parseInt(request.getParameter("page"));
        }else{
            startNum = 1;
        }
        int pageNum;
        if(request.getParameter("limit")!=null&&request.getParameter("limit").matches("[0,9]*")){
            pageNum = Integer.parseInt(request.getParameter("limit"));
        }else{
            pageNum = 5;
        }

        HashMap<String,Object> condition = new HashMap<String, Object>();

        if(request.getParameter("id")!=null&&!"".equals(request.getParameter("id"))){
            condition.put("id",request.getParameter("id"));
        }
        if(request.getParameter("partner")!=null&&!"".equals(request.getParameter("partner"))){
            condition.put("partner",request.getParameter("partner"));
        }
        if(request.getParameter("isCarousel")!=null&&!"".equals(request.getParameter("isCarousel"))){
            condition.put("isCarousel",request.getParameter("isCarousel"));
        }
        if(request.getParameter("stateId")!=null&&!"".equals(request.getParameter("stateId"))){
            condition.put("stateId",request.getParameter("stateId"));
        }

        return JSON.toJSONString(advertiserService.queryAdvertiserByPage(condition,startNum,pageNum));
    }

    @RequestMapping(value = "insertIamge")
    //上传图片
    public Object insertIamge(MultipartFile file,HttpServletRequest req) {
        String filePath = req.getParameter("filePath");

        Map<String,Object> map = new HashMap<String,Object>();

        if(filePath!=null&&!"".equals(filePath)){
            String path = filePath.substring(0,filePath.lastIndexOf("\\"));

            File dir = new File(path);
            if(!dir.exists()){
                dir.mkdirs();
            }

            dir = new File(filePath);
            try {
                file.transferTo(dir);
                map.put("msg","success");
                map.put("code",200);
            } catch (IOException e) {
                map.put("msg","error");
                map.put("code",0);
                e.printStackTrace();
            }
        }else{
            String path = req.getSession().getServletContext().getRealPath("image");

            File dir = new File(path);
            if(!dir.exists()){
                dir.mkdirs();
            }

            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
            Random random = new Random();
            String fileName = random.nextInt(89999 + 10000) + simpleDateFormat.format(new Date());

            dir = new File(path+"\\"+fileName);
            if(dir.exists()){
                map.put("msg","repeat");
                map.put("code",0);
            }else{
                try {
                    file.transferTo(dir);
                    map.put("msg",fileName);
                    map.put("code",200);
                } catch (IOException e) {
                    map.put("msg","error");
                    map.put("code",0);
                    e.printStackTrace();
                }
            }
        }

        return JSON.toJSONString(map);
    }

    @RequestMapping(value = "insertAdvertiser")
    //新增广告
    public String insertAdvertiser(@RequestBody Advertiser advertiser,HttpServletRequest req){
        if (advertiser!=null){
            advertiser.setImgUrl(req.getSession().getServletContext().getRealPath("image")+"\\"+advertiser.getImgUrl());
            int isSuccess = advertiserService.insertAdvertiser(advertiser);

            if (isSuccess!=0){
                return JSON.toJSONString("success");
            }else{
                return JSON.toJSONString("error");
            }
        }else{
            return JSON.toJSONString("upDataError");
        }
    }

    @RequestMapping(value = "queryAdvertiserImage")
    //查询广告图片
    public void queryAdvertiserImage(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HashMap<String,Object> condition = new HashMap<String, Object>();

        if(request.getParameter("id")!=null&&!"".equals(request.getParameter("id"))){
            condition.put("id",request.getParameter("id"));
        }

        List<AdvertiserInfo> list = advertiserService.queryAdvertiser(condition);

        if(list!=null){
            String filePath = list.get(0).getImgUrl();

            File file = new File(filePath);

            if(file.exists()){
                BufferedImage image = ImageIO.read(new FileInputStream(filePath));
                ImageIO.write(image, "jpg", response.getOutputStream());
            }
        }
    }

    @RequestMapping(value = "changeAdvertiser")
    //修改，模拟删除广告
    public String changeAdvertiser(@RequestBody Advertiser advertiser){
        if (advertiser!=null){
            int isSuccess = advertiserService.changeAdvertiser(advertiser);

            if (isSuccess!=0){
                return JSON.toJSONString("success");
            }else{
                return JSON.toJSONString("error");
            }
        }else{
            return JSON.toJSONString("upDataError");
        }
    }
}
