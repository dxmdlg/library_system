package com.liu.mapper;

import com.liu.domain.User;

import java.util.List;

public interface UserMapper {

    /**
     * 注册时通过用户名查找用户
     * @param username
     * @return
     */
    User findUserByUsername(String username);

    /**
     * 保存一个用户
     * @param user
     */
    void saveUser(User user);

    /**
     * 更新用户
     * @param user
     */
    void updateUser(User user);

    /**
     * 查找所有用户
     * @return
     */
    List<User> findAllUser();
}
