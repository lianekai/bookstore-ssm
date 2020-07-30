package com.lianyikai.bookstore.controller;

import com.lianyikai.bookstore.pojo.Account;
import com.lianyikai.bookstore.pojo.User;
import com.lianyikai.bookstore.service.IAccountService;
import com.lianyikai.bookstore.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/uc")
public class UserController {
    @Autowired
    private IUserService userService;
    @Autowired
    private IAccountService accountService;

    @ResponseBody
    @RequestMapping(value="showaccount",method = RequestMethod.POST)
    public List<Account> showAccount(HttpServletRequest request){
        System.out.println("执行了showAccount方法...........");
        HttpSession session=request.getSession();
        User user= (User) session.getAttribute("myuser");
        System.out.println(user.getUserid());
        List<Account> acclist=accountService.searchAccByUserId(user.getUserid());
        return acclist;
    }
    @ResponseBody
    @RequestMapping(value="showbalance",method = RequestMethod.POST)
    public Double showBalance(Integer accId){
         return accountService.searchBalanceByAccId(accId);
    }
}