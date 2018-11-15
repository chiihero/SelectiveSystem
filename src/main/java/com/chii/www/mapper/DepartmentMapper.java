package com.chii.www.mapper;

import com.chii.www.pojo.Department;

import java.util.List;

public interface DepartmentMapper {
    int deleteByPrimaryKey(String dname);

    int insert(Department record);

    int insertSelective(Department record);

    List<Department> selectAll();

    Department selectByPrimaryKey(String dname);

    int updateByPrimaryKeySelective(Department record);

    int updateByPrimaryKey(Department record);
}