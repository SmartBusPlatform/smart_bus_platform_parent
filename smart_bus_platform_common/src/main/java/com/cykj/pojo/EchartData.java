package com.cykj.pojo;

public class EchartData {
    //线路名
    private String lineName;
    //线路收银
    private String lineFee;
    //收银日期
    private String feeTime;
    //每日费用
    private double dayFee;
    //时段
    private String time;
    //时段费用
    private double timeFee;
    //客流量
    private String flowNum;
    public EchartData() {
    }

    public String getFlowNum() {
        return flowNum;
    }

    public void setFlowNum(String flowNum) {
        this.flowNum = flowNum;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public double getTimeFee() {
        return timeFee;
    }

    public void setTimeFee(double timeFee) {
        this.timeFee = timeFee;
    }

    public String getFeeTime() {
        return feeTime;
    }

    public void setFeeTime(String feeTime) {
        this.feeTime = feeTime;
    }

    public double getDayFee() {
        return dayFee;
    }

    public void setDayFee(double dayFee) {
        this.dayFee = dayFee;
    }

    public String getLineName() {
        return lineName;
    }

    public void setLineName(String lineName) {
        this.lineName = lineName;
    }

    public String getLineFee() {
        return lineFee;
    }

    public void setLineFee(String lineFee) {
        this.lineFee = lineFee;
    }
}
