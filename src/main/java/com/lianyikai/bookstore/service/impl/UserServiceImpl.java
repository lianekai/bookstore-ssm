package com.lianyikai.bookstore.service.impl;

import com.lianyikai.bookstore.dao.IUserDao;

import com.lianyikai.bookstore.pojo.User;
import com.lianyikai.bookstore.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements IUserService {
    @Autowired
    private IUserDao userDao;


    @Override
    public User searchUserForLogin(User user) {
        if(user==null){
            return null;
        }
        if(user.getLoginname()==null||user.getLoginname().equals("")||user.getLoginpwd()==null||user.getLoginpwd().equals(""))
        {return null;}
        return userDao.searchUserForLogin(user);

    }
}