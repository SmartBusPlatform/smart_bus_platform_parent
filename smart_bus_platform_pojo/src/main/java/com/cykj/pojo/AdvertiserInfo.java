package com.cykj.pojo;

public class AdvertiserInfo extends Advertiser{

    private String partnerName;
    private String stateName;
    private String carouselName;
    private String coordinate;

    public String getPartnerName() {
        return partnerName;
    }

    public void setPartnerName(String partnerName) {
        this.partnerName = partnerName;
    }

    public String getStateName() {
        return stateName;
    }

    public void setStateName(String stateName) {
        this.stateName = stateName;
    }

    public String getCarouselName() {
        return carouselName;
    }

    public void setCarouselName(String carouselName) {
        this.carouselName = carouselName;
    }

    public String getCoordinate() {
        return coordinate;
    }

    public void setCoordinate(String coordinate) {
        this.coordinate = coordinate;
    }

    @Override
    public String toString() {
        return "AdvertiserInfo{" +
                "partnerName='" + partnerName + '\'' +
                ", stateName='" + stateName + '\'' +
                ", carouselName='" + carouselName + '\'' +
                ", coordinate='" + coordinate + '\'' +
                '}';
    }
}
