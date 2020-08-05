package com.cykj.pojo;

public class Partner {
    private int id;
    private String partner;
    private int typeId;
    private int cityId;
    private int stateId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPartner() {
        return partner;
    }

    public void setPartner(String partner) {
        this.partner = partner;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public int getStateId() {
        return stateId;
    }

    public void setStateId(int stateId) {
        this.stateId = stateId;
    }

    public int getCityId() {
        return cityId;
    }

    public void setCityId(int cityId) {
        this.cityId = cityId;
    }

    @Override
    public String toString() {
        return "Partner{" +
                "id=" + id +
                ", partner='" + partner + '\'' +
                ", typeId=" + typeId +
                ", cityId=" + cityId +
                ", stateId=" + stateId +
                '}';
    }
}

