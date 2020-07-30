package com.lianyikai.bookstore.dao;

import com.lianyikai.bookstore.pojo.Account;

import java.util.List;

public interface IAccountDao {
    public List<Account> searchAccByUserId(Integer userid);
    public Double searchBalanceByAccId(Integer accid);
}
