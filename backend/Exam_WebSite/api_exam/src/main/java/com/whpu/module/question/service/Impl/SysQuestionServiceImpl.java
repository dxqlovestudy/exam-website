package com.whpu.module.question.service.Impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.whpu.module.exam.dao.mapper.StuAnsRecordingMapper;

import com.whpu.module.loginAndResgiter.dao.pojo.User;
import com.whpu.module.question.dao.mapper.QuestionTopicsMapper;
import com.whpu.module.question.dao.mapper.SysQuestionMapper;
import com.whpu.module.exam.dao.pojo.StuAnsRecording;
import com.whpu.module.question.dao.mapper.SysQuestionTopicsMapper;
import com.whpu.module.question.dao.pojo.QuestionTopics;
import com.whpu.module.question.dao.pojo.SysQuestion;
import com.whpu.module.exam.service.ExamRecordingService;

import com.whpu.module.question.dao.pojo.SysQuestionTopic;
import com.whpu.module.question.service.SysQuestionService;
import com.whpu.utils.UserThreadLocal;
import com.whpu.vo.ExercisePaperVo;
import com.whpu.vo.QuestionVo;
import com.whpu.vo.params.QuestionParam;
import com.whpu.vo.params.TopicParam;
import com.whpu.vo.params.TopicsForGetTopicPaperParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * @description
 * @author: 唉 烁
 * @time: 2021/10/29 20:25
 */
@Service
@Transactional
public class SysQuestionServiceImpl implements SysQuestionService {

    @Autowired
    private SysQuestionMapper sysQuestionMapper;
    @Autowired
    private ExamRecordingService examRecordingService;
    @Autowired
    private StuAnsRecordingMapper stuAnsRecordingMapper;

    @Autowired
    private SysQuestionTopicsMapper sysQuestionTopicsMapper;
    @Override
    /**
     * 添加系统的题目
     */
    public int addSysQuestion(QuestionParam questionParam) {
        List<Integer> topics = questionParam.getTopics();
        SysQuestion sysQuestion = new SysQuestion(
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
                questionParam.getAnalyse()
        );
        int insert = sysQuestionMapper.insert(sysQuestion);
        topics.forEach(s->{
            /**
             * 将添加的题目与知识点分类 添加到题目与知识点的映射表中
             */
            SysQuestionTopic sysQuestionTopic =new SysQuestionTopic();
            sysQuestionTopic.setQuestionId(sysQuestion.getQuestionId());
            sysQuestionTopic.setTopicId(s);
            sysQuestionTopicsMapper.insert(sysQuestionTopic);
        });
        return  insert;
    }

    @Override
    @Transactional
    /**
     * 随机组卷
     */
    public ExercisePaperVo selectRandomQuestion(int SysQuestionNum, String userId) {
        //添加考试的记录
        String examRecordingId = examRecordingService.addExamRecordingService(SysQuestionNum,"Random");
        //选择题模块
        if(SysQuestionNum ==0) {
            SysQuestionNum = 20;
        }
        //随机查到对应的选择题题目
        LambdaQueryWrapper<SysQuestion> qw = new LambdaQueryWrapper<>();
        qw.select(SysQuestion::getQuestionContent,SysQuestion::getAnalyse,SysQuestion::getAnsNum,
                SysQuestion::getOptionA,SysQuestion::getOptionB,SysQuestion::getOptionC,SysQuestion::getOptionD,SysQuestion::getOptionE
        ,SysQuestion::getOptionF,SysQuestion::getOptionG,SysQuestion::getAnswer,SysQuestion::getQuestionId);
        qw.last("ORDER BY RAND() LIMIT "+SysQuestionNum);
        List<SysQuestion> SysQuestions = sysQuestionMapper.selectList(qw);
        List<QuestionVo> questionVos= new ArrayList<QuestionVo>();

        for(SysQuestion q:SysQuestions)
        {

            //将选出来的题发给前端的同时，将对应的题目给个记录
            StuAnsRecording stuAnsRecording = new StuAnsRecording();
            stuAnsRecording.setQuestionId(q.getQuestionId());
            stuAnsRecording.setExamRecordingId(examRecordingId);
            stuAnsRecording.setStudentId(userId);
            stuAnsRecording.setAnswer(q.getAnswer());
            stuAnsRecording.setQuestionType(1);
            stuAnsRecordingMapper.insert(stuAnsRecording);

            //将通过题目的Id 获取到这个题目topic(知识点)
            List<QuestionTopics> questionTopicsList = sysQuestionTopicsMapper.findTopicByQuestionId(q.getQuestionId());
            System.out.println(questionTopicsList);


            QuestionVo questionVo = new QuestionVo(
                    q.getQuestionId(),
                    q.getQuestionContent(),
                    q.getAnsNum(),
                    q.getOptionA(),
                    q.getOptionB(),
                    q.getOptionC(),
                    q.getOptionD(),
                    q.getOptionE(),
                    q.getOptionF(),
                    q.getOptionG(),
                    q.getAnswer(),
                    q.getAnalyse(),
                    null,null, 1,questionTopicsList
            );
            questionVos.add(questionVo);
        }

        ExercisePaperVo exerciseRandomVo = new ExercisePaperVo();
            //将选择题目放入到结果集当中
        exerciseRandomVo.setQuestions(questionVos);
            //判断题模块(还没做)
            //告诉你这是哪次考试
        exerciseRandomVo.setExamId(examRecordingId);
            //题目数量，如果前端没给就默认100
        exerciseRandomVo.setSize(SysQuestionNum);
            //考试时长，默认给120分钟，7200秒
        exerciseRandomVo.setExamTime("7200");
            //考试总分，默认给100分
        exerciseRandomVo.setTotalPoints(100);
        //题目类型
        return exerciseRandomVo;
        }

    @Override
    public ExercisePaperVo selectTopicQuestions(TopicsForGetTopicPaperParam topicsForGetTopicPaperParam) {
        User user = UserThreadLocal.get();

       //根据提供的知识点类，将所有的知识点对应的题目找出来，然后选择其中的数量为，提供的题目数量
        List<SysQuestion> SysQuestions = new ArrayList<>();
        topicsForGetTopicPaperParam.getTopics().forEach(topicId->
        {
            List<SysQuestion> questionByTopics = sysQuestionTopicsMapper.findQuestionByTopics(topicId);
            SysQuestions.addAll(questionByTopics);
        });
        //如果根据知识点找到的题目 不足提供的题目数量 ，那么就提供能提供的题目
        //找到的数量多余需要的数量，那么就要在找到题目中随机出 需要的数量的题目
        String examRecordingId =null;
        if(SysQuestions.size()<=topicsForGetTopicPaperParam.getQuestionNum())
        {
            //添加考试的记录
           examRecordingId = examRecordingService.addExamRecordingService(SysQuestions.size(),"Topic");
        }
        else {
            examRecordingId = examRecordingService.addExamRecordingService(topicsForGetTopicPaperParam.getQuestionNum(), "Topic");
            //用set结构将随机出的 题目进行去重，然后将set变为我们要的题目集
            Set<SysQuestion> questionSet = new HashSet<>();
            Random r = new Random();
            while(questionSet.size()<topicsForGetTopicPaperParam.getQuestionNum())
            {
                int i = r.nextInt(SysQuestions.size()-1);
                questionSet.add(SysQuestions.get(i));
            }
            SysQuestions.clear();
            SysQuestions.addAll(questionSet);
        }

        List<QuestionVo> questionVos= new ArrayList<QuestionVo>();

        for(SysQuestion q:SysQuestions)
        {

            //将选出来的题发给前端的同时，将对应的题目给个记录
            StuAnsRecording stuAnsRecording = new StuAnsRecording();
            stuAnsRecording.setQuestionId(q.getQuestionId());
            stuAnsRecording.setExamRecordingId(examRecordingId);
            stuAnsRecording.setStudentId(user.getUserId());
            stuAnsRecording.setAnswer(q.getAnswer());
            stuAnsRecording.setQuestionType(1);
            stuAnsRecordingMapper.insert(stuAnsRecording);

            //将通过题目的Id 获取到这个题目topic(知识点)
            List<QuestionTopics> questionTopicsList = sysQuestionTopicsMapper.findTopicByQuestionId(q.getQuestionId());


            QuestionVo questionVo = new QuestionVo(
                    q.getQuestionId(),
                    q.getQuestionContent(),
                    q.getAnsNum(),
                    q.getOptionA(),
                    q.getOptionB(),
                    q.getOptionC(),
                    q.getOptionD(),
                    q.getOptionE(),
                    q.getOptionF(),
                    q.getOptionG(),
                    q.getAnswer(),
                    q.getAnalyse(),
                    null,null, 1,questionTopicsList
            );
            questionVos.add(questionVo);
        }

        ExercisePaperVo exerciseRandomVo = new ExercisePaperVo();
        //将选择题目放入到结果集当中
        exerciseRandomVo.setQuestions(questionVos);
        //判断题模块(还没做)
        //告诉你这是哪次考试
        exerciseRandomVo.setExamId(examRecordingId);
        //题目数量，如果前端没给就默认20
        exerciseRandomVo.setSize(topicsForGetTopicPaperParam.getQuestionNum());
        //考试时长，默认给120分钟，7200秒
        exerciseRandomVo.setExamTime("7200");
        //考试总分，默认给100分
        exerciseRandomVo.setTotalPoints(questionVos.size());
        return exerciseRandomVo;
    }

}
