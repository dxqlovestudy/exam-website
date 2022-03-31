package com.whpu.module.question.dao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.whpu.module.question.dao.pojo.SysQuestion;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface SysQuestionMapper extends BaseMapper<SysQuestion> {
}
