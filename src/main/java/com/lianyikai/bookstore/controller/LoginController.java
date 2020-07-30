package com.lianyikai.bookstore.controller;

import com.lianyikai.bookstore.pojo.User;
import com.lianyikai.bookstore.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
@RequestMapping("/lc")
public class LoginController {
    @Autowired
    private IUserService userService;

    @RequestMapping("login")
    public void Login(User user, HttpServletRequest request, HttpServletResponse response) throws IOException {
        String mess = "";
        User u=userService.searchUserForLogin(user);
        if ( u!= null) {
            mess = "{\"flag\":true}";
            request.getSession().setAttribute("myuser",u);
        } else {
            mess = "{\"flag\":false}";
        }
        PrintWriter pw=response.getWriter();
        pw.write(mess);
        pw.flush();//flush()方法是用于将输出流缓冲的数据全部写到目的地。
        pw.close();
    }
}