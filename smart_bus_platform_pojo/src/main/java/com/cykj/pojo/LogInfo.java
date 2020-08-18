package com.cykj.pojo;

public class LogInfo {
    private int id;
    private String time;
    private String type;
    private String operator;
    private String operation;

    public LogInfo() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public String getOperation() {
        return operation;
    }

    public void setOperation(String operation) {
        this.operation = operation;
    }

    @Override
    public String toString() {
        return "LogInfo{" +
                "id=" + id +
                ", time='" + time + '\'' +
                ", type='" + type + '\'' +
                ", operator='" + operator + '\'' +
                ", operation='" + operation + '\'' +
                '}';
    }
}
