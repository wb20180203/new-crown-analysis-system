package com.hqyj.xinguan.entity;

import java.sql.Date;

/**
 * @description:
 * @author:lifu
 * @date:2021/3/20 17:06
 */
public class AreaInfo {
    private Integer id;
    private Date time;
    private String provinceName;
    private String areaName;
    private int confirmCount;
    private int curedCount;
    private int deadCount;

    public Integer getId() {
        return id;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getProvinceName() {
        return provinceName;
    }

    public void setProvinceName(String provinceName) {
        this.provinceName = provinceName;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public int getConfirmCount() {
        return confirmCount;
    }

    public void setConfirmCount(int confirmCount) {
        this.confirmCount = confirmCount;
    }

    public int getCuredCount() {
        return curedCount;
    }

    public void setCuredCount(int curedCount) {
        this.curedCount = curedCount;
    }

    public int getDeadCount() {
        return deadCount;
    }

    public void setDeadCount(int deadCount) {
        this.deadCount = deadCount;
    }

    @Override
    public String toString() {
        return "AreaInfo{" +
                "id=" + id +
                ", time=" + time +
                ", provinceName='" + provinceName + '\'' +
                ", areaName='" + areaName + '\'' +
                ", confirmCount=" + confirmCount +
                ", curedCount=" + curedCount +
                ", deadCount=" + deadCount +
                '}';
    }
}
