package com.whpu.module.question.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.whpu.module.question.dao.mapper.QuestionTopicsMapper;
import com.whpu.module.question.dao.mapper.SysQuestionTopicsMapper;
import com.whpu.module.question.dao.pojo.QuestionTopics;
import com.whpu.module.question.dao.pojo.SysQuestionTopic;
import com.whpu.vo.params.TopicParam;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.websocket.server.PathParam;

@RestController
@RequestMapping("api/topic")
@Api(tags = "用于知识点的管理")
public class TopicController {
    @Autowired
    private QuestionTopicsMapper questionTopicsMapper;

    @ApiOperation(value = "添加知识点")
    @PostMapping("add")
    public void addTopic(@RequestBody TopicParam topicParam) {
        QuestionTopics questionTopics = new QuestionTopics();
        questionTopics.setTopic(topicParam.getTopic());
        questionTopicsMapper.insert(questionTopics);
    }

    @ApiOperation(value = "删除知识点")
    @GetMapping("remove/{id}")
    public void deleteTopic(@PathVariable Integer id) {
        questionTopicsMapper.deleteById(id);
    }

    @ApiOperation(value = "修改知识点")
    @GetMapping("change/{id}/{topic}")
    public void deleteTopic(@PathVariable Integer id, @PathVariable String topic) {
        questionTopicsMapper.updateById(new QuestionTopics(id, topic));
    }

    @ApiOperation(value = "查询所有知识点")
    @GetMapping("getAllTopic")
    public void getAllTopic() {
        questionTopicsMapper.selectList(new QueryWrapper<>());
    }
}
