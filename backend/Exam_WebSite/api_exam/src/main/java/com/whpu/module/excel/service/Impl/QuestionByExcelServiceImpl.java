package com.whpu.module.excel.service.Impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.whpu.module.excel.dao.SysQuestionForExcel;
import com.whpu.module.excel.service.QuestionByExcelService;
import com.whpu.module.question.dao.mapper.QuestionTopicsMapper;
import com.whpu.module.question.dao.mapper.SysQuestionTopicsMapper;
import com.whpu.module.question.dao.pojo.QuestionTopics;
import com.whpu.module.question.service.SysQuestionService;
import com.whpu.vo.params.QuestionParam;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class QuestionByExcelServiceImpl implements QuestionByExcelService {
    @Autowired
    SysQuestionService sysQuestionService;
    @Autowired
    QuestionTopicsMapper questionTopicsMapper;

    public static List<String> notExistTopic = new ArrayList<>();

    public void addQuestionByExcel(SysQuestionForExcel data) {

        System.out.println("data = " + data);
        QuestionParam questionParam = new QuestionParam();
        questionParam.setQuestionContent(data.getQuestionContent());
        questionParam.setOptionA(data.getOptionA());
        questionParam.setOptionB(data.getOptionB());
        questionParam.setOptionC(data.getOptionC());
        questionParam.setOptionD(data.getOptionD());
        questionParam.setOptionE(data.getOptionE());
        questionParam.setOptionF(data.getOptionF());
        questionParam.setOptionG(data.getOptionG());
        questionParam.setAnswer(data.getAnswer());
        questionParam.setAnalyse(data.getAnalyse());
        //如果题目的答案长度大于1 那么说明这个题目是多选，否则就是单选
        if (data.getAnswer() != null && data.getAnswer().length() > 1) {
            questionParam.setAnsNum(1);
        } else {
            questionParam.setAnsNum(0);
        }
        List<Integer> questionTopics = new ArrayList<>();
        int count = 0;//用于计数，如果不为0，那么说明有的知识点是不存在的，那么就不添加这道题目
        //查看Topic1是否存在
        if (data.getTopic1() != null) {
            QueryWrapper<QuestionTopics> SQT1 = new QueryWrapper<>();
            SQT1.eq(StringUtils.isNotBlank(data.getTopic1()), "topic", data.getTopic1());
            System.out.println(SQT1);
            QuestionTopics topic1 = questionTopicsMapper.selectOne(SQT1);
            System.out.println(topic1);
            //查询对应的topic，如果不存在那么就放到此类 不存在的集合中，最后返回给前端。
            if (topic1 == null) {
                notExistTopic.add(data.getTopic1());
                count++;
            } else {
                questionTopics.add(topic1.getId());
            }
        }

        //查看Topic2是否存在
        if (data.getTopic2() != null) {
            QueryWrapper<QuestionTopics> SQT2 = new QueryWrapper<>();
            SQT2.eq("topic", data.getTopic2());
            QuestionTopics topic2 = questionTopicsMapper.selectOne(SQT2);
            //查询对应的topic，如果不存在那么就放到此类 不存在的集合中，最后返回给前端。
            if (topic2 == null) {
                notExistTopic.add(data.getTopic2());
                count++;
            } else {
                questionTopics.add(topic2.getId());
            }
        }
        if (data.getTopic3() != null) {
            //查看Topic3是否存在
            QueryWrapper<QuestionTopics> SQT3 = new QueryWrapper<>();
            SQT3.eq("topic", data.getTopic3());
            QuestionTopics topic3 = questionTopicsMapper.selectOne(SQT3);
            //查询对应的topic，如果不存在那么就放到此类 不存在的集合中，最后返回给前端。
            if (topic3 == null) {
                notExistTopic.add(data.getTopic3());
                count++;
            } else {
                questionTopics.add(topic3.getId());
            }
        }
        //如果任何一个知识点是不存在的那么就返回，不进行插入操作
        if (count != 0) {
            return;
        }
        questionParam.setTopics(questionTopics);
        System.out.println(questionParam);
        System.out.println(questionParam);
        int i = sysQuestionService.addSysQuestion(questionParam);
    }
}
