package com.whpu.module.user.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.whpu.module.user.dao.pojo.StuTeacher;
import com.whpu.module.user.dao.mapper.StuTeacherMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.whpu.module.user.service.StuTeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 学生与教师映射表 服务实现类
 * </p>
 *
 * @author Adonis
 * @since 2022-01-07
 */
@Service
@Transactional
public class StuTeacherServiceImpl extends ServiceImpl<StuTeacherMapper, StuTeacher> implements StuTeacherService {

    @Autowired
    private StuTeacherMapper stuTeacherMapper;
    @Override
    public int addStudent(String studentId, String teacherId) {
        StuTeacher stuTeacher = new StuTeacher();
        stuTeacher.setStuid(studentId);
        stuTeacher.setTeacherid(teacherId);
        stuTeacherMapper.insert(stuTeacher);
        return 0;
    }

    public List<String> getAllStudentId(String teacherId)
    {
        QueryWrapper<StuTeacher> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("teacherId",teacherId);
        List<StuTeacher> stuTeachers = stuTeacherMapper.selectList(queryWrapper);
        List<String> studentIdList = new ArrayList<>();
        stuTeachers.forEach(s->{
            studentIdList.add(s.getStuid());
        });
        return studentIdList;
    }
}
