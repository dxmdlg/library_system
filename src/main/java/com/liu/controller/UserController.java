package com.liu.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.liu.domain.Book;
import com.liu.domain.Borrow;
import com.liu.domain.User;
import com.liu.service.BookService;
import com.liu.service.BorrowService;
import com.liu.service.UserService;
import com.liu.util.Massage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;
    @Autowired
    BorrowService borrowService;
    @Autowired
    BookService bookService;

    @RequestMapping("/findUser")
    public void findUser(User user, ModelAndView model, HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("开始查找用户");
        User findUser = userService.findUserByUsername(user.getUsername());
        System.out.println(findUser);
        if (findUser!=null&&(findUser.getUsername().equals(user.getUsername()))&&findUser.getPassword().equals(user.getPassword())){
            model.setViewName("registerSuccess");
        }else {
            String msg ="用户名或密码错误！";
            model.addObject(msg);
            response.sendRedirect(request.getContextPath()+"/index");
        }

    }

    /**
     * 展示所有已借阅的书籍
     * @param pn
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/borrowedBook")
    public String borrowedBook(@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session, ModelMap model){
        User nowUser = (User)session.getAttribute("nowUser");
        PageHelper.startPage(pn,10);
        List<Borrow> borrows = borrowService.findBorrowByUid(nowUser.getUid());
        PageInfo page = new PageInfo(borrows,5);
        model.addAttribute("borrowedInfo",page);
        return "user/borrowedBook";
    }

    /**
     * 点击借书按钮后，会发送ajax请求借书一本
     * 并生成Borrow类
     */
    @RequestMapping("/borrowBook")
    @ResponseBody
    public Integer borrowBook(Integer bookId, HttpSession session){
        //生成一条操作记录
        System.out.println("开始存了一条操作记录");
        User user =(User) session.getAttribute("nowUser");
        List<Borrow> borrowByUid = borrowService.findBorrowByUid(user.getUid());
        if(user.getType()==1){
            return 3;
        }
        if (borrowByUid.size()>0){
            Date now = new Date();
            long time1 = now.getTime();
//        如果有逾期图书则不允许借书
            for(Borrow i:borrowByUid){
                long time2 = i.getsReturnTime().getTime();
                if (time1>time2)return 0; //返回0，代表有逾期，不能借
            }
        }
        Book bookByBookId = bookService.findBookByBookId(bookId);
        //使图书数量减一
        if(bookByBookId.getSurplusNum()>=1){
            bookByBookId.setSurplusNum(bookByBookId.getSurplusNum()-1);
        }else {
            //返回1标志，代表书没了
            return 1;
        }

        Borrow borrow = new Borrow();

        borrow.setBookName(bookByBookId.getBookName());
        Date date = new Date();
        borrow.setBorrowTime(date);
        long returnDate = date.getTime()+1000l*60l*60l*24l*30l;
        borrow.setsReturnTime(new Date(returnDate));
        borrow.setUid(user.getUid());
        borrow.setIsReturn(0);
        borrow.settReturnTime(date);
        user.setTimes(user.getTimes()+1);
        //保存此操作记录
        borrowService.saveBorrow(borrow);
        bookService.updateBook(bookByBookId);
        userService.updateUser(user);
        System.out.println("成功存了一条操作记录");
        return 2;
    }



    /**
     * 还书
     * @param borrowId
     * @return
     */
    @RequestMapping("/returnBook")
    @ResponseBody
    public String returnBook(Integer borrowId){
        Borrow borrow = borrowService.findBorrowByBorrowId(borrowId);
        borrow.setIsReturn(1);
        borrow.settReturnTime(new Date());
        borrowService.updateBorrow(borrow);
        return "borrowedBook";
    }

    /**
     * 续借
     * @return
     */
    @RequestMapping("/continueBorrow")
    @ResponseBody
    public String continueBorrow( Integer borrowId){
        Borrow borrow = borrowService.findBorrowByBorrowId(borrowId);
        Date date1 = borrow.getsReturnTime();
        System.out.println( date1);
        long l = date1.getTime() + 1000l * 60l * 60l * 24l * 7l;
        Date date2 = new Date(l);
        borrow.setsReturnTime(date2);
        System.out.println(date2);
        borrowService.updateBorrow(borrow);
        return "borrowedBook";
    }

    /**
     * 借阅记录页面
     * @return
     */
    @RequestMapping("/borrowHistory")
    public String borrowHistory(@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session, ModelMap model){
        User nowUser = (User)session.getAttribute("nowUser");
        PageHelper.startPage(pn,14);
        List<Borrow> borrows = borrowService.findAllBorrowByUid(nowUser.getUid());
        PageInfo page = new PageInfo(borrows,5);
        model.addAttribute("borrowPage",page);
        return "user/borrowHistory";
    }


    /**
     * 查找所有书籍
     *
     * @return
     */
    @RequestMapping("/findAllBook")
    public String findAllBook(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
        PageHelper.startPage(pn, 10);
        List<Book> allBook = bookService.findAllBook();
        PageInfo page = new PageInfo(allBook, 5);
        Massage pageInfo = new Massage();
        pageInfo.setRequestAddress("findAllBook");
        Map<String,Object> extend = new HashMap<String, Object>();
        extend.put("pageInfo",page);
        pageInfo.setExtend(extend);
        model.addAttribute("pageInfo", pageInfo);

        return "user/userIndex2";
    }

    /**
     * 根据书名查询
     * @param pn
     * @param model
     * @param type
     * @param data
     * @return
     */
    @RequestMapping("/findBookByBookName")
    public String findBookByBookName(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model,String type,String data){
        if("".equals(data)){
            return "redirect:/book/findAllBook";
        }
        PageHelper.startPage(pn, 10);
        String bookName ="%" + data + "%";
        List<Book> bookByBookName = bookService.findBookByBookName(bookName);
        PageInfo page = new PageInfo(bookByBookName,4);
        Massage pageInfo = new Massage();
        pageInfo.setRequestAddress("findBookByBookName");
        pageInfo.setType(type);
        pageInfo.setData(data);
        Map<String,Object> extend = new HashMap<String, Object>();
        extend.put("pageInfo",page);
        pageInfo.setExtend(extend);
        model.addAttribute("pageInfo", pageInfo);
        return "user/userIndex2";
    }


    /**
     * 根据作者查询
     * @param pn
     * @param model
     * @param type
     * @param data
     * @return
     */
    @RequestMapping("/findBookByAuthor")
    public String findBookByAuthor(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model,String type,String data){
        if("".equals(data)){
            return "redirect:/book/findAllBook";
        }
        PageHelper.startPage(pn, 10);
        String author ="%" + data + "%";
        List<Book> bookByBookName = bookService.findBookByAuthor(author);
        PageInfo page = new PageInfo(bookByBookName,4);
        Massage pageInfo = new Massage();
        pageInfo.setRequestAddress("findBookByAuthor");
        pageInfo.setType(type);
        pageInfo.setData(data);
        Map<String,Object> extend = new HashMap<String, Object>();
        extend.put("pageInfo",page);
        pageInfo.setExtend(extend);
        model.addAttribute("pageInfo", pageInfo);
        return "user/userIndex2";
    }

    /**
     * 根据出版社查询
     * @param pn
     * @param model
     * @param type
     * @param data
     * @return
     */
    @RequestMapping("/findBookByPublisher")
    public String findBookByPublisher(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model, String type, String data){
        if("".equals(data)){
            return "redirect:/book/findAllBook";
        }
        PageHelper.startPage(pn, 10);
        String publisher ="%" + data + "%";
        List<Book> bookByBookName = bookService.findBookByPublisher(publisher);
        PageInfo page = new PageInfo(bookByBookName,4);
        Massage pageInfo = new Massage();
        pageInfo.setRequestAddress("findBookByPublisher");
        pageInfo.setType(type);
        pageInfo.setData(data);
        Map<String,Object> extend = new HashMap<String, Object>();
        extend.put("pageInfo",page);
        pageInfo.setExtend(extend);
        model.addAttribute("pageInfo", pageInfo);
        return "user/userIndex2";
    }
}
