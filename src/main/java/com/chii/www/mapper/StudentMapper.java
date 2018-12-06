package com.chii.www.mapper;

import com.chii.www.pojo.Student;

import java.util.List;

public interface StudentMapper {
    int deleteByPrimaryKey(String sno);

    int insert(Student record);

    int insertSelective(Student record);

    List<Student> selectAll(String search);

    List<Student> selectAllByTeaKey(String tno);

    Student selectByPrimaryKey(String sno);


    int updateByPrimaryKeySelective(Student record);

    int updateByPrimaryKey(Student record);
}