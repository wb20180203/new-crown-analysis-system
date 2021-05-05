package com.hqyj.xinguan.entity;

/**
 * @description:
 * @author:lifu
 * @date:2021/3/19 9:39
 */
public class EchartsData {
    private String name;
    private String value;

    public EchartsData(String name, String value) {
        this.name = name;
        this.value = value;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return "EchartsData{" +
                "name='" + name + '\'' +
                ", value='" + value + '\'' +
                '}';
    }
}
