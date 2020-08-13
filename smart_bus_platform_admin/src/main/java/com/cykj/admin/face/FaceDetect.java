package com.cykj.admin.face;

import com.cykj.admin.face.util.GsonUtils;
import com.cykj.admin.face.util.HttpUtil;

import java.util.HashMap;
import java.util.Map;

public class FaceDetect {

    public static String faceDetect() {
        // 请求url
        String url = "https://aip.baidubce.com/rest/2.0/face/v3/detect";
        try {
            Map<String, Object> map = new HashMap<>();
            map.put("image", "027d8308a2ec665acb1bdf63e513bcb9");
            map.put("face_field", "faceshape,facetype");
            map.put("image_type", "FACE_TOKEN");

            String param = GsonUtils.toJson(map);

            // 注意这里仅为了简化编码每一次请求都去获取access_token，线上环境access_token有过期时间， 客户端可自行缓存，过期后重新获取。
            String accessToken = "[调用鉴权接口获取的token]";

            String result = HttpUtil.post(url, FaceSearch.accessToken, "application/json", param);
            System.out.println(result);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}