package com.chii.www.pojo;

public class Teacher {
    private String tno;

    private String tname;

    private String tsex;

    private Integer tage;

    private String teb;

    private String tpt;

    private String cno1;

    private String cno2;

    private String cno3;

    private String password;

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

    public String getTsex() {
        return tsex;
    }

    public void setTsex(String tsex) {
        this.tsex = tsex == null ? null : tsex.trim();
    }

    public Integer getTage() {
        return tage;
    }

    public void setTage(Integer tage) {
        this.tage = tage;
    }

    public String getTeb() {
        return teb;
    }

    public void setTeb(String teb) {
        this.teb = teb == null ? null : teb.trim();
    }

    public String getTpt() {
        return tpt;
    }

    public void setTpt(String tpt) {
        this.tpt = tpt == null ? null : tpt.trim();
    }

    public String getCno1() {
        return cno1;
    }

    public void setCno1(String cno1) {
        this.cno1 = cno1 == null ? null : cno1.trim();
    }

    public String getCno2() {
        return cno2;
    }

    public void setCno2(String cno2) {
        this.cno2 = cno2 == null ? null : cno2.trim();
    }

    public String getCno3() {
        return cno3;
    }

    public void setCno3(String cno3) {
        this.cno3 = cno3 == null ? null : cno3.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }
}