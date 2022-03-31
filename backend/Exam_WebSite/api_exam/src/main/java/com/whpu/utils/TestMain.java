package com.whpu.utils;

import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.config.DataSourceConfig;
import com.baomidou.mybatisplus.generator.config.GlobalConfig;
import com.baomidou.mybatisplus.generator.config.PackageConfig;
import com.baomidou.mybatisplus.generator.config.StrategyConfig;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import com.whpu.module.question.dao.mapper.SysQuestionTopicsMapper;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @description
 * @author: 唉 烁
 * @time: 2021/11/23 19:47
 */
public class TestMain {

    @Test
    public void test01() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
        String date = simpleDateFormat.format(System.currentTimeMillis());
        System.out.println(date);
        System.out.println(System.currentTimeMillis());
    }

    @Test
    public void test02() {
        AutoGenerator mg = new AutoGenerator();
        GlobalConfig globalConfig = new GlobalConfig();
        globalConfig.setOutputDir(System.getProperty("user.dir") + "/src/main/java/");
        globalConfig.setAuthor("Adonis");
        globalConfig.setOpen(false);
        globalConfig.setServiceName("%sService");
        globalConfig.setServiceImplName("%sServiceImpl");
        mg.setGlobalConfig(globalConfig);

        DataSourceConfig dataSourceConfig = new DataSourceConfig();
        dataSourceConfig.setUrl("jdbc:mysql://101.43.47.172:3306/exam?useUnicode=true&characterEncoding=UTF-8&serverTimeZone=UTC");
        dataSourceConfig.setDriverName("com.mysql.cj.jdbc.Driver");
        dataSourceConfig.setUsername("root");
        dataSourceConfig.setPassword("0920");
        mg.setDataSource(dataSourceConfig);

        PackageConfig pc = new PackageConfig();
        pc.setParent("com.whpu.module.user");
        mg.setPackageInfo(pc);

        StrategyConfig sc = new StrategyConfig();
        sc.setInclude("sys_stu");
        sc.setColumnNaming(NamingStrategy.underline_to_camel);
        sc.setNaming(NamingStrategy.underline_to_camel);
        mg.setStrategy(sc);

        mg.execute();


    }
}
