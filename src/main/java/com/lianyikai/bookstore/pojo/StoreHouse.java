package com.lianyikai.bookstore.pojo;

import java.io.Serializable;

public class StoreHouse  implements Serializable {
    public Integer getBookid() {
        return bookid;
    }

    public void setBookid(Integer bookid) {
        this.bookid = bookid;
    }

    public Integer getBookcount() {
        return bookcount;
    }

    public void setBookcount(Integer bookcount) {
        this.bookcount = bookcount;
    }

    private Integer bookid;
    private Integer bookcount;
}