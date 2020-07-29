package com.cykj.pojo;

public class Param {
    private int id;
    private String name;
    private String type;
    private String value;
    private String typeEnglish;

    public Param() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getTypeEnglish() {
        return typeEnglish;
    }

    public void setTypeEnglish(String typeEnglish) {
        this.typeEnglish = typeEnglish;
    }

    @Override
    public String toString() {
        return "Param{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", type='" + type + '\'' +
                ", value='" + value + '\'' +
                ", typeEnglish='" + typeEnglish + '\'' +
                '}';
    }
}
