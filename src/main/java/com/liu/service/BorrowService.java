package com.liu.service;

import com.liu.domain.Borrow;

import java.util.List;

public interface BorrowService {

    /**
     * 保存一条操作记录
     * @param borrow
     */
    void saveBorrow(Borrow borrow);

    /**
     * 根据用户id查询其借书且未归还目录
     * @param uid
     * @return
     */
    List<Borrow> findBorrowByUid(Integer uid);

    /**
     * 根据借书记录id查询借书记录
     * @param borrowId
     * @return
     */
    Borrow findBorrowByBorrowId(Integer borrowId);

    /**
     * 还书或续借后更新借书记录
     * @param borrow
     */
    void updateBorrow(Borrow borrow);

    /**
     * 根据uid查询此用户所有借阅记录
     * @param uid
     * @return
     */
    List<Borrow> findAllBorrowByUid(Integer uid);

    /**
     * 根据uid查询借阅次数
     * @param uid
     * @return
     */
    Integer findBorrowTimesByUid(Integer uid);

    /**
     * 查询所有借阅记录
     * @return
     */
    List<Borrow> findAllBorrow();
}
