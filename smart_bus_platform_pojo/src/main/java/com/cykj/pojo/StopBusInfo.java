package com.cykj.pojo;

public class StopBusInfo extends StopBus{
    private String busNumber;
    private String siteName;
    private String closeSiteName;
    private String stopTime;

    public String getBusNumber() {
        return busNumber;
    }

    public void setBusNumber(String busNumber) {
        this.busNumber = busNumber;
    }

    public String getSiteName() {
        return siteName;
    }

    public void setSiteName(String siteName) {
        this.siteName = siteName;
    }

    public String getCloseSiteName() {
        return closeSiteName;
    }

    public void setCloseSiteName(String closeSiteName) {
        this.closeSiteName = closeSiteName;
    }

    public String getStopTime() {
        return stopTime;
    }

    public void setStopTime(String stopTime) {
        this.stopTime = stopTime;
    }
}
