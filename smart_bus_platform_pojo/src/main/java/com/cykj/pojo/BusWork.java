package com.cykj.pojo;

public class BusWork {

    private int id;
    private int busId;
    private int lineId;
    private int timeId;
    private int isFixLine;
    private String isAddup;
    private int startBeginOrReturn;

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

    public String getIsAddup() {
        return isAddup;
    }

    public void setIsAddup(String isAddup) {
        this.isAddup = isAddup;
    }

    public int getStartBeginOrReturn() {
        return startBeginOrReturn;
    }

    public void setStartBeginOrReturn(int startBeginOrReturn) {
        this.startBeginOrReturn = startBeginOrReturn;
    }


}
