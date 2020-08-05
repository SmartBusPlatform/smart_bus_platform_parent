package com.cykj.pojo;

public class CitySiteChild extends  CitySite {
    //经过线路
    private String throughLine;

    public CitySiteChild() {
    }

    public String getThroughLine() {
        return throughLine;
    }

    public void setThroughLine(String throughLine) {
        this.throughLine = throughLine;
    }

    @Override
    public String toString() {
        return "CitySiteChild{" +
                "throughLine='" + throughLine + '\'' +
                '}';
    }
}
