package com.liu.service;

import com.liu.domain.Book;

import java.util.List;

public interface BookService {

    /**
     * 查找所有书籍
     * @return
     */
    List<Book> findAllBook();

    /**
     * 根据书名查询书籍
     * @return
     */
    List<Book> findBookByBookName(String bookName);

    /**
     * 根据作者查询书籍
     * @return
     */
    List<Book> findBookByAuthor(String author);

    /**
     * 根据出版社查询书籍
     * @return
     */
    List<Book> findBookByPublisher(String publisher);

    /**
     * 根据类别查询书籍
     * @return
     */
    List<Book> findBookByType(Integer type);

    /**
     * 更新书的信息
     * @param book
     */
    void updateBook(Book book);

    /**
     * 根据Id查询图书
     * @param bookId
     * @return
     */
    Book findBookByBookId(Integer bookId);

    /**
     * 保存一本书
     * @param book
     */
    void saveBook(Book book);

    /**
     * 根据bookId删除一本书
     * @param bookId
     */
    void deleteBook(Integer bookId);
}
