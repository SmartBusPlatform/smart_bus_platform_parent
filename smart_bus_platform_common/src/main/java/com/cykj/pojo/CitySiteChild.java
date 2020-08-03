package com.cykj.pojo;

public class CitySiteChild extends  CitySite {
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
