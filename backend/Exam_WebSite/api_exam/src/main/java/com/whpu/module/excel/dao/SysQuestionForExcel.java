package com.whpu.module.excel.dao;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.alibaba.excel.annotation.ExcelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class SysQuestionForExcel {
    @ExcelIgnore
    private String questionId;

    @ExcelIgnore
    private Integer AnsNum;

    @ExcelProperty(value = "题目", index = 0)
    private String questionContent;

    @ExcelProperty(value = "选项A", index = 1)
    private String optionA;

    @ExcelProperty(value = "选项B", index = 2)
    private String optionB;

    @ExcelProperty(value = "选项C", index = 3)
    private String optionC;

    @ExcelProperty(value = "选项D", index = 4)
    private String optionD;

    @ExcelProperty(value = "选项E", index = 5)
    private String optionE;

    @ExcelProperty(value = "选项F", index = 6)
    private String optionF;

    @ExcelProperty(value = "选项G", index = 7)
    private String optionG;

    @ExcelProperty(value = "答案", index = 8)
    private String answer;

    @ExcelProperty(value = "解析", index = 9)
    private String analyse;
    @ExcelProperty(value = "知识点1", index = 10)
    private String topic1;
    @ExcelProperty(value = "知识点2", index = 11)
    private String topic2;
    @ExcelProperty(value = "知识点3", index = 12)
    private String topic3;

    public SysQuestionForExcel() {
    }
}
