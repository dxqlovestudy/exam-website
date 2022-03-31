package com.whpu.vo;

import com.baomidou.mybatisplus.annotation.TableField;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @description 用户信息返回的包装类
 * @author: 唉 烁
 * @time: 2021/10/28 15:57
 */
@Data
@ApiModel("登录时返回给浏览器的用户信息")
public class LoginUserVo {
    @ApiModelProperty("用户账号")
    //用户账号
    private String account;
    @ApiModelProperty("用户密码")
    //用户密码
    private String userId;
    @ApiModelProperty("用户昵称")
    //用户昵称
    private String nickName;
}
