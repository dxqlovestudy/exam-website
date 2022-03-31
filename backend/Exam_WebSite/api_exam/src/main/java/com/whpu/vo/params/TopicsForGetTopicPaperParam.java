package com.whpu.vo.params;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.ArrayList;

@Data
@ApiModel("专题组卷时的参数")
public class TopicsForGetTopicPaperParam {
    @ApiModelProperty("知识点数组,数组中是知识点的id")
    private ArrayList<Integer> topics;
    @ApiModelProperty("题目数量")
    private Integer questionNum;
}
