package com.lianyikai.bookstore.service;

import com.lianyikai.bookstore.pojo.User;

public interface IUserService {
    public User searchUserForLogin(User user);
}
