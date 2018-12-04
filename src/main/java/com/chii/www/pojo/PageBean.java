package com.chii.www.pojo;

import java.util.List;

public class PageBean<T> {
    //属性
    private String key;
    private String searchPhrase;
    private int current = 1;//当前页
    private int rowCount = 10;//每页大小
    private long total;//总行数
    private List<Student> rows;

    public String getKey() {
        return key;
    }
    public void setKey(String key) {
        this.key = key;
    }
    public String getSearchPhrase() {
        return searchPhrase;
    }
    public void setSearchPhrase(String searchPhrase) {
        if (searchPhrase.equals("")){
            searchPhrase=null;
        }
        this.searchPhrase = searchPhrase;
    }
    public int getCurrent() {
        return current;
    }
    public void setCurrent(int current) {
        this.current = current;
    }

    public int getRowCount() {
        return rowCount;
    }

    public void setRowCount(int rowCount) {
        if (rowCount == -1)
            rowCount = 0;
        this.rowCount = rowCount;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public List<Student> getRows() {
        return rows;
    }

    public void setRows(List<Student> rows) {
        this.rows = rows;
    }
}
