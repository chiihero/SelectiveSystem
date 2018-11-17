package com.chii.www.controller;

import com.chii.www.Tool.SafeCode;
import com.chii.www.pojo.Sct;
import com.chii.www.pojo.Teacher;
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
@RequestMapping("teacher")
public class TeacherController {
    @Autowired
    private UserService userService;
    @Autowired
    private CourseService courseService;

    @RequestMapping("/teacherIndex")
    public String teacherUrl() {
        return "teacher/teacherIndex";
    }

    @RequestMapping("/changeinfo")
    public String changeinfoUrl(@ModelAttribute("msg") String msg,@ModelAttribute("username") String tno, Model model) {
        if (!msg.isEmpty()) model.addAttribute("msg", msg);
//        System.out.println(userno);
        model.addAttribute("teacher", userService.getTeaInfoById(tno));
        model.addAttribute("courses", courseService.getAllCourseInfo());
        return "teacher/changeinfo";
    }

    @RequestMapping("/changepasswd")
    public String changepasswdUrl(@ModelAttribute("username") String tno, Model model) {

        model.addAttribute("userno", tno);
        return "teacher/changepasswd";
    }

    @RequestMapping("/studentuser")
    public String studentuserUrl(@ModelAttribute("username") String tno, Model model) {

        model.addAttribute("students", courseService.getSctInfoByTeaId(tno));//待修改
        return "teacher/studentuser";
    }

    @RequestMapping("/update")
    public String teacherupdate(Teacher teacher, HttpServletRequest request, Model model) {
        userService.updateTeaInfo(teacher);
        String returnURL = request.getHeader("Referer");
//        System.out.println(returnURL);
        if (returnURL.contains("teacher")){
            model.addAttribute("msg","更新成功");
            return "redirect:/teacher/changeinfo?userno="+teacher.getTno()+"";
        }else {
            return "redirect:/admin/teacheruser";
        }
    }


    @RequestMapping("/insert")
    public String teacherinsert(Teacher teacher, Model model) {
        //加入默认密码
        String password = SafeCode.PasswordHash("1986027b866780f74faa601a73bbcfca",teacher.getTno());
        teacher.setPassword(password);
        userService.insertTeaInfo(teacher);
        model.addAttribute("msg","插入成功");
        return "redirect:/admin/teacheradd";
    }

    @RequestMapping("/scoreupdate")
    public String scoreupdate(Sct sct, Model model) {
        courseService.updateGradeInfo(sct);
        return "redirect:/teacher/studentuser";
    }
//    @RequestMapping("/delete")
//    public String teacherdelete(String no){
//        return "redirect:../Admin/teacheradd";
//    }
}
