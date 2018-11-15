package com.chii.www.pojo;

public class Department {
    private String dname;

    private String dno;

    private String dmanager;

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname == null ? null : dname.trim();
    }

    public String getDno() {
        return dno;
    }

    public void setDno(String dno) {
        this.dno = dno == null ? null : dno.trim();
    }

    public String getDmanager() {
        return dmanager;
    }

    public void setDmanager(String dmanager) {
        this.dmanager = dmanager == null ? null : dmanager.trim();
    }
}