package com.whpu.module.loginAndResgiter.dao.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * @description
 * @author: 唉 烁
 * @time: 2021/10/27 23:45
 */
@Data
@TableName("sys_user")
public class User {
    //主键
    @TableId(value = "userId",type = IdType.ID_WORKER_STR)
    private String userId;

    //用户账号
    @TableField(value = "account")
    private String account;

    //用户密码
    @TableField(value = "password")
    private String password;

    //用户昵称
    @TableField(value = "nickName")
    private String nickName;

    @TableField(value = "identity")
    private String identity;

    //用户状态码，正常是1，禁用是0，默认是1
    @TableField(value = "userState")
    private String userState;

    //用户备注
    @TableField(value="remark")
    private String remark;
}
