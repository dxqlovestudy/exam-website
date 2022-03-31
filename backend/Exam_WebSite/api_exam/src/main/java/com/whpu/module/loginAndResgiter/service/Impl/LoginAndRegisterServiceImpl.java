package com.whpu.module.loginAndResgiter.service.Impl;

import com.alibaba.fastjson.JSON;
import com.whpu.module.loginAndResgiter.dao.pojo.User;
import com.whpu.module.loginAndResgiter.service.LoginAndRegisterService;
import com.whpu.module.loginAndResgiter.service.UserService;
import com.whpu.utils.JWTUtils;
import com.whpu.vo.ErrorCode;
import com.whpu.vo.Result;
import com.whpu.vo.TokenVo;
import com.whpu.vo.params.LoginParam;
import com.whpu.vo.params.RegisterParam;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * @description
 * @author: 唉 烁
 * @time: 2021/10/27 23:45
 */

@Service
@Transactional
public class LoginAndRegisterServiceImpl implements LoginAndRegisterService {

    //加密盐
    private static final String salt = "123456@whpu";
    @Autowired
    private UserService userService;

    @Autowired
    private RedisTemplate<String,String> redisTemplate;

    /**
     * @description: 用户登录
     * @param loginParam
     * @return: com.whpu.vo.Result
     */
    @Override
    public Result<String> doLogin(LoginParam loginParam) {

        /**
         *  1，检查参数是否合法
         *  2，根据用户民和密码 查询用户，看这个用户是否存在
         *  3，不存在就登录失败
         *  4，存在就使用jwt生成 token返回给前端
         *  5 token放入redis中 redis存放，token：user信息 设置过期时间
         *  （登录验证时，先认证token字符串是否合法，再去redis看 是否存在）
         */
        String account = loginParam.getAccount();
        String password = loginParam.getPassword();
        if(StringUtils.isBlank(account)||StringUtils.isBlank(password))
        {
            return Result.fail(ErrorCode.PARAMS_ERROR.getCode(),ErrorCode.PARAMS_ERROR.getMsg());
        }
        //对密码进行加密,再到数据库进行比较，因为数据库存的是加密后的密码
        password = DigestUtils.md5Hex(password+salt);
        User user = userService.findUser(account,password);
        if(user==null)
        {
            return Result.fail(ErrorCode.ACCOUNT_PWD_NOT_EXIST.getCode(),ErrorCode.ACCOUNT_PWD_NOT_EXIST.getMsg());
        }
        if(!loginParam.getIdentity().equals(user.getIdentity()))
        {
            //如果身份不匹配，则报错
            return Result.fail(ErrorCode.ERROR_IDENTITY.getCode(),ErrorCode.ERROR_IDENTITY.getMsg());
        }
        String token = JWTUtils.creatToken(user.getUserId());
        redisTemplate.opsForValue().set("Token_"+token, JSON.toJSONString(user),1, TimeUnit.DAYS);
        return Result.success(token);
    }

    @Override
    /**
     *  1判断token是否为空，或者Token中的数据是空，则token不合法，返回fale结果
     *  2，从redis 缓存中去寻找当前的token信息，找到则验证成功，返回user的内容
     *      没找到，则说明token过期，或者token没有存在过
     */
    public Result checkToken(String token) {
        if(StringUtils.isBlank(token))
        {
            return Result.fail(ErrorCode.TOKEN_OVERDUE.getCode(),ErrorCode.TOKEN_OVERDUE.getMsg());
        }
        Map<String, Object> stringObjectMap = JWTUtils.checkToken(token);
        if(stringObjectMap==null)
        {
            return Result.fail(ErrorCode.TOKEN_OVERDUE.getCode(),ErrorCode.TOKEN_OVERDUE.getMsg());
        }
        String userJson = redisTemplate.opsForValue().get("Token_"+token);
        if(StringUtils.isBlank(userJson))
        {
            return Result.fail(ErrorCode.TOKEN_OVERDUE.getCode(),ErrorCode.TOKEN_OVERDUE.getMsg());
        }
        User user = JSON.parseObject(userJson, User.class);
        return Result.success(user);
    }

    /**
     * @description: 退出登录
     * @param token
     * @return: com.whpu.vo.Result
     */
    @Override
    public Result doLogout(String token) {
        redisTemplate.delete("Token_"+token);
        return Result.success(null);
    }

    @Override
    @Transactional
    /**
     * 这是注册用户的service
     */
    public Result registerStudent(RegisterParam registerParam) {
        //①首先查看要注册的账户的account是否已经存在
        //如果存在就返回 fail 不能进行注册
        User user1 = userService.findUserByAccount(registerParam.getAccount());
        System.out.println("user1"+"------------"+user1);
        if(user1!=null)
        {
            return Result.fail(ErrorCode.REGISTER_ERROR_UserHasExit.getCode(),ErrorCode.REGISTER_ERROR_UserHasExit.getMsg());
        }
        User user = new User();
        user.setAccount(registerParam.getAccount());
        user.setPassword(registerParam.getPassword());
        user.setNickName(registerParam.getNickName());
        user.setUserState(registerParam.getUserState());
        user.setRemark(registerParam.getRemark());
        user.setIdentity("student");
        Integer integer = userService.addUser(user);

        //查看是否注册成功
        if(integer==1)
        {
            return Result.success(user);
        }
        else
        {
            return Result.fail(ErrorCode.REGISTER_ERROR.getCode(),ErrorCode.REGISTER_ERROR.getMsg());
        }
    }
    @Override
    @Transactional
    public Result registerTeacher(RegisterParam registerParam) {
        //①首先查看要注册的账户的account是否已经存在
        //如果存在就返回 fail 不能进行注册
        User user1 = userService.findUserByAccount(registerParam.getAccount());
        if(user1!=null)
        {
            return Result.fail(ErrorCode.REGISTER_ERROR_UserHasExit.getCode(),ErrorCode.REGISTER_ERROR_UserHasExit.getMsg());
        }
        User user = new User();
        user.setAccount(registerParam.getAccount());
        user.setPassword(registerParam.getPassword());
        user.setNickName(registerParam.getNickName());
        user.setUserState(registerParam.getUserState());
        user.setRemark(registerParam.getRemark());
        user.setIdentity("teacher");
        Integer integer = userService.addUser(user);

        //查看是否注册成功
        if(integer==1)
        {
            return Result.success(integer);
        }
        else
        {
            return Result.fail(ErrorCode.REGISTER_ERROR.getCode(),ErrorCode.REGISTER_ERROR.getMsg());
        }
    }

    @Override
    public Result registerManager(RegisterParam registerParam) {
        //①首先查看要注册的账户的account是否已经存在
        //如果存在就返回 fail 不能进行注册
        User user1 = userService.findUserByAccount(registerParam.getAccount());
        if(user1!=null)
        {
            return Result.fail(ErrorCode.REGISTER_ERROR_UserHasExit.getCode(),ErrorCode.REGISTER_ERROR_UserHasExit.getMsg());
        }
        User user = new User();
        user.setAccount(registerParam.getAccount());
        user.setPassword(registerParam.getPassword());
        user.setNickName(registerParam.getNickName());
        user.setUserState(registerParam.getUserState());
        user.setRemark(registerParam.getRemark());
        user.setIdentity("manager");
        Integer integer = userService.addUser(user);

        //查看是否注册成功
        if(integer==1)
        {
            return Result.success(integer);
        }
        else
        {
            return Result.fail(ErrorCode.REGISTER_ERROR.getCode(),ErrorCode.REGISTER_ERROR.getMsg());
        }
    }
}
