package com.liu.service.impl;

import com.liu.domain.Book;
import com.liu.mapper.BookMapper;
import com.liu.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookServiceImpl implements BookService {

    @Autowired
    BookMapper bookMapper;

    @Override
    public List<Book> findAllBook() {
        List<Book> allBook = bookMapper.findAllBook();
        return allBook;
    }

    @Override
    public List<Book> findBookByBookName(String bookName) {
        List<Book> bookByBookName = bookMapper.findBookByBookName(bookName);
        return bookByBookName;
    }

    @Override
    public List<Book> findBookByAuthor(String author) {
        List<Book> bookByAuthor = bookMapper.findBookByAuthor(author);
        return bookByAuthor;
    }

    @Override
    public List<Book> findBookByPublisher(String publisher) {
        List<Book> bookByPublisher = bookMapper.findBookByPublisher(publisher);
        return bookByPublisher;
    }

    @Override
    public List<Book> findBookByType(Integer type) {
        List<Book> bookByType = bookMapper.findBookByType(type);
        return bookByType;
    }

    @Override
    public void updateBook(Book book) {
        bookMapper.updateBook(book);
    }

    @Override
    public Book findBookByBookId(Integer bookId) {
        Book bookByBookId = bookMapper.findBookByBookId(bookId);
        return bookByBookId;
    }

    @Override
    public void saveBook(Book book) {
        bookMapper.saveBook(book);
    }

    @Override
    public void deleteBook(Integer bookId) {
        bookMapper.deleteBook(bookId);
    }

}
