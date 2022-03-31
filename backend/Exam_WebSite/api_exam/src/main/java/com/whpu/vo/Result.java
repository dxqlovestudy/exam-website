package com.whpu.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.io.Serializable;

/**
 * @description:统一的返回数据类
 * @author: 唉 烁
 * @time: 2021/10/27 21:46
 */
@Data
@ApiModel("返回的结果")
@AllArgsConstructor
public class Result<T>implements Serializable {
    @ApiModelProperty("是否成功")
    private boolean success;
    @ApiModelProperty("状态码")
    private int code;//返回状态码

    @ApiModelProperty("返回的信息")
    private String msg; //返回的信息

    @ApiModelProperty("返回的数据")
    private T data; //返回的数据

    public static Result success(Object data)
    {
        return new Result(true,201,"success",data);
    }

    public static Result fail(int code,String msg)
    {
        return new Result(false,code,msg,null);
    }
}
