package com.cykj.pojo;

public class Line {

    private int id;
    private String name;
    private int cityId;
    private double oneMoney;
    private int startTime;
    private int returnTime;
    private double travelMoney;

    public Line() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCityId() {
        return cityId;
    }

    public void setCityId(int cityId) {
        this.cityId = cityId;
    }

    public double getOneMoney() {
        return oneMoney;
    }

    public void setOneMoney(double oneMoney) {
        this.oneMoney = oneMoney;
    }

    public int getStartTime() {
        return startTime;
    }

    public void setStartTime(int startTime) {
        this.startTime = startTime;
    }

    public int getReturnTime() {
        return returnTime;
    }

    public void setReturnTime(int returnTime) {
        this.returnTime = returnTime;
    }

    public double getTravelMoney() {
        return travelMoney;
    }

    public void setTravelMoney(double travelMoney) {
        this.travelMoney = travelMoney;
    }

    @Override
    public String toString() {
        return "Line{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", cityId=" + cityId +
                ", oneMoney=" + oneMoney +
                ", startTime=" + startTime +
                ", returnTime=" + returnTime +
                ", travelMoney=" + travelMoney +
                '}';
    }
}
