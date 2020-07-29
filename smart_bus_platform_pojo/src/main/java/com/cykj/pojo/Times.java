package com.cykj.pojo;

public class Times {
    private int id;
    private String time;
    private int propertyId;

    public Times() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getPropertyId() {
        return propertyId;
    }

    public void setPropertyId(int propertyId) {
        this.propertyId = propertyId;
    }

    @Override
    public String toString() {
        return "Times{" +
                "id=" + id +
                ", time='" + time + '\'' +
                ", propertyId=" + propertyId +
                '}';
    }
}
