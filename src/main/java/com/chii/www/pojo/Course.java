package com.chii.www.pojo;

public class Course {
    private String cno;
    private String cname;
    private String cpno;
    private int cnum;
    private Short ccredit;

    public String getCno() {
        return cno;
    }

    public void setCno(String cno) {
        this.cno = cno == null ? null : cno.trim();
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname == null ? null : cname.trim();
    }

    public String getCpno() {
        return cpno;
    }

    public void setCpno(String cpno) {
        this.cpno = cpno == null ? null : cpno.trim();
    }

    public int getCnum() {
        return cnum;
    }

    public void setCnum(int cnum) {
        this.cnum = cnum;
    }

    public Short getCcredit() {
        return ccredit;
    }

    public void setCcredit(Short ccredit) {
        this.ccredit = ccredit;
    }


}