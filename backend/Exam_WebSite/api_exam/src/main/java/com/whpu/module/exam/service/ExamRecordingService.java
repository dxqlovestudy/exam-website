package com.whpu.module.exam.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.whpu.module.exam.dao.pojo.ExamRecording;

import java.util.List;

/**
 * @description
 * @author: 唉 烁
 * @time: 2021/11/8 20:58
 */
public interface ExamRecordingService {
    String addExamRecordingService(Integer questionNum,String examType);
    IPage<ExamRecording> getAllExamRecording(String studentId, Integer PageSize, Integer currentPage);
}
