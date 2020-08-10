package com.cykj.pojo;

public class TimesInfo extends Times{
    private String number;      //车牌号
    private int busId;      //巴士ID
    private int requiredTime;     //总耗时
    private int isRun;   //当前时间车辆是否在运行
    private int busWorkId;  //当前排班id
    private int lineId; //路线ID
    private String lineName; //路线ID
    private int workType;   //排班类型ID

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public int getIsRun() {
        return isRun;
    }

    public void setIsRun(int isRun) {
        this.isRun = isRun;
    }

    public int getRequiredTime() {
        return requiredTime;
    }

    public void setRequiredTime(int requiredTime) {
        this.requiredTime = requiredTime;
    }

    public int getBusId() {
        return busId;
    }

    public void setBusId(int busId) {
        this.busId = busId;
    }

    public int getBusWorkId() {
        return busWorkId;
    }

    public void setBusWorkId(int busWorkId) {
        this.busWorkId = busWorkId;
    }

    public int getLineId() {
        return lineId;
    }

    public void setLineId(int lineId) {
        this.lineId = lineId;
    }

    public String getLineName() {
        return lineName;
    }

    public void setLineName(String lineName) {
        this.lineName = lineName;
    }

    public int getWorkType() {
        return workType;
    }

    public void setWorkType(int workType) {
        this.workType = workType;
    }
}
