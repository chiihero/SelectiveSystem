package com.chii.www.controller;

import com.chii.www.Tool.InfoAdd;
import com.chii.www.pojo.Course;
import com.chii.www.pojo.Department;
import com.chii.www.pojo.Page;
import com.chii.www.pojo.Sct;
import com.chii.www.service.CourseService;
import com.chii.www.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin")
public class AdminController {
    @Autowired
    private UserService userService;
    @Autowired
    private CourseService courseService;

    @RequestMapping("/adminIndex")
    public String adminUrl() {
        return "admin/adminIndex";
    }

    @RequestMapping("/studentadd")
    public String studentaddUrl(Model model) {
//        final Long STARTTIME = 201802011001L;
//        for (int i = 0; i < 100; i++) {
//            String sno = String.valueOf((STARTTIME + i));
//            userService.insertStuInfo(InfoAdd.getStudent(sno,"文学大院"));
//        }
        model.addAttribute("departments", courseService.getAllDepartmentInfo());
        return "admin/studentadd";
    }

    @RequestMapping("/studentuser")
    public String studentuserUrl(Page page, Model model) {
        page.setPageCount(userService.getStuCount(page.getSdept()));
        model.addAttribute("page",page);//获取当前用户总记录条数
        model.addAttribute("departments", courseService.getAllDepartmentInfo());
        model.addAttribute("students", userService.getAllStuInfoList(page));
//            model.addAttribute("students", userService.getAllStuInfo());
        return "admin/studentuser";
    }

    @RequestMapping("/studentupdate")
    public String studentupdateUrl(String sno, Model model) {
        System.out.println(sno);
        model.addAttribute("student", userService.getStuInfoById(sno));
        model.addAttribute("departments", courseService.getAllDepartmentInfo());
        return "admin/studentupdate";
    }

    @RequestMapping("/teacheradd")
    public String teacheraddUrl(Model model) {
        model.addAttribute("courses", courseService.getAllCourseInfo());
        return "admin/teacheradd";
    }

    @RequestMapping("/teacheruser")
    public String teacheruserUrl(Model model) {
        model.addAttribute("teachers", userService.getAllTeaInfo());
        model.addAttribute("courses", courseService.getAllCourseInfo());
        return "admin/teacheruser";
    }

    @RequestMapping("/teacherupdate")
    public String teacherupdateUrl(String tno, Model model) {
        System.out.println(tno);
        model.addAttribute("teacher", userService.getTeaInfoById(tno));
        model.addAttribute("courses", courseService.getAllCourseInfo());
        return "admin/teacherupdate";
    }

    @RequestMapping("/userimport")
    public String userimportUrl() {
        return "admin/userimport";
    }

//    @RequestMapping("/score")
//    public String scoreUrl(Model model) {
//        model.addAttribute("courses", courseService.getAllCourseInfo());
//        model.addAttribute("scts", courseService.getAllSctInfo());
//        return "admin/score废弃";
//    }

    @RequestMapping("/scoreupdate")
    public String scoreupdate(Sct sct, Model model) {
        courseService.updateGradeInfo(sct);
        return "redirect:/admin/score";
    }

    @RequestMapping("/scoredelete")
    public String scoredeletee(Sct sct, Model model) {
        courseService.deleteSctInfo(sct);
        return "redirect:/admin/score";
    }

    @RequestMapping("/sct")
    public String sctUrl(Model model) {
        model.addAttribute("scts", courseService.getAllSctInfo());
        return "admin/sct";
    }
    @RequestMapping("/sctDelete")
    public String sctDelete(Sct sct ,Model model) {
        courseService.deleteSctInfo(sct);
        return "redirect:/admin/sct";
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
        model.addAttribute("teachers", userService.getAllTeaInfo());
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
