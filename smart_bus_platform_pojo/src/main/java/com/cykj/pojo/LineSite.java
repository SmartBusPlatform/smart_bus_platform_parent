package com.cykj.pojo;

import java.util.List;

public class LineSite {
    private int id;
    private int lineId;
    private int siteId;
    private int startIndex;
    private int propertyId;
    private int backIndex;
    private String name;

    public LineSite() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getLineId() {
        return lineId;
    }

    public void setLineId(int lineId) {
        this.lineId = lineId;
    }

    public int getSiteId() {
        return siteId;
    }

    public void setSiteId(int siteId) {
        this.siteId = siteId;
    }

    public int getStartIndex() {
        return startIndex;
    }

    public void setStartIndex(int startIndex) {
        this.startIndex = startIndex;
    }

    public int getPropertyId() {
        return propertyId;
    }

    public void setPropertyId(int propertyId) {
        this.propertyId = propertyId;
    }

    public int getBackIndex() {
        return backIndex;
    }

    public void setBackIndex(int backIndex) {
        this.backIndex = backIndex;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "LineSite{" +
                "id=" + id +
                ", lineId=" + lineId +
                ", siteId=" + siteId +
                ", startIndex=" + startIndex +
                ", propertyId=" + propertyId +
                ", backIndex=" + backIndex +
                '}';
    }
}
