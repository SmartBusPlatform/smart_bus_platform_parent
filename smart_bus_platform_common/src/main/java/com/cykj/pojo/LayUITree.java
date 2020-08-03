package com.cykj.pojo;

import java.util.List;

public class LayUITree {
    private int id;
    private String title;
    private List<LayUITree> children;

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

    public List<LayUITree> getChildren() {
        return children;
    }

    public void setChildren(List<LayUITree> children) {
        this.children = children;
    }

    @Override
    public String toString() {
        return "LayUITree{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", children=" + children +
                '}';
    }
}
