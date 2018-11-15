package com.chii.www.mapper;

import com.chii.www.pojo.Teacher;

import java.util.List;

public interface TeacherMapper {
    int deleteByPrimaryKey(String tno);

    int insert(Teacher record);

    int insertSelective(Teacher record);

    Teacher selectByPrimaryKey(String tno);

    List<Teacher> selectAll();

    int updateByPrimaryKeySelective(Teacher record);

    int updateByPrimaryKey(Teacher record);
}