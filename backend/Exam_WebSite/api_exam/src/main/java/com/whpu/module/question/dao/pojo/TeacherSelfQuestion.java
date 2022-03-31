package com.whpu.module.question.dao.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * @description
 * @author: 唉 烁
 * @time: 2021/11/24 11:13
 */
@Data
@TableName("teach_self_question")
public class TeacherSelfQuestion {
    public TeacherSelfQuestion(Integer ansNum, String questionContent, String optionA, String optionB, String optionC, String optionD, String optionE, String optionF, String optionG, String answer, String analyse, String teacherId) {
        this.AnsNum = ansNum;
        this.questionContent = questionContent;
        this.optionA = optionA;
        this.optionB = optionB;
        this.optionC = optionC;
        this.optionD = optionD;
        this.optionE = optionE;
        this.optionF = optionF;
        this.optionG = optionG;
        this.Answer = answer;
        this.Analyse = analyse;
        this.teacherId = teacherId;
    }

    public TeacherSelfQuestion() {
    }

    @TableId(value = "questionId", type = IdType.ID_WORKER_STR)
    String questionId;

    @TableField(value = "AnsNum")
    Integer AnsNum;

    @TableField(value = "questionContent")
    String questionContent;

    @TableField(value = "optionA")
    String optionA;

    @TableField(value = "optionB")
    String optionB;

    @TableField(value = "optionC")
    String optionC;

    @TableField(value = "optionD")
    String optionD;

    @TableField(value = "optionE")
    String optionE;

    @TableField(value = "optionF")
    String optionF;

    @TableField(value = "optionG")
    String optionG;

    @TableField(value = "Answer")
    String Answer;

    @TableField(value = "Analyse")
    String Analyse;

    @TableField("teacherId")
    String teacherId;
}
