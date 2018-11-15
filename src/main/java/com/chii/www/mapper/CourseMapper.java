package com.chii.www.mapper;

import com.chii.www.pojo.Course;

import java.util.List;

public interface CourseMapper {
    int deleteByPrimaryKey(String cno);

    int insert(Course record);

    int insertSelective(Course record);

    List<Course> selectAll();

    Course selectByPrimaryKey(String cno);

    int updateByPrimaryKeySelective(Course record);

    int updateByPrimaryKey(Course record);
}