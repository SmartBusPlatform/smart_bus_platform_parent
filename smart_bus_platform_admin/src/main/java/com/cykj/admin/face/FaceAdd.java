package com.cykj.admin.face;

import com.cykj.admin.face.util.Base64Util;
import com.cykj.admin.face.util.FileUtil;
import com.cykj.admin.face.util.GsonUtils;
import com.cykj.admin.face.util.HttpUtil;


import java.util.HashMap;
import java.util.Map;


/**
 * 人脸注册
 * @author asus
 *
 */
public class FaceAdd {

    private static String accessToken = "24.faef7797bcf475ce7208e5e58b070243.2592000.1599716427.282335-21928609";

    public static String add() throws Exception {

        byte[] bytes1 = FileUtil.readFileByBytes("D:/Pictures/peng3.jpg");
        String image1 = Base64Util.encode(bytes1);

        // 请求url
        String url = "https://aip.baidubce.com/rest/2.0/face/v3/faceset/user/add";
        try {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("image", image1);
            map.put("group_id", "group_repeat");
            map.put("user_id", "user1");
            map.put("user_info", "abc");
            map.put("liveness_control", "NORMAL");
            //map.put("image_type", "FACE_TOKEN");
            map.put("image_type", "BASE64");
            map.put("quality_control", "LOW");

            String param = GsonUtils.toJson(map);

            // 注意这里仅为了简化编码每一次请求都去获取access_token，线上环境access_token有过期时间， 客户端可自行缓存，过期后重新获取。
//            String accessToken = "[调用鉴权接口获取的token]";

            // 客户端可自行缓存，过期后重新获取。
            String result = HttpUtil.post(url, accessToken, "application/json", param);
            System.out.println(result);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) throws Exception {
        FaceAdd.add();
    }
}
