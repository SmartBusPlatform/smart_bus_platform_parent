package com.cykj.pojo;

public class Opinion {

    private int id;
    private int userId;
    private String userOpinion;
    private int adminId;
    private String result;
    private String replay;

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

    @Override
    public String toString() {
        return "Opinion{" +
                "id=" + id +
                ", userId=" + userId +
                ", userOpinion='" + userOpinion + '\'' +
                ", adminId=" + adminId +
                ", result='" + result + '\'' +
                ", replay='" + replay + '\'' +
                '}';
    }
}
