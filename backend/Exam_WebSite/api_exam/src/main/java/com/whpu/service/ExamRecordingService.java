package com.whpu.service;

import com.whpu.dao.pojo.ExamRecording;

import java.util.List;

/**
 * @description
 * @author: 唉 烁
 * @time: 2021/11/8 20:58
 */
public interface ExamRecordingService {
    String addExamRecordingService();
    List<ExamRecording> getAllExamRecording(String studentId);
}
