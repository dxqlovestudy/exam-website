package com.whpu.vo.params;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
@ApiModel("随机组卷的参数")
public class RandomParam {
    @ApiModelProperty("题目数量")
    private Integer questionNum = 20;
}
