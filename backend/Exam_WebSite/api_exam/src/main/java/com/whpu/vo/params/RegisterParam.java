package com.whpu.vo.params;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
@ApiModel("添加用户所用的参数")
public class RegisterParam {
    @ApiModelProperty("新用户的账号")
    private String account;
    @ApiModelProperty("新用户的密码")
    private String password;
    @ApiModelProperty("新用户的名称")
    private String nickName;

    @ApiModelProperty("用户状态码，正常是1，禁用是0，默认是1")
    //用户状态码，正常是1，禁用是0，默认是1
    private String userState;
    @ApiModelProperty("用户备注")
    //用户备注
    private String remark;
}
