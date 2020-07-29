package com.cykj.pojo;

public class BusWork {

    private int id;
    private int busId;
    private int lineId;
    private int timeId;
    private int isFixLine;

    public BusWork() {
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

    public int getTimeId() {
        return timeId;
    }

    public void setTimeId(int timeId) {
        this.timeId = timeId;
    }

    public int getIsFixLine() {
        return isFixLine;
    }

    public void setIsFixLine(int isFixLine) {
        this.isFixLine = isFixLine;
    }

    @Override
    public String toString() {
        return "BusWork{" +
                "id=" + id +
                ", busId=" + busId +
                ", lineId=" + lineId +
                ", timeId=" + timeId +
                ", isFixLine=" + isFixLine +
                '}';
    }
}
