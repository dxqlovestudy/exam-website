package com.whpu.vo.params;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

/**
 * @description
 * @author: 唉 烁
 * @time: 2021/11/24 10:52
 */
@Data
@ApiModel("添加题目的参数")
public class QuestionParam {
    @ApiModelProperty("题目的题干" )
    private String questionContent;
    @ApiModelProperty("题目答案数量")
    private Integer AnsNum;
    @ApiModelProperty("题目选项A")
    private String optionA;
    @ApiModelProperty("题目选项B")
    private String optionB;
    @ApiModelProperty("题目选项C")
    private String optionC;
    @ApiModelProperty("题目选项D")
    private String optionD;
    @ApiModelProperty("题目选项E")
    private String optionE;
    @ApiModelProperty("题目选项F")
    private String optionF;
    @ApiModelProperty("题目选项G")
    private String optionG;
    @ApiModelProperty("题目答案")
    private String Answer;
    @ApiModelProperty("题目解析")
    private String Analyse;
    @ApiModelProperty("知识点Id")
    private List<Integer> topics;
}
