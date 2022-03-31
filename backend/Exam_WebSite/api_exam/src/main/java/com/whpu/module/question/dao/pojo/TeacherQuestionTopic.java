package com.whpu.module.question.dao.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("teacher_self_question_topic")
public class TeacherQuestionTopic {
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    @TableField(value = "topicId")
    private Integer topicId;
    @TableField(value = "questionId")
    private String questionId;
}
