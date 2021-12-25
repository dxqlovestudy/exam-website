package com.whpu.vo;

import lombok.Data;

import java.util.List;

/**
 * @description
 * @author: 唉 烁
 * @time: 2021/11/17 8:37
 */
@Data
public class ExerciseRandomVo {
    List<QuestionVo> questions;
    Integer size;
    String examTime;
    String examId;
    Integer totalPoints;
}
