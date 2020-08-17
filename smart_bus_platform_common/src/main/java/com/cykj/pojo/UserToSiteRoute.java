package com.cykj.pojo;

import java.util.List;

public class UserToSiteRoute {
    private String lineName;    //线路名
    private int lineId;     //线路ID
    private double distance;  //距离
    private String startSiteId;   //开始站点ID
    private String startSiteName;   //开始站点名
    private String endSiteId;   //开始站ID
    private String endSiteName;   //结束站点名
    private String startSiteLongitude;   //开始站点经度
    private String startSiteLatitude;   //开始站点纬度
    private String startIndex;   //开始站点索引
    private String endSiteLongitude;   //结束站点名
    private String endSiteLatitude;   //结束站点名
    private String endIndex;   //结束站点索引
    private int propertyId;   //往返程属性id
    private String propertyName;   //往返程属性名
    private List<CitySiteArr> middleSiteList;   //中间站点集合

    public String getStartSiteId() {
        return startSiteId;
    }

    public void setStartSiteId(String startSiteId) {
        this.startSiteId = startSiteId;
    }

    public String getEndSiteId() {
        return endSiteId;
    }

    public void setEndSiteId(String endSiteId) {
        this.endSiteId = endSiteId;
    }

    public String getLineName() {
        return lineName;
    }

    public void setLineName(String lineName) {
        this.lineName = lineName;
    }

    public int getLineId() {
        return lineId;
    }

    public void setLineId(int lineId) {
        this.lineId = lineId;
    }

    public String getStartSiteName() {
        return startSiteName;
    }

    public void setStartSiteName(String startSiteName) {
        this.startSiteName = startSiteName;
    }

    public String getEndSiteName() {
        return endSiteName;
    }

    public void setEndSiteName(String endSiteName) {
        this.endSiteName = endSiteName;
    }

    public String getStartSiteLongitude() {
        return startSiteLongitude;
    }

    public void setStartSiteLongitude(String startSiteLongitude) {
        this.startSiteLongitude = startSiteLongitude;
    }

    public String getStartSiteLatitude() {
        return startSiteLatitude;
    }

    public void setStartSiteLatitude(String startSiteLatitude) {
        this.startSiteLatitude = startSiteLatitude;
    }

    public String getEndSiteLongitude() {
        return endSiteLongitude;
    }

    public void setEndSiteLongitude(String endSiteLongitude) {
        this.endSiteLongitude = endSiteLongitude;
    }

    public String getEndSiteLatitude() {
        return endSiteLatitude;
    }

    public void setEndSiteLatitude(String endSiteLatitude) {
        this.endSiteLatitude = endSiteLatitude;
    }

    public int getPropertyId() {
        return propertyId;
    }

    public void setPropertyId(int propertyId) {
        this.propertyId = propertyId;
    }

    public String getPropertyName() {
        return propertyName;
    }

    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName;
    }

    public List<CitySiteArr> getMiddleSiteList() {
        return middleSiteList;
    }

    public void setMiddleSiteList(List<CitySiteArr> middleSiteList) {
        this.middleSiteList = middleSiteList;
    }

    public String getStartIndex() {
        return startIndex;
    }

    public void setStartIndex(String startIndex) {
        this.startIndex = startIndex;
    }

    public String getEndIndex() {
        return endIndex;
    }

    public void setEndIndex(String endIndex) {
        this.endIndex = endIndex;
    }

    public double getDistance() {
        return distance;
    }

    public void setDistance(double distance) {
        this.distance = distance;
    }
}
