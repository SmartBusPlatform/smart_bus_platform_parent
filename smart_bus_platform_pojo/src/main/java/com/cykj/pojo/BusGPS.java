package com.cykj.pojo;

public class BusGPS {
    private int id;
    private int busId;
    private int curSiteId;
    private double curX;
    private double curY;

    public BusGPS() {
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

    public int getCurSiteId() {
        return curSiteId;
    }

    public void setCurSiteId(int curSiteId) {
        this.curSiteId = curSiteId;
    }

    public double getCurX() {
        return curX;
    }

    public void setCurX(double curX) {
        this.curX = curX;
    }

    public double getCurY() {
        return curY;
    }

    public void setCurY(double curY) {
        this.curY = curY;
    }

    @Override
    public String toString() {
        return "BusGPS{" +
                "id=" + id +
                ", busId=" + busId +
                ", curSiteId=" + curSiteId +
                ", curX=" + curX +
                ", curY=" + curY +
                '}';
    }
}
