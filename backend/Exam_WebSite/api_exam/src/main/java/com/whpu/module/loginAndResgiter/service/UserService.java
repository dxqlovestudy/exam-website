package com.whpu.module.loginAndResgiter.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.whpu.module.loginAndResgiter.dao.pojo.User;
import com.whpu.vo.Result;

public interface UserService {
    User findUser(String account,String password);

    User findUserByAccount(String account);

    Integer addUser(User user);

    IPage<User> selectStudentInfo(int currentPage,int size,String teacherId);

    Result findUserByToken(String token);

}
