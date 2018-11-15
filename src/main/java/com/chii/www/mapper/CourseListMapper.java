package com.chii.www.mapper;

import com.chii.www.pojo.CourseList;

import java.util.List;

public interface CourseListMapper {
    List<CourseList> selectAll();

    int insert(CourseList record);
}