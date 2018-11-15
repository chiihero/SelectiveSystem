package com.chii.www.pojo;

public class Sct {
    private String sno;
    private String sname;
    private String cno;
    private String cname;
    private String tno;
    private String tname;
    private Integer grade;

    public String getSno() {
        return sno;
    }

    public void setSno(String sno) {
        this.sno = sno == null ? null : sno.trim();
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getSname() {
        return sname;
    }

    public String getCno() {
        return cno;
    }

    public void setCno(String cno) {
        this.cno = cno == null ? null : cno.trim();
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCname() {
        return cname;
    }

    public String getTno() {
        return tno;
    }

    public void setTno(String tno) {
        this.tno = tno == null ? null : tno.trim();
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public String getTname() {
        return tname;
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }
}