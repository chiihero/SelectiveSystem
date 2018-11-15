package com.chii.www.controller;

import com.chii.www.pojo.Sct;
import com.chii.www.pojo.Student;
import com.chii.www.service.CourseService;
import com.chii.www.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("student")
public class StudentController {
    @Autowired
    private UserService userService;
    @Autowired
    private CourseService courseService;
    @RequestMapping("/studentIndex")
    public String studentUrl() {
        return "student/studentIndex";
    }

    @RequestMapping("/changeinfo")
    public String changeinfoUrl(@ModelAttribute("msg") String msg,String userno, Model model) {
        if (!msg.isEmpty()) model.addAttribute("msg", msg);
        System.out.println(userno);
        model.addAttribute("student", userService.getStuInfoById(userno));
        model.addAttribute("departments", courseService.getAllDepartmentInfo());
        return "student/changeinfo";
    }

    @RequestMapping("/changepasswd")
    public String changepasswdUrl(String userno, Model model) {
        System.out.println(userno);
        model.addAttribute("userno", userno);
        return "student/changepasswd";
    }

    @RequestMapping("/course")
    public String courseUrl(String userno, Model model) {
        System.out.println(userno);
        model.addAttribute("userno", userno);
//        model.addAttribute("teachers", userService.getAllStuInfo());

        model.addAttribute("courselist", courseService.getAllInfo());
        return "student/course";
    }

    @RequestMapping("/score")
    public String scoreUrl(String userno, Model model) {
        model.addAttribute("scts", courseService.getSctInfoByStuId(userno));
        return "student/score";
    }

    @RequestMapping("/sctInsert")
    public String sctInsert( Sct sct) {
        System.out.println(sct.getSno());

        courseService.insertSctInfo(sct);
        return "redirect:/student/course";
    }

    @RequestMapping("/update")
    public String studentupdate(Student student, HttpServletRequest request, Model model) {
        userService.updateStuInfo(student);
        String returnURL = request.getHeader("Referer");
        System.out.println(returnURL);
        if (returnURL.contains("student")){
            model.addAttribute("msg", "更新成功！");
            return "redirect:/student/changeinfo?userno="+student.getSno()+"";
        }else {
            return "redirect:/admin/studentuser";
        }

    }

    @RequestMapping("/insert")
    public String studentinsert(Student student, Model model) {
        userService.insertStuInfo(student);
        model.addAttribute("msg","插入成功");
        return "redirect:/admin/studentadd";
    }
}
