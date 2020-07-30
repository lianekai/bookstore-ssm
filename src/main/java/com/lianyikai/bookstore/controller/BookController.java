package com.lianyikai.bookstore.controller;

import com.lianyikai.bookstore.pojo.Book;
import com.lianyikai.bookstore.pojo.StoreHouse;
import com.lianyikai.bookstore.service.IBookService;
import com.lianyikai.bookstore.service.IStoreHouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.UUID;

@Controller
@RequestMapping("/bc")
public class BookController {
    @Autowired
    private IBookService bookService;
    @Autowired
    private IStoreHouseService storeHouseService;
    @RequestMapping(value ="showbook",method = RequestMethod.GET)
    public String showBook(Integer bookid, Model model){
        Book book =bookService.searchBookById(bookid);
        model.addAttribute("book",book);
        return "book_info";
    }
    @RequestMapping(value = "addbook",method = RequestMethod.GET)
    public String addBook(){
        return "book_add";
    }

    @RequestMapping(value = "addbook",method = RequestMethod.POST)
    public String addBook(Book book, @RequestParam MultipartFile pic, HttpServletRequest request){
        System.out.println(book.getBookName());
        System.out.println(book.getAuthor());
        System.out.println(book.getSummary());
        OutputStream os=null;
        try {
            String realpath=request.getSession().getServletContext().getRealPath("/images/upload");
            System.out.println("真路径"+realpath);
            String uuid= UUID.randomUUID().toString();
            File file=new File(realpath+"/"+uuid+pic.getOriginalFilename());
            os=new FileOutputStream(file);
            try {
                FileCopyUtils.copy(pic.getInputStream(),os);
                book.setImgPath("/images/upload"+"/"+uuid+pic.getOriginalFilename());
            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }

        bookService.addBook(book);
        return "redirect:/fpc/fp";
    }
    @RequestMapping(value ="buybook",method=RequestMethod.GET)
    public String buybook(Integer bookid,Model model){
//根据bookid查询书籍信息
        Book book = bookService.searchBookById(bookid);
        int count= storeHouseService.findCountByBookId(bookid);
        //查当前用户的账号列表
        model.addAttribute("book",book);
        model.addAttribute("count",count);
        return "book_order";
    }

}