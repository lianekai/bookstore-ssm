package com.lianyikai.bookstore.service.impl;

import com.lianyikai.bookstore.dao.IAccountDao;
import com.lianyikai.bookstore.pojo.Account;
import com.lianyikai.bookstore.service.IAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AccountServiceImpl implements IAccountService {
    @Autowired
    private IAccountDao accountDao;


    public List<Account> searchAccByUserId(Integer userid) {
        if(userid==null) {
            return null;
        }
        return accountDao.searchAccByUserId(userid);
    }

    @Override
    public Double searchBalanceByAccId(Integer accid) {
        if(accid==null) {
            return null;
        }
        return accountDao.searchBalanceByAccId(accid);
    }
}