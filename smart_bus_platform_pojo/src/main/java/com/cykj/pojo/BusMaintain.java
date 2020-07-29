package com.cykj.pojo;

public class BusMaintain {

    private int id;
    private int busId;
    private String time;
    private int repairmanId;
    private int stateId;
    private String repairContent;

    public BusMaintain() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBusId() {
        return busId;
    }

    public void setBusId(int busId) {
        this.busId = busId;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getRepairmanId() {
        return repairmanId;
    }

    public void setRepairmanId(int repairmanId) {
        this.repairmanId = repairmanId;
    }

    public int getStateId() {
        return stateId;
    }

    public void setStateId(int stateId) {
        this.stateId = stateId;
    }

    public String getRepairContent() {
        return repairContent;
    }

    public void setRepairContent(String repairContent) {
        this.repairContent = repairContent;
    }

    @Override
    public String toString() {
        return "BusMaintain{" +
                "id=" + id +
                ", busId=" + busId +
                ", time='" + time + '\'' +
                ", repairmanId=" + repairmanId +
                ", stateId=" + stateId +
                ", repairContent='" + repairContent + '\'' +
                '}';
    }
}
