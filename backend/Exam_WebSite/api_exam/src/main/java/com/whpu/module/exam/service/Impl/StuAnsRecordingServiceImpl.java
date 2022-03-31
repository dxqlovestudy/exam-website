package com.whpu.module.exam.service.Impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.whpu.module.exam.dao.mapper.ExamRecordingMapper;
import com.whpu.module.exam.dao.mapper.StuAnsRecordingMapper;
import com.whpu.module.exam.dao.pojo.ExamRecording;
import com.whpu.module.exam.dao.pojo.StuAnsRecording;
import com.whpu.module.exam.service.StuAnsRecordingService;
import com.whpu.module.question.dao.mapper.SysQuestionMapper;
import com.whpu.module.question.dao.mapper.SysQuestionTopicsMapper;
import com.whpu.module.question.dao.pojo.QuestionTopics;
import com.whpu.module.question.dao.pojo.SysQuestion;
import com.whpu.vo.ExamInfoVo;
import com.whpu.vo.QuestionVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @description
 * @author: 唉 烁
 * @time: 2021/11/17 10:10
 */
@Service
@Transactional
public class StuAnsRecordingServiceImpl implements StuAnsRecordingService {
    @Autowired
    StuAnsRecordingMapper stuAnsRecordingMapper;
    @Autowired
    ExamRecordingMapper examRecordingMapper;
    @Autowired
    SysQuestionMapper sysQuestionMapper;
    @Autowired
    SysQuestionTopicsMapper sysQuestionTopicsMapper;

    @Override
    public ExamInfoVo getExamInfo(String examId) {
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("exam_recording_Id", examId);
        List<StuAnsRecording> recordings = stuAnsRecordingMapper.selectList(queryWrapper);

        ExamRecording examRecording = examRecordingMapper.selectById(examId);

        ArrayList<QuestionVo> SysQuestionsList = new ArrayList<>();
        recordings.forEach(s ->
        {
            QuestionVo SysQuestionVo = new QuestionVo();
            SysQuestion SysQuestion = sysQuestionMapper.selectById(s.getQuestionId());
            SysQuestionVo.setQuestionId(SysQuestion.getQuestionId());
            SysQuestionVo.setAnalyse(SysQuestion.getAnalyse());
            SysQuestionVo.setQuestionContent(SysQuestion.getQuestionContent());
            SysQuestionVo.setOptionA(SysQuestion.getOptionA());
            SysQuestionVo.setOptionB(SysQuestion.getOptionB());
            SysQuestionVo.setOptionC(SysQuestion.getOptionC());
            SysQuestionVo.setOptionD(SysQuestion.getOptionD());
            SysQuestionVo.setOptionE(SysQuestion.getOptionE());
            SysQuestionVo.setOptionF(SysQuestion.getOptionF());
            SysQuestionVo.setAnswer(SysQuestion.getAnswer());
            SysQuestionVo.setStuAnswer(s.getStuAnswer());

            List<QuestionTopics> topics = sysQuestionTopicsMapper.findTopicByQuestionId(s.getQuestionId());
            SysQuestionVo.setQuestionTopics(topics);
            SysQuestionsList.add(SysQuestionVo);
        });
        ExamInfoVo examInfoVo = new ExamInfoVo();
        examInfoVo.setQuestions(SysQuestionsList);
        examInfoVo.setExamId(examId);
        examInfoVo.setSpendTime(examRecording.getSpendTime());
        examInfoVo.setSubmitTime(examRecording.getSubmitTime());
        System.out.println("-----------------------");
        System.out.println(examRecording.getSpendTime());
        examInfoVo.setSize(examRecording.getQuestionNum());
        examInfoVo.setTotalPoints(examRecording.getTotalScore());
        return examInfoVo;
    }
}
