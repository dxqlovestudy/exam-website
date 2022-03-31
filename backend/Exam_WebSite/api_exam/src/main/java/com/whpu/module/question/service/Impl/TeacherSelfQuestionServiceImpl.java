package com.whpu.module.question.service.Impl;

import com.whpu.module.question.dao.mapper.TeacherQuestionTopicMapper;
import com.whpu.module.question.dao.mapper.TeacherSelfQuestionMapper;
import com.whpu.module.question.dao.pojo.SysQuestionTopic;
import com.whpu.module.question.dao.pojo.TeacherQuestionTopic;
import com.whpu.module.question.dao.pojo.TeacherSelfQuestion;
import com.whpu.module.loginAndResgiter.dao.pojo.User;
import com.whpu.module.question.service.TeacherSelfQuestionService;
import com.whpu.utils.UserThreadLocal;
import com.whpu.vo.params.QuestionParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @description
 * @author: 唉 烁
 * @time: 2021/11/24 11:27
 */
@Service
@Transactional
public class TeacherSelfQuestionServiceImpl implements TeacherSelfQuestionService {
    @Autowired
    private TeacherSelfQuestionMapper teacherSelfQuestionMapper;
    @Autowired
    private TeacherQuestionTopicMapper teacherQuestionTopicMapper;
    public int addQuestion(QuestionParam questionParam)
    {
        List<Integer> topics = questionParam.getTopics();
        User user = UserThreadLocal.get();
        TeacherSelfQuestion teacherSelfQuestion = new TeacherSelfQuestion(
                questionParam.getAnsNum(),
                questionParam.getQuestionContent(),
                questionParam.getOptionA(),
                questionParam.getOptionB(),
                questionParam.getOptionC(),
                questionParam.getOptionD(),
                questionParam.getOptionE(),
                questionParam.getOptionF(),
                questionParam.getOptionG(),
                questionParam.getAnswer(),
                questionParam.getAnalyse(),
                user.getUserId()
        );
        int insert = teacherSelfQuestionMapper.insert(teacherSelfQuestion);
        topics.forEach(s->{
            /**
             * 将添加的题目与知识点分类 添加到题目与知识点的映射表中
             */
            TeacherQuestionTopic teacherQuestionTopic =new TeacherQuestionTopic();
            teacherQuestionTopic.setQuestionId(teacherSelfQuestion.getQuestionId());
            teacherQuestionTopic.setTopicId(s);
            teacherQuestionTopicMapper.insert(teacherQuestionTopic);
        });
        return  insert;
    }
}
