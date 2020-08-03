package com.cykj.pojo;

public class BusInfo extends Bus{
    private String stateName;
    private String cityName;
    private String repairmanName;
    private int lineId;
    private String lineName;
    private String userTimeRatioStr;
    private int provinceId;

    public String getStateName() {
        return stateName;
    }

    public void setStateName(String stateName) {
        this.stateName = stateName;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public String getRepairmanName() {
        return repairmanName;
    }

    public void setRepairmanName(String repairmanName) {
        this.repairmanName = repairmanName;
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

    public String getUserTimeRatioStr() {
        return userTimeRatioStr;
    }

    public void setUserTimeRatioStr(String userTimeRatioStr) {
        this.userTimeRatioStr = userTimeRatioStr;
    }

    public int getProvinceId() {
        return provinceId;
    }

    public void setProvinceId(int provinceId) {
        this.provinceId = provinceId;
    }
}
