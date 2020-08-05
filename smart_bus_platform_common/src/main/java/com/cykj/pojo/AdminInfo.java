package com.cykj.pojo;

public class AdminInfo extends AdminZJH {

    //司机的上班站点
    private String workSiteName;
    //司机所属城市名
    private String areasName;

    public String getWorkSiteName() {
        return workSiteName;
    }

    public void setWorkSiteName(String workSiteName) {
        this.workSiteName = workSiteName;
    }

    public String getAreasName() {
        return areasName;
    }

    public void setAreasName(String areasName) {
        this.areasName = areasName;
    }
}
