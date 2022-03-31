package com.whpu;



import com.baomidou.mybatisplus.extension.api.R;
import com.whpu.module.loginAndResgiter.dao.pojo.User;
import com.whpu.module.question.dao.mapper.SysQuestionTopicsMapper;
import com.whpu.module.question.dao.pojo.QuestionTopics;
import com.whpu.module.question.service.SysQuestionService;
import com.whpu.module.loginAndResgiter.service.UserService;
import com.whpu.vo.params.QuestionParam;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.*;

@SpringBootTest
class ApiExamApplicationTests {

    @Autowired
    private UserService userService;
    @Autowired
    private SysQuestionTopicsMapper sysQuestionTopicsMapper;
    @Autowired
    private SysQuestionService questionService;
    @Autowired
    private SysQuestionService sysQuestionService;

    @Test
    void contextLoads() {
    }

    @Test
    public void testDb() {
        User user = new User();
        user.setAccount("admin");
        user.setPassword("123456");
        user.setNickName("小明");
        user.setIdentity("student");
        userService.addUser(user);
    }

    @Test
    public void test() {
        for (int i = 0; i < 99
                ; i++) {
            QuestionParam questionParam = new QuestionParam();
            questionParam.setQuestionContent("企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量");
            questionParam.setAnalyse("暂无");
            questionParam.setAnswer("A");
            questionParam.setOptionA("正确");
            questionParam.setOptionB("错误");
            questionService.addSysQuestion(questionParam);
        }
        for (int i = 0; i < 100; i++) {
            QuestionParam questionParam = new QuestionParam();
            questionParam.setQuestionContent("下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?");
            questionParam.setAnalyse("暂无");
            questionParam.setAnswer("A");
            questionParam.setOptionA("对比配置法");
            questionParam.setOptionB("自项向下法");
            questionParam.setOptionC("自底向上法");
            questionParam.setOptionD("替换法");
            questionService.addSysQuestion(questionParam);
        }

    }

    @Test
    public void testSql()
    {
        sysQuestionTopicsMapper.findQuestionByTopics(1);
        sysQuestionTopicsMapper.findTopicByQuestionId("1");
    }
    @Test
    public void addTestTopicAndQuestion()
    {
        QuestionParam questionParam = new QuestionParam();
        questionParam.setQuestionContent("当前华为的防火墙产品USG6X00系列， 属于UTM防火墙产品，其在支持状态检测包过滤的同时， 还支持入侵检测， 反病毒和URL过德等功能");
        questionParam.setAnswer("B");
        questionParam.setAnsNum(0);
        questionParam.setOptionA("正确");
        questionParam.setOptionB("错误");
        questionParam.setOptionC("");
        questionParam.setOptionD("");
        questionParam.setOptionE("");

        Random r = new Random();
       Set<Integer> set = new HashSet<>();
       while(set.size()<2)
       {
           set.add(r.nextInt(4)+1);
       }
        questionParam.setTopics(new ArrayList<>(set));
        sysQuestionService.addSysQuestion(questionParam);
    }
}
