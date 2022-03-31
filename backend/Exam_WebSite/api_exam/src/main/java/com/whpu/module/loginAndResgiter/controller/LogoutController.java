package com.whpu.module.loginAndResgiter.controller;

import com.whpu.module.loginAndResgiter.service.LoginAndRegisterService;
import com.whpu.vo.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @description
 * @author: 唉 烁
 * @time: 2021/10/28 16:52
 */
@RestController
@RequestMapping("/api/logout")
@Api(tags = "用于提出登录")
public class LogoutController {

    @Autowired
    private LoginAndRegisterService loginService;

    @PostMapping
    @ApiOperation(value = "用于退出登录")
    public Result doLogout(@RequestHeader("Authorization") String token) {
        return loginService.doLogout(token);
    }
}
