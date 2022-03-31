package com.whpu.vo.params;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @description
 * @author: 唉 烁
 * @time: 2021/11/8 15:10
 */
@Data
@ApiModel("提交的参数")
public class SubmitParam {
    @ApiModelProperty("学生回答问题的答案数组")
    private List<AnsParam> questionAnswers;
    @ApiModelProperty("答题总用时")
    private Integer totalTime;
    @ApiModelProperty("考试的ID")
    private String examId;
}
