package com.chii.www.controller;

import com.chii.www.Tool.SafeCode;
import com.chii.www.pojo.Admin;
import com.chii.www.pojo.Student;
import com.chii.www.pojo.Teacher;
import com.chii.www.pojo.User;
import com.chii.www.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("login")
@SessionAttributes({"username", "name"})//放到Session属性列表中，以便这个属性可以跨请求访问
public class LoginController {
    @Autowired
    private UserService userService;

    @RequestMapping("/index")
    public String Index(User user, Model model) {
        if (user.getUsername() != null)
            model.addAttribute("username", user.getUsername());
        if (user.getMessage() != null)
            model.addAttribute("message", user.getMessage());
        return "login";
    }

    @RequestMapping(value = "/signIn", method = RequestMethod.POST)
    public String Login(User user, Model model) {
        Subject currentUser = SecurityUtils.getSubject();
        System.out.println(currentUser.isAuthenticated());
        if (!currentUser.isAuthenticated()) {
            UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(), user.getPassword());
            token.setRememberMe(true);
            try {
//                System.out.println(token.hashCode());
                currentUser.login(token);
                System.out.println("登录成功: " + user.getUsername());

            } catch (AuthenticationException ae) {
                System.out.println("登录失败: " + ae.getMessage());
                model.addAttribute("message", "用户名或密码错误");
                return "redirect:/login/index";
            } finally {
//                System.out.println("登录成功: " + user.getUsername());
                model.addAttribute("message", "");
            }
        }
        model.addAttribute("username", user.getUsername());
        switch (user.getType()) {//根据用户类型转跳到不同view
            case "1":
                model.addAttribute("name", userService.getStuInfoById(user.getUsername()).getSname());
                return "redirect:/student/studentIndex";
            case "2":
                model.addAttribute("name", userService.getTeaInfoById(user.getUsername()).getTname());
                return "redirect:/teacher/teacherIndex";
            case "3":
                model.addAttribute("name", userService.getAdminInfoById(user.getUsername()).getAname());
                return "redirect:/admin/adminIndex";
            default:
                model.addAttribute("message", "请选择用户类型");
        }
        System.out.println("error!!!!!!!!!!!!!!!!!!!!");
        return "redirect:/login/logout";
    }

    @RequestMapping("/PasswordUpdate")
    public String passwordUpdate(User user) {
        String oldpassword, getpass;
        oldpassword = SafeCode.PasswordHash(user.getPassword(), user.getUsername());
        switch (user.getType()) {//根据用户类型转跳到不同view
            case "1":
                getpass = userService.getStuInfoById(user.getUsername()).getPassword();//获取数据库密码
                if (oldpassword.equals(getpass)) {//加密完成的密码与数据库密码对比
                    String newPad = SafeCode.PasswordHash(user.getNewpassword(), user.getUsername());
                    Student student = new Student();
                    student.setSno(user.getUsername());
                    student.setPassword(newPad);
                    userService.updateStuLoginPass(student);
                }
                break;
            case "2":
                getpass = userService.getTeaInfoById(user.getUsername()).getPassword();//获取数据库密码
                if (oldpassword.equals(getpass)) {//加密完成的密码与数据库密码对比
                    String newPad = SafeCode.PasswordHash(user.getNewpassword(), user.getUsername());
                    Teacher teacher = new Teacher();
                    teacher.setTno(user.getUsername());
                    teacher.setPassword(newPad);
                    userService.updateTeaLoginPass(teacher);
                }
                break;
            case "3":
                getpass = userService.getAdminInfoById(user.getUsername()).getPassword();//获取数据库密码
                if (oldpassword.equals(getpass)) {//加密完成的密码与数据库密码对比
                    String newPad = SafeCode.PasswordHash(user.getNewpassword(), user.getUsername());
                    Admin admin = new Admin();
                    admin.setAno(user.getUsername());
                    admin.setPassword(newPad);
                    userService.updateAdmLoginPass(admin);
                }
                break;
        }
        return "redirect:/login/index";
    }

    @RequestMapping("/logout")
    public String exit(HttpServletRequest request) {
//        request.getSession().invalidate();
        return "/logout";
    }
}
