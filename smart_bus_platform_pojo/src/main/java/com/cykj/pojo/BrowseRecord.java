package com.cykj.pojo;

public class BrowseRecord {

    private int id;
    private int userId;
    private int lineId;
    private int propertyId;

    public BrowseRecord() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getLineId() {
        return lineId;
    }

    public void setLineId(int lineId) {
        this.lineId = lineId;
    }

    public int getPropertyId() {
        return propertyId;
    }

    public void setPropertyId(int propertyId) {
        this.propertyId = propertyId;
    }

    @Override
    public String toString() {
        return "BrowseRecord{" +
                "id=" + id +
                ", userId=" + userId +
                ", lineId=" + lineId +
                ", propertyId=" + propertyId +
                '}';
    }
}
