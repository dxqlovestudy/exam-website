package com.whpu.module.user.service.Impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.whpu.module.loginAndResgiter.dao.mapper.UserMapper;
import com.whpu.module.loginAndResgiter.dao.pojo.User;
import com.whpu.module.user.dao.mapper.SysStuMapper;
import com.whpu.module.user.dao.pojo.SysStu;
import com.whpu.module.user.service.SysStuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author Adonis
 * @since 2022-01-07
 */
@Service
@Transactional
public class SysStuServiceImpl extends ServiceImpl<SysStuMapper, SysStu> implements SysStuService {

    @Autowired
    public SysStuMapper sysStuMapper;
    @Autowired
    public UserMapper userMapper;
    @Override
    public List<SysStu> getAllStudentInfo(List<String> studentId) {
        List<SysStu> sysStuList = new ArrayList<>();
        studentId.forEach(s->{
            QueryWrapper<SysStu> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("stu_id",s);
            SysStu sysStu = sysStuMapper.selectOne(queryWrapper);

            QueryWrapper<User> queryWrapper1 = new QueryWrapper<>();
            queryWrapper1.eq("studentId",s);
            sysStuList.add(sysStu);
        });
        return sysStuList;
    }

    @Override
    public SysStu getOwnStudentInfo(String studentId) {

            QueryWrapper<SysStu> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("stu_id",studentId);
            SysStu sysStu = sysStuMapper.selectOne(queryWrapper);

        return sysStu;
    }

    @Override
    public void addStudentInfo(String studentId,String nickName) {
        SysStu sysStu = new SysStu();
        sysStu.setStuId(studentId);
        sysStu.setNickname(nickName);
        sysStuMapper.insert(sysStu);
    }

    @Override
    public int changeStudentInfo(int trueNum, int falseNum, String userId) {
        //①首先将这个学生的信息查出来
        QueryWrapper<SysStu> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("stu_id",userId);
        SysStu sysStu = sysStuMapper.selectOne(queryWrapper);

        //②拿到信息后 修改学生信息
        sysStu.setTotalScore(sysStu.getTotalScore()+trueNum);
        sysStu.setWrongAnsNum(sysStu.getWrongAnsNum()+falseNum);
        sysStu.setAccuracy((1.00)*sysStu.getTotalScore()/(sysStu.getTotalScore()+sysStu.getWrongAnsNum()));
        sysStu.setExerTimes(sysStu.getExerTimes()+1);

        int i = sysStuMapper.updateById(sysStu);
        return i;
    }
}
