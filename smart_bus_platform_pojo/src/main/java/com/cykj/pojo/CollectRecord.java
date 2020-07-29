package com.cykj.pojo;

public class CollectRecord {
    private int id;
    private int userId;
    private int startSiteId;
    private int endSiteId;
    private double startAddressX;
    private double startAddressY;
    private String startAddressName;

    public CollectRecord() {
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

    public int getStartSiteId() {
        return startSiteId;
    }

    public void setStartSiteId(int startSiteId) {
        this.startSiteId = startSiteId;
    }

    public int getEndSiteId() {
        return endSiteId;
    }

    public void setEndSiteId(int endSiteId) {
        this.endSiteId = endSiteId;
    }

    public double getStartAddressX() {
        return startAddressX;
    }

    public void setStartAddressX(double startAddressX) {
        this.startAddressX = startAddressX;
    }

    public double getStartAddressY() {
        return startAddressY;
    }

    public void setStartAddressY(double startAddressY) {
        this.startAddressY = startAddressY;
    }

    public String getStartAddressName() {
        return startAddressName;
    }

    public void setStartAddressName(String startAddressName) {
        this.startAddressName = startAddressName;
    }

    @Override
    public String toString() {
        return "CollectRecord{" +
                "id=" + id +
                ", userId=" + userId +
                ", startSiteId=" + startSiteId +
                ", endSiteId=" + endSiteId +
                ", startAddressX=" + startAddressX +
                ", startAddressY=" + startAddressY +
                ", startAddressName='" + startAddressName + '\'' +
                '}';
    }
}
