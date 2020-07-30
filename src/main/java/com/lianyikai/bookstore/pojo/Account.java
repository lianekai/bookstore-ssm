package com.lianyikai.bookstore.pojo;

import java.io.Serializable;

public class Account implements Serializable {
    private Long accid;
    private String accName;
    private Double balance;
    private Integer userid;

    public Long getAccid() {
        return accid;
    }

    public void setAccid(Long accid) {
        this.accid = accid;
    }

    public String getAccName() {
        return accName;
    }

    public void setAccName(String accName) {
        this.accName = accName;
    }

    public Double getBalance() {
        return balance;
    }

    public void setBalance(Double balance) {
        this.balance = balance;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }


    @Override
    public String toString() {
        return "Account{" +
                "accid=" + accid +
                ", accName='" + accName + '\'' +
                ", balance=" + balance +
                ", userid=" + userid +
                '}';
    }
}