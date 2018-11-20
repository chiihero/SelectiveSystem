package com.chii.www.service;


import com.chii.www.pojo.Admin;
import com.chii.www.pojo.Page;
import com.chii.www.pojo.Student;
import com.chii.www.pojo.Teacher;

import java.util.List;

public interface UserService {

    Student getStuInfoById(String userno);

    List<Student> getAllStuInfoByTeaId(String userno);

    List<Student> getAllStuInfo();

    List<Student> getAllStuInfoList(Page page);

    Teacher getTeaInfoById(String userno);

    List<Teacher> getAllTeaInfo();

    int getStuCount(String sdept);

    Admin getAdminInfoById(String userno);

    void insertStuInfo(Student student);

    void updateStuLoginPass(Student student);

    void updateTeaLoginPass(Teacher teacher);

    void updateAdmLoginPass(Admin admin);




    void updateStuInfo(Student student);

    void deleteStuInfo(String userno);


    void insertTeaInfo(Teacher teacher);

    void updateTeaInfo(Teacher teacher);

    void dateleTeaInfo(String userno);



}
