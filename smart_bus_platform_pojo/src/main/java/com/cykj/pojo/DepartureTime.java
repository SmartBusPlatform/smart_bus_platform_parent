package com.cykj.pojo;

public class DepartureTime {
    private int id;
    private String time;
    private int busId;
    private int propertyId;

    public DepartureTime() {
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

    public int getBusId() {
        return busId;
    }

    public void setBusId(int busId) {
        this.busId = busId;
    }

    public int getPropertyId() {
        return propertyId;
    }

    public void setPropertyId(int propertyId) {
        this.propertyId = propertyId;
    }

    @Override
    public String toString() {
        return "DepartureTime{" +
                "id=" + id +
                ", time='" + time + '\'' +
                ", busId=" + busId +
                ", propertyId=" + propertyId +
                '}';
    }
}
