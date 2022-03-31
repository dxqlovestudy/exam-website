package com.whpu.module.user.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.whpu.module.user.dao.pojo.SysStu;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author Adonis
 * @since 2022-01-07
 */
public interface SysStuService extends IService<SysStu> {

    List<SysStu> getAllStudentInfo(List<String> studentId);

    SysStu getOwnStudentInfo(String studentId);

    void addStudentInfo(String studentId,String nickName);

    int changeStudentInfo(int trueNum, int falseNum, String userId);
}
