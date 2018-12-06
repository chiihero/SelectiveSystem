package com.chii.www.service.impl;

import com.chii.www.mapper.CourseListMapper;
import com.chii.www.mapper.CourseMapper;
import com.chii.www.mapper.DepartmentMapper;
import com.chii.www.mapper.SctMapper;
import com.chii.www.pojo.*;
import com.chii.www.service.CourseService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("courseService")
public class CourseServiceImpl implements CourseService {
    @Autowired
    private DepartmentMapper departmentMapper;
    @Autowired
    private CourseMapper courseMapper;
    @Autowired
    private CourseListMapper courseListMapper;
    @Autowired
    private SctMapper sctMapper;

    @Override
    public List<Department> getAllDepartmentInfo() {
        return departmentMapper.selectAll();
    }

    @Override
    public List<Course> getAllCourseInfo() {
        return courseMapper.selectAll();
    }

    @Override
    public Course getCourseInfoById(String cno) {
        return courseMapper.selectByPrimaryKey(cno);
    }



    @Override
    public PageInfo<Sct> getAllSctInfoByPage(PageBean pageBean) {
        PageHelper.startPage(pageBean.getCurrent(), pageBean.getRowCount());
        List<Sct> scts = sctMapper.selectAll(pageBean.getSearchPhrase());
        PageInfo<Sct> pi = new PageInfo<>(scts);
        return pi;
    }



    @Override
    public PageInfo<CourseList> getAllCourseListInfo(PageBean pageBean) {
        PageHelper.startPage(pageBean.getCurrent(), pageBean.getRowCount());
        List<CourseList> students = courseListMapper.selectAll();
        PageInfo<CourseList> pi = new PageInfo<>(students);
        return pi;

    }

    public PageInfo<Sct> getSctInfoByTeaId(PageBean pageBean) {
        PageHelper.startPage(pageBean.getCurrent(), pageBean.getRowCount());
        List<Sct> scts = sctMapper.selectByTno(pageBean);
        PageInfo<Sct> pi = new PageInfo<>(scts);
        return pi;
    }

    @Override
    public List<Sct> getSctInfoByStuId(String userno) {
        return sctMapper.selectBySno(userno);
    }

    @Override
    public List<CourseList> getAllSelectCourse() {
        return courseListMapper.selectAll();
    }

    @Override
    public void insertCourseListInfo(CourseList courseList) {
        courseListMapper.insert(courseList);
    }

    @Override
    public void insertGradeInfo(Sct sct) {
        sctMapper.insertSelective(sct);
    }

    @Override
    public void insertCourseInfo(Course course) {
        courseMapper.insert(course);
    }

    @Override
    public void insertDepartmentInfo(Department department) {
        departmentMapper.insert(department);
    }

    @Override
    public void insertSctInfo(Sct sct) {
        sctMapper.insertSelective(sct);
    }

    @Override
    public void updateGradeInfo(Sct sct) {
        sctMapper.updateByPrimaryKey(sct);
    }

    @Override
    public void deleteSctInfo(Sct sct) {
        sctMapper.deleteByPrimaryKey(sct);
    }

    @Override
    public void deleteCourseInfo(String userno) {
        courseMapper.deleteByPrimaryKey(userno);
    }

    @Override
    public void deleteDepartmentInfo(String userno) {
        departmentMapper.deleteByPrimaryKey(userno);
    }
}
