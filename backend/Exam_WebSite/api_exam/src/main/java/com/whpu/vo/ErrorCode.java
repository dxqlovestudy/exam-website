package com.whpu.vo;

public enum ErrorCode {
    PARAMS_ERROR(10001, "参数有误"),
    FILE_NOT_FORWORD(10005, "文件格式有误"),
    REGISTER_ERROR(10002, "注册失败"),
    REGISTER_ERROR_UserHasExit(10004, "注册失败,账号已存在"),
    ACCOUNT_PWD_NOT_EXIST(400, "用户名或密码不存在"),
    TOKEN_ERROR(10003, "token不合法"),
    TOKEN_OVERDUE(401, "token已过期,身份已过期"),
    NO_PERMISSION(400, "无权限访问"),
    ERROR_IDENTITY(400, "身份选择错误"),
    SESSION_TIME_OUT(90001, "未登录"),
    NO_LOGIN(401, "未登录，无权访问");


    private int code;
    private String msg;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    ErrorCode(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }
}
