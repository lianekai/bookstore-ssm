package com.lianyikai.bookstore.dao;

import com.lianyikai.bookstore.pojo.User;

public interface IUserDao {
    public User searchUserForLogin(User user);
}
