package com.whpu.vo.params;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @description
 * @author: 唉 烁
 * @time: 2021/11/8 20:41
 */
@Data
@ApiModel("学生的答案")
public class AnsParam {
    @ApiModelProperty("题目Id")
    private String questionId;
    @ApiModelProperty("学生给的这个题的答案")
    private String stuAnswer;

}
