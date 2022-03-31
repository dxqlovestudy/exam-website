package com.whpu.module.question.dao.pojo;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * @description
 * @author: 唉 烁
 * @time: 2021/10/29 20:03
 */
@Data
@TableName("sys_question")
public class SysQuestion {
    @ExcelIgnore
    @TableId(value = "questionId", type = IdType.ID_WORKER_STR)
    String questionId;
    @ExcelIgnore
    @TableField(value = "AnsNum")
    Integer AnsNum;

    @ExcelProperty(value = "题目", index = 0)
    @TableField(value = "questionContent")
    String questionContent;

    @ExcelProperty(value = "选项A", index = 1)
    @TableField(value = "optionA")
    String optionA;

    @ExcelProperty(value = "选项B", index = 2)
    @TableField(value = "optionB")
    String optionB;

    @ExcelProperty(value = "选项C", index = 3)
    @TableField(value = "optionC")
    String optionC;

    @ExcelProperty(value = "选项D", index = 4)
    @TableField(value = "optionD")
    String optionD;

    @ExcelProperty(value = "选项E", index = 5)
    @TableField(value = "optionE")
    String optionE;

    @ExcelProperty(value = "选项F", index = 6)
    @TableField(value = "optionF")
    String optionF;

    @ExcelProperty(value = "选项G", index = 7)
    @TableField(value = "optionG")
    String optionG;

    @ExcelProperty(value = "答案", index = 9)
    @TableField(value = "Answer")
    String answer;

    @ExcelProperty(value = "解析", index = 8)
    @TableField(value = "Analyse")
    String analyse;

    public SysQuestion() {
    }

    public SysQuestion(Integer ansNum, String questionContent, String optionA, String optionB, String optionC, String optionD, String optionE, String optionF, String optionG, String answer, String analyse) {
        AnsNum = ansNum;
        this.questionContent = questionContent;
        this.optionA = optionA;
        this.optionB = optionB;
        this.optionC = optionC;
        this.optionD = optionD;
        this.optionE = optionE;
        this.optionF = optionF;
        this.optionG = optionG;
        this.answer = answer;
        this.analyse = analyse;
    }
}
