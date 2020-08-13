package com.cykj.pojo;

public class AddSiteRecord {
    private int id;
    private String time;
    private String content;
    private int stateId;
    private int cityId;
    public AddSiteRecord() {
    }

    public AddSiteRecord(String content, int cityId) {
        this.content = content;
        this.cityId = cityId;
    }

    public int getCityId() {
        return cityId;
    }

    public void setCityId(int cityId) {
        this.cityId = cityId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getStateId() {
        return stateId;
    }

    public void setStateId(int stateId) {
        this.stateId = stateId;
    }
}
