package com.whpu.module.question.dao.pojo;

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
@TableName("stu_wrong_que")
public class StuWrongQue {
    @TableId(type = IdType.ID_WORKER_STR)
    private String id;
    @TableField(value = "studentId")
    private String studentId;
    @TableField(value = "questionId")
    private String questionId;
    @TableField(value = "recordingId")
    private String recordingId;
    @TableField(value = "studentAns")
    private String studentAns;
}
