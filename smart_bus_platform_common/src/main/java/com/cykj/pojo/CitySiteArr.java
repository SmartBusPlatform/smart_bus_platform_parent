package com.cykj.pojo;

public class CitySiteArr {

    private String name;
    private int title;
    private double xPosition;
    private double yPosition;
    private double distance;

    public CitySiteArr() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getTitle() {
        return title;
    }

    public void setTitle(int title) {
        this.title = title;
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

    public double getDistance() {
        return distance;
    }

    public void setDistance(double distance) {
        this.distance = distance;
    }

    @Override
    public String toString() {
        return "CitySiteArr{" +
                "name='" + name + '\'' +
                ", title=" + title +
                ", xPosition=" + xPosition +
                ", yPosition=" + yPosition +
                ", distance=" + distance +
                '}';
    }
}
