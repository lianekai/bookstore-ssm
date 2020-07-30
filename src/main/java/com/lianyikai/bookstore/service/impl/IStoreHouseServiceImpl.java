package com.lianyikai.bookstore.service.impl;

import com.lianyikai.bookstore.dao.IStoreHouseDao;
import com.lianyikai.bookstore.service.IStoreHouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IStoreHouseServiceImpl implements IStoreHouseService {
    @Autowired
    private IStoreHouseDao storeHouseDao;

    @Override
    public Integer findCountByBookId(Integer bookid) {
        if(bookid==null){return 0;}
        return storeHouseDao.findCountByBookId(bookid);
    }
}