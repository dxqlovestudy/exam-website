package com.whpu.module.question.controller;

import com.whpu.module.question.service.SysQuestionService;
import com.whpu.module.question.service.TeacherSelfQuestionService;
import com.whpu.vo.Result;
import com.whpu.vo.params.QuestionParam;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @description
 * @author: 唉 烁
 * @time: 2021/11/24 11:19
 */
@RestController
@RequestMapping("api/addQuestion")
@Api(tags = "用于添加试题")
public class AddQuestionController {
    @Autowired
    private TeacherSelfQuestionService teacherSelfQuestionService;
    @Autowired
    private SysQuestionService sysQuestionService;

    @PostMapping("addSelfQuestion")
    @ApiOperation("教师添加自有的题目到私有题库")
    public Result addTeacherSelfQuestion(@RequestBody QuestionParam questionParam) {
        int i = teacherSelfQuestionService.addQuestion(questionParam);
        return Result.success(null);
    }

    @PostMapping("addSysQuestion")
    @ApiOperation("添加题目到系统题库")
    public Result addSysQuestion(@RequestBody QuestionParam questionParam) {
        int i = sysQuestionService.addSysQuestion(questionParam);
        return Result.success(null);
    }
}
