package com.whpu.module.exam.dao.pojo;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

/**
 * @description
 * @author: 唉 烁
 * @time: 2021/11/8 15:00
 */
@Data
@TableName("stu_ans_recording")
public class StuAnsRecording {
    @TableId(type = IdType.ID_WORKER_STR)
    private String id;
    @TableField(value = "studentId")
    private String StudentId;
    @TableField("exam_recording_id")
    private String examRecordingId;
    @TableField("questionId")
    private String questionId;
    @TableField("stuAnswer")
    private String stuAnswer;
    @TableField("answer")
    private String answer;
    private Integer judgment;
    //考试类型，如果是判断题就是0，选择题就是1，默认是-1
    private Integer questionType;
    private Integer status;

}
