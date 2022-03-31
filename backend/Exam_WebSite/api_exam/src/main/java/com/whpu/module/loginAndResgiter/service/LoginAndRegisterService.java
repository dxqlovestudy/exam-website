package com.whpu.module.loginAndResgiter.service;

import com.whpu.vo.Result;
import com.whpu.vo.params.LoginParam;
import com.whpu.vo.params.RegisterParam;

public interface LoginAndRegisterService {
    Result doLogin(LoginParam loginParam);

    Result checkToken(String token);

    /**
     * @description: 退出登录
     * @param token
     * @return: com.whpu.vo.Result
     */
    Result doLogout(String token);

    public Result registerStudent(RegisterParam loginParam);
    public Result registerTeacher(RegisterParam registerParam);
    public Result registerManager(RegisterParam registerParam);

}
