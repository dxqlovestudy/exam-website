package com.whpu.vo.params;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ApiModel("用于获取首页中 所有考试记录信息")
public class ExamRecordingPageParam {
    @ApiModelProperty("当前页面")
    Integer currentPage ;
    @ApiModelProperty("每个页面的记录数")
    Integer pageSize ;
}
