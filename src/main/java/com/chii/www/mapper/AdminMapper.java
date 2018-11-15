package com.chii.www.mapper;

import com.chii.www.pojo.Admin;

public interface AdminMapper {
    int deleteByPrimaryKey(String ano);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(String ano);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);
}