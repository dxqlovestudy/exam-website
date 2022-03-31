package com.whpu.module.exam.service;

import com.whpu.vo.Result;
import com.whpu.vo.params.SubmitParam;

public interface StuSubmitService {
    Result submit(SubmitParam submitParam,String userId);
}
