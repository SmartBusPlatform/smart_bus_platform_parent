package com.cykj.pojo;

public class BusLine {

    private int id;
    private int busId;
    private int lineId;

    public BusLine() {
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

    public int getLineId() {
        return lineId;
    }

    public void setLineId(int lineId) {
        this.lineId = lineId;
    }

    @Override
    public String toString() {
        return "BusLine{" +
                "id=" + id +
                ", busId=" + busId +
                ", lineId=" + lineId +
                '}';
    }
}
