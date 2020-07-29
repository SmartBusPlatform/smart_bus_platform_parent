package com.cykj.pojo;

public class Fee {

    private int id;
    private int busId;
    private int userId;
    private int siteId;
    private int lineId;
    private String feeTime;

    public Fee() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBusId() {
        return busId;
    }

    public void setBusId(int busId) {
        this.busId = busId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getSiteId() {
        return siteId;
    }

    public void setSiteId(int siteId) {
        this.siteId = siteId;
    }

    public int getLineId() {
        return lineId;
    }

    public void setLineId(int lineId) {
        this.lineId = lineId;
    }

    public String getFeeTime() {
        return feeTime;
    }

    public void setFeeTime(String feeTime) {
        this.feeTime = feeTime;
    }

    @Override
    public String toString() {
        return "Fee{" +
                "id=" + id +
                ", busId=" + busId +
                ", userId=" + userId +
                ", siteId=" + siteId +
                ", lineId=" + lineId +
                ", feeTime='" + feeTime + '\'' +
                '}';
    }
}
