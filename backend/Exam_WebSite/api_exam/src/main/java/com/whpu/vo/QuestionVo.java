package com.whpu.vo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.whpu.module.question.dao.pojo.QuestionTopics;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

/**
 * @description
 * @author: 唉 烁
 * @time: 2021/10/30 13:08
 */
@Data
@ApiModel("组卷时的返回给前端的题目")
public class QuestionVo {
    public QuestionVo() {
    }

    public QuestionVo(String questionId, String questionContent, int ansNum, String optionA, String optionB, String optionC, String optionD, String optionE, String optionF, String optionG, String answer, String analyse, String stuAnswer, Integer status, Integer score, List<QuestionTopics> questionTopics) {
        this.questionId = questionId;
        this.questionContent = questionContent;
        AnsNum = ansNum;
        this.optionA = optionA;
        this.optionB = optionB;
        this.optionC = optionC;
        this.optionD = optionD;
        this.optionE = optionE;
        this.optionF = optionF;
        this.optionG = optionG;
        Answer = answer;
        Analyse = analyse;
        this.stuAnswer = stuAnswer;
        this.status = status;
        this.score = score;
        this.questionTopics = questionTopics;
    }
    @ApiModelProperty("题目的Id")
    private String questionId;
    @ApiModelProperty("题目的题干")
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
    @ApiModelProperty("学生的答案")
    private String stuAnswer;
    @ApiModelProperty("是否有效")
    private Integer status;
    private List<QuestionTopics> questionTopics;
    @ApiModelProperty("每个题目的分数 默认是1")
    private Integer score=1;
}
