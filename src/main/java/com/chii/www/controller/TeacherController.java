package com.chii.www.controller;

import com.chii.www.Tool.SafeCode;
import com.chii.www.pojo.PageBean;
import com.chii.www.pojo.Sct;
import com.chii.www.pojo.Student;
import com.chii.www.pojo.Teacher;
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
@RequestMapping("teacher")
public class TeacherController {
    @Autowired
    private UserService userService;
    @Autowired
    private CourseService courseService;
    @ModelAttribute
    private void addAttributes(Model model)
    {
        model.addAttribute("role", "teacher");
    }
    @RequestMapping("/teacherIndex")
    public String teacherUrl() {
        return "teacher/teacherIndex";
    }

//    @RequestMapping("/changeinfo")
//    public String changeinfoUrl(@ModelAttribute("msg") String msg,@ModelAttribute("username") String tno, Model model) {
//        if (!msg.isEmpty()) model.addAttribute("msg", msg);
////        System.out.println(userno);
//        model.addAttribute("teacher", userService.getTeaInfoById(tno));
//        model.addAttribute("courses", courseService.getAllCourseInfo());
//        return "teacher/changeinfo";
//    }
@RequestMapping("/TeacherInfo")
public String TeacherInfoUrl(@ModelAttribute("username") String tno, Model model) {
    System.out.println(tno);
    model.addAttribute("teacher", userService.getTeaInfoById(tno));
    model.addAttribute("mode", "update");
//    model.addAttribute("role", "teacher");
    model.addAttribute("courses", courseService.getAllCourseInfo());
    return "Info/TeacherInfo";
}
//    @RequestMapping("/changepassword")
//    public String changepasswordUrl(@ModelAttribute("username") String tno, Model model) {
//        model.addAttribute("userno", tno);
//        return "teacher/changepassword";
//    }
    @RequestMapping("/ChangePassword")
    public String ChangePasswordUrl(@ModelAttribute("username") String tno, Model model) {
//        model.addAttribute("role", "teacher");
        model.addAttribute("userno", tno);
        return "Info/ChangePassword";
    }

    @RequestMapping("/studentuser")
    public String studentuserUrl(Model model) {
//        model.addAttribute("students", courseService.getSctInfoByTeaId(tno));//待修改
        return "teacher/studentuser";
    }
    @RequestMapping(value ="/AllStudentUser")
    @ResponseBody
    public PageBean AllStudentUser(@ModelAttribute("username") String tno ,PageBean page) {
        page.setKey(tno);
        PageInfo<Sct> pi = courseService.getSctInfoByTeaId(page);
        page.setCurrent(page.getCurrent());
        page.setRowCount(page.getRowCount());
        page.setRows(pi.getList());
        page.setTotal(pi.getTotal());
        return page;
    }
    @RequestMapping("/update")
    public String teacherupdate(Teacher teacher, HttpServletRequest request, Model model) {
        //加密密码
        String password = SafeCode.PasswordHash(teacher.getPassword(),teacher.getTno());
        teacher.setPassword(password);
        userService.updateTeaInfo(teacher);
        String returnURL = request.getHeader("Referer");
//        System.out.println(returnURL);
        model.addAttribute("msg","更新成功");
        if (returnURL.contains("admin")){
            return "redirect:/admin/teacheruser";
        }else {
            return "redirect:/teacher/TeacherInfo";
        }
    }

    @RequestMapping("/insert")
    public String teacherinsert(Teacher teacher, Model model) {
        //加入默认密码
        String password = SafeCode.PasswordHash("c6274012383f2674afbff44a332a8896",teacher.getTno());
        teacher.setPassword(password);
        userService.insertTeaInfo(teacher);
        model.addAttribute("msg","插入成功");
        return "redirect:/admin/teacheradd";
    }

//    @RequestMapping("/scoreupdate")
//    public String scoreupdate(Sct sct, Model model) {
//        courseService.updateGradeInfo(sct);
//        return "redirect:/teacher/studentuser";
//    }
//    @RequestMapping("/delete")
//    public String teacherdelete(String no){
//        return "redirect:../Admin/teacheradd";
//    }
}
