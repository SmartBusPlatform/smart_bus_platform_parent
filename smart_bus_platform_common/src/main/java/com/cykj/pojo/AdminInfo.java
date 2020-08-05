package com.cykj.pojo;

public class AdminInfo extends AdminZJH {

    //司机的上班站点
    private String workSite;
    //司机所属城市名
    private String areasName;

    public String getWorkSite() {
        return workSite;
    }

    public void setWorkSite(String workSite) {
        this.workSite = workSite;
    }

    public String getAreasName() {
        return areasName;
    }

    public void setAreasName(String areasName) {
        this.areasName = areasName;
    }
}
