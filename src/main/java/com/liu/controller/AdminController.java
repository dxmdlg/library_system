package com.liu.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.liu.domain.Book;
import com.liu.domain.Borrow;
import com.liu.domain.User;
import com.liu.service.BookService;
import com.liu.service.BorrowService;
import com.liu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    BookService bookService;
    @Autowired
    UserService userService;
    @Autowired
    BorrowService borrowService;

    @RequestMapping("/allBook")
    public String adminIndex(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model){
        PageHelper.startPage(pn, 10);
        List<Book> allBook = bookService.findAllBook();
        PageInfo page = new PageInfo(allBook, 5);
        model.addAttribute("pageInfo",page);
        return "admin/adminIndex";
    }


    @RequestMapping("/managementUser")
    public String managementUser(@RequestParam(value = "pn",defaultValue = "1")Integer pn,Model model){
        PageHelper.startPage(pn,10);
        List<User> allUser = userService.findAllUser();
        PageInfo pageInfo = new PageInfo(allUser,5);
        model.addAttribute("pageInfo",pageInfo);
        return "admin/managementUser";
    }

    /**
     * 管理员页面展示用户借阅记录
     * @param pn
     * @param uid
     * @param model
     * @return
     */
    @RequestMapping("/userBorrowHistory")
    public String userBorrowedHistory(@RequestParam(value = "pn",defaultValue = "1")Integer pn,Integer uid,Model model){
        PageHelper.startPage(pn,10);
        List<Borrow> borrowByUid = borrowService.findAllBorrowByUid(uid);
        PageInfo pageInfo = new PageInfo(borrowByUid,5);
        model.addAttribute("borrowPage",pageInfo);
        model.addAttribute("uid",uid);
        return "admin/userBorrowHistory";
    }


    @RequestMapping("/addBlacklist")
    @ResponseBody
    public Integer addBlacklist(String username){
        User userByUsername = userService.findUserByUsername(username);
        userByUsername.setType(1);
        userService.updateUser(userByUsername);
        return 1;
    }

    @RequestMapping("/removeBlacklist")
    @ResponseBody
    public Integer removeBlacklist(String username){
        User userByUsername = userService.findUserByUsername(username);
        userByUsername.setType(0);
        userService.updateUser(userByUsername);
        return 1;
    }

    @RequestMapping("/findAllBorrow")
    public String findAllBorrow(@RequestParam(value = "pn",defaultValue = "1")Integer pn,Model model){
        PageHelper.startPage(pn,13);
        List<Borrow> allBorrow = borrowService.findAllBorrow();
        PageInfo pageInfo = new PageInfo(allBorrow,5);
        List<User> allUser = userService.findAllUser();
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("allUser",allUser);
        return "admin/allBorrow";
    }

    /**
     * 根据BookId找到图书进入修改页面
     * @param bookId
     * @param model
     * @return
     */
    @RequestMapping("/alterBook")
    public String alterBook(Integer bookId,Model model){
        Book bookByBookId = bookService.findBookByBookId(bookId);
        model.addAttribute("book",bookByBookId);
        return "admin/alterBook";
    }

    /**
     * 完成修改
     * @param book
     * @return
     */
    @RequestMapping("/finishAlter")
    public String finishAlter(Book book){
        bookService.updateBook(book);
        return "admin/finishAlter";
    }

    /**
     * 完成删除
     * @param bookId
     * @return
     */
    @RequestMapping("/deleteBook")
    public String deleteBook(Integer bookId){
        bookService.deleteBook(bookId);
        return "admin/finishAlter";
    }

    /**
     * 跳转到添加页面
     * @return
     */
    @RequestMapping("/addBook")
    public String addBook(){
        return "admin/addBook";
    }

    /**
     * 完成添加一本书
     * @param book
     * @return
     */
    @RequestMapping("/finishAddBook")
    public String finishAddBook(Book book){
        bookService.saveBook(book);
        return "admin/finishAddBook";
    }

}
