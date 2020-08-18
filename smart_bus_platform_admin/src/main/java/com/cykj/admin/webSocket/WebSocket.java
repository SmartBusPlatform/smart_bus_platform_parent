package com.cykj.admin.webSocket;

import org.springframework.stereotype.Component;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.concurrent.CopyOnWriteArraySet;

@ServerEndpoint("/webSocket/{user}")
@Component
public class WebSocket {

    //会话，前后端建立的通道
    private Session session;

    //会话的集合，使用时可能会打开多个会话通道
    private static CopyOnWriteArraySet<WebSocket> webSockets = new CopyOnWriteArraySet<>();

    //建立webSocket时会执行以下方法
    //开
    @OnOpen
    public void onOpen(Session session) {
        this.session = session;
        webSockets.add(this);
        System.out.println("开连接成功，现有" + webSockets.size() + "个连接");
    }

    //关
    @OnClose
    public void onClose() {
        webSockets.remove(this);
        System.out.println("关连接成功，现有" + webSockets.size() + "个连接");
    }

    //信息处理--模拟多人聊天的群聊
    @OnMessage
    public void onMessage(String msg) {
        //遍历会话  发送msg
        System.out.println("用户发送的消息是：" + msg);
        for (WebSocket webSocket : webSockets) {
            try {
                webSocket.session.getBasicRemote().sendText(msg);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

}
