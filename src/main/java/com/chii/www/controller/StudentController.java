package com.chii.www.controller;

import com.chii.www.Tool.SafeCode;
import com.chii.www.pojo.*;
import com.chii.www.service.CourseService;
import com.chii.www.service.UserService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletRequest;

@Controller
@SessionAttributes({"username"})//放到Session属性列表中，以便这个属性可以跨请求访问
@RequestMapping("student")
public class StudentController {

    @Autowired
    private UserService userService;

    @RequestMapping("/update")
    public String studentupdate(Student student, HttpServletRequest request, Model model) {
        if (student.getPassword() != null) {
            //加密密码
            String password = SafeCode.safe_password(student.getPassword(), student.getSno());
            student.setPassword(password);
        }
        userService.updateStuInfo(student);
        String returnURL = request.getHeader("Referer");
        System.out.println(returnURL);
        model.addAttribute("msg", "更新成功！");
        if (returnURL.contains("admin")) {
            return "redirect:/admin/studentuser";
        } else {
            return "redirect:/student/StudentInfo";
        }
    }

    @RequestMapping("/insert")
    public String studentinsert(Student student, Model model) {
        //加入默认密码
        String password = SafeCode.safe_password("c6274012383f2674afbff44a332a8896", student.getSno());
        student.setPassword(password);
        userService.insertStuInfo(student);
        model.addAttribute("msg", "插入成功");
        return "redirect:/admin/studentuser";
    }

}
