package com.cykj.pojo;

public class Line {

    private int id;
    private String name;
    private int cityId;
    private double oneMoney;
    private String oneTime;
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

    public String getOneTime() {
        return oneTime;
    }

    public void setOneTime(String oneTime) {
        this.oneTime = oneTime;
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
                ", oneTime='" + oneTime + '\'' +
                ", travelMoney=" + travelMoney +
                '}';
    }
}
