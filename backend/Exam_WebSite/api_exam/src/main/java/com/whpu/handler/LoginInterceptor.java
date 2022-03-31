package com.whpu.handler;

import com.alibaba.fastjson.JSON;
import com.whpu.module.loginAndResgiter.dao.pojo.User;
import com.whpu.module.loginAndResgiter.service.LoginAndRegisterService;
import com.whpu.utils.JWTUtils;
import com.whpu.utils.UserThreadLocal;
import com.whpu.vo.ErrorCode;
import com.whpu.vo.Result;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * @description
 * @author: 唉 烁
 * @time: 2021/10/28 23:00
 */
@Component
@Slf4j
public class LoginInterceptor implements HandlerInterceptor {

    @Autowired
    LoginAndRegisterService loginAndRegisterService;
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
                             Object handler) throws Exception {
        /**
         * @description:在执行方法前进行执行方法
         *1，需要判断，请求的接口路径是否为 HandlerMethod（controller方法）
         *2，判断token 是否为空，如果为空，未登录
         * 3，如果token不为空，登录验证，loginAndRegistryService 中有checkToken 方法
         */
        if(!(handler instanceof HandlerMethod))
        {
            return true;
        }

        System.out.println("开始拦截");
        log.info("====================request start==============");
        String requestURL = request.getRequestURI();
        log.info("request uri{}",requestURL);
        log.info("request method:{}",request.getMethod());
        log.info("===================request end==============");

        String token = request.getHeader("Authorization");
        System.out.println(token);
        if(StringUtils.isBlank(token))
        {
           Result result =Result.fail(ErrorCode.NO_LOGIN.getCode(),ErrorCode.NO_LOGIN.getMsg());
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().print(JSON.toJSONString(result));
            return false;
        }

        Result getResult = loginAndRegisterService.checkToken(token);
        User user = (User) getResult.getData();
        if(user==null)
        {
            Result result =Result.fail(ErrorCode.NO_LOGIN.getCode(),ErrorCode.NO_LOGIN.getMsg());
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().print(JSON.toJSONString(result));
            return false;
        }
        //登录验证成功，放行
        //要在controller中，直接获取用户的信息
        UserThreadLocal.put(user);
        return true;
    }


    /**
     * 所有方法执行完了就会调用这个方法
     */
    @Override
    public void afterCompletion(HttpServletRequest request,
                                HttpServletResponse response, Object handler, Exception ex) throws Exception {
        //如果不删除ThreadLocal中用完的内容 会有内存泄露的风险
        UserThreadLocal.remove();
    }
}
