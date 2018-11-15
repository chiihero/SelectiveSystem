package com.chii.www.pojo;

public class CourseList {
    private String cno;
    private String cname;
    private String tno;
    private String tname;
    private int cnum;
    private int cnewnum;

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

    public String getTno() {
        return tno;
    }

    public void setTno(String tno) {
        this.tno = tno == null ? null : tno.trim();
    }

    public String getTname() {
        return tname;
    }
    public void setTname(String tname) {
        this.tname = tname == null ? null : tname.trim();
    }

    public int getCnum() {
        return cnum;
    }

    public void setCnum(int cnum) {
        this.cnum = cnum;
    }

    public int getCnewnum() {
        return cnewnum;
    }

    public void setCnewnum(int cnewnum) {
        this.cnewnum = cnewnum;
    }


}