package com.lianyikai.bookstore.service.impl;

import com.lianyikai.bookstore.dao.IBookDao;
import com.lianyikai.bookstore.pojo.Book;
import com.lianyikai.bookstore.pojo.User;
import com.lianyikai.bookstore.service.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class BookServiceImpl implements IBookService {

    @Autowired
    private IBookDao bookDao;

    public List<Book> findBookSplitAndCondition(Map<String, Object> map) {
        return bookDao.findBookSplitAndCondition(map);
    }


    public Integer countBook(Map<String, Object> map) {
        return bookDao.countBook(map);
    }

    @Override
    public Book searchBookById(Integer bookid) {
        if(bookid==null){return null;}
        return bookDao.searchBookById(bookid);
    }

    @Override
    public void addBook(Book book) {
        if(book!=null){
            bookDao.addBook(book);
        }
        else {
            System.out.println("输入的书本信息为空，插入错误");
        }
    }


}