package com.chii.www.mapper;

import com.chii.www.pojo.PageBean;
import com.chii.www.pojo.Student;
import com.github.pagehelper.Page;

import java.util.List;

public interface StudentMapper {
    int deleteByPrimaryKey(String sno);

    int insert(Student record);

    int insertSelective(Student record);

    List<Student> selectAll(String sdept);

    int selectAllCount(String sdept);

//    List<Student> selectAllList(PageBean page);

    List<Student> selectAllByTeaKey(String tno);

    Student selectByPrimaryKey(String sno);


    int updateByPrimaryKeySelective(Student record);

    int updateByPrimaryKey(Student record);
}