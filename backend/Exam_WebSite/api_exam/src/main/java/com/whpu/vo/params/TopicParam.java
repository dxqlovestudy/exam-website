package com.whpu.vo.params;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
@ApiModel("知识点参数，提供给知识点的增删改查")
public class TopicParam {
    @ApiModelProperty("知识点")
    private String topic;
}
