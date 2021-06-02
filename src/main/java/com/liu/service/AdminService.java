package com.liu.service;

import com.liu.domain.Admin;

public interface AdminService {

    /**
     * 通过用户名查找管理员账户
     * @param username
     * @return
     */
    Admin findAdminByUsername(String username);

    /**
     * 保存一个管理员账户
     * @param admin
     */
    void saveAdmin(Admin admin);

}
