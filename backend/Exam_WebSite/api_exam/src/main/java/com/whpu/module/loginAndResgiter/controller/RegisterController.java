package com.whpu.module.loginAndResgiter.controller;

import com.whpu.module.loginAndResgiter.service.LoginAndRegisterService;
import com.whpu.vo.ErrorCode;
import com.whpu.vo.Result;
import com.whpu.vo.params.RegisterParam;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @description 这是一个注册的功能，暂时不做，不做
 * @author: 唉 烁
 * @time: 2021/10/28 16:59
 */
@RestController
@RequestMapping("/api/register")
@Api(tags = "用于系统注册，暂时不做")
public class RegisterController {

    @Autowired
    private LoginAndRegisterService loginAndRegisterService;

    @PostMapping("student")
    @ApiOperation(value = "用于注册学生，此处先不做")
    public Result doRegisterStu(@RequestBody RegisterParam registerParam) {
        if (registerParam.getAccount() == null ||
                registerParam.getNickName() == null ||
                registerParam.getPassword() == null) {
            return Result.fail(ErrorCode.PARAMS_ERROR.getCode(), ErrorCode.PARAMS_ERROR.getMsg());
        }
        Result result = loginAndRegisterService.registerStudent(registerParam);
        return result;
    }

    @PostMapping("teacher")
    @ApiOperation(value = "用于注册教师，此处先不做")
    public Result doRegisterTeacher(@RequestBody RegisterParam registerParam) {

        if (registerParam.getAccount() == null ||
                registerParam.getNickName() == null ||
                registerParam.getPassword() == null) {
            return Result.fail(ErrorCode.PARAMS_ERROR.getCode(), ErrorCode.PARAMS_ERROR.getMsg());
        }
        return loginAndRegisterService.registerTeacher(registerParam);
    }

    @PostMapping("manager")
    @ApiOperation(value = "用于注册管理员，此处先不做")
    public Result doRegisterManager(@RequestBody RegisterParam registerParam) {

        if (registerParam.getAccount() == null ||
                registerParam.getNickName() == null ||
                registerParam.getPassword() == null) {
            return Result.fail(ErrorCode.PARAMS_ERROR.getCode(), ErrorCode.PARAMS_ERROR.getMsg());
        }
        return loginAndRegisterService.registerManager(registerParam);
    }

}
