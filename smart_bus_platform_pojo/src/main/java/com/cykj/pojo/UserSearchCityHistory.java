package com.cykj.pojo;

public class UserSearchCityHistory {

    private int id;
    private int userId;
    private int cityId;

    public UserSearchCityHistory() {
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

    public int getCityId() {
        return cityId;
    }

    public void setCityId(int cityId) {
        this.cityId = cityId;
    }

    @Override
    public String toString() {
        return "UserSearchCityHistory{" +
                "id=" + id +
                ", userId=" + userId +
                ", cityId=" + cityId +
                '}';
    }
}
