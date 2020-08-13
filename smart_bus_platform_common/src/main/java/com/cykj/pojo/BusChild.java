package com.cykj.pojo;

public class BusChild extends Bus {
    //车牌
    private String number;
    //发车时刻
    private String departureTime;
    //属性
    private String propertyName;

    @Override
    public String toString() {
        return "BusChild{" +
                "number='" + number + '\'' +
                ", departureTime='" + departureTime + '\'' +
                ", property='" + propertyName + '\'' +
                '}';
    }

    @Override
    public String getNumber() {
        return number;
    }

    @Override
    public void setNumber(String number) {
        this.number = number;
    }

    public String getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(String departureTime) {
        this.departureTime = departureTime;
    }

    public String getPropertyName() {
        return propertyName;
    }

    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName;
    }
}
