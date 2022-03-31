package com.whpu.module.exam.service.Impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.whpu.module.question.dao.mapper.SysQuestionMapper;
import com.whpu.module.exam.dao.mapper.ExamRecordingMapper;
import com.whpu.module.exam.dao.mapper.StuAnsRecordingMapper;
import com.whpu.module.question.dao.mapper.StuWrongQueMapper;
import com.whpu.module.exam.dao.pojo.ExamRecording;
import com.whpu.module.exam.dao.pojo.StuAnsRecording;
import com.whpu.module.question.dao.pojo.StuWrongQue;
import com.whpu.module.exam.service.StuSubmitService;
import com.whpu.module.user.service.SysStuService;
import com.whpu.vo.Result;
import com.whpu.vo.params.AnsParam;
import com.whpu.vo.params.SubmitParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


/**
 * @description
 * @author: 唉 烁
 * @time: 2021/11/8 15:05
 */
@Service
@Transactional
public class StuSubmitServiceImpl implements StuSubmitService {

    @Autowired
    SysStuService sysStuService;
    @Autowired
    ExamRecordingMapper examRecordingMapper;
    @Autowired
    StuAnsRecordingMapper stuAnsRecordingMapper;
    @Autowired
    StuWrongQueMapper stuWrongQueMapper;
    @Autowired
    SysQuestionMapper questionMapper;

    /**
     * 用于提交试卷后，保存对应的内容
     * 所有操作通过事务完成，如果一旦出错就回滚
     * 1.通过token获取到学生的信息，创建对应的考试记录，添加考试提交的时间
     * 2.将学生的答案与正确答案进行比对并且，存到学生答案库中，
     * 3，在比对中将错题插入到 错题库中
     * 4，比对完成后，得到得分，并且存到考试记录中
     */
    @Override
    @Transactional
    public Result submit(SubmitParam submitParam, String userId) {
        int trueNum = 0;
        int falseNum = 0;
        String examRecordingId = submitParam.getExamId();
        List<AnsParam> ans = submitParam.getQuestionAnswers();
        if (ans == null)
            System.out.println("-----------------------------------------*****************************");
        for (AnsParam s : ans) {
            //将对应的答案 找到对应的题目记录，如果是对的就将judgment改成1
            //如果是错的就将judgement 改成0
            //同时将学生的答案放进去
            UpdateWrapper uw = new UpdateWrapper();
            uw.eq("studentId", userId);
            uw.eq("questionId", s.getQuestionId());
            uw.eq("exam_recording_id", examRecordingId);
            StuAnsRecording stuAnsRecording = stuAnsRecordingMapper.selectOne(uw);
            if (stuAnsRecording.getAnswer().equals(s.getStuAnswer())) {
                stuAnsRecording.setJudgment(1);//对了
                trueNum++;
            } else {
                //将错题插入错题库中
                //首先查找 对应的题目是否存在，如果此错题已经存在，那么就不再添加
                QueryWrapper<StuWrongQue> queryWrapper = new QueryWrapper<>();
                queryWrapper.eq("studentId", userId).eq("questionId", s.getQuestionId());
                List<StuWrongQue> stuWrongQues = stuWrongQueMapper.selectList(queryWrapper);
                //如果不存在 就添加对应的错题题目
                if (stuWrongQues.size() == 0) {
                    //添加错题
                    stuAnsRecording.setJudgment(0);//错了
                    StuWrongQue stuWrongQue = new StuWrongQue();
                    stuWrongQue.setQuestionId(s.getQuestionId());
                    stuWrongQue.setRecordingId(examRecordingId);
                    stuWrongQue.setStudentId(userId);
                    stuWrongQue.setStudentAns(s.getStuAnswer());
                    stuWrongQueMapper.insert(stuWrongQue);
                    falseNum++;
                }
            }
            stuAnsRecording.setStuAnswer(s.getStuAnswer());
            stuAnsRecordingMapper.update(stuAnsRecording, uw);

        }
        ;
        //对考试记录进行更改操作
        //将是否完成改为完成，添加用时时长，添加分数，添加错题数
        UpdateWrapper<ExamRecording> eruw = new UpdateWrapper<>();
        eruw.eq("examRecordingId", examRecordingId)
                .set("spendTime", submitParam.getTotalTime())
                .set("isFinish", 1)
                .set("WrongAnsNum", falseNum)
                .set("totalScore", trueNum)
                .set("submitTime", System.currentTimeMillis());
        examRecordingMapper.update(null, eruw);

        //将对应结果添加到学生的个人信息中
        sysStuService.changeStudentInfo(trueNum, falseNum, userId);
        return Result.success(null);
    }
}
