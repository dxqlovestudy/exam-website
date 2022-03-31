package com.whpu.module.question.service;


import com.whpu.vo.ExercisePaperVo;
import com.whpu.vo.params.QuestionParam;
import com.whpu.vo.params.TopicParam;
import com.whpu.vo.params.TopicsForGetTopicPaperParam;

public interface SysQuestionService {

   int addSysQuestion(QuestionParam questionParam);
    ExercisePaperVo selectRandomQuestion(int QuestionNum, String userId);

    ExercisePaperVo selectTopicQuestions(TopicsForGetTopicPaperParam topicsForGetTopicPaperParam);
}
