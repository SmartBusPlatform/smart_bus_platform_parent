package com.cykj.pojo;

public class CitySite {

    private int id;
    private String name;
    private int cityId;
    private double xPosition;
    private double yPosition;
    private int stateId;
    public CitySite() {
    }

    public int getStateId() {
        return stateId;
    }

    public void setStateId(int stateId) {
        this.stateId = stateId;
    }

    public CitySite(String name, double xPosition, double yPosition) {
        this.name = name;
        this.xPosition = xPosition;
        this.yPosition = yPosition;
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

    public double getxPosition() {
        return xPosition;
    }

    public void setxPosition(double xPosition) {
        this.xPosition = xPosition;
    }

    public double getyPosition() {
        return yPosition;
    }

    public void setyPosition(double yPosition) {
        this.yPosition = yPosition;
    }

    @Override
    public String toString() {
        return "CitySite{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", cityId=" + cityId +
                ", xPosition=" + xPosition +
                ", yPosition=" + yPosition +
                '}';
    }
}
