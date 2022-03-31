package com.whpu.module.user.dao.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author Adonis
 * @since 2022-01-08
 */
public class SysStu implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 自增Id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 学生Id
     */
    @TableField("stu_id")
    private String stuId;

    /**
     * 学生昵称
     */
    @TableField("nickName")
    private String nickname;

    /**
     * 总分
     */
    private Integer totalScore;

    /**
     * 错题数
     */
    private Integer wrongAnsNum;

    /**
     * 正确率
     */
    private Double accuracy;

    /**
     * 练习次数
     */
    private Integer exerTimes;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStuId() {
        return stuId;
    }

    public void setStuId(String stuId) {
        this.stuId = stuId;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public Integer getTotalScore() {
        return totalScore;
    }

    public void setTotalScore(Integer totalScore) {
        this.totalScore = totalScore;
    }

    public Integer getWrongAnsNum() {
        return wrongAnsNum;
    }

    public void setWrongAnsNum(Integer wrongAnsNum) {
        this.wrongAnsNum = wrongAnsNum;
    }

    public Double getAccuracy() {
        return accuracy;
    }

    public void setAccuracy(Double accuracy) {
        this.accuracy = accuracy;
    }

    public Integer getExerTimes() {
        return exerTimes;
    }

    public void setExerTimes(Integer exerTimes) {
        this.exerTimes = exerTimes;
    }

    @Override
    public String toString() {
        return "SysStu{" +
        "id=" + id +
        ", stuId=" + stuId +
        ", nickname=" + nickname +
        ", totalScore=" + totalScore +
        ", wrongAnsNum=" + wrongAnsNum +
        ", accuracy=" + accuracy +
        ", exerTimes=" + exerTimes +
        "}";
    }
}
