package com.cykj.pojo;

public class DriverWork {

    private int id;
    private String workDate;
    private int busId;
    private int adminId;

    public DriverWork() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getWorkDate() {
        return workDate;
    }

    public void setWorkDate(String workDate) {
        this.workDate = workDate;
    }

    public int getBusId() {
        return busId;
    }

    public void setBusId(int busId) {
        this.busId = busId;
    }

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    @Override
    public String toString() {
        return "DriverWork{" +
                "id=" + id +
                ", workDate='" + workDate + '\'' +
                ", busId=" + busId +
                ", adminId=" + adminId +
                '}';
    }
}
