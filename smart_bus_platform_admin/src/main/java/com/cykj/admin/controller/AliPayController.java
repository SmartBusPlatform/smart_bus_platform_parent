package com.cykj.admin.controller;

import com.alipay.api.AlipayApiException;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.demo.trade.config.Configs;
import com.cykj.admin.webSocket.WebSocket;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

@Controller
@RequestMapping("aliPayController")
public class AliPayController {

    @Autowired
    private WebSocket webSocket;
    //用户支付成功后的异步回调（通知商家的）
    @RequestMapping(value = "notifyUrl", method = {RequestMethod.POST})
    public void notifyUrl(HttpServletRequest request, HttpServletResponse response) throws AlipayApiException, IOException {

        Configs.init("zfbinfo.properties");
        Map<String, String> params = new HashMap<String, String>();
        //获取到的参数
        Map<String, String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = iter.next();
            String[] values = requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
            }
            params.put(name, valueStr);
        }
        System.out.println(params);
        System.out.println(requestParams);
        boolean signVerified = AlipaySignature.rsaCheckV1(params, Configs.getAlipayPublicKey(), "UTF-8", "RSA2");  //调用SDK验证签名
        if (signVerified) {

            // TODO 验签成功则继续业务操作，最后在response中返回success
            webSocket.onMessage("reload");
            String resStr = "success";
            BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
            out.write(resStr.getBytes());
            out.flush();
            out.close();
        } else {
            // TODO 验签失败则记录异常日志，并在response中返回failure.
            String resStr = "failure";
            BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
            out.write(resStr.getBytes());
            out.flush();
            out.close();
        }
    }


}

