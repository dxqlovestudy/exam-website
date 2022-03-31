package com.whpu.utils;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.read.builder.ExcelReaderBuilder;
import com.alibaba.excel.read.builder.ExcelReaderSheetBuilder;
import com.whpu.module.excel.dao.SysQuestionForExcel;
import com.whpu.module.excel.dao.SysQuestionForExcelReadListener;
import com.whpu.module.question.dao.pojo.SysQuestion;
import com.whpu.vo.Result;
import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

/**
 * @description
 * @author: 唉 烁
 * @time: 2021/10/29 9:13
 */
@RestController
@RequestMapping("/test")
@Api(tags = "用于后端用于测试的接口，这个没啥用")
public class TestController {
    @PostMapping("/doInterceptor")
    public Result dotest() {
        return Result.fail(111, "拦截失败");
    }

    @PostMapping("uploadFile")
    public Result uploadFile(@RequestBody MultipartFile file) throws IOException {
        System.out.println(file.getOriginalFilename());

        // 读取文件，读取完之后会自动关闭
        /*
            pathName        文件路径；"d:\\模拟在线202003班学员信息.xls"
            head            每行数据对应的实体；Student.class
            readListener    读监听器，每读一样就会调用一次该监听器的invoke方法

            sheet方法参数： 工作表的顺序号（从0开始）或者工作表的名字，不传默认为0
        */
        // 封装工作簿对象
        ExcelReaderBuilder workBook = EasyExcel.read
                (file.getInputStream(), SysQuestionForExcel.class, new SysQuestionForExcelReadListener());

        // 封装工作表
        ExcelReaderSheetBuilder sheet1 = workBook.sheet();
        // 读取
        sheet1.doRead();

        return null;
    }
}
