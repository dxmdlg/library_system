package com.liu.controller;

import com.liu.domain.Admin;
import com.liu.domain.User;
import com.liu.service.AdminService;
import com.liu.service.BookService;
import com.liu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import javax.servlet.http.HttpSession;

@Controller
@SessionAttributes(value = {"nowAdmin","nowUser"})
public class LoginController {

    @Autowired
    UserService userService;
    @Autowired
    AdminService adminService;
    @Autowired
    BookService bookService;


    /**
     * 到达登陆页面，若session域存了用户或管理员账户则自动登陆
     * @param session
     * @return
     */
    @RequestMapping("/login")
    public String login(HttpSession session){
        System.out.println("这个登录方法执行了");
        if (session.getAttribute("nowAdmin")!=null){
            return "redirect:/admin/allBook";
        }
        if (session.getAttribute("nowUser")!=null){
            return "redirect:/user/findAllBook";
        }
        return "login";
    }

    /**
     * 配合上面那个重定向，用于使管理员保持登陆状态
     * @return
     */
    @RequestMapping("/adminIndex")
    public String adminSuccess(){
        return "admin/adminIndex";
    }

    /**
     * 用于使用户保持登陆状态
     * @return
     */
    @RequestMapping("/userIndex")
    public String userSuccess(){
        return "user/userIndex2";
    }

    /**
     * 用户登陆
     * @param user
     * @param model
     * @return
     */
    @RequestMapping("/userLogin")
    public String findUser(User user, ModelMap model) {
        System.out.println("开始查找用户");
        User findUser = userService.findUserByUsername(user.getUsername());
        System.out.println(findUser);
        if (findUser!=null&&(findUser.getUsername().equals(user.getUsername()))&&findUser.getPassword().equals(user.getPassword())){
            model.addAttribute("nowUser",findUser);
            return "redirect:/user/findAllBook";
        }else {
            String msg ="用户名或密码错误！";
            model.addAttribute("msg",msg);
            return "login";
        }
    }

    /**
     * 管理员登陆
     * @param admin
     * @param model
     * @return
     */
    @RequestMapping("/adminLogin")
    public String findAdmin(Admin admin, ModelMap model) {
        System.out.println("开始查找管理员");
        Admin findAdmin = adminService.findAdminByUsername(admin.getUsername());
        System.out.println(findAdmin);
        if (findAdmin!=null&&(findAdmin.getUsername().equals(admin.getUsername()))&&findAdmin.getPassword().equals(admin.getPassword())){
            model.addAttribute("nowAdmin",findAdmin);
            return "redirect:/admin/allBook";
        }else {
            String msg ="管理员账户名或密码错误！";
            model.addAttribute("msg",msg);
            return "login";
        }
    }

    /**
     * 到达注册页
     * @return
     */
    @RequestMapping("/register")
    public String register(){
        return "register";
    }

    /**
     * 注册成功提示自动跳转页
     * @param user
     * @return
     */
    @RequestMapping("/toRegister")
    public String register(User user){
        System.out.println("开始注册用户");
        userService.saveUser(user);
        return "registerSuccess";
    }

    /**
     *Ajax验证用户名是否已存在
     * @param username
     * @return 1代表不重复，可以使用。0代表重复，不可使用
     */
    @RequestMapping("/findSameUser")
    @ResponseBody
    public Integer findSameUser(String username){
        User user = userService.findUserByUsername(username);
        if (user==null){
            return 1;
        }else {
            return 0;
        }
    }

    @RequestMapping("/quit")
    public String quit(SessionStatus sessionStatus){
        System.out.println("进入到quit方法里");
        sessionStatus.setComplete();
        System.out.println("开始跳转");
        return "redirect:/login";
    }
}
