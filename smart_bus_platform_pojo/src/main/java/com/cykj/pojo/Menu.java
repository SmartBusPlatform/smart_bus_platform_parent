package com.cykj.pojo;

public class Menu {
    private int id;
    private String menuName;
    private String menuUrl;
    private int menuPid;

    public Menu() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public String getMenuUrl() {
        return menuUrl;
    }

    public void setMenuUrl(String menuUrl) {
        this.menuUrl = menuUrl;
    }

    public int getMenuPid() {
        return menuPid;
    }

    public void setMenuPid(int menuPid) {
        this.menuPid = menuPid;
    }

    @Override
    public String toString() {
        return "Menu{" +
                "id=" + id +
                ", menuName='" + menuName + '\'' +
                ", menuUrl='" + menuUrl + '\'' +
                ", menuPid=" + menuPid +
                '}';
    }
}
