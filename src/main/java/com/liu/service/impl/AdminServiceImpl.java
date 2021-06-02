package com.liu.service.impl;

import com.liu.domain.Admin;
import com.liu.mapper.AdminMapper;
import com.liu.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    AdminMapper adminMapper;

    @Override
    public Admin findAdminByUsername(String username) {
        Admin adminByUsername = adminMapper.findAdminByUsername(username);
        return adminByUsername;
    }

    @Override
    public void saveAdmin(Admin admin) {
        adminMapper.saveAdmin(admin);
    }
}
