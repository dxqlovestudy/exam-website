package com.whpu.vo;

import com.whpu.vo.params.AnsParam;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.ArrayList;

/**
 * @description
 * @author: 唉 烁
 * @time: 2021/11/17 10:22
 */
@Data
@ApiModel("考试信息")
public class ExamInfoVo {
    @ApiModelProperty("题目数量")
    Integer size;
    @ApiModelProperty("用时")
    Long spendTime;//秒
    @ApiModelProperty("提交时间")
    Long submitTime;
    @ApiModelProperty("总分")
    Integer totalPoints;
    @ApiModelProperty("题目")
    ArrayList<QuestionVo> questions;
    @ApiModelProperty("试卷ID")
    String examId;

    ArrayList<AnsParam> questionAnswers;
}
