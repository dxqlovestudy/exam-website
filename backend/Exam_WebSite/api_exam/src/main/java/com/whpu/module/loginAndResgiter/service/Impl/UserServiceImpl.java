package com.whpu.module.loginAndResgiter.service.Impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.whpu.module.loginAndResgiter.dao.mapper.UserMapper;
import com.whpu.module.loginAndResgiter.dao.pojo.User;
import com.whpu.module.loginAndResgiter.service.LoginAndRegisterService;
import com.whpu.module.loginAndResgiter.service.UserService;
import com.whpu.vo.ErrorCode;
import com.whpu.vo.LoginUserVo;
import com.whpu.vo.Result;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @description
 * @author: 唉 烁
 * @time: 2021/10/27 23:47
 */
@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private LoginAndRegisterService loginService;
    //加密盐
    private static final String salt = "123456@whpu";
    @Override
    public User findUser(String account, String password) {
        LambdaQueryWrapper<User> qw = new LambdaQueryWrapper<>();
        qw.eq(User::getAccount,account);
        qw.eq(User::getPassword,password);
        qw.select(User::getAccount,User::getPassword,
                User::getNickName,User::getUserId,
                User::getIdentity,User::getUserState,User::getRemark);
        qw.last("limit 1");
        return userMapper.selectOne(qw);
    }
    public User findUserByAccount(String account) {
        LambdaQueryWrapper<User> qw = new LambdaQueryWrapper<>();
        qw.eq(User::getAccount,account);
        qw.select(User::getAccount,User::getPassword,
                User::getNickName,User::getUserId,
                User::getIdentity,User::getUserState,User::getRemark);
        qw.last("limit 1");
        return userMapper.selectOne(qw);
    }
    /**
     * @description:添加一个用户
     * @author: 唉 烁
     * @time: 2021/10/28 15:13
     */
    @Override
    public Integer addUser(User user) {
        //添加用户的时候，对密码进行加密
        user.setPassword(DigestUtils.md5Hex(user.getPassword()+salt));
        return userMapper.insert(user);
    }

    @Override
    public IPage<User> selectStudentInfo(int currentPage,int size,String teacherId) {

        QueryWrapper lqw = new QueryWrapper();
        lqw.eq("identity","Student");
        Page<User> userPage = new Page<>(currentPage,size);

        IPage<User> userIPage = userMapper.selectPage(userPage,lqw);
        return userIPage;
    }

    /**
     * @description: 根据token给的信息，查到user
     * @param
     * @return: com.whpu.vo.Result
     */
    @Override
    public Result findUserByToken(String token) {
       /**
        * 1对token的合法性进行验证，是否为空，解析是否成功，redis是否存在
        * 2，如果校验失败，就返回错误
        * 3，如果校验成功，返回对应的对象，包装一下LoginUserVo
        */
       if(StringUtils.isBlank(token)){
           return Result.fail(ErrorCode.TOKEN_ERROR.getCode(),ErrorCode.TOKEN_ERROR.getMsg());
       }
        User user = (User)loginService.checkToken(token).getData();
       if(user==null)
       {
           return Result.fail(ErrorCode.TOKEN_ERROR.getCode(),ErrorCode.TOKEN_ERROR.getMsg());
       }
        LoginUserVo loginUserVo= new LoginUserVo();
        loginUserVo.setAccount(user.getAccount());
        loginUserVo.setUserId(user.getUserId());
        loginUserVo.setNickName(user.getNickName());

        return Result.success(loginUserVo);
    }


}
