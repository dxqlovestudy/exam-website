package com.whpu.handler;

import com.whpu.vo.Result;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @description
 * @author: 唉 烁
 * @time: 2021/10/27 23:06
 */
//对加了@Controller注解的方法进行拦截处理AOP的实现
@ControllerAdvice
public class AllExceptionHandler {

    //进行异常处理，对Exception进行处理，即对所有错误进行处理
    @ExceptionHandler(Exception.class)
    @ResponseBody
    public Result doException(Exception e) {
        e.printStackTrace();
        return Result.fail(-999, "系统异常");
    }


}
