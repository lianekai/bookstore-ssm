package com.lianyikai.bookstore.service;

import com.lianyikai.bookstore.pojo.Book;

import java.util.List;
import java.util.Map;

public interface IBookService {
    public List<Book> findBookSplitAndCondition(Map<String,Object> map);
    public Integer countBook(Map<String,Object> map);
    public Book searchBookById(Integer bookid);
    public void addBook(Book book);

}