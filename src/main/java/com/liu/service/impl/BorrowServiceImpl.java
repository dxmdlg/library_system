package com.liu.service.impl;

import com.liu.domain.Borrow;
import com.liu.mapper.BorrowMapper;
import com.liu.service.BorrowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BorrowServiceImpl implements BorrowService {

    @Autowired
    BorrowMapper borrowMapper;

    @Override
    public void saveBorrow(Borrow borrow) {
        borrowMapper.saveBorrow(borrow);
    }

    @Override
    public List<Borrow> findBorrowByUid(Integer uid) {
        List<Borrow> borrowByUid = borrowMapper.findBorrowByUid(uid);
        return borrowByUid;
    }

    @Override
    public Borrow findBorrowByBorrowId(Integer borrowId) {
        Borrow borrow = borrowMapper.findBorrowByBorrowId(borrowId);
        return borrow;
    }

    @Override
    public void updateBorrow(Borrow borrow) {
        borrowMapper.updateBorrow(borrow);
    }

    @Override
    public List<Borrow> findAllBorrowByUid(Integer uid) {
        List<Borrow> allBorrowByUid = borrowMapper.findAllBorrowByUid(uid);
        return allBorrowByUid;
    }

    @Override
    public Integer findBorrowTimesByUid(Integer uid) {
        Integer borrowTimesByUid = borrowMapper.findBorrowTimesByUid(uid);
        return borrowTimesByUid;
    }

    @Override
    public List<Borrow> findAllBorrow() {
        List<Borrow> allBorrow = borrowMapper.findAllBorrow();
        return allBorrow;
    }
}
