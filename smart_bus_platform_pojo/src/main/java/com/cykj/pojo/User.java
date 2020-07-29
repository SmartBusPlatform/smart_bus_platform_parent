package com.cykj.pojo;

public class User {
    private int id;
    private  String account;
    private String name;
    private String password;
    private String sex;
    private String home;
    private String company;
    private String imgUrl;
    private double money;
    private String phone;
    private int stateId;
    private String identityNum;
    private double homeX;
    private double homeY;
    private double companyX;
    private double companyY;

    public User() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getHome() {
        return home;
    }

    public void setHome(String home) {
        this.home = home;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getStateId() {
        return stateId;
    }

    public void setStateId(int stateId) {
        this.stateId = stateId;
    }

    public String getIdentityNum() {
        return identityNum;
    }

    public void setIdentityNum(String identityNum) {
        this.identityNum = identityNum;
    }

    public double getHomeX() {
        return homeX;
    }

    public void setHomeX(double homeX) {
        this.homeX = homeX;
    }

    public double getHomeY() {
        return homeY;
    }

    public void setHomeY(double homeY) {
        this.homeY = homeY;
    }

    public double getCompanyX() {
        return companyX;
    }

    public void setCompanyX(double companyX) {
        this.companyX = companyX;
    }

    public double getCompanyY() {
        return companyY;
    }

    public void setCompanyY(double companyY) {
        this.companyY = companyY;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", account='" + account + '\'' +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", sex='" + sex + '\'' +
                ", home='" + home + '\'' +
                ", company='" + company + '\'' +
                ", imgUrl='" + imgUrl + '\'' +
                ", money=" + money +
                ", phone='" + phone + '\'' +
                ", stateId=" + stateId +
                ", identityNum='" + identityNum + '\'' +
                ", homeX=" + homeX +
                ", homeY=" + homeY +
                ", companyX=" + companyX +
                ", companyY=" + companyY +
                '}';
    }
}
