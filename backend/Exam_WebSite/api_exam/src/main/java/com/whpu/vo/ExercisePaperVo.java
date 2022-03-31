package com.whpu.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

/**
 * @description
 * @author: 唉 烁
 * @time: 2021/11/17 8:37
 */
@Data
@ApiModel("考试卷")
public class ExercisePaperVo {
    @ApiModelProperty("题目列表")
    List<QuestionVo> questions;
    @ApiModelProperty("题目数量")
    Integer size;
    @ApiModelProperty("考试时长")
    String examTime;
    @ApiModelProperty("考试ID")
    String examId;
    @ApiModelProperty("总分")
    Integer totalPoints;
}
