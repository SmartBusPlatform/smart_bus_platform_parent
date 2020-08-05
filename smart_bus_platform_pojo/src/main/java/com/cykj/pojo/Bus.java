package com.cykj.pojo;

public class Bus {

    private int id;
    private String number;
    private int stateId;
    private String endTime;
    private String productionTime;
    private int cityId;
    private double userTimeRatio;
    private String isFixedLine;
    private int repairmanId;

    public Bus() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public int getStateId() {
        return stateId;
    }

    public void setStateId(int stateId) {
        this.stateId = stateId;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getProductionTime() {
        return productionTime;
    }

    public void setProductionTime(String productionTime) {
        this.productionTime = productionTime;
    }

    public int getCityId() {
        return cityId;
    }

    public void setCityId(int cityId) {
        this.cityId = cityId;
    }

    public double getUserTimeRatio() {
        return userTimeRatio;
    }

    public void setUserTimeRatio(double userTimeRatio) {
        this.userTimeRatio = userTimeRatio;
    }

    public String getIsFixedLine() {
        return isFixedLine;
    }

    public void setIsFixedLine(String isFixedLine) {
        this.isFixedLine = isFixedLine;
    }

    public int getRepairmanId() {
        return repairmanId;
    }

    public void setRepairmanId(int repairmanId) {
        this.repairmanId = repairmanId;
    }

    @Override
    public String toString() {
        return "Bus{" +
                "id=" + id +
                ", number='" + number + '\'' +
                ", stateId=" + stateId +
                ", endTime='" + endTime + '\'' +
                ", productionTime='" + productionTime + '\'' +
                ", cityId=" + cityId +
                ", userTimeRatio=" + userTimeRatio +
                ", isFixedLine='" + isFixedLine + '\'' +
                ", repairmanId=" + repairmanId +
                '}';
    }
}
