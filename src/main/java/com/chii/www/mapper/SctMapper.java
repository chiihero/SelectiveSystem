package com.chii.www.mapper;

import com.chii.www.pojo.Sct;

import java.util.List;

public interface SctMapper {

    int deleteByPrimaryKey(Sct record);

    int insert(Sct record);

    int insertSelective(Sct record);

    List<Sct> selectAll();

    List<Sct> selectBySno(String userno);

    List<Sct> selectByTno(String userno);

    Sct selectByPrimaryKey(Sct record);

    int updateByPrimaryKeySelective(Sct record);

    int updateByPrimaryKey(Sct record);
}