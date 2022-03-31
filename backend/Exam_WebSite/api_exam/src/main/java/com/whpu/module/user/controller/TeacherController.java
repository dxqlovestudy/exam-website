package com.whpu.module.user.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.whpu.module.exam.dao.pojo.ExamRecording;
import com.whpu.module.exam.service.ExamRecordingService;
import com.whpu.module.loginAndResgiter.dao.pojo.User;
import com.whpu.module.loginAndResgiter.service.LoginAndRegisterService;
import com.whpu.module.user.dao.pojo.SysStu;
import com.whpu.module.user.service.SysStuService;
import com.whpu.utils.UserThreadLocal;
import com.whpu.vo.*;
import com.whpu.vo.params.RegisterParam;
import com.whpu.module.user.service.StuTeacherService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.models.auth.In;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/teacher")
@Transactional
@Api(tags = "教师自有操作")
public class TeacherController {
    @Autowired
    private LoginAndRegisterService loginAndRegisterService;
    @Autowired
    private StuTeacherService stuTeacherService;
    @Autowired
    private SysStuService sysStuService;
    @Autowired
    private ExamRecordingService examRecordingService;

    @PostMapping("addStudent")
    @ApiOperation("添加一个学生，并且这个学生从属于这个教师")
    public Result addStudent(@RequestBody RegisterParam registerParam) {
        //①首先判断 参数是否有问题
        if (registerParam.getAccount() == null ||
                registerParam.getNickName() == null ||
                registerParam.getPassword() == null) {
            return Result.fail(ErrorCode.PARAMS_ERROR.getCode(), ErrorCode.PARAMS_ERROR.getMsg());
        }
        //② 将对应的学生添加到登录管理的user表中
        Result result = loginAndRegisterService.registerStudent(registerParam);

        if (result.getData() != null) {
            //③得到学生与老师的Id 添加到学生与老师的对应表中
            User student = (User) result.getData();
             String teacherId = UserThreadLocal.get().getUserId();

           //测试用的数据 String teacherId = "1463502680960798722";
            stuTeacherService.addStudent(student.getUserId(), teacherId);

            //④为学生新建一个学生的信息表
            sysStuService.addStudentInfo(student.getUserId(), student.getNickName());
        }
        return result;
    }

    @GetMapping("getAllOwnStudentInfo")
    @ApiOperation("教师获取到自己所有学生的总评情况")
    public Result<GetAllStudentInfoVo> getAllStudent() {
        String teacherId = UserThreadLocal.get().getUserId();
        //测试用String teacherId = "1463502680960798722";
        List<String> allStudentId = stuTeacherService.getAllStudentId(teacherId);
        List<SysStu> allStudentInfo = sysStuService.getAllStudentInfo(allStudentId);
        GetAllStudentInfoVo getAllStudentInfoVo = new GetAllStudentInfoVo();
        getAllStudentInfoVo.setAllStudentInfo(allStudentInfo);
        return Result.success(getAllStudentInfoVo);
    }

    @ApiOperation("教师获取到某个学生的所有考试记录")
    @GetMapping("getStudentExamInfo/{id}/{currentPage}/pageSize")
    public Result<GetAllStudentInfoVo> getStudentExamInfo(@PathVariable String studentId, @PathVariable Integer currentPage, @PathVariable Integer pageSize) {
        IPage<ExamRecording> allExamRecording = examRecordingService.getAllExamRecording(studentId, pageSize, currentPage);
        GetExamRecordingInfo examRecordingInfo = new GetExamRecordingInfo();
        examRecordingInfo.setAllExamRecording(allExamRecording);
        return Result.success(examRecordingInfo);
    }
}
