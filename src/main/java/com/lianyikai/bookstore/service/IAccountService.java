package com.lianyikai.bookstore.service;

import com.lianyikai.bookstore.pojo.Account;

import java.util.List;

public interface IAccountService {
    public List<Account> searchAccByUserId(Integer userid);
    public Double searchBalanceByAccId(Integer accid);
}
