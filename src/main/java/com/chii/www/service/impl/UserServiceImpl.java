package com.chii.www.service.impl;

import com.chii.www.mapper.AdminMapper;
import com.chii.www.mapper.StudentMapper;
import com.chii.www.mapper.TeacherMapper;
import com.chii.www.pojo.Admin;
import com.chii.www.pojo.Student;
import com.chii.www.pojo.Teacher;
import com.chii.www.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private AdminMapper adminMapper;
    @Autowired
    private StudentMapper studentMapper;
    @Autowired
    private TeacherMapper teacherMapper;

//    @Override
//    public String getStuLoginPass(String userno) {
//        Student student  = studentMapper.selectByPrimaryKey(userno);
//        if (student != null)
//            return student.getPassword();
//        else
//            return "false";
//    }
//
//    @Override
//    public String getTeaLoginPass(String userno) {
//        Teacher teacher  = teacherMapper.selectByPrimaryKey(userno);
//        if (teacher != null)
//            return teacher.getPassword();
//        else
//            return "false";
//    }
//
//    @Override
//    public String getAdmLoginPass(String userno) {
//        Admin admin  = adminMapper.selectByPrimaryKey(userno);
//        if (admin != null)
//            return admin.getPassword();
//        else
//            return "false";
//    }

    @Override
    public Student getStuInfoById(String userno) {
        return studentMapper.selectByPrimaryKey(userno);
    }

    @Override
    public List<Student> getAllStuInfo() {
        return studentMapper.selectAll();
    }

    @Override
    public List<Student> getAllStuInfoByTeaId(String userno) {
        return studentMapper.selectAllByTeaKey(userno);
    }


    @Override
    public Teacher getTeaInfoById(String userno) {
        return teacherMapper.selectByPrimaryKey(userno);
    }

    @Override
    public void updateStuLoginPass(Student student) {
        studentMapper.updateByPrimaryKeySelective(student);
    }

    @Override
    public void updateTeaLoginPass(Teacher teacher) {
        teacherMapper.updateByPrimaryKeySelective(teacher);

    }

    @Override
    public void updateAdmLoginPass(Admin admin) {
        adminMapper.updateByPrimaryKeySelective(admin);
    }


    @Override
    public List<Teacher> getAllTeaInfo() {
        return teacherMapper.selectAll();
    }

    @Override
    public Admin getAdminInfoById(String userno) {
        return adminMapper.selectByPrimaryKey(userno);
    }

    @Override
    public void insertTeaInfo(Teacher teacher) {
        teacherMapper.insert(teacher);
    }

    @Override
    public void insertStuInfo(Student student) {
        studentMapper.insert(student);
    }

    @Override
    public void updateStuInfo(Student student) {
        studentMapper.updateByPrimaryKeySelective(student);
    }

    @Override
    public void deleteStuInfo(String userno) {
        studentMapper.deleteByPrimaryKey(userno);
    }
    @Override
    public void updateTeaInfo(Teacher teacher) {
        teacherMapper.updateByPrimaryKeySelective(teacher);
    }

    @Override
    public void dateleTeaInfo(String userno) {
        teacherMapper.deleteByPrimaryKey(userno);
    }

}