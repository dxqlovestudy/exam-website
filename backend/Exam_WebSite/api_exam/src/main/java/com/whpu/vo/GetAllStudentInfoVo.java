package com.whpu.vo;

import com.whpu.module.user.dao.pojo.SysStu;
import io.swagger.annotations.ApiModel;
import lombok.Data;

import java.util.List;

@Data
@ApiModel("得到该老师手下所有学生的信息")
public class GetAllStudentInfoVo {
   private List<SysStu> allStudentInfo;
}
