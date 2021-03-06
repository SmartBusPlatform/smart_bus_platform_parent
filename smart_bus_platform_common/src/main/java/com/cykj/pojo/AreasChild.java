package com.cykj.pojo;

import com.cykj.pojo.Areas;

import java.util.List;

public class AreasChild extends Areas {
    //城市id
    private int cityId;
    //省份id
    private int provinceId;
    //城市名
    private String cityName;
    //省份名
    private String provinceName;
    //站点数量
    private int siteNum;
    //线路数量
    private int lineNum;
    //城市首字母
    private String idx;
    //城市集合
    private List<Areas> cities;

    public String getIdx() {
        return idx;
    }

    public void setIdx(String idx) {
        this.idx = idx;
    }

    public List<Areas> getCities() {
        return cities;
    }

    public void setCities(List<Areas> cities) {
        this.cities = cities;
    }

    public int getCityId() {
        return cityId;
    }

    public void setCityId(int cityId) {
        this.cityId = cityId;
    }

    public int getProvinceId() {
        return provinceId;
    }

    public void setProvinceId(int provinceId) {
        this.provinceId = provinceId;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public String getProvinceName() {
        return provinceName;
    }

    public void setProvinceName(String provinceName) {
        this.provinceName = provinceName;
    }

    public int getSiteNum() {
        return siteNum;
    }

    public void setSiteNum(int siteNum) {
        this.siteNum = siteNum;
    }

    public int getLineNum() {
        return lineNum;
    }

    public void setLineNum(int lineNum) {
        this.lineNum = lineNum;
    }

    @Override
    public String toString() {
        return "AreasChild{" +
                "cityId=" + cityId +
                ", provinceId=" + provinceId +
                ", cityName='" + cityName + '\'' +
                ", provinceName='" + provinceName + '\'' +
                ", siteNum=" + siteNum +
                ", lineNum=" + lineNum +
                '}';
    }
}
