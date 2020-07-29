package com.cykj.pojo;

public class Advertiser {

    private int id;
    private String partner;
    private String title;
    private int isCarousel;
    private String releaseTime;
    private String adSchedule;
    private int stateId;
    private String imgUrl;
    private double advertiserX;
    private double advertiserY;

    public Advertiser() {
    }

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

    public String getAdSchedule() {
        return adSchedule;
    }

    public void setAdSchedule(String adSchedule) {
        this.adSchedule = adSchedule;
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
                ", partner='" + partner + '\'' +
                ", title='" + title + '\'' +
                ", isCarousel=" + isCarousel +
                ", releaseTime='" + releaseTime + '\'' +
                ", adSchedule='" + adSchedule + '\'' +
                ", stateId=" + stateId +
                ", imgUrl='" + imgUrl + '\'' +
                ", advertiserX=" + advertiserX +
                ", advertiserY=" + advertiserY +
                '}';
    }
}
