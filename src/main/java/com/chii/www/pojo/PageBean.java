package com.chii.www.pojo;

import java.util.List;

public class PageBean<T> {
    //属性
    private String sdept;
    private int current = 1;//当前页
    private int rowCount = 10;//每页大小
    private int total;//总行数
    private List<Student> rows;

    public String getSdept() {
        return sdept;
    }

    public void setSdept(String sdept) {
        this.sdept = sdept;
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
        this.rowCount = rowCount;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public List<Student> getRows() {
        return rows;
    }

    public void setRows(List<Student> rows) {
        this.rows = rows;
    }
}
