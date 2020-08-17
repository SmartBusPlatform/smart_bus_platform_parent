package com.cykj.pojo;

import java.util.List;

public class CitySiteInfo extends CitySite{
    private List<LineChild> lineList;
    private int sameNum;
    private int distance;
    private int startIndex;
    private int backIndex;

    public List<LineChild> getLineList() {
        return lineList;
    }

    public void setLineList(List<LineChild> lineList) {
        this.lineList = lineList;
    }

    public int getSameNum() {
        return sameNum;
    }

    public void setSameNum(int sameNum) {
        this.sameNum = sameNum;
    }

    public int getDistance() {
        return distance;
    }

    public void setDistance(int distance) {
        this.distance = distance;
    }

    public int getStartIndex() {
        return startIndex;
    }

    public void setStartIndex(int startIndex) {
        this.startIndex = startIndex;
    }

    public int getBackIndex() {
        return backIndex;
    }

    public void setBackIndex(int backIndex) {
        this.backIndex = backIndex;
    }
}
