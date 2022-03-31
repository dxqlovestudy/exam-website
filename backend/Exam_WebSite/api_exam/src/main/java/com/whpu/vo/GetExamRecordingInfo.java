package com.whpu.vo;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.whpu.module.exam.dao.pojo.ExamRecording;
import lombok.Data;

import java.util.List;

@Data
public class GetExamRecordingInfo {
    private IPage<ExamRecording> allExamRecording;
}
