package com.lianyikai.bookstore.dao;

import com.lianyikai.bookstore.pojo.Book;

import java.util.List;
import java.util.Map;

public interface IBookDao {
    public List<Book> findBookSplitAndCondition(Map<String,Object> map);
    public Integer countBook(Map<String,Object> map);
    public Book searchBookById(Integer bookid);
    public void addBook(Book book);
}
