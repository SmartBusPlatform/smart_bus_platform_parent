package com.cykj.admin.bean;

public class DriverWorkload {

    private String busNumber;
    private String lineName;
    private String startTime;

    public String getBusNumber() {
        return busNumber;
    }

    public void setBusNumber(String busNumber) {
        this.busNumber = busNumber;
    }

    public String getLineName() {
        return lineName;
    }

    public void setLineName(String lineName) {
        this.lineName = lineName;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    @Override
    public String toString() {
        return "DriverWorkload{" +
                "busNumber='" + busNumber + '\'' +
                ", lineName='" + lineName + '\'' +
                ", startTime='" + startTime + '\'' +
                '}';
    }
}
