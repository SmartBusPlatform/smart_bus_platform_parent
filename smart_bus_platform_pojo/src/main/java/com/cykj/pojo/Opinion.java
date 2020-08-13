package com.cykj.pojo;

public class Opinion {

    private int id;
    private int userId;
    private String opinionImgUrl;
    private String userOpinion;
    private int adminId;
    private String result;
    private String replay;
    private String opinionTime;
    private String replayTime;
    private int stateId;

    public Opinion() {
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

    public String getOpinionImgUrl() {
        return opinionImgUrl;
    }

    public void setOpinionImgUrl(String opinionImgUrl) {
        this.opinionImgUrl = opinionImgUrl;
    }

    public String getUserOpinion() {
        return userOpinion;
    }

    public void setUserOpinion(String userOpinion) {
        this.userOpinion = userOpinion;
    }

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getReplay() {
        return replay;
    }

    public void setReplay(String replay) {
        this.replay = replay;
    }

    public String getOpinionTime() {
        return opinionTime;
    }

    public void setOpinionTime(String opinionTime) {
        this.opinionTime = opinionTime;
    }

    public String getReplayTime() {
        return replayTime;
    }

    public void setReplayTime(String replayTime) {
        this.replayTime = replayTime;
    }

    public int getStateId() {
        return stateId;
    }

    public void setStateId(int stateId) {
        this.stateId = stateId;
    }

    @Override
    public String toString() {
        return "Opinion{" +
                "id=" + id +
                ", userId=" + userId +
                ", opinionImgUrl='" + opinionImgUrl + '\'' +
                ", userOpinion='" + userOpinion + '\'' +
                ", adminId=" + adminId +
                ", result='" + result + '\'' +
                ", replay='" + replay + '\'' +
                ", opinionTime='" + opinionTime + '\'' +
                ", replayTime='" + replayTime + '\'' +
                ", stateId=" + stateId +
                '}';
    }
}
