package com.chii.www.controller;

import com.chii.www.pojo.*;
import com.chii.www.service.CourseService;
import com.chii.www.service.UserService;
import com.github.pagehelper.PageInfo;
import org.apache.log4j.BasicConfigurator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("admin")
public class AdminController {
    @Autowired
    private UserService userService;
    @Autowired
    private CourseService courseService;
    @ModelAttribute
    private void addAttributes(Model model)
    {
        model.addAttribute("role", "admin");
    }
    @RequestMapping("/adminIndex")
    public String adminUrl() {
        BasicConfigurator.configure();
        return "admin/adminIndex";
    }


    @RequestMapping("/studentuser")
    public String studentuserUrl(Model model) {
        model.addAttribute("departments", courseService.getAllDepartmentInfo());
//        model.addAttribute("students",userService.getAllStuInfo(pageBean));
        return "admin/studentuser";
    }
    @RequestMapping(value ="/AllStudentUser")
    @ResponseBody
    public PageBean AllStudentUser(PageBean page) {
        if(page.getSdept().equals("AllDep")) {
            page.setSdept(null);
        }
        PageInfo<Student> pi = userService.getAllStuInfo(page);
        page.setCurrent(page.getCurrent());
        page.setRowCount(page.getRowCount());
        page.setRows(pi.getList());
        page.setTotal(pi.getTotal());
        return page;
    }
//    @RequestMapping("/studentadd")
//    public String studentaddUrl(Model model) {
////        final Long STARTTIME = 201802011001L;
////        for (int i = 0; i < 100; i++) {
////            String sno = String.valueOf((STARTTIME + i));
////            userService.insertStuInfo(InfoAdd.getStudent(sno,"文学大院"));
////        }
//        model.addAttribute("departments", courseService.getAllDepartmentInfo());
//        return "admin/studentadd";
//    }
//    @RequestMapping("/studentupdate")
//    public String studentupdateUrl(String sno, Model model) {
//        System.out.println(sno);
//        model.addAttribute("student", userService.getStuInfoById(sno));
//        return "admin/studentupdate";
//    }

    @RequestMapping("/StudentInfo")
    public String StudentInfoUrl(String sno, Model model) {
        if (sno==null){
            model.addAttribute("mode", "insert");
        }else{
            System.out.println(sno);
            model.addAttribute("student", userService.getStuInfoById(sno));
            model.addAttribute("mode", "update");
        }
//        model.addAttribute("role", "admin");
        model.addAttribute("departments", courseService.getAllDepartmentInfo());
        return "Info/StudentInfo";
    }

    @RequestMapping("/teacheruser")
    public String teacheruserUrl(Model model) {
//        model.addAttribute("teachers", userService.getAllTeaInfo());
//        model.addAttribute("courses", courseService.getAllCourseInfo());
        return "admin/teacheruser";
    }

    @RequestMapping(value ="/AllTeacherUser")
    @ResponseBody
    public PageBean AllTeacherUser(PageBean page) {
        PageInfo<Teacher> pi = userService.getAllTeaInfo(page);
        page.setCurrent(page.getCurrent());
        page.setRowCount(page.getRowCount());
        page.setRows(pi.getList());
        page.setTotal(pi.getTotal());
        return page;
    }
//    @RequestMapping("/teacheradd")
//    public String teacheraddUrl(Model model) {
//        model.addAttribute("courses", courseService.getAllCourseInfo());
//        return "admin/teacheradd";
//    }
//    @RequestMapping("/teacherupdate")
//    public String teacherupdateUrl(String tno, Model model) {
//        System.out.println(tno);
//        model.addAttribute("teacher", userService.getTeaInfoById(tno));
//        model.addAttribute("courses", courseService.getAllCourseInfo());
//        return "admin/teacherupdate";
//    }

    @RequestMapping("/TeacherInfo")
    public String TeacherInfoUrl(String tno, Model model) {
        if (tno==null){
            model.addAttribute("mode", "insert");
        }else{
            System.out.println(tno);
            model.addAttribute("teacher", userService.getTeaInfoById(tno));
            model.addAttribute("mode", "update");
        }
//        model.addAttribute("role", "admin");
        model.addAttribute("courses", courseService.getAllCourseInfo());
        return "Info/TeacherInfo";
    }
    @RequestMapping("/userimport")
    public String userimportUrl() {
        return "admin/userimport";
    }

    @RequestMapping("/scoreupdate")
    @ResponseBody
    public int scoreupdate(Sct sct) {
        courseService.updateGradeInfo(sct);
//        return "redirect:/admin/score";
        return sct.getGrade();
    }

    @RequestMapping("/scoredelete")
    @ResponseBody

    public boolean scoredeletee(Sct sct) {
        courseService.deleteSctInfo(sct);
        return true;
    }

    @RequestMapping("/score")
    public String sctUrl(Model model) {
        model.addAttribute("scts", courseService.getAllSctInfo());
        return "admin/score";
    }
    @RequestMapping(value ="/AllScore")
    @ResponseBody
    public PageBean AllScore(PageBean page) {
        PageInfo<Sct> pi = courseService.getAllSctInfoByPage(page);
        page.setCurrent(page.getCurrent());
        page.setRowCount(page.getRowCount());
        page.setRows(pi.getList());
        page.setTotal(pi.getTotal());
        return page;
    }
    @RequestMapping("/sctDelete")
    public String sctDelete(Sct sct) {
        courseService.deleteSctInfo(sct);
        return "redirect:/admin/score";
    }
    @RequestMapping("/course")
    public String courseUrl(Model model) {
        model.addAttribute("courses", courseService.getAllCourseInfo());
        return "/admin/course";
    }

    @RequestMapping("/courseadd")
    public String courseaddUrl(Model model) {
        return "/admin/courseadd";
    }

    @RequestMapping("/courseInsert")
    public String courseInsert(Course course) {
        courseService.insertCourseInfo(course);
        return "redirect:/admin/courseadd";
    }

    @RequestMapping("/courseDelete")
    public String courseDelete(String cno, Model model) {
//        System.out.println(cno);
        courseService.deleteCourseInfo(cno);
        return "redirect:/admin/course";
    }

    @RequestMapping("/department")
    public String departmentUrl(Model model) {
        model.addAttribute("departments", courseService.getAllDepartmentInfo());
        return "/admin/department";
    }

    @RequestMapping("/departmentadd")
    public String departmentaddUrl(Model model) {
//        model.addAttribute("teachers", userService.getAllTeaInfo(null));
        return "/admin/departmentadd";
    }

    @RequestMapping("/departmentInsert")
    public String departmentInsert(Department department) {
        courseService.insertDepartmentInfo(department);
        return "redirect:/admin/departmentadd";
    }

    @RequestMapping("/departmentDelete")
    public String departmentDelete(String cno, Model model) {
//        System.out.println(cno);
        courseService.deleteDepartmentInfo(cno);
        return "redirect:/admin/department";
    }
}
