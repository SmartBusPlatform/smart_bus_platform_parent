package com.cykj.pojo;

public class Advertiser {

    private int id;
    private int partnerId;
    private String title;
    private int isCarousel;
    private String releaseTime;
    private String endTime;
    private int stateId;
    private String imgUrl;
    private double advertiserX;
    private double advertiserY;

    public Advertiser() {
    }

    public int getPartnerId() {
        return partnerId;
    }

    public void setPartnerId(int partnerId) {
        this.partnerId = partnerId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getIsCarousel() {
        return isCarousel;
    }

    public void setIsCarousel(int isCarousel) {
        this.isCarousel = isCarousel;
    }

    public String getReleaseTime() {
        return releaseTime;
    }

    public void setReleaseTime(String releaseTime) {
        this.releaseTime = releaseTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public int getStateId() {
        return stateId;
    }

    public void setStateId(int stateId) {
        this.stateId = stateId;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public double getAdvertiserX() {
        return advertiserX;
    }

    public void setAdvertiserX(double advertiserX) {
        this.advertiserX = advertiserX;
    }

    public double getAdvertiserY() {
        return advertiserY;
    }

    public void setAdvertiserY(double advertiserY) {
        this.advertiserY = advertiserY;
    }


    @Override
    public String toString() {
        return "Advertiser{" +
                "id=" + id +
                ", partnerId=" + partnerId +
                ", title='" + title + '\'' +
                ", isCarousel=" + isCarousel +
                ", releaseTime='" + releaseTime + '\'' +
                ", endTime='" + endTime + '\'' +
                ", stateId=" + stateId +
                ", imgUrl='" + imgUrl + '\'' +
                ", advertiserX=" + advertiserX +
                ", advertiserY=" + advertiserY +
                '}';
    }
}
