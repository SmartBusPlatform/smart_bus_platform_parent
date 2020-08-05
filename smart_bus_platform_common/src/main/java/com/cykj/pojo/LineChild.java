package com.cykj.pojo;


import java.util.List;

public class LineChild extends  Line {
    private int lineId;
    //线路经过站点数
    private int siteNum;
    //线路每日运行班次
    private int dailyFrequencyNum;
    //线路在用车辆
    private int useVehiclesNum;
    //单程费用
    private double oneMoney;
    //司机费用
    private double travelMoney;
    //始程理论时间
    private int startTime;
    //返程理论时间
    private int returnTime;
    //始程线路站点数组
    private List<CitySiteArr> arrs;
    //返程线路站点数组
    private List<CitySiteArr> resverArrs;

    public int getLineId() {
        return lineId;
    }

    public void setLineId(int lineId) {
        this.lineId = lineId;
    }

    public int getSiteNum() {
        return siteNum;
    }

    public void setSiteNum(int siteNum) {
        this.siteNum = siteNum;
    }

    public int getDailyFrequencyNum() {
        return dailyFrequencyNum;
    }

    public void setDailyFrequencyNum(int dailyFrequencyNum) {
        this.dailyFrequencyNum = dailyFrequencyNum;
    }

    public int getUseVehiclesNum() {
        return useVehiclesNum;
    }

    public void setUseVehiclesNum(int useVehiclesNum) {
        this.useVehiclesNum = useVehiclesNum;
    }

    @Override
    public double getOneMoney() {
        return oneMoney;
    }

    @Override
    public void setOneMoney(double oneMoney) {
        this.oneMoney = oneMoney;
    }

    @Override
    public double getTravelMoney() {
        return travelMoney;
    }

    @Override
    public void setTravelMoney(double travelMoney) {
        this.travelMoney = travelMoney;
    }

    public int getStartTime() {
        return startTime;
    }

    public void setStartTime(int startTime) {
        this.startTime = startTime;
    }

    public int getReturnTime() {
        return returnTime;
    }

    public void setReturnTime(int returnTime) {
        this.returnTime = returnTime;
    }

    public List<CitySiteArr> getArrs() {
        return arrs;
    }

    public void setArrs(List<CitySiteArr> arrs) {
        this.arrs = arrs;
    }

    public List<CitySiteArr> getResverArrs() {
        return resverArrs;
    }

    public void setResverArrs(List<CitySiteArr> resverArrs) {
        this.resverArrs = resverArrs;
    }

    @Override
    public String toString() {
        return "LineChild{" +
                "siteNum=" + siteNum +
                ", dailyFrequencyNum=" + dailyFrequencyNum +
                ", useVehiclesNum=" + useVehiclesNum +
                ", oneMoney=" + oneMoney +
                ", travelMoney=" + travelMoney +
                ", startTime=" + startTime +
                ", returnTime=" + returnTime +
                ", arrs=" + arrs +
                ", resverArrs=" + resverArrs +
                '}';
    }
}
