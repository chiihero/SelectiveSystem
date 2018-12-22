package com.chii.www.controller;

import com.chii.www.pojo.*;
import com.chii.www.service.CourseService;
import com.chii.www.service.UserService;
import com.github.pagehelper.PageInfo;
import org.apache.commons.io.IOUtils;
import org.apache.log4j.BasicConfigurator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.ejb.Init;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.InputStream;

@Controller
@RequestMapping("admin")
@SessionAttributes({"username"})//放到Session属性列表中，以便这个属性可以跨请求访问
public class AdminController {
    @Autowired
    private UserService userService;
    @Autowired
    private CourseService courseService;

    @ModelAttribute
    private void addAttributes(Model model) {
        model.addAttribute("role", "admin");
    }

    @RequestMapping("/adminIndex")
    public String adminUrl(Model model) {
        model.addAttribute("username", "chii");
        return "admin/adminIndex";
    }

    @RequestMapping("/studentuser")
    public String studentuserUrl(Model model) {
//        final Long STARTTIME = 201802011001L;
//        for (int i = 0; i < 100; i++) {
//            String sno = String.valueOf((STARTTIME + i));
//            userService.insertStuInfo(InfoAdd.getStudent(sno, "文学大院"));
//        }
//        model.addAttribute("departments", courseService.getAllDepartmentInfo());
        return "admin/studentuser";
    }

    @RequestMapping(value = "/AllStudentUser")
    @ResponseBody
    public PageBean AllStudentUser(PageBean page) {
        PageInfo<Student> pi = userService.getAllStuInfo(page);
        page.setCurrent(page.getCurrent());
        page.setRowCount(page.getRowCount());
        page.setRows(pi.getList());
        page.setTotal(pi.getTotal());
        return page;
    }

    @RequestMapping("/StudentInfo")
    public String StudentInfoUrl(String sno, Model model) {
        if (sno == null) {
            model.addAttribute("mode", "insert");
        } else {
            System.out.println(sno);
            model.addAttribute("student", userService.getStuInfoById(sno));
            model.addAttribute("mode", "update");
        }
        model.addAttribute("departments", courseService.getAllDepartmentInfo());
        return "Info/StudentInfo";
    }

    @RequestMapping("/teacheruser")
    public String teacheruserUrl(Model model) {
//        model.addAttribute("teachers", userService.getAllTeaInfoByPage());
//        model.addAttribute("courses", courseService.getAllCourseInfo());
        return "admin/teacheruser";
    }

    @RequestMapping(value = "/AllTeacherUser")
    @ResponseBody
    public PageBean AllTeacherUser(PageBean page) {
        PageInfo<Teacher> pi = userService.getAllTeaInfoByPage(page);
        page.setCurrent(page.getCurrent());
        page.setRowCount(page.getRowCount());
        page.setRows(pi.getList());
        page.setTotal(pi.getTotal());
        return page;
    }

    @RequestMapping("/TeacherInfo")
    public String TeacherInfoUrl(String tno, Model model) {
        if (tno == null) {
            model.addAttribute("mode", "insert");
        } else {
            System.out.println(tno);
            model.addAttribute("teacher", userService.getTeaInfoById(tno));
            model.addAttribute("mode", "update");
        }
        model.addAttribute("courses", courseService.getAllCourseInfo());
        return "Info/TeacherInfo";
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
        return "admin/score";
    }

    @RequestMapping(value = "/AllScore")
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



    @RequestMapping("/help")
    public String helpUrl(Model model) {
        return "/admin/help";
    }
}
