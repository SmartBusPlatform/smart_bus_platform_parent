package com.cykj.pojo;

public class Bus {

    private int id;
    private String number;
    private int stateId;
    private int busLife;
    private int cityId;
    private double userTimeRatio;

    public Bus() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public int getStateId() {
        return stateId;
    }

    public void setStateId(int stateId) {
        this.stateId = stateId;
    }

    public int getBusLife() {
        return busLife;
    }

    public void setBusLife(int busLife) {
        this.busLife = busLife;
    }

    public int getCityId() {
        return cityId;
    }

    public void setCityId(int cityId) {
        this.cityId = cityId;
    }

    public double getUserTimeRatio() {
        return userTimeRatio;
    }

    public void setUserTimeRatio(double userTimeRatio) {
        this.userTimeRatio = userTimeRatio;
    }

    @Override
    public String toString() {
        return "Bus{" +
                "id=" + id +
                ", number='" + number + '\'' +
                ", stateId=" + stateId +
                ", busLife=" + busLife +
                ", cityId=" + cityId +
                ", userTimeRatio=" + userTimeRatio +
                '}';
    }
}
