package com.whpu.module.excel.dao;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.whpu.module.question.dao.mapper.QuestionTopicsMapper;
import com.whpu.module.question.dao.mapper.SysQuestionTopicsMapper;
import com.whpu.module.question.dao.pojo.QuestionTopics;
import com.whpu.module.question.dao.pojo.SysQuestion;
import com.whpu.module.question.dao.pojo.SysQuestionTopic;
import com.whpu.module.question.service.SysQuestionService;
import com.whpu.vo.params.QuestionParam;
import com.whpu.vo.params.TopicParam;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;


/**
 * 未完成
 */

public class SysQuestionForExcelReadListener extends AnalysisEventListener<SysQuestionForExcel> {


    public static List<SysQuestionForExcel> datas = new ArrayList<>();

    @Override
    public void invoke(SysQuestionForExcel data, AnalysisContext context) {
        datas.add(data);
    }

    // 全部读完之后，会调用该方法
    @Override
    public void doAfterAllAnalysed(AnalysisContext context) {
        // TODO......
    }

}

