package com.hqyj.xinguan.entity;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 *
 * @Auther: xt
 * @Date: 2021/03/16 9:58
 * @Version 1.0
 * @Description: 主要用于封装分页相关的变量
 */
public class PageData <T>{
    private int pageNumber; //当前页码， 从1开始
    private int pageSize; // 每页的记录数

    private int previous; // 上一页页码；
    private int nextPage; // 下一页页面
    private int totalPage;//总页数
    private long  totalSize; //总记录数
    private List<T> listData; // 当前页记录集合


    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPrevious() {
        return previous;
    }

    public void setPrevious(int previous) {
        this.previous = previous;
    }

    public int getNextPage() {
        return nextPage;
    }

    public void setNextPage(int nextPage) {
        this.nextPage = nextPage;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public long getTotalSize() {
        return totalSize;
    }

    public void setTotalSize(long totalSize) {
        this.totalSize = totalSize;
    }

    public List<T> getListData() {
        return listData;
    }

    public void setListData(List<T> listData) {
        this.listData = listData;
    }

    @Override
    public String toString() {
        return "PageData{" +
                "pageNumber=" + pageNumber +
                ", pageSize=" + pageSize +
                ", previous=" + previous +
                ", nextPage=" + nextPage +
                ", totalPage=" + totalPage +
                ", totalSize=" + totalSize +
                ", listData=" + listData +
                '}';
    }
}
