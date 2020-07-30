package com.lianyikai.bookstore.controller;

import com.lianyikai.bookstore.pojo.Book;
import com.lianyikai.bookstore.service.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/fpc")
public class FirstpageController {

    @Autowired
    private IBookService bookService;
    @RequestMapping(value="fp")
    public String firstpage(){
        System.out.println("fisrtpage.....");

        return "forward:finddata";
    }
    @RequestMapping(value="finddata")
    public String findDataForMain(String bookname, String deptname, String loprice, String hiprice, String author,
        @RequestParam(defaultValue = "1",required = false) Integer cp, @RequestParam(defaultValue = "3",required = false) Integer ps, Model model){
        Map<String,Object> map=new HashMap<String,Object>();
        if(bookname!=null&&!bookname.equals("")){
            map.put("bookname",bookname);
            model.addAttribute("bookname",bookname);
        }
        if(deptname!=null&&!deptname.equals("")){
            map.put("deptname",deptname);
            model.addAttribute("deptname",deptname);
        }
        if(loprice!=null&& !loprice.equals("") &&hiprice!=null&& !hiprice.equals("")){
            map.put("loprice",loprice);
            map.put("hiprice",hiprice);
            model.addAttribute("loprice",loprice);
            model.addAttribute("hiprice",hiprice);
        }
        if(author!=null&& !author.equals("")){
            map.put("author",author);
            model.addAttribute("author",author);
        }
        System.out.println("cp:"+cp);
        System.out.println((cp-1)*ps);
        System.out.println((cp*ps));
        map.put("start",(cp-1)*ps);
        map.put("end",cp*ps);



        List<Book> booklist=bookService.findBookSplitAndCondition(map);
        int count=bookService.countBook(map);
        int allpage=(count-1)/ps+1;//总页码数。

        model.addAttribute("cp",cp);
        model.addAttribute("ps",ps);
        model.addAttribute("booklist",booklist);
        model.addAttribute("count",count);
        model.addAttribute("allpage",allpage);
        return "main";
    }
}