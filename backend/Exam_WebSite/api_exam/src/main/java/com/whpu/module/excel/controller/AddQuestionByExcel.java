package com.whpu.module.excel.controller;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.read.builder.ExcelReaderBuilder;
import com.alibaba.excel.read.builder.ExcelReaderSheetBuilder;
import com.whpu.module.excel.dao.SysQuestionForExcel;
import com.whpu.module.excel.dao.SysQuestionForExcelReadListener;
import com.whpu.module.excel.service.Impl.QuestionByExcelServiceImpl;
import com.whpu.module.excel.service.QuestionByExcelService;
import com.whpu.module.question.dao.pojo.QuestionTopics;
import com.whpu.module.question.dao.pojo.SysQuestion;
import com.whpu.vo.ErrorCode;
import com.whpu.vo.Result;
import com.whpu.vo.WrongExcelRowVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("excel")
@Api(tags = "用于通过Excel添加试题")
public class AddQuestionByExcel {
    @Autowired
    QuestionByExcelService questionByExcelService;

    @ApiOperation(value = "通过Excel添加题目的接口(管理员权限使用的)")
    @PostMapping("addQuestion")
    public Result addQuestionByExecl(@RequestBody MultipartFile file) throws IOException {

        //如果不是Excel文件就返回错误
        if (file == null || (!("xlsx".equals(file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1))))) {
            return Result.fail(ErrorCode.FILE_NOT_FORWORD.getCode(), ErrorCode.FILE_NOT_FORWORD.getMsg());
        }
        ExcelReaderBuilder read = EasyExcel.read(file.getInputStream(), SysQuestionForExcel.class, new SysQuestionForExcelReadListener());
        // 封装工作表
        ExcelReaderSheetBuilder sheet1 = read.sheet();
        // 读取
        sheet1.doRead();

        int row = 0;
        List<WrongExcelRowVo> wrongExcelRowVoList = new ArrayList<>();
        for (SysQuestionForExcel data : SysQuestionForExcelReadListener.datas) {
            row++;
            if (data.getAnswer() == null || data.getQuestionContent() == null || data.getOptionA() == null || data.getOptionB() == null) {
                //如果以上这些参数为null，那么说明这个题目不符合规范，记录下来，返回给前端的是对应的 行数
                wrongExcelRowVoList.add(new WrongExcelRowVo(row, "题目，答案，选项A，选项B,必须都存在，但其中有一个不存在"));
                continue;
            }
            questionByExcelService.addQuestionByExcel(data);
            for (String q : QuestionByExcelServiceImpl.notExistTopic) {
                wrongExcelRowVoList.add(new WrongExcelRowVo(row, "知识点：“" + q+ "”不存在，请先添加对应的知识点"));
            }
            QuestionByExcelServiceImpl.notExistTopic.clear();
        }
        //返回这个数组，如果是null，那么说明没有不存在知识点，如果有，那么返回给前端，让前端知道有的知识点是不存在的
        return Result.success(wrongExcelRowVoList);

    }
}
