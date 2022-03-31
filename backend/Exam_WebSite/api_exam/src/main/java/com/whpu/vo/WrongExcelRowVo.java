package com.whpu.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.models.auth.In;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ApiModel("当用户提供的Excel中有错误信息时，提供错误信息")
public class WrongExcelRowVo {
    @ApiModelProperty("Excel中错误的行数")
    private Integer row;
    @ApiModelProperty("错误信息")
    private String errorMsg;
}
