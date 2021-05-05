package com.hqyj.xinguan.entity;


import java.text.SimpleDateFormat;
import java.sql.Date;

/**
 * @description:
 * @author:lifu
 * @date:2021/3/19 16:52
 */

public class Province {
    private Integer id;
    private Date time;
    private String provinceName;
    private int confirmCount;
    private int curedCount;
    private int deadCount;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTime() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return dateFormat.format(time);
    }

    public void setTime(Date time) {
        this.time=time;
    }

    public String getProvinceName() {
        return provinceName;
    }

    public void setProvinceName(String provinceName) {
        this.provinceName = provinceName;
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
        return "Province{" +
                "id=" + id +
                ", time=" + time +
                ", provinceName='" + provinceName + '\'' +
                ", confirmCount=" + confirmCount +
                ", curedCount=" + curedCount +
                ", deadCount=" + deadCount +
                '}';
    }
}
