package com.whpu.module.user.dao.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;

/**
 * <p>
 * 学生与教师映射表
 * </p>
 *
 * @author Adonis
 * @since 2022-01-07
 */
public class StuTeacher implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 学生ID
     */
    @TableField("stuId")
    private String stuid;

    /**
     * 教师ID
     */
    @TableField("teacherId")
    private String teacherid;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStuid() {
        return stuid;
    }

    public void setStuid(String stuid) {
        this.stuid = stuid;
    }

    public String getTeacherid() {
        return teacherid;
    }

    public void setTeacherid(String teacherid) {
        this.teacherid = teacherid;
    }

    @Override
    public String toString() {
        return "StuTeacher{" +
        "id=" + id +
        ", stuid=" + stuid +
        ", teacherid=" + teacherid +
        "}";
    }
}
