package com.liu.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class Borrow implements Serializable {

//    借书操作id
    private Integer borrowId;
//    所借书id
    private String bookName;
//    借书时间

    @JsonFormat(pattern="yyyy-MM-ddHH:mm:ss",timezone="GMT+8")
    @DateTimeFormat(pattern="yyyy-MM-ddHH:mm:ss")
    private Date borrowTime;
//    应归还时间

    @JsonFormat(pattern="yyyy-MM-ddHH:mm:ss",timezone="GMT+8")
    @DateTimeFormat(pattern="yyyy-MM-ddHH:mm:ss")
    private Date sReturnTime;
//    借书用户id
    private Integer uid;
//    是否已归还此书
    private Integer isReturn;
//    实际归还时间

    @JsonFormat(pattern="yyyy-MM-ddHH:mm:ss",timezone="GMT+8")
    @DateTimeFormat(pattern="yyyy-MM-ddHH:mm:ss")
    private Date tReturnTime;

    public Integer getBorrowId() {
        return borrowId;
    }

    public void setBorrowId(Integer borrowId) {
        this.borrowId = borrowId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public Date getBorrowTime() {
        return borrowTime;
    }

    public void setBorrowTime(Date borrowTime) {
        this.borrowTime = borrowTime;
    }

    public Date getsReturnTime() {
        return sReturnTime;
    }

    public void setsReturnTime(Date sReturnTime) {
        this.sReturnTime = sReturnTime;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getIsReturn() {
        return isReturn;
    }

    public void setIsReturn(Integer isReturn) {
        this.isReturn = isReturn;
    }

    public Date gettReturnTime() {
        return tReturnTime;
    }

    public void settReturnTime(Date tReturnTime) {
        this.tReturnTime = tReturnTime;
    }

    @Override
    public String toString() {
        return "Borrow{" +
                "borrowId=" + borrowId +
                ", bookName=" + bookName +
                ", borrowTime=" + borrowTime +
                ", sReturnTime=" + sReturnTime +
                ", uid=" + uid +
                ", isReturn=" + isReturn +
                ", tReturnTime=" + tReturnTime +
                '}';
    }
}
