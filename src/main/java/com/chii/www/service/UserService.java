package com.chii.www.service;


import com.chii.www.pojo.Admin;
import com.chii.www.pojo.Student;
import com.chii.www.pojo.Teacher;

import java.util.List;

public interface UserService {
//    String getStuLoginPass(String userno);
//
//    String getTeaLoginPass(String userno);
//
//    String getAdmLoginPass(String userno);

    Student getStuInfoById(String userno);

    List<Student> getAllStuInfoByTeaId(String userno);

    List<Student> getAllStuInfo();


    Teacher getTeaInfoById(String userno);

    List<Teacher> getAllTeaInfo();

    Admin getAdminInfoById(String userno);

    void updateStuLoginPass(Student student);

    void updateTeaLoginPass(Teacher teacher);

    void updateAdmLoginPass(Admin admin);


    void insertStuInfo(Student student);

    void updateStuInfo(Student student);

    void deleteStuInfo(String userno);


    void insertTeaInfo(Teacher teacher);

    void updateTeaInfo(Teacher teacher);

    void dateleTeaInfo(String userno);



}
