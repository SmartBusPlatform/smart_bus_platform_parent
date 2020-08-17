package com.cykj.pojo;

public class CitySiteChild extends  CitySite {
    //经过线路
    private String throughLine;
    //城市名
    private String cityName;
    //客流量
    private int flowNum;
    public CitySiteChild() {
    }

    public int getFlowNum() {
        return flowNum;
    }

    public void setFlowNum(int flowNum) {
        this.flowNum = flowNum;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public String getThroughLine() {
        return throughLine;
    }

    public void setThroughLine(String throughLine) {
        this.throughLine = throughLine;
    }

    @Override
    public String toString() {
        return "CitySiteChild{" +
                "throughLine='" + throughLine + '\'' +
                '}';
    }
}
