package com.cykj.pojo;

public class ChatRecord {

    private int id;
    private int userId;
    private String content;
    private int adminId;
    private int senderTypeId;
    private int stateId;

    public ChatRecord() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public int getSenderTypeId() {
        return senderTypeId;
    }

    public void setSenderTypeId(int senderTypeId) {
        this.senderTypeId = senderTypeId;
    }

    public int getStateId() {
        return stateId;
    }

    public void setStateId(int stateId) {
        this.stateId = stateId;
    }

    @Override
    public String toString() {
        return "ChatRecord{" +
                "id=" + id +
                ", userId=" + userId +
                ", content='" + content + '\'' +
                ", adminId=" + adminId +
                ", senderTypeId=" + senderTypeId +
                ", stateId=" + stateId +
                '}';
    }
}
