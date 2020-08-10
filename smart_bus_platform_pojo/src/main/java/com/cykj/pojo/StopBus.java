package com.cykj.pojo;

public class StopBus {

    private int id;
    private int busId;
    private int siteId;
    private String arrivalTime;
    private String closeDateTime;
    private int closeSiteId;

    public StopBus() {
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

    public int getSiteId() {
        return siteId;
    }

    public void setSiteId(int siteId) {
        this.siteId = siteId;
    }


    public String getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(String arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    public String getCloseDateTime() {
        return closeDateTime;
    }

    public void setCloseDateTime(String closeDateTime) {
        this.closeDateTime = closeDateTime;
    }

    public int getCloseSiteId() {
        return closeSiteId;
    }

    public void setCloseSiteId(int closeSiteId) {
        this.closeSiteId = closeSiteId;
    }
}
