package com.cykj.pojo;

public class OutSiteRecord {
    private int id;
    private int busId;
    private int lineId;
    private int adminId;
    private String outSiteTime;
    private String startSiteTime;

    public OutSiteRecord() {
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

    public int getLineId() {
        return lineId;
    }

    public void setLineId(int lineId) {
        this.lineId = lineId;
    }

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public String getOutSiteTime() {
        return outSiteTime;
    }

    public void setOutSiteTime(String outSiteTime) {
        this.outSiteTime = outSiteTime;
    }

    public String getStartSiteTime() {
        return startSiteTime;
    }

    public void setStartSiteTime(String startSiteTime) {
        this.startSiteTime = startSiteTime;
    }

    @Override
    public String toString() {
        return "OutSiteRecord{" +
                "id=" + id +
                ", busId=" + busId +
                ", lineId=" + lineId +
                ", adminId=" + adminId +
                ", outSiteTime='" + outSiteTime + '\'' +
                ", startSiteTime='" + startSiteTime + '\'' +
                '}';
    }
}
