package com.chii.www.controller;

import com.chii.www.Tool.SafeCode;
import com.chii.www.pojo.Sct;
import com.chii.www.pojo.Student;
import com.chii.www.service.CourseService;
import com.chii.www.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletRequest;

@Controller
@SessionAttributes({"username"})//放到Session属性列表中，以便这个属性可以跨请求访问
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
    public String changeinfoUrl(@ModelAttribute("msg") String msg,@ModelAttribute("username") String sno,Model model) {
        if (!msg.isEmpty()) model.addAttribute("msg", msg);
        System.out.println(sno);
        model.addAttribute("student", userService.getStuInfoById(sno));
        model.addAttribute("departments", courseService.getAllDepartmentInfo());
        return "student/changeinfo";
    }

    @RequestMapping("/changepasswd")
    public String changepasswdUrl(@ModelAttribute("username") String sno, Model model) {
        System.out.println(sno);
        model.addAttribute("userno", sno);
        return "student/changepasswd";
    }

    @RequestMapping("/course")
    public String courseUrl(Model model) {
        model.addAttribute("courselist", courseService.getAllInfo());
        return "student/course";
    }

    @RequestMapping("/score")
    public String scoreUrl(@ModelAttribute("username") String sno, Model model) {
        model.addAttribute("scts", courseService.getSctInfoByStuId(sno));
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
        //加入密码加密
        String password = SafeCode.PasswordHash(student.getPassword(),student.getSno());
        student.setPassword(password);
        userService.updateStuInfo(student);
        String returnURL = request.getHeader("Referer");
        System.out.println(returnURL);
        model.addAttribute("msg", "更新成功！");
        if (returnURL.contains("admin")){
            return "redirect:/admin/studentuser";
        }else {
            return "redirect:/student/changeinfo";
        }

    }

    @RequestMapping("/insert")
    public String studentinsert(Student student, Model model) {
        //加入默认密码
        String password = SafeCode.PasswordHash("1986027b866780f74faa601a73bbcfca",student.getSno());
        student.setPassword(password);
        userService.insertStuInfo(student);
        model.addAttribute("msg","插入成功");
        return "redirect:/admin/studentadd";
    }
}
