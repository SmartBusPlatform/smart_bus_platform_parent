package com.cykj.pojo;


public class BusWorkInfo extends BusWork{
    private String startTime;   //始程所需时间
    private String returnTime;  //返程所需时间
    private String departureTime;   //发车时间
    private String arrivalTime;    //到站时间
    private String returnDepartureTime;     //返回发车时间
    private String returnArrivalTime;   //返回到站时间
    private String lineName;    //线路名
    private String number;  //车牌号
    private int allTime; //总消耗时间
    private String remarks;//备注
    private String time;//时刻

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getReturnTime() {
        return returnTime;
    }

    public void setReturnTime(String returnTime) {
        this.returnTime = returnTime;
    }

    public String getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(String departureTime) {
        this.departureTime = departureTime;
    }

    public String getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(String arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    public String getReturnDepartureTime() {
        return returnDepartureTime;
    }

    public void setReturnDepartureTime(String returnDepartureTime) {
        this.returnDepartureTime = returnDepartureTime;
    }

    public String getReturnArrivalTime() {
        return returnArrivalTime;
    }

    public void setReturnArrivalTime(String returnArrivalTime) {
        this.returnArrivalTime = returnArrivalTime;
    }

    public String getLineName() {
        return lineName;
    }

    public void setLineName(String lineName) {
        this.lineName = lineName;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public int getAllTime() {
        return allTime;
    }

    public void setAllTime(int allTime) {
        this.allTime = allTime;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}
