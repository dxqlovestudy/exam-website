package com.whpu.module.exam.dao.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * @description
 * @author: 唉 烁
 * @time: 2021/11/8 15:50
 */
@Data
@TableName("stu_exam_recording")
public class ExamRecording {
    @TableId( value="examRecordingId", type = IdType.ID_WORKER_STR)
    private String examRecordingId;
    @TableField(value = "studentId")
    private String studentId;
    @TableField(value = "questionNum")
    private Integer questionNum;
    @TableField(value = "totalScore")
    private Integer totalScore;
    @TableField(value = "wrongAnsNum")
    private Integer wrongAnsNum;
    private Integer availability;
    @TableField(value = "isFinish")
    private Integer isFinish;
    @TableField(value = "examType")
    private String examType;
    @TableField(value = "spendTime")
    private Long spendTime;
    @TableField(value = "submitTime")
    private Long submitTime;
    @TableField(value = "limitTime")
    private Long limitTime;


}
