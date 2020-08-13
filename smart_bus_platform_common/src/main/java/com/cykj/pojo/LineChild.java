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
    //班次时间
    private String shiftTime;
    //站点集合
        private List<CitySite> siteArr;
    private int allTime;    //一趟总耗时

    private String endSiteName;     //始程终点站
    private String startSiteName;     //始程起始站

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

    public int getAllTime() {
        return allTime;
    }

    public void setAllTime(int allTime) {
        this.allTime = allTime;
    }

    public String getEndSiteName() {
        return endSiteName;
    }

    public void setEndSiteName(String endSiteName) {
        this.endSiteName = endSiteName;
    }

    public String getStartSiteName() {
        return startSiteName;
    }

    public void setStartSiteName(String startSiteName) {
        this.startSiteName = startSiteName;
    }


    public String getShiftTime() {
        return shiftTime;
    }

    public void setShiftTime(String shiftTime) {
        this.shiftTime = shiftTime;
    }

    public List<CitySite> getSiteArr() {
        return siteArr;
    }

    public void setSiteArr(List<CitySite> siteArr) {
        this.siteArr = siteArr;
    }


    @Override
    public String toString() {
        return "LineChild{" +
                "lineId=" + lineId +
                ", siteNum=" + siteNum +
                ", dailyFrequencyNum=" + dailyFrequencyNum +
                ", useVehiclesNum=" + useVehiclesNum +
                ", oneMoney=" + oneMoney +
                ", travelMoney=" + travelMoney +
                ", startTime=" + startTime +
                ", returnTime=" + returnTime +
                ", arrs=" + arrs +
                ", resverArrs=" + resverArrs +
                ", shiftTime='" + shiftTime + '\'' +
                ", siteArr=" + siteArr +
                ", allTime=" + allTime +
                ", endSiteName='" + endSiteName + '\'' +
                ", startSiteName='" + startSiteName + '\'' +
                '}';
    }
}
