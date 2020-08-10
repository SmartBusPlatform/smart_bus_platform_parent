package com.cykj.pojo;

import java.util.List;

public class CitySiteInfo extends CitySite{
    private List<LineChild> lineList;

    public List<LineChild> getLineList() {
        return lineList;
    }

    public void setLineList(List<LineChild> lineList) {
        this.lineList = lineList;
    }
}
