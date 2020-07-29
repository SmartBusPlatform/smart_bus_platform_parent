package com.cykj.pojo;

public class StopBus {

    private int id;
    private int busId;
    private int stateId;
    private String stopTime;
    private String closeTime;
    private String closeSite;

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

    public int getStateId() {
        return stateId;
    }

    public void setStateId(int stateId) {
        this.stateId = stateId;
    }

    public String getStopTime() {
        return stopTime;
    }

    public void setStopTime(String stopTime) {
        this.stopTime = stopTime;
    }

    public String getCloseTime() {
        return closeTime;
    }

    public void setCloseTime(String closeTime) {
        this.closeTime = closeTime;
    }

    public String getCloseSite() {
        return closeSite;
    }

    public void setCloseSite(String closeSite) {
        this.closeSite = closeSite;
    }

    @Override
    public String toString() {
        return "StopBus{" +
                "id=" + id +
                ", busId=" + busId +
                ", stateId=" + stateId +
                ", stopTime='" + stopTime + '\'' +
                ", closeTime='" + closeTime + '\'' +
                ", closeSite='" + closeSite + '\'' +
                '}';
    }
}
