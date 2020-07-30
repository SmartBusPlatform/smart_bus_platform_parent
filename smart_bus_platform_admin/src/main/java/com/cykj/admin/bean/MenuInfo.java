package com.cykj.smart_bus_platform_admin.bean;

import com.cykj.pojo.Menu;

import java.util.List;

public class MenuInfo extends Menu {

    //子菜单集合
    private List<Menu> menuList;

    public List<Menu> getMenuList() {
        return menuList;
    }

    public void setMenuList(List<Menu> menuList) {
        this.menuList = menuList;
    }

    @Override
    public String toString() {
        return "MenuInfo{" +
                "menuList=" + menuList +
                '}';
    }
}
