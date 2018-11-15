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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("login")
@SessionAttributes({"userid", "username"})//放到Session属性列表中，以便这个属性可以跨请求访问
public class LoginController {
    @Autowired
    private UserService userService;

    @RequestMapping("index")
    public String Index(){
        return "../../index";
    }

    @RequestMapping(value = "/signIn", method = RequestMethod.POST)
    public String Login(User user, Model model) {

        Subject currentUser = SecurityUtils.getSubject();
        if (!currentUser.isAuthenticated()){
            UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(),user.getPassword());
            token.setRememberMe(true);
            try {
                System.out.println(token.hashCode());
                currentUser.login(token);
            }
            catch (AuthenticationException ae){
                System.out.println("登录失败: "+ae.getMessage());
            }
        }

        System.out.println("error!!!!!!!!!!!!!!!!!!!!");
        model.addAttribute("error", "用户名或密码错误");
        return "../../success";
    }

    @RequestMapping("/passwdUpdate")
    public String passwdUpdate(String userno, String old_password, String new_password,String type) {
        String oldPad = old_password;
        String getpass = old_password;
        if (!old_password.equals("1986027b866780f74faa601a73bbcfca")) {//密码加密
            oldPad = SafeCode.safe_password(old_password, userno);
        }
        switch (type) {//根据用户类型转跳到不同view
            case "1":
                getpass = userService.getStuInfoById(userno).getPassword();//获取数据库密码
                if (oldPad.equals(getpass)) {//加密完成的密码与数据库密码对比
                    String newPad = SafeCode.safe_password(new_password, userno);
                    Student student = new Student();
                    student.setSno(userno);
                    student.setPassword(newPad);
                    userService.updateStuLoginPass(student);
                }
                break;
            case "2":
                getpass = userService.getTeaInfoById(userno).getPassword();//获取数据库密码
                if (oldPad.equals(getpass)) {//加密完成的密码与数据库密码对比
                    String newPad = SafeCode.safe_password(new_password, userno);
                    Teacher teacher = new Teacher();
                    teacher.setTno(userno);
                    teacher.setPassword(newPad);
                    userService.updateTeaLoginPass(teacher);
                }
                break;
            case "3":
                getpass = userService.getAdminInfoById(userno).getPassword();//获取数据库密码
                if (oldPad.equals(getpass)) {//加密完成的密码与数据库密码对比
                    String newPad = SafeCode.safe_password(new_password, userno);
                    Admin admin = new Admin();
                    admin.setAno(userno);
                    admin.setPassword(newPad);
                    userService.updateAdmLoginPass(admin);
                }
                break;
        }
        return "redirect:login";
    }

    @RequestMapping("exit")
    public String exit(HttpServletRequest request) {
        request.getSession().invalidate();
        return "redirect:login";
    }
}
