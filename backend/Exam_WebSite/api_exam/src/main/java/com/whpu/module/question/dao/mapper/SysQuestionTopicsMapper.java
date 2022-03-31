package com.whpu.module.question.dao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.whpu.module.question.dao.pojo.QuestionTopics;
import com.whpu.module.question.dao.pojo.SysQuestion;
import com.whpu.module.question.dao.pojo.SysQuestionTopic;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface SysQuestionTopicsMapper extends BaseMapper<SysQuestionTopic> {
    @Select("SELECT id,topic from question_topics where question_topics.id in (select topicId from sys_question_topic where questionId=#{questionId})")
    List<QuestionTopics> findTopicByQuestionId(@Param("questionId")String questionId);

    @Select("select * from sys_question where sys_question.questionId in (select questionId from sys_question_topic where topicId =#{topicId})")
    List<SysQuestion> findQuestionByTopics(@Param("topicId") Integer topicId);
}
