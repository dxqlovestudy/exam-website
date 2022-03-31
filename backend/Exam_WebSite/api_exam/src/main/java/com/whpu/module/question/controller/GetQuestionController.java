package com.whpu.module.question.controller;

import com.whpu.module.loginAndResgiter.dao.pojo.User;
import com.whpu.module.question.service.SysQuestionService;
import com.whpu.utils.UserThreadLocal;
import com.whpu.vo.ErrorCode;
import com.whpu.vo.ExercisePaperVo;
import com.whpu.vo.Result;
import com.whpu.vo.params.RandomParam;
import com.whpu.vo.params.TopicParam;
import com.whpu.vo.params.TopicsForGetTopicPaperParam;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @description
 * @author: 唉 烁
 * @time: 2021/10/30 13:22
 */
@RestController
@RequestMapping("api/exercise")
@Api(tags = "用于组卷")
public class GetQuestionController {

    @Autowired
    SysQuestionService sysQuestionService;
    @PostMapping("random")
    @ApiOperation(value = "随机组卷")
    public Result<ExercisePaperVo> selectRandomQuestion(@RequestBody RandomParam randomParam)
    {
        User user = UserThreadLocal.get();
        ExercisePaperVo exerciseRandomVo = sysQuestionService.selectRandomQuestion(randomParam.getQuestionNum(), user.getUserId());
        return Result.success(exerciseRandomVo);
    }
    @PostMapping("topic")
    @ApiOperation(value = "专题组卷（根据知识点组卷）")
    public Result<ExercisePaperVo> selectTopicQuestion(@RequestBody TopicsForGetTopicPaperParam topicParam)
    {
        System.out.println(topicParam);

        if(topicParam==null||topicParam.getTopics()==null)//如果分类为空或者不存在返回false
        {
            return Result.fail(ErrorCode.PARAMS_ERROR.getCode(),ErrorCode.PARAMS_ERROR.getMsg());
        }
        if(topicParam.getQuestionNum()==null)
        {
            topicParam.setQuestionNum(20);//设置默认的题目数
        }
        ExercisePaperVo exercisePaperVo = sysQuestionService.selectTopicQuestions(topicParam);
        return Result.success(exercisePaperVo);
    }

}
