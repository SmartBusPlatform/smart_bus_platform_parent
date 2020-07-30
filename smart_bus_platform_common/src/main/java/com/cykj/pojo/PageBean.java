package com.cykj.pojo;

import java.util.List;

public class PageBean<T> {
    private long curPage;
    private long prePage;
    private long nextPage;
    private long totalPage;
    private long totalRecord;
    private long pageSize;
    private int status;
    private List<T> list;

    public PageBean(int curPage, int pageSize, long totalRecord){
        this.curPage = curPage;
        this.pageSize =pageSize;
        this.totalRecord = totalRecord;
        totalPage = totalRecord%pageSize==0?totalRecord/pageSize:(totalRecord/pageSize)+1;
    }

    public long getCurPage() {
        return curPage;
    }

    public void setCurPage(long curPage) {
        this.curPage = curPage;
    }

    public long getPrePage() {
        return curPage==1?1:curPage-1;
    }

    public void setPrePage(long prePage) {
        this.prePage = prePage;
    }

    public long getNextPage() {
        return curPage==totalPage?totalPage:totalPage==0?1:curPage+1;
    }

    public void setNextPage(int nextPage) {
        this.nextPage = nextPage;
    }

    public long getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public long getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(long totalRecord) {
        this.totalRecord = totalRecord;
    }

    public long getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public void setNextPage(long nextPage) {
        this.nextPage = nextPage;
    }

    public void setTotalPage(long totalPage) {
        this.totalPage = totalPage;
    }

    public void setPageSize(long pageSize) {
        this.pageSize = pageSize;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "PageBean{" +
                "curPage=" + curPage +
                ", prePage=" + prePage +
                ", nextPage=" + nextPage +
                ", totalPage=" + totalPage +
                ", totalRecord=" + totalRecord +
                ", pageSize=" + pageSize +
                ", list=" + list +
                '}';
    }
}
