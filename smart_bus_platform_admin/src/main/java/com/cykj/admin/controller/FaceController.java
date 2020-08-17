package com.cykj.admin.controller;

import com.alibaba.fastjson.JSON;
import com.cykj.admin.bean.FaceInfo;
import com.cykj.admin.face.FaceSearch;
import com.cykj.admin.face.util.Base64Util;
import com.cykj.admin.face.util.GsonUtils;
import com.cykj.admin.face.util.HttpUtil;
import com.cykj.admin.service.FaceService;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("faceController")
@Controller
public class FaceController {

    @Autowired
    private FaceService service;

    private static String accessToken = "24.faef7797bcf475ce7208e5e58b070243.2592000.1599716427.282335-21928609";

    //人脸搜索
//    @RequestMapping("faceSearch")
//    @ResponseBody
    public String faceSearch(String imgData) throws IOException {
        //file为MultipartFile
//        BASE64Decoder decoder = new BASE64Decoder();
//        byte[] b = decoder.decodeBuffer(imgData);
//        String image1 = Base64Util.encode(b);
        // 请求url
        String url = "https://aip.baidubce.com/rest/2.0/face/v3/search";
        try {
            Map<String, Object> map = new HashMap<>();
            map.put("image", imgData);
            map.put("liveness_control", "NORMAL");
            map.put("group_id_list", "group_repeat,group_233");
            map.put("image_type", "BASE64");
            map.put("quality_control", "LOW");

            String param = GsonUtils.toJson(map);

            // 注意这里仅为了简化编码每一次请求都去获取access_token，线上环境access_token有过期时间， 客户端可自行缓存，过期后重新获取。
//            String accessToken = "[调用鉴权接口获取的token]";

            String result = HttpUtil.post(url, accessToken, "application/json", param);
            System.out.println("人脸搜索="+result);

            JSONObject jsonObject = new JSONObject(result);
            String error_msg = jsonObject.getString("error_msg");

            if (error_msg.equalsIgnoreCase("SUCCESS")) {
                if (jsonObject.getInt("error_code") == 0) {
                    JSONObject res = jsonObject.getJSONObject("result");

                    JSONArray userList = res.getJSONArray("user_list");
                    JSONObject object = (JSONObject) userList.get(0);
                    double score = object.getDouble("score");

                    FaceInfo faceInfo = JSON.parseObject(String.valueOf(object), FaceInfo.class);
                    System.out.println(score);
                    //判断打卡成功
                    if (faceInfo.getScore() >= 85) {

                        int i = service.driverSign(faceInfo);
                        if (i == 1) {
                            return JSON.toJSONString(faceInfo);
                        } else {
                            String str="warn";
                            return JSON.toJSONString(str);
                        }
                    }
                }
            }
            return "error";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "error";
    }

    //人脸检测
    @RequestMapping("faceDetect")
    @ResponseBody
    public String faceDetect(String imgData) throws IOException {

        BASE64Decoder decoder = new BASE64Decoder();
        byte[] b = decoder.decodeBuffer(imgData);
        String image1 = Base64Util.encode(b);
        // 请求url
        String url = "https://aip.baidubce.com/rest/2.0/face/v3/detect";
        try {
            Map<String, Object> map = new HashMap<>();
            map.put("image", image1);
            map.put("face_field", "faceshape,facetype");
            map.put("image_type", "BASE64");

            String param = GsonUtils.toJson(map);

            // 注意这里仅为了简化编码每一次请求都去获取access_token，线上环境access_token有过期时间， 客户端可自行缓存，过期后重新获取。
//            String accessToken = "[调用鉴权接口获取的token]";

            String result = HttpUtil.post(url, FaceSearch.accessToken, "application/json", param);
            System.out.println("人脸检测="+result);

            JSONObject jsonObject = new JSONObject(result);

            String face_type = jsonObject.getString("error_msg");

            if (face_type.equalsIgnoreCase("SUCCESS")) {
                String s = faceSearch(image1);
                return s;
            }

            return "error";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "error";
    }
}
