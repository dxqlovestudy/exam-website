package com.whpu.vo.params;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @description，用户登陆时可以提供的内容
 * @author: 唉 烁
 * @time: 2021/10/27 23:37
 */
@Data
@ApiModel("登录参数")
public class LoginParam {
    @ApiModelProperty("账户名")
    private String account;
    @ApiModelProperty("密码")
    private String password;
    @ApiModelProperty(value = "用户昵称",required = false)
    private String nickName;
    @ApiModelProperty(value = "身份")
    private String identity;
}
