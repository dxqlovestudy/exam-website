package com.whpu.module.user.service;

import com.whpu.module.user.dao.pojo.StuTeacher;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 学生与教师映射表 服务类
 * </p>
 *
 * @author Adonis
 * @since 2022-01-07
 */
public interface StuTeacherService extends IService<StuTeacher> {
    int addStudent(String studentId, String teacherId);

    List<String> getAllStudentId(String teacherId);
}
