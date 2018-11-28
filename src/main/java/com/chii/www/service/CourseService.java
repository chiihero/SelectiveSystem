package com.chii.www.service;

import com.chii.www.pojo.*;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface CourseService {
    List<Department> getAllDepartmentInfo();

    List<Course> getAllCourseInfo();

    Course getCourseInfoById(String cno);

    List<CourseList> getAllSelectCourse();

    List<Sct> getAllSctInfo();

    List<CourseList> getAllInfo();

    PageInfo<CourseList> getAllCourseListInfo(PageBean pageBean);

    List<Sct> getSctInfoByTeaId(String userno);

    List<Sct> getSctInfoByStuId(String userno);

    void insertCourseListInfo(CourseList courseList);

    void insertGradeInfo(Sct sct);

    void insertCourseInfo(Course course);

    void insertDepartmentInfo(Department department);

    void insertSctInfo(Sct sct);

    void updateGradeInfo(Sct sct);

    void deleteSctInfo(Sct sct);

    void deleteCourseInfo(String userno);

    void deleteDepartmentInfo(String userno);

}
