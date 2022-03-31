/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : exam

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 07/12/2021 15:15:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for stu_ans_recording
-- ----------------------------
DROP TABLE IF EXISTS `stu_ans_recording`;
CREATE TABLE `stu_ans_recording`  (
  `Id` char(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `studentId` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `exam_recording_Id` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `questionId` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `answer` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `stuAnswer` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `judgment` int(1) NOT NULL DEFAULT -1 COMMENT '对于对错进行判断，对的是1，错的是0，没做的是-1',
  `question_type` int(1) NULL DEFAULT -1,
  `status` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stu_ans_recording
-- ----------------------------

-- ----------------------------
-- Table structure for stu_exam_recording
-- ----------------------------
DROP TABLE IF EXISTS `stu_exam_recording`;
CREATE TABLE `stu_exam_recording`  (
  `examRecordingId` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '考试记录的主键Id',
  `studentId` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生Id',
  `questionNum` int(11) NOT NULL COMMENT '题目数量',
  `totalScore` int(11) NOT NULL COMMENT '学生得分',
  `wrongAnsNum` int(11) NOT NULL COMMENT '学生错题数',
  `availability` int(11) NOT NULL DEFAULT 1 COMMENT '考试是否有效，默认是1，有效',
  `isFinish` int(1) NOT NULL DEFAULT 0 COMMENT '是否已经交卷，默认是0，交卷了是1',
  `examType` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '考试类型：包含随机（random）等',
  `spendTime` bigint(20) NOT NULL DEFAULT 0 COMMENT '学生花费的时间，单位，分钟',
  `submitTime` bigint(20) NOT NULL COMMENT '考试提交时间',
  `limitTime` bigint(20) NULL DEFAULT NULL COMMENT '限时时长',
  PRIMARY KEY (`examRecordingId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stu_exam_recording
-- ----------------------------

-- ----------------------------
-- Table structure for stu_wrong_que
-- ----------------------------
DROP TABLE IF EXISTS `stu_wrong_que`;
CREATE TABLE `stu_wrong_que`  (
  `id` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `studentId` char(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `questionId` char(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `recordingId` char(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `studentAns` char(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stu_wrong_que
-- ----------------------------

-- ----------------------------
-- Table structure for sys_question
-- ----------------------------
DROP TABLE IF EXISTS `sys_question`;
CREATE TABLE `sys_question`  (
  `questionId` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AnsNum` int(1) NOT NULL DEFAULT 0,
  `questionContent` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `optionA` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `optionB` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `optionC` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `optionD` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `optionE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `optionF` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `optionG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Answer` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Analyse` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '暂无',
  PRIMARY KEY (`questionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_question
-- ----------------------------
INSERT INTO `sys_question` VALUES ('1468114752323489794', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', '', '', NULL, NULL, NULL, 'A', '');
INSERT INTO `sys_question` VALUES ('1468116169004273665', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116180119179265', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116180161122306', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116180203065345', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116180236619778', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116180295340034', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116180328894465', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116180379226114', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116180421169153', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116180454723585', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116180479889410', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116180538609665', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116180588941314', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116180630884353', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116180664438785', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116180706381826', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116180781879298', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116180815433730', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116180844793858', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116180907708418', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116180953845761', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116180991594498', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116181008371713', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116181041926145', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116181075480577', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116181100646402', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116181125812226', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116181159366657', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116181184532482', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116181218086914', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116181251641346', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116181285195777', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116181301972993', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116181343916034', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116181364887553', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116181436190721', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116181461356545', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116181486522370', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116181511688193', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116181553631234', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116181578797058', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116181612351490', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116181637517314', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116181654294530', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116181696237570', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116181708820482', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116181742374914', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116181759152130', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116181792706562', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116181809483777', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116181843038210', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116181859815426', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116181876592642', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116181905952769', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116181922729986', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116181956284417', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116181973061633', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116182006616065', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116182035976193', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116182052753410', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116182069530626', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116182103085058', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116182119862274', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116182157611009', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116182186971137', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116182203748354', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116182279245826', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116182300217346', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116182312800257', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116182358937602', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116182375714817', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116182396686338', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116182434435074', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116182493155330', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116182526709761', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116182543486978', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116182560264193', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116182589624321', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116182623178754', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116182656733186', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116182673510402', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116182719647746', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116182736424961', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116182753202178', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116182790950914', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116182807728130', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116182832893954', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116182874836994', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116182900002818', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116182916780033', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116182941945858', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116182962917378', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116182979694594', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116182996471810', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116183042609154', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116183076163585', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116183126495233', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116183155855362', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116183201992706', 0, '企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量', '正确', '错误', NULL, NULL, NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116183227158529', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116183252324354', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116183281684481', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116183298461698', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116183332016129', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116183365570561', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116183394930690', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116183394930691', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116183487205377', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116183524954113', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116183541731329', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116183571091457', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116183587868673', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116183621423106', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116183638200322', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116183654977537', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116183671754754', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116183688531970', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116183722086402', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116183738863618', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116183768223745', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116183789195266', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116183805972482', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116183839526914', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116183856304130', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116183873081346', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116183889858561', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116183919218689', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116183956967426', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184015687682', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184086990850', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184099573761', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184116350977', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184133128193', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184149905410', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184183459842', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184200237057', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184217014274', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184254763010', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184279928834', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184296706049', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184313483266', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184330260481', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184347037698', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184363814914', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184376397826', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184393175042', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184426729473', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184443506690', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184460283906', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184477061122', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184493838337', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184510615554', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184527392769', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184544169986', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184560947201', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184577724418', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184607084545', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184623861761', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184640638977', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184657416193', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184674193410', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184690970626', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184707747841', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184741302274', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184758079490', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184774856706', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184791633922', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184825188353', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184841965569', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184858742785', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184892297218', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184909074434', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184925851649', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184942628865', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184976183298', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116184992960513', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116185009737730', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116185026514946', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116185039097858', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116185055875074', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116185072652290', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116185106206722', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116185122983938', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116185139761153', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116185156538370', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116185173315585', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116185190092802', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116185223647234', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116185236230146', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116185253007361', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116185269784578', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116185286561793', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116185303339009', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116185332699137', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116185349476354', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116185366253570', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116185383030785', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116185399808002', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');
INSERT INTO `sys_question` VALUES ('1468116185416585218', 0, '下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?', '对比配置法', '自项向下法', '自底向上法', '替换法', NULL, NULL, NULL, 'A', '暂无');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(11) NOT NULL,
  `role` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'Student');
INSERT INTO `sys_role` VALUES (2, 'Teacher');
INSERT INTO `sys_role` VALUES (3, 'SchoolManager');
INSERT INTO `sys_role` VALUES (4, 'Manager');

-- ----------------------------
-- Table structure for sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user`  (
  `id` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `roleId` int(11) NOT NULL,
  `userId` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `userId` bigint(15) NOT NULL,
  `account` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nickName` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `identity` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userState` int(1) NOT NULL DEFAULT 1,
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1463502680960798722, '123456', 'd4fab0d24bcda737025efbbc39b6e366', '刘老师', 'Teacher', 1, NULL);
INSERT INTO `sys_user` VALUES (1463503074629783554, '123456', 'd4fab0d24bcda737025efbbc39b6e366', '小明', 'Student', 1, NULL);

-- ----------------------------
-- Table structure for teach_self_question
-- ----------------------------
DROP TABLE IF EXISTS `teach_self_question`;
CREATE TABLE `teach_self_question`  (
  `questionId` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AnsNum` int(1) NOT NULL DEFAULT 0,
  `questionContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `optionA` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `optionB` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `optionC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `optionD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `optionE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `optionF` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `optionG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Analyse` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacherId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`questionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teach_self_question
-- ----------------------------
INSERT INTO `teach_self_question` VALUES ('1460634224225681410', 0, '261+258=?', '519', '507', '506', '505', NULL, NULL, NULL, '519', '261+258=519', '');
INSERT INTO `teach_self_question` VALUES ('1460634224393453570', 0, '721+992=?', '1698', '1699', '1707', '1713', NULL, NULL, NULL, '1713', '721+992=1713', '');
INSERT INTO `teach_self_question` VALUES ('1460634224422813698', 0, '170+660=?', '824', '830', '824', '821', NULL, NULL, NULL, '830', '170+660=830', '');
INSERT INTO `teach_self_question` VALUES ('1460634224485728257', 0, '989+996=?', '1985', '1973', '1972', '1970', NULL, NULL, NULL, '1985', '989+996=1985', '');
INSERT INTO `teach_self_question` VALUES ('1460634224548642817', 0, '381+488=?', '869', '855', '861', '863', NULL, NULL, NULL, '869', '381+488=869', '');
INSERT INTO `teach_self_question` VALUES ('1460634224548642818', 0, '584+139=?', '712', '712', '723', '716', NULL, NULL, NULL, '723', '584+139=723', '');
INSERT INTO `teach_self_question` VALUES ('1460634224682860546', 0, '199+222=?', '406', '407', '421', '410', NULL, NULL, NULL, '421', '199+222=421', '');
INSERT INTO `teach_self_question` VALUES ('1460634224766746626', 0, '726+587=?', '1307', '1298', '1313', '1306', NULL, NULL, NULL, '1313', '726+587=1313', '');
INSERT INTO `teach_self_question` VALUES ('1460634224766746627', 0, '295+857=?', '1141', '1152', '1142', '1144', NULL, NULL, NULL, '1152', '295+857=1152', '');
INSERT INTO `teach_self_question` VALUES ('1460634224825466882', 0, '735+310=?', '1035', '1045', '1039', '1034', NULL, NULL, NULL, '1045', '735+310=1045', '');
INSERT INTO `teach_self_question` VALUES ('1460634224884187137', 0, '243+657=?', '900', '888', '886', '885', NULL, NULL, NULL, '900', '243+657=900', '');
INSERT INTO `teach_self_question` VALUES ('1460634224972267521', 0, '675+29=?', '695', '704', '689', '690', NULL, NULL, NULL, '704', '675+29=704', '');
INSERT INTO `teach_self_question` VALUES ('1460634225047764994', 0, '353+518=?', '871', '862', '856', '864', NULL, NULL, NULL, '871', '353+518=871', '');
INSERT INTO `teach_self_question` VALUES ('1460634225089708033', 0, '152+355=?', '507', '500', '500', '493', NULL, NULL, NULL, '507', '152+355=507', '');
INSERT INTO `teach_self_question` VALUES ('1460634225152622594', 0, '982+935=?', '1909', '1917', '1907', '1910', NULL, NULL, NULL, '1917', '982+935=1917', '');
INSERT INTO `teach_self_question` VALUES ('1460634225219731457', 0, '972+648=?', '1606', '1606', '1620', '1605', NULL, NULL, NULL, '1620', '972+648=1620', '');
INSERT INTO `teach_self_question` VALUES ('1460634225291034625', 0, '128+545=?', '660', '673', '663', '665', NULL, NULL, NULL, '673', '128+545=673', '');
INSERT INTO `teach_self_question` VALUES ('1460634225353949186', 0, '302+410=?', '700', '706', '699', '712', NULL, NULL, NULL, '712', '302+410=712', '');
INSERT INTO `teach_self_question` VALUES ('1460634225353949187', 0, '29+103=?', '123', '122', '132', '124', NULL, NULL, NULL, '132', '29+103=132', '');
INSERT INTO `teach_self_question` VALUES ('1460634225442029570', 0, '522+432=?', '946', '944', '942', '954', NULL, NULL, NULL, '954', '522+432=954', '');
INSERT INTO `teach_self_question` VALUES ('1460634225483972610', 0, '184+572=?', '756', '745', '750', '750', NULL, NULL, NULL, '756', '184+572=756', '');
INSERT INTO `teach_self_question` VALUES ('1460634225483972611', 0, '471+984=?', '1449', '1455', '1449', '1445', NULL, NULL, NULL, '1455', '471+984=1455', '');
INSERT INTO `teach_self_question` VALUES ('1460634225483972612', 0, '967+617=?', '1584', '1574', '1570', '1571', NULL, NULL, NULL, '1584', '967+617=1584', '');
INSERT INTO `teach_self_question` VALUES ('1460634225546887169', 0, '3+78=?', '74', '68', '74', '81', NULL, NULL, NULL, '81', '3+78=81', '');
INSERT INTO `teach_self_question` VALUES ('1460634225546887170', 0, '820+341=?', '1161', '1155', '1146', '1151', NULL, NULL, NULL, '1161', '820+341=1161', '');
INSERT INTO `teach_self_question` VALUES ('1460634225626578946', 0, '723+337=?', '1060', '1051', '1045', '1051', NULL, NULL, NULL, '1060', '723+337=1060', '');
INSERT INTO `teach_self_question` VALUES ('1460634225626578947', 0, '476+456=?', '932', '918', '920', '921', NULL, NULL, NULL, '932', '476+456=932', '');
INSERT INTO `teach_self_question` VALUES ('1460634225681104897', 0, '542+821=?', '1363', '1356', '1352', '1349', NULL, NULL, NULL, '1363', '542+821=1363', '');
INSERT INTO `teach_self_question` VALUES ('1460634225681104898', 0, '459+136=?', '595', '587', '581', '585', NULL, NULL, NULL, '595', '459+136=595', '');
INSERT INTO `teach_self_question` VALUES ('1460634225681104899', 0, '261+821=?', '1071', '1082', '1071', '1068', NULL, NULL, NULL, '1082', '261+821=1082', '');
INSERT INTO `teach_self_question` VALUES ('1460634225748213762', 0, '339+459=?', '798', '784', '789', '789', NULL, NULL, NULL, '798', '339+459=798', '');
INSERT INTO `teach_self_question` VALUES ('1460634225748213763', 0, '561+909=?', '1463', '1470', '1461', '1455', NULL, NULL, NULL, '1470', '561+909=1470', '');
INSERT INTO `teach_self_question` VALUES ('1460634225748213764', 0, '369+818=?', '1187', '1174', '1180', '1177', NULL, NULL, NULL, '1187', '369+818=1187', '');
INSERT INTO `teach_self_question` VALUES ('1460634225811128322', 0, '606+109=?', '700', '715', '705', '704', NULL, NULL, NULL, '715', '606+109=715', '');
INSERT INTO `teach_self_question` VALUES ('1460634225811128323', 0, '279+764=?', '1037', '1043', '1029', '1030', NULL, NULL, NULL, '1043', '279+764=1043', '');
INSERT INTO `teach_self_question` VALUES ('1460634225811128324', 0, '790+907=?', '1683', '1697', '1685', '1683', NULL, NULL, NULL, '1697', '790+907=1697', '');
INSERT INTO `teach_self_question` VALUES ('1460634225878237186', 0, '607+934=?', '1541', '1534', '1531', '1529', NULL, NULL, NULL, '1541', '607+934=1541', '');
INSERT INTO `teach_self_question` VALUES ('1460634225878237187', 0, '677+933=?', '1596', '1610', '1598', '1595', NULL, NULL, NULL, '1610', '677+933=1610', '');
INSERT INTO `teach_self_question` VALUES ('1460634225878237188', 0, '818+684=?', '1488', '1502', '1496', '1491', NULL, NULL, NULL, '1502', '818+684=1502', '');
INSERT INTO `teach_self_question` VALUES ('1460634225878237189', 0, '732+937=?', '1662', '1658', '1663', '1669', NULL, NULL, NULL, '1669', '732+937=1669', '');
INSERT INTO `teach_self_question` VALUES ('1460634225941151745', 0, '527+706=?', '1219', '1233', '1223', '1224', NULL, NULL, NULL, '1233', '527+706=1233', '');
INSERT INTO `teach_self_question` VALUES ('1460634225941151746', 0, '918+341=?', '1251', '1248', '1259', '1245', NULL, NULL, NULL, '1259', '918+341=1259', '');
INSERT INTO `teach_self_question` VALUES ('1460634225941151747', 0, '23+737=?', '745', '760', '754', '754', NULL, NULL, NULL, '760', '23+737=760', '');
INSERT INTO `teach_self_question` VALUES ('1460634226008260610', 0, '330+549=?', '873', '868', '879', '865', NULL, NULL, NULL, '879', '330+549=879', '');
INSERT INTO `teach_self_question` VALUES ('1460634226008260611', 0, '550+85=?', '625', '624', '635', '629', NULL, NULL, NULL, '635', '550+85=635', '');
INSERT INTO `teach_self_question` VALUES ('1460634226008260612', 0, '939+145=?', '1084', '1073', '1072', '1073', NULL, NULL, NULL, '1084', '939+145=1084', '');
INSERT INTO `teach_self_question` VALUES ('1460634226008260613', 0, '828+286=?', '1102', '1107', '1107', '1114', NULL, NULL, NULL, '1114', '828+286=1114', '');
INSERT INTO `teach_self_question` VALUES ('1460634226142478338', 0, '834+874=?', '1696', '1697', '1708', '1697', NULL, NULL, NULL, '1708', '834+874=1708', '');
INSERT INTO `teach_self_question` VALUES ('1460634226142478339', 0, '618+680=?', '1298', '1284', '1283', '1288', NULL, NULL, NULL, '1298', '618+680=1298', '');
INSERT INTO `teach_self_question` VALUES ('1460634226213781505', 0, '447+673=?', '1113', '1120', '1113', '1113', NULL, NULL, NULL, '1120', '447+673=1120', '');
INSERT INTO `teach_self_question` VALUES ('1460634226410913794', 0, '989+317=?', '1298', '1299', '1306', '1293', NULL, NULL, NULL, '1306', '989+317=1306', '');
INSERT INTO `teach_self_question` VALUES ('1460634226494799874', 0, '599+440=?', '1027', '1029', '1029', '1039', NULL, NULL, NULL, '1039', '599+440=1039', '');
INSERT INTO `teach_self_question` VALUES ('1460634226494799875', 0, '799+525=?', '1316', '1311', '1324', '1315', NULL, NULL, NULL, '1324', '799+525=1324', '');
INSERT INTO `teach_self_question` VALUES ('1460634226700320770', 0, '377+694=?', '1059', '1056', '1064', '1071', NULL, NULL, NULL, '1071', '377+694=1071', '');
INSERT INTO `teach_self_question` VALUES ('1460634226742263809', 0, '881+325=?', '1197', '1192', '1206', '1193', NULL, NULL, NULL, '1206', '881+325=1206', '');
INSERT INTO `teach_self_question` VALUES ('1460634226742263810', 0, '716+616=?', '1326', '1332', '1326', '1322', NULL, NULL, NULL, '1332', '716+616=1332', '');
INSERT INTO `teach_self_question` VALUES ('1460634226742263811', 0, '235+601=?', '825', '836', '827', '826', NULL, NULL, NULL, '836', '235+601=836', '');
INSERT INTO `teach_self_question` VALUES ('1460634226742263812', 0, '234+405=?', '632', '631', '639', '631', NULL, NULL, NULL, '639', '234+405=639', '');
INSERT INTO `teach_self_question` VALUES ('1460634226805178370', 0, '258+225=?', '469', '469', '471', '483', NULL, NULL, NULL, '483', '258+225=483', '');
INSERT INTO `teach_self_question` VALUES ('1460634228478705666', 0, '240+437=?', '664', '662', '677', '662', NULL, NULL, NULL, '677', '240+437=677', '');
INSERT INTO `teach_self_question` VALUES ('1460634228545814529', 0, '955+926=?', '1867', '1875', '1881', '1874', NULL, NULL, NULL, '1881', '955+926=1881', '');
INSERT INTO `teach_self_question` VALUES ('1460634228545814530', 0, '285+102=?', '387', '378', '375', '376', NULL, NULL, NULL, '387', '285+102=387', '');
INSERT INTO `teach_self_question` VALUES ('1460634228545814531', 0, '722+166=?', '888', '874', '874', '882', NULL, NULL, NULL, '888', '722+166=888', '');
INSERT INTO `teach_self_question` VALUES ('1460634228612923393', 0, '840+941=?', '1772', '1768', '1768', '1781', NULL, NULL, NULL, '1781', '840+941=1781', '');
INSERT INTO `teach_self_question` VALUES ('1460634228612923394', 0, '486+70=?', '556', '545', '549', '549', NULL, NULL, NULL, '556', '486+70=556', '');
INSERT INTO `teach_self_question` VALUES ('1460634228612923395', 0, '986+627=?', '1613', '1607', '1602', '1607', NULL, NULL, NULL, '1613', '986+627=1613', '');
INSERT INTO `teach_self_question` VALUES ('1460634228692615170', 0, '564+679=?', '1243', '1228', '1229', '1235', NULL, NULL, NULL, '1243', '564+679=1243', '');
INSERT INTO `teach_self_question` VALUES ('1460634228692615171', 0, '555+797=?', '1345', '1343', '1339', '1352', NULL, NULL, NULL, '1352', '555+797=1352', '');
INSERT INTO `teach_self_question` VALUES ('1460634228747141121', 0, '92+666=?', '751', '750', '746', '758', NULL, NULL, NULL, '758', '92+666=758', '');
INSERT INTO `teach_self_question` VALUES ('1460634228747141122', 0, '933+175=?', '1108', '1093', '1093', '1099', NULL, NULL, NULL, '1108', '933+175=1108', '');
INSERT INTO `teach_self_question` VALUES ('1460634228747141123', 0, '206+442=?', '636', '633', '637', '648', NULL, NULL, NULL, '648', '206+442=648', '');
INSERT INTO `teach_self_question` VALUES ('1460634228747141124', 0, '4+68=?', '72', '57', '63', '61', NULL, NULL, NULL, '72', '4+68=72', '');
INSERT INTO `teach_self_question` VALUES ('1460634228814249986', 0, '345+202=?', '539', '538', '547', '540', NULL, NULL, NULL, '547', '345+202=547', '');
INSERT INTO `teach_self_question` VALUES ('1460634228814249987', 0, '873+633=?', '1497', '1498', '1492', '1506', NULL, NULL, NULL, '1506', '873+633=1506', '');
INSERT INTO `teach_self_question` VALUES ('1460634228814249988', 0, '887+891=?', '1778', '1766', '1764', '1770', NULL, NULL, NULL, '1778', '887+891=1778', '');
INSERT INTO `teach_self_question` VALUES ('1460634228814249989', 0, '378+354=?', '723', '718', '732', '721', NULL, NULL, NULL, '732', '378+354=732', '');
INSERT INTO `teach_self_question` VALUES ('1460634228948467714', 0, '591+892=?', '1471', '1483', '1477', '1472', NULL, NULL, NULL, '1483', '591+892=1483', '');
INSERT INTO `teach_self_question` VALUES ('1460634228948467715', 0, '776+629=?', '1405', '1392', '1390', '1395', NULL, NULL, NULL, '1405', '776+629=1405', '');
INSERT INTO `teach_self_question` VALUES ('1460634228948467716', 0, '866+211=?', '1070', '1069', '1064', '1077', NULL, NULL, NULL, '1077', '866+211=1077', '');
INSERT INTO `teach_self_question` VALUES ('1460634228948467717', 0, '779+425=?', '1190', '1198', '1190', '1204', NULL, NULL, NULL, '1204', '779+425=1204', '');
INSERT INTO `teach_self_question` VALUES ('1460634229015576578', 0, '281+917=?', '1192', '1198', '1188', '1183', NULL, NULL, NULL, '1198', '281+917=1198', '');
INSERT INTO `teach_self_question` VALUES ('1460634229015576579', 0, '521+166=?', '675', '687', '672', '677', NULL, NULL, NULL, '687', '521+166=687', '');
INSERT INTO `teach_self_question` VALUES ('1460634229015576580', 0, '343+882=?', '1217', '1225', '1210', '1210', NULL, NULL, NULL, '1225', '343+882=1225', '');
INSERT INTO `teach_self_question` VALUES ('1460634229095268353', 0, '714+785=?', '1487', '1493', '1499', '1492', NULL, NULL, NULL, '1499', '714+785=1499', '');
INSERT INTO `teach_self_question` VALUES ('1460634229095268354', 0, '361+244=?', '605', '597', '597', '595', NULL, NULL, NULL, '605', '361+244=605', '');
INSERT INTO `teach_self_question` VALUES ('1460634229095268355', 0, '93+929=?', '1007', '1015', '1011', '1022', NULL, NULL, NULL, '1022', '93+929=1022', '');
INSERT INTO `teach_self_question` VALUES ('1460634229149794305', 0, '196+411=?', '601', '607', '592', '595', NULL, NULL, NULL, '607', '196+411=607', '');
INSERT INTO `teach_self_question` VALUES ('1460634229149794306', 0, '623+148=?', '761', '756', '763', '771', NULL, NULL, NULL, '771', '623+148=771', '');
INSERT INTO `teach_self_question` VALUES ('1460634229149794307', 0, '673+736=?', '1409', '1396', '1395', '1403', NULL, NULL, NULL, '1409', '673+736=1409', '');
INSERT INTO `teach_self_question` VALUES ('1460634229149794308', 0, '865+561=?', '1426', '1418', '1419', '1415', NULL, NULL, NULL, '1426', '865+561=1426', '');
INSERT INTO `teach_self_question` VALUES ('1460634229216903170', 0, '161+299=?', '450', '460', '450', '450', NULL, NULL, NULL, '460', '161+299=460', '');
INSERT INTO `teach_self_question` VALUES ('1460634229216903171', 0, '867+683=?', '1541', '1543', '1550', '1542', NULL, NULL, NULL, '1550', '867+683=1550', '');
INSERT INTO `teach_self_question` VALUES ('1460634229284012033', 0, '884+561=?', '1438', '1445', '1438', '1430', NULL, NULL, NULL, '1445', '884+561=1445', '');
INSERT INTO `teach_self_question` VALUES ('1460634229284012034', 0, '728+795=?', '1523', '1515', '1516', '1509', NULL, NULL, NULL, '1523', '728+795=1523', '');
INSERT INTO `teach_self_question` VALUES ('1460634229284012035', 0, '920+336=?', '1256', '1241', '1242', '1243', NULL, NULL, NULL, '1256', '920+336=1256', '');
INSERT INTO `teach_self_question` VALUES ('1460634229363703810', 0, '480+294=?', '767', '762', '763', '774', NULL, NULL, NULL, '774', '480+294=774', '');
INSERT INTO `teach_self_question` VALUES ('1460634229363703811', 0, '238+413=?', '643', '651', '636', '640', NULL, NULL, NULL, '651', '238+413=651', '');
INSERT INTO `teach_self_question` VALUES ('1460634229363703812', 0, '789+780=?', '1563', '1560', '1569', '1559', NULL, NULL, NULL, '1569', '789+780=1569', '');
INSERT INTO `teach_self_question` VALUES ('1460634229414035458', 0, '546+27=?', '561', '565', '562', '573', NULL, NULL, NULL, '573', '546+27=573', '');
INSERT INTO `teach_self_question` VALUES ('1460634229414035459', 0, '703+714=?', '1411', '1403', '1406', '1417', NULL, NULL, NULL, '1417', '703+714=1417', '');
INSERT INTO `teach_self_question` VALUES ('1460634229414035460', 0, '765+987=?', '1739', '1743', '1742', '1752', NULL, NULL, NULL, '1752', '765+987=1752', '');
INSERT INTO `teach_self_question` VALUES ('1460634229414035461', 0, '955+669=?', '1624', '1618', '1610', '1610', NULL, NULL, NULL, '1624', '955+669=1624', '');
INSERT INTO `teach_self_question` VALUES ('1460634229577613313', 0, '393+575=?', '968', '956', '959', '956', NULL, NULL, NULL, '968', '393+575=968', '');
INSERT INTO `teach_self_question` VALUES ('1460634229577613314', 0, '180+964=?', '1134', '1136', '1144', '1137', NULL, NULL, NULL, '1144', '180+964=1144', '');
INSERT INTO `teach_self_question` VALUES ('1460634229627944961', 0, '712+89=?', '790', '790', '801', '786', NULL, NULL, NULL, '801', '712+89=801', '');
INSERT INTO `teach_self_question` VALUES ('1460634229627944962', 0, '630+927=?', '1545', '1557', '1542', '1542', NULL, NULL, NULL, '1557', '630+927=1557', '');
INSERT INTO `teach_self_question` VALUES ('1460634229627944963', 0, '206+965=?', '1171', '1156', '1159', '1161', NULL, NULL, NULL, '1171', '206+965=1171', '');
INSERT INTO `teach_self_question` VALUES ('1460634229682470913', 0, '289+559=?', '839', '838', '848', '836', NULL, NULL, NULL, '848', '289+559=848', '');
INSERT INTO `teach_self_question` VALUES ('1460634229682470914', 0, '950+295=?', '1237', '1230', '1237', '1245', NULL, NULL, NULL, '1245', '950+295=1245', '');
INSERT INTO `teach_self_question` VALUES ('1460634229682470915', 0, '757+335=?', '1086', '1085', '1085', '1092', NULL, NULL, NULL, '1092', '757+335=1092', '');
INSERT INTO `teach_self_question` VALUES ('1460634229682470916', 0, '414+111=?', '517', '518', '525', '517', NULL, NULL, NULL, '525', '414+111=525', '');
INSERT INTO `teach_self_question` VALUES ('1460634229745385473', 0, '531+487=?', '1018', '1010', '1003', '1004', NULL, NULL, NULL, '1018', '531+487=1018', '');
INSERT INTO `teach_self_question` VALUES ('1460634229745385474', 0, '866+32=?', '887', '898', '885', '887', NULL, NULL, NULL, '898', '866+32=898', '');
INSERT INTO `teach_self_question` VALUES ('1460634229745385475', 0, '697+799=?', '1484', '1483', '1496', '1483', NULL, NULL, NULL, '1496', '697+799=1496', '');
INSERT INTO `teach_self_question` VALUES ('1460634229745385476', 0, '924+611=?', '1535', '1520', '1521', '1520', NULL, NULL, NULL, '1535', '924+611=1535', '');
INSERT INTO `teach_self_question` VALUES ('1460634229745385477', 0, '166+82=?', '238', '239', '240', '248', NULL, NULL, NULL, '248', '166+82=248', '');
INSERT INTO `teach_self_question` VALUES ('1460634229812494337', 0, '236+517=?', '742', '741', '739', '753', NULL, NULL, NULL, '753', '236+517=753', '');
INSERT INTO `teach_self_question` VALUES ('1460634229812494338', 0, '619+333=?', '945', '938', '952', '940', NULL, NULL, NULL, '952', '619+333=952', '');
INSERT INTO `teach_self_question` VALUES ('1460634229812494339', 0, '644+115=?', '753', '759', '750', '748', NULL, NULL, NULL, '759', '644+115=759', '');
INSERT INTO `teach_self_question` VALUES ('1460634229812494340', 0, '902+973=?', '1862', '1875', '1860', '1864', NULL, NULL, NULL, '1875', '902+973=1875', '');
INSERT INTO `teach_self_question` VALUES ('1460634229883797506', 0, '899+831=?', '1721', '1722', '1716', '1730', NULL, NULL, NULL, '1730', '899+831=1730', '');
INSERT INTO `teach_self_question` VALUES ('1460634229883797507', 0, '909+655=?', '1564', '1549', '1553', '1554', NULL, NULL, NULL, '1564', '909+655=1564', '');
INSERT INTO `teach_self_question` VALUES ('1460634229883797508', 0, '723+559=?', '1272', '1282', '1271', '1271', NULL, NULL, NULL, '1282', '723+559=1282', '');
INSERT INTO `teach_self_question` VALUES ('1460634229946712065', 0, '289+369=?', '643', '648', '650', '658', NULL, NULL, NULL, '658', '289+369=658', '');
INSERT INTO `teach_self_question` VALUES ('1460634229946712066', 0, '580+181=?', '752', '761', '755', '753', NULL, NULL, NULL, '761', '580+181=761', '');
INSERT INTO `teach_self_question` VALUES ('1460634229946712067', 0, '999+896=?', '1895', '1886', '1885', '1884', NULL, NULL, NULL, '1895', '999+896=1895', '');
INSERT INTO `teach_self_question` VALUES ('1460634229946712068', 0, '392+123=?', '506', '515', '505', '506', NULL, NULL, NULL, '515', '392+123=515', '');
INSERT INTO `teach_self_question` VALUES ('1460634230013820930', 0, '860+562=?', '1422', '1409', '1412', '1415', NULL, NULL, NULL, '1422', '860+562=1422', '');
INSERT INTO `teach_self_question` VALUES ('1460634230013820931', 0, '899+820=?', '1719', '1707', '1709', '1705', NULL, NULL, NULL, '1719', '899+820=1719', '');
INSERT INTO `teach_self_question` VALUES ('1460634230013820932', 0, '445+825=?', '1270', '1256', '1255', '1262', NULL, NULL, NULL, '1270', '445+825=1270', '');
INSERT INTO `teach_self_question` VALUES ('1460634230080929793', 0, '210+953=?', '1152', '1163', '1157', '1155', NULL, NULL, NULL, '1163', '210+953=1163', '');
INSERT INTO `teach_self_question` VALUES ('1460634230080929794', 0, '905+844=?', '1741', '1737', '1738', '1749', NULL, NULL, NULL, '1749', '905+844=1749', '');
INSERT INTO `teach_self_question` VALUES ('1460634230080929795', 0, '520+506=?', '1013', '1012', '1026', '1016', NULL, NULL, NULL, '1026', '520+506=1026', '');
INSERT INTO `teach_self_question` VALUES ('1460634230080929796', 0, '854+802=?', '1642', '1656', '1643', '1642', NULL, NULL, NULL, '1656', '854+802=1656', '');
INSERT INTO `teach_self_question` VALUES ('1460634230152232961', 0, '236+314=?', '540', '543', '544', '550', NULL, NULL, NULL, '550', '236+314=550', '');
INSERT INTO `teach_self_question` VALUES ('1460634230152232962', 0, '542+369=?', '900', '897', '899', '911', NULL, NULL, NULL, '911', '542+369=911', '');
INSERT INTO `teach_self_question` VALUES ('1460634230152232963', 0, '756+489=?', '1231', '1245', '1232', '1231', NULL, NULL, NULL, '1245', '756+489=1245', '');
INSERT INTO `teach_self_question` VALUES ('1460634230219341825', 0, '353+305=?', '643', '647', '645', '658', NULL, NULL, NULL, '658', '353+305=658', '');
INSERT INTO `teach_self_question` VALUES ('1460634230219341826', 0, '965+116=?', '1066', '1070', '1072', '1081', NULL, NULL, NULL, '1081', '965+116=1081', '');
INSERT INTO `teach_self_question` VALUES ('1460634230219341827', 0, '455+6=?', '447', '454', '461', '452', NULL, NULL, NULL, '461', '455+6=461', '');
INSERT INTO `teach_self_question` VALUES ('1460634230282256385', 0, '967+276=?', '1232', '1243', '1236', '1234', NULL, NULL, NULL, '1243', '967+276=1243', '');
INSERT INTO `teach_self_question` VALUES ('1460634230282256386', 0, '793+976=?', '1761', '1769', '1760', '1760', NULL, NULL, NULL, '1769', '793+976=1769', '');
INSERT INTO `teach_self_question` VALUES ('1460634230282256387', 0, '193+29=?', '213', '216', '222', '210', NULL, NULL, NULL, '222', '193+29=222', '');
INSERT INTO `teach_self_question` VALUES ('1460634230282256388', 0, '236+97=?', '327', '333', '321', '320', NULL, NULL, NULL, '333', '236+97=333', '');
INSERT INTO `teach_self_question` VALUES ('1460634230349365249', 0, '648+479=?', '1117', '1114', '1127', '1117', NULL, NULL, NULL, '1127', '648+479=1127', '');
INSERT INTO `teach_self_question` VALUES ('1460634230349365250', 0, '68+338=?', '398', '395', '406', '397', NULL, NULL, NULL, '406', '68+338=406', '');
INSERT INTO `teach_self_question` VALUES ('1460634230349365251', 0, '874+895=?', '1762', '1762', '1755', '1769', NULL, NULL, NULL, '1769', '874+895=1769', '');
INSERT INTO `teach_self_question` VALUES ('1460634230349365252', 0, '921+290=?', '1197', '1197', '1202', '1211', NULL, NULL, NULL, '1211', '921+290=1211', '');
INSERT INTO `teach_self_question` VALUES ('1460634230416474113', 0, '678+975=?', '1647', '1641', '1653', '1639', NULL, NULL, NULL, '1653', '678+975=1653', '');
INSERT INTO `teach_self_question` VALUES ('1460634230416474114', 0, '882+589=?', '1464', '1458', '1458', '1471', NULL, NULL, NULL, '1471', '882+589=1471', '');
INSERT INTO `teach_self_question` VALUES ('1460634230416474115', 0, '899+587=?', '1476', '1478', '1476', '1486', NULL, NULL, NULL, '1486', '899+587=1486', '');
INSERT INTO `teach_self_question` VALUES ('1460634230416474116', 0, '949+696=?', '1631', '1645', '1631', '1631', NULL, NULL, NULL, '1645', '949+696=1645', '');
INSERT INTO `teach_self_question` VALUES ('1460634230483582977', 0, '788+62=?', '844', '850', '841', '844', NULL, NULL, NULL, '850', '788+62=850', '');
INSERT INTO `teach_self_question` VALUES ('1460634230483582978', 0, '137+598=?', '724', '721', '722', '735', NULL, NULL, NULL, '735', '137+598=735', '');
INSERT INTO `teach_self_question` VALUES ('1460634230546497537', 0, '406+700=?', '1098', '1106', '1100', '1098', NULL, NULL, NULL, '1106', '406+700=1106', '');
INSERT INTO `teach_self_question` VALUES ('1460634230546497538', 0, '939+23=?', '951', '962', '949', '952', NULL, NULL, NULL, '962', '939+23=962', '');
INSERT INTO `teach_self_question` VALUES ('1460634230546497539', 0, '281+272=?', '538', '553', '544', '544', NULL, NULL, NULL, '553', '281+272=553', '');
INSERT INTO `teach_self_question` VALUES ('1460634230546497540', 0, '133+6=?', '139', '130', '126', '131', NULL, NULL, NULL, '139', '133+6=139', '');
INSERT INTO `teach_self_question` VALUES ('1460634230546497541', 0, '37+548=?', '576', '572', '571', '585', NULL, NULL, NULL, '585', '37+548=585', '');
INSERT INTO `teach_self_question` VALUES ('1460634230613606402', 0, '613+349=?', '955', '962', '948', '955', NULL, NULL, NULL, '962', '613+349=962', '');
INSERT INTO `teach_self_question` VALUES ('1460634230613606403', 0, '557+277=?', '828', '825', '825', '834', NULL, NULL, NULL, '834', '557+277=834', '');
INSERT INTO `teach_self_question` VALUES ('1460634230613606404', 0, '67+916=?', '973', '977', '983', '969', NULL, NULL, NULL, '983', '67+916=983', '');
INSERT INTO `teach_self_question` VALUES ('1460634230613606405', 0, '612+44=?', '644', '656', '646', '641', NULL, NULL, NULL, '656', '612+44=656', '');
INSERT INTO `teach_self_question` VALUES ('1460634230676520962', 0, '333+570=?', '903', '895', '895', '889', NULL, NULL, NULL, '903', '333+570=903', '');
INSERT INTO `teach_self_question` VALUES ('1460634230676520963', 0, '29+654=?', '683', '672', '671', '676', NULL, NULL, NULL, '683', '29+654=683', '');
INSERT INTO `teach_self_question` VALUES ('1460634230676520964', 0, '160+463=?', '608', '616', '610', '623', NULL, NULL, NULL, '623', '160+463=623', '');
INSERT INTO `teach_self_question` VALUES ('1460634230676520965', 0, '956+90=?', '1046', '1033', '1038', '1034', NULL, NULL, NULL, '1046', '956+90=1046', '');
INSERT INTO `teach_self_question` VALUES ('1460634230676520966', 0, '389+396=?', '771', '777', '785', '771', NULL, NULL, NULL, '785', '389+396=785', '');
INSERT INTO `teach_self_question` VALUES ('1460634230743629825', 0, '458+265=?', '723', '709', '715', '716', NULL, NULL, NULL, '723', '458+265=723', '');
INSERT INTO `teach_self_question` VALUES ('1460634230743629826', 0, '821+4=?', '815', '813', '818', '825', NULL, NULL, NULL, '825', '821+4=825', '');
INSERT INTO `teach_self_question` VALUES ('1460634230743629827', 0, '91+738=?', '822', '815', '829', '822', NULL, NULL, NULL, '829', '91+738=829', '');
INSERT INTO `teach_self_question` VALUES ('1460634230743629828', 0, '686+754=?', '1427', '1429', '1434', '1440', NULL, NULL, NULL, '1440', '686+754=1440', '');
INSERT INTO `teach_self_question` VALUES ('1460634230743629829', 0, '556+192=?', '734', '736', '738', '748', NULL, NULL, NULL, '748', '556+192=748', '');
INSERT INTO `teach_self_question` VALUES ('1460634230810738690', 0, '297+650=?', '947', '934', '936', '934', NULL, NULL, NULL, '947', '297+650=947', '');
INSERT INTO `teach_self_question` VALUES ('1460634230810738691', 0, '765+883=?', '1633', '1648', '1642', '1641', NULL, NULL, NULL, '1648', '765+883=1648', '');
INSERT INTO `teach_self_question` VALUES ('1460634230810738692', 0, '146+269=?', '415', '401', '405', '408', NULL, NULL, NULL, '415', '146+269=415', '');
INSERT INTO `teach_self_question` VALUES ('1460634230810738693', 0, '473+999=?', '1472', '1458', '1461', '1465', NULL, NULL, NULL, '1472', '473+999=1472', '');
INSERT INTO `teach_self_question` VALUES ('1460634230882041858', 0, '688+336=?', '1017', '1009', '1015', '1024', NULL, NULL, NULL, '1024', '688+336=1024', '');
INSERT INTO `teach_self_question` VALUES ('1460634230882041859', 0, '439+335=?', '774', '768', '766', '762', NULL, NULL, NULL, '774', '439+335=774', '');
INSERT INTO `teach_self_question` VALUES ('1460634230882041860', 0, '741+242=?', '973', '970', '976', '983', NULL, NULL, NULL, '983', '741+242=983', '');
INSERT INTO `teach_self_question` VALUES ('1460634230882041861', 0, '424+972=?', '1396', '1385', '1387', '1385', NULL, NULL, NULL, '1396', '424+972=1396', '');
INSERT INTO `teach_self_question` VALUES ('1460634230882041862', 0, '792+898=?', '1690', '1678', '1676', '1682', NULL, NULL, NULL, '1690', '792+898=1690', '');
INSERT INTO `teach_self_question` VALUES ('1460634230944956418', 0, '3+468=?', '471', '460', '457', '458', NULL, NULL, NULL, '471', '3+468=471', '');
INSERT INTO `teach_self_question` VALUES ('1460634230944956419', 0, '309+481=?', '790', '782', '781', '777', NULL, NULL, NULL, '790', '309+481=790', '');
INSERT INTO `teach_self_question` VALUES ('1460634230944956420', 0, '765+726=?', '1477', '1479', '1491', '1482', NULL, NULL, NULL, '1491', '765+726=1491', '');
INSERT INTO `teach_self_question` VALUES ('1460634230944956421', 0, '101+507=?', '599', '608', '601', '599', NULL, NULL, NULL, '608', '101+507=608', '');
INSERT INTO `teach_self_question` VALUES ('1460634230944956422', 0, '972+203=?', '1163', '1175', '1166', '1164', NULL, NULL, NULL, '1175', '972+203=1175', '');
INSERT INTO `teach_self_question` VALUES ('1460634231012065282', 0, '35+883=?', '906', '908', '904', '918', NULL, NULL, NULL, '918', '35+883=918', '');
INSERT INTO `teach_self_question` VALUES ('1460634231012065283', 0, '531+260=?', '791', '784', '780', '776', NULL, NULL, NULL, '791', '531+260=791', '');
INSERT INTO `teach_self_question` VALUES ('1460634231012065284', 0, '590+524=?', '1114', '1102', '1105', '1104', NULL, NULL, NULL, '1114', '590+524=1114', '');
INSERT INTO `teach_self_question` VALUES ('1460634231012065285', 0, '519+61=?', '569', '569', '580', '567', NULL, NULL, NULL, '580', '519+61=580', '');
INSERT INTO `teach_self_question` VALUES ('1460634231012065286', 0, '135+582=?', '708', '705', '708', '717', NULL, NULL, NULL, '717', '135+582=717', '');
INSERT INTO `teach_self_question` VALUES ('1460634231079174145', 0, '54+728=?', '782', '774', '770', '769', NULL, NULL, NULL, '782', '54+728=782', '');
INSERT INTO `teach_self_question` VALUES ('1460634231079174146', 0, '382+344=?', '712', '714', '718', '726', NULL, NULL, NULL, '726', '382+344=726', '');
INSERT INTO `teach_self_question` VALUES ('1460634231079174147', 0, '412+139=?', '536', '543', '551', '541', NULL, NULL, NULL, '551', '412+139=551', '');
INSERT INTO `teach_self_question` VALUES ('1460634231079174148', 0, '620+400=?', '1020', '1011', '1012', '1009', NULL, NULL, NULL, '1020', '620+400=1020', '');
INSERT INTO `teach_self_question` VALUES ('1460634231079174149', 0, '189+859=?', '1040', '1048', '1036', '1041', NULL, NULL, NULL, '1048', '189+859=1048', '');
INSERT INTO `teach_self_question` VALUES ('1460634231079174150', 0, '591+262=?', '840', '853', '846', '840', NULL, NULL, NULL, '853', '591+262=853', '');
INSERT INTO `teach_self_question` VALUES ('1460634231146283009', 0, '219+248=?', '458', '467', '461', '455', NULL, NULL, NULL, '467', '219+248=467', '');
INSERT INTO `teach_self_question` VALUES ('1460634231146283010', 0, '704+522=?', '1216', '1226', '1216', '1212', NULL, NULL, NULL, '1226', '704+522=1226', '');
INSERT INTO `teach_self_question` VALUES ('1460634231146283011', 0, '750+281=?', '1021', '1022', '1018', '1031', NULL, NULL, NULL, '1031', '750+281=1031', '');
INSERT INTO `teach_self_question` VALUES ('1460634231146283012', 0, '1+384=?', '373', '374', '373', '385', NULL, NULL, NULL, '385', '1+384=385', '');
INSERT INTO `teach_self_question` VALUES ('1460634231146283013', 0, '322+339=?', '655', '661', '655', '653', NULL, NULL, NULL, '661', '322+339=661', '');
INSERT INTO `teach_self_question` VALUES ('1460634231213391873', 0, '877+563=?', '1427', '1440', '1430', '1431', NULL, NULL, NULL, '1440', '877+563=1440', '');
INSERT INTO `teach_self_question` VALUES ('1460634231213391874', 0, '524+771=?', '1281', '1286', '1287', '1295', NULL, NULL, NULL, '1295', '524+771=1295', '');
INSERT INTO `teach_self_question` VALUES ('1460634231213391875', 0, '598+650=?', '1234', '1233', '1235', '1248', NULL, NULL, NULL, '1248', '598+650=1248', '');
INSERT INTO `teach_self_question` VALUES ('1460634231213391876', 0, '880+195=?', '1075', '1063', '1069', '1061', NULL, NULL, NULL, '1075', '880+195=1075', '');
INSERT INTO `teach_self_question` VALUES ('1460634231213391877', 0, '850+207=?', '1051', '1057', '1049', '1046', NULL, NULL, NULL, '1057', '850+207=1057', '');
INSERT INTO `teach_self_question` VALUES ('1460634231280500738', 0, '367+620=?', '977', '987', '973', '977', NULL, NULL, NULL, '987', '367+620=987', '');
INSERT INTO `teach_self_question` VALUES ('1460634231280500739', 0, '615+590=?', '1196', '1191', '1199', '1205', NULL, NULL, NULL, '1205', '615+590=1205', '');
INSERT INTO `teach_self_question` VALUES ('1460634231280500740', 0, '149+438=?', '587', '580', '573', '574', NULL, NULL, NULL, '587', '149+438=587', '');
INSERT INTO `teach_self_question` VALUES ('1460634231280500741', 0, '864+901=?', '1758', '1753', '1750', '1765', NULL, NULL, NULL, '1765', '864+901=1765', '');
INSERT INTO `teach_self_question` VALUES ('1460634231280500742', 0, '860+653=?', '1507', '1505', '1513', '1503', NULL, NULL, NULL, '1513', '860+653=1513', '');
INSERT INTO `teach_self_question` VALUES ('1460634231347609601', 0, '568+14=?', '576', '574', '582', '568', NULL, NULL, NULL, '582', '568+14=582', '');
INSERT INTO `teach_self_question` VALUES ('1460634231347609602', 0, '665+71=?', '726', '729', '736', '726', NULL, NULL, NULL, '736', '665+71=736', '');
INSERT INTO `teach_self_question` VALUES ('1460634231347609603', 0, '526+312=?', '827', '826', '838', '823', NULL, NULL, NULL, '838', '526+312=838', '');
INSERT INTO `teach_self_question` VALUES ('1460634231347609604', 0, '579+415=?', '987', '994', '979', '982', NULL, NULL, NULL, '994', '579+415=994', '');
INSERT INTO `teach_self_question` VALUES ('1460634231414718465', 0, '596+954=?', '1550', '1537', '1543', '1538', NULL, NULL, NULL, '1550', '596+954=1550', '');
INSERT INTO `teach_self_question` VALUES ('1460634231414718466', 0, '923+78=?', '986', '993', '1001', '993', NULL, NULL, NULL, '1001', '923+78=1001', '');
INSERT INTO `teach_self_question` VALUES ('1460634231414718467', 0, '499+849=?', '1339', '1333', '1335', '1348', NULL, NULL, NULL, '1348', '499+849=1348', '');
INSERT INTO `teach_self_question` VALUES ('1460634231414718468', 0, '620+632=?', '1240', '1240', '1252', '1243', NULL, NULL, NULL, '1252', '620+632=1252', '');
INSERT INTO `teach_self_question` VALUES ('1460634231414718469', 0, '290+159=?', '439', '449', '442', '439', NULL, NULL, NULL, '449', '290+159=449', '');
INSERT INTO `teach_self_question` VALUES ('1460634231481827330', 0, '88+969=?', '1043', '1050', '1044', '1057', NULL, NULL, NULL, '1057', '88+969=1057', '');
INSERT INTO `teach_self_question` VALUES ('1460634231481827331', 0, '379+195=?', '561', '565', '574', '561', NULL, NULL, NULL, '574', '379+195=574', '');
INSERT INTO `teach_self_question` VALUES ('1460634231481827332', 0, '277+762=?', '1031', '1039', '1032', '1029', NULL, NULL, NULL, '1039', '277+762=1039', '');
INSERT INTO `teach_self_question` VALUES ('1460634231481827333', 0, '81+218=?', '299', '290', '290', '285', NULL, NULL, NULL, '299', '81+218=299', '');
INSERT INTO `teach_self_question` VALUES ('1460634231548936194', 0, '698+185=?', '874', '883', '873', '871', NULL, NULL, NULL, '883', '698+185=883', '');
INSERT INTO `teach_self_question` VALUES ('1460634231548936195', 0, '411+864=?', '1261', '1275', '1269', '1266', NULL, NULL, NULL, '1275', '411+864=1275', '');
INSERT INTO `teach_self_question` VALUES ('1460634231548936196', 0, '246+11=?', '249', '251', '248', '257', NULL, NULL, NULL, '257', '246+11=257', '');
INSERT INTO `teach_self_question` VALUES ('1460634231548936197', 0, '813+683=?', '1486', '1483', '1486', '1496', NULL, NULL, NULL, '1496', '813+683=1496', '');
INSERT INTO `teach_self_question` VALUES ('1460634231548936198', 0, '445+359=?', '789', '804', '789', '789', NULL, NULL, NULL, '804', '445+359=804', '');
INSERT INTO `teach_self_question` VALUES ('1460634231548936199', 0, '9+437=?', '438', '446', '434', '437', NULL, NULL, NULL, '446', '9+437=446', '');
INSERT INTO `teach_self_question` VALUES ('1460634231616045057', 0, '23+999=?', '1022', '1012', '1007', '1008', NULL, NULL, NULL, '1022', '23+999=1022', '');
INSERT INTO `teach_self_question` VALUES ('1460634231616045058', 0, '79+690=?', '754', '760', '757', '769', NULL, NULL, NULL, '769', '79+690=769', '');
INSERT INTO `teach_self_question` VALUES ('1460634231616045059', 0, '951+704=?', '1645', '1643', '1655', '1641', NULL, NULL, NULL, '1655', '951+704=1655', '');
INSERT INTO `teach_self_question` VALUES ('1460634231616045060', 0, '382+107=?', '489', '476', '479', '475', NULL, NULL, NULL, '489', '382+107=489', '');
INSERT INTO `teach_self_question` VALUES ('1460634231683153921', 0, '930+14=?', '930', '937', '938', '944', NULL, NULL, NULL, '944', '930+14=944', '');
INSERT INTO `teach_self_question` VALUES ('1460634231683153922', 0, '392+253=?', '636', '639', '639', '645', NULL, NULL, NULL, '645', '392+253=645', '');
INSERT INTO `teach_self_question` VALUES ('1460634231683153923', 0, '202+567=?', '754', '757', '763', '769', NULL, NULL, NULL, '769', '202+567=769', '');
INSERT INTO `teach_self_question` VALUES ('1460634231683153924', 0, '90+679=?', '759', '769', '756', '758', NULL, NULL, NULL, '769', '90+679=769', '');
INSERT INTO `teach_self_question` VALUES ('1460634231683153925', 0, '79+26=?', '94', '99', '99', '105', NULL, NULL, NULL, '105', '79+26=105', '');
INSERT INTO `teach_self_question` VALUES ('1460634231750262786', 0, '954+967=?', '1911', '1921', '1906', '1906', NULL, NULL, NULL, '1921', '954+967=1921', '');
INSERT INTO `teach_self_question` VALUES ('1460634231750262787', 0, '524+636=?', '1160', '1145', '1152', '1152', NULL, NULL, NULL, '1160', '524+636=1160', '');
INSERT INTO `teach_self_question` VALUES ('1460634231750262788', 0, '300+351=?', '642', '651', '638', '641', NULL, NULL, NULL, '651', '300+351=651', '');
INSERT INTO `teach_self_question` VALUES ('1460634231750262789', 0, '744+369=?', '1113', '1099', '1106', '1106', NULL, NULL, NULL, '1113', '744+369=1113', '');
INSERT INTO `teach_self_question` VALUES ('1460634231750262790', 0, '547+650=?', '1185', '1197', '1188', '1186', NULL, NULL, NULL, '1197', '547+650=1197', '');
INSERT INTO `teach_self_question` VALUES ('1460634231817371650', 0, '655+21=?', '664', '663', '661', '676', NULL, NULL, NULL, '676', '655+21=676', '');
INSERT INTO `teach_self_question` VALUES ('1460634231817371651', 0, '370+97=?', '452', '453', '455', '467', NULL, NULL, NULL, '467', '370+97=467', '');
INSERT INTO `teach_self_question` VALUES ('1460634231817371652', 0, '841+207=?', '1038', '1040', '1034', '1048', NULL, NULL, NULL, '1048', '841+207=1048', '');
INSERT INTO `teach_self_question` VALUES ('1460634231817371653', 0, '210+571=?', '781', '768', '775', '773', NULL, NULL, NULL, '781', '210+571=781', '');
INSERT INTO `teach_self_question` VALUES ('1460634231884480514', 0, '320+263=?', '575', '574', '583', '571', NULL, NULL, NULL, '583', '320+263=583', '');
INSERT INTO `teach_self_question` VALUES ('1460634231884480515', 0, '321+805=?', '1120', '1114', '1126', '1119', NULL, NULL, NULL, '1126', '321+805=1126', '');
INSERT INTO `teach_self_question` VALUES ('1460634231884480516', 0, '698+994=?', '1685', '1679', '1683', '1692', NULL, NULL, NULL, '1692', '698+994=1692', '');
INSERT INTO `teach_self_question` VALUES ('1460634231884480517', 0, '981+189=?', '1155', '1170', '1161', '1161', NULL, NULL, NULL, '1170', '981+189=1170', '');
INSERT INTO `teach_self_question` VALUES ('1460634231951589377', 0, '50+802=?', '843', '852', '844', '846', NULL, NULL, NULL, '852', '50+802=852', '');
INSERT INTO `teach_self_question` VALUES ('1460634231951589378', 0, '289+947=?', '1223', '1226', '1236', '1227', NULL, NULL, NULL, '1236', '289+947=1236', '');
INSERT INTO `teach_self_question` VALUES ('1460634231951589379', 0, '640+366=?', '996', '994', '1006', '994', NULL, NULL, NULL, '1006', '640+366=1006', '');
INSERT INTO `teach_self_question` VALUES ('1460634231951589380', 0, '593+967=?', '1554', '1560', '1545', '1554', NULL, NULL, NULL, '1560', '593+967=1560', '');
INSERT INTO `teach_self_question` VALUES ('1460634231951589381', 0, '888+594=?', '1476', '1468', '1482', '1471', NULL, NULL, NULL, '1482', '888+594=1482', '');
INSERT INTO `teach_self_question` VALUES ('1460634232018698242', 0, '523+896=?', '1408', '1408', '1407', '1419', NULL, NULL, NULL, '1419', '523+896=1419', '');
INSERT INTO `teach_self_question` VALUES ('1460634232018698243', 0, '220+864=?', '1070', '1069', '1071', '1084', NULL, NULL, NULL, '1084', '220+864=1084', '');
INSERT INTO `teach_self_question` VALUES ('1460634232018698244', 0, '710+854=?', '1556', '1549', '1564', '1557', NULL, NULL, NULL, '1564', '710+854=1564', '');
INSERT INTO `teach_self_question` VALUES ('1460634232018698245', 0, '476+472=?', '938', '934', '942', '948', NULL, NULL, NULL, '948', '476+472=948', '');
INSERT INTO `teach_self_question` VALUES ('1460634232018698246', 0, '413+53=?', '457', '453', '453', '466', NULL, NULL, NULL, '466', '413+53=466', '');
INSERT INTO `teach_self_question` VALUES ('1460634232085807106', 0, '369+548=?', '909', '917', '909', '903', NULL, NULL, NULL, '917', '369+548=917', '');
INSERT INTO `teach_self_question` VALUES ('1460634232085807107', 0, '41+653=?', '681', '687', '681', '694', NULL, NULL, NULL, '694', '41+653=694', '');
INSERT INTO `teach_self_question` VALUES ('1460634232085807108', 0, '919+454=?', '1366', '1363', '1373', '1362', NULL, NULL, NULL, '1373', '919+454=1373', '');
INSERT INTO `teach_self_question` VALUES ('1460634232085807109', 0, '130+728=?', '858', '848', '847', '852', NULL, NULL, NULL, '858', '130+728=858', '');
INSERT INTO `teach_self_question` VALUES ('1460634232152915969', 0, '648+152=?', '788', '790', '800', '793', NULL, NULL, NULL, '800', '648+152=800', '');
INSERT INTO `teach_self_question` VALUES ('1460634232152915970', 0, '652+967=?', '1619', '1611', '1608', '1608', NULL, NULL, NULL, '1619', '652+967=1619', '');
INSERT INTO `teach_self_question` VALUES ('1460634232152915971', 0, '23+53=?', '63', '62', '76', '62', NULL, NULL, NULL, '76', '23+53=76', '');
INSERT INTO `teach_self_question` VALUES ('1460634232152915972', 0, '794+993=?', '1778', '1780', '1772', '1787', NULL, NULL, NULL, '1787', '794+993=1787', '');
INSERT INTO `teach_self_question` VALUES ('1460634232152915973', 0, '617+206=?', '810', '823', '815', '815', NULL, NULL, NULL, '823', '617+206=823', '');
INSERT INTO `teach_self_question` VALUES ('1460634232220024833', 0, '440+714=?', '1140', '1148', '1145', '1154', NULL, NULL, NULL, '1154', '440+714=1154', '');
INSERT INTO `teach_self_question` VALUES ('1460634232220024834', 0, '203+919=?', '1116', '1108', '1122', '1108', NULL, NULL, NULL, '1122', '203+919=1122', '');
INSERT INTO `teach_self_question` VALUES ('1460634232220024835', 0, '736+685=?', '1421', '1411', '1414', '1410', NULL, NULL, NULL, '1421', '736+685=1421', '');
INSERT INTO `teach_self_question` VALUES ('1460634232220024836', 0, '54+446=?', '489', '494', '494', '500', NULL, NULL, NULL, '500', '54+446=500', '');
INSERT INTO `teach_self_question` VALUES ('1460634232220024837', 0, '717+306=?', '1015', '1015', '1023', '1017', NULL, NULL, NULL, '1023', '717+306=1023', '');
INSERT INTO `teach_self_question` VALUES ('1460634232287133697', 0, '601+934=?', '1527', '1528', '1529', '1535', NULL, NULL, NULL, '1535', '601+934=1535', '');
INSERT INTO `teach_self_question` VALUES ('1460634232287133698', 0, '537+376=?', '898', '913', '903', '904', NULL, NULL, NULL, '913', '537+376=913', '');
INSERT INTO `teach_self_question` VALUES ('1460634232287133699', 0, '334+853=?', '1187', '1178', '1176', '1175', NULL, NULL, NULL, '1187', '334+853=1187', '');
INSERT INTO `teach_self_question` VALUES ('1460634232287133700', 0, '554+95=?', '635', '639', '635', '649', NULL, NULL, NULL, '649', '554+95=649', '');
INSERT INTO `teach_self_question` VALUES ('1460634232287133701', 0, '671+464=?', '1120', '1127', '1135', '1125', NULL, NULL, NULL, '1135', '671+464=1135', '');
INSERT INTO `teach_self_question` VALUES ('1460634232287133702', 0, '664+936=?', '1600', '1586', '1591', '1589', NULL, NULL, NULL, '1600', '664+936=1600', '');
INSERT INTO `teach_self_question` VALUES ('1460634232354242561', 0, '475+930=?', '1394', '1394', '1405', '1391', NULL, NULL, NULL, '1405', '475+930=1405', '');
INSERT INTO `teach_self_question` VALUES ('1460634232354242562', 0, '542+918=?', '1448', '1460', '1450', '1451', NULL, NULL, NULL, '1460', '542+918=1460', '');
INSERT INTO `teach_self_question` VALUES ('1460634232354242563', 0, '199+78=?', '265', '268', '263', '277', NULL, NULL, NULL, '277', '199+78=277', '');
INSERT INTO `teach_self_question` VALUES ('1460634232354242564', 0, '523+255=?', '764', '772', '767', '778', NULL, NULL, NULL, '778', '523+255=778', '');
INSERT INTO `teach_self_question` VALUES ('1460634232354242565', 0, '233+644=?', '864', '870', '871', '877', NULL, NULL, NULL, '877', '233+644=877', '');
INSERT INTO `teach_self_question` VALUES ('1460634232421351425', 0, '752+916=?', '1655', '1668', '1656', '1657', NULL, NULL, NULL, '1668', '752+916=1668', '');
INSERT INTO `teach_self_question` VALUES ('1460634232421351426', 0, '353+541=?', '881', '879', '894', '885', NULL, NULL, NULL, '894', '353+541=894', '');
INSERT INTO `teach_self_question` VALUES ('1460634232421351427', 0, '17+29=?', '46', '32', '34', '39', NULL, NULL, NULL, '46', '17+29=46', '');
INSERT INTO `teach_self_question` VALUES ('1460634232421351428', 0, '807+228=?', '1021', '1035', '1022', '1022', NULL, NULL, NULL, '1035', '807+228=1035', '');
INSERT INTO `teach_self_question` VALUES ('1460634232421351429', 0, '512+811=?', '1309', '1323', '1317', '1309', NULL, NULL, NULL, '1323', '512+811=1323', '');
INSERT INTO `teach_self_question` VALUES ('1460634232488460289', 0, '859+977=?', '1827', '1836', '1828', '1826', NULL, NULL, NULL, '1836', '859+977=1836', '');
INSERT INTO `teach_self_question` VALUES ('1460634232488460290', 0, '725+886=?', '1611', '1605', '1596', '1603', NULL, NULL, NULL, '1611', '725+886=1611', '');
INSERT INTO `teach_self_question` VALUES ('1460634232488460291', 0, '957+611=?', '1557', '1557', '1568', '1553', NULL, NULL, NULL, '1568', '957+611=1568', '');
INSERT INTO `teach_self_question` VALUES ('1460634232488460292', 0, '813+790=?', '1603', '1597', '1591', '1597', NULL, NULL, NULL, '1603', '813+790=1603', '');
INSERT INTO `teach_self_question` VALUES ('1460634232488460293', 0, '846+406=?', '1237', '1242', '1241', '1252', NULL, NULL, NULL, '1252', '846+406=1252', '');
INSERT INTO `teach_self_question` VALUES ('1460634232555569154', 0, '121+270=?', '385', '391', '383', '380', NULL, NULL, NULL, '391', '121+270=391', '');
INSERT INTO `teach_self_question` VALUES ('1460634232555569155', 0, '117+781=?', '898', '885', '883', '889', NULL, NULL, NULL, '898', '117+781=898', '');
INSERT INTO `teach_self_question` VALUES ('1460634232555569156', 0, '255+602=?', '848', '846', '846', '857', NULL, NULL, NULL, '857', '255+602=857', '');
INSERT INTO `teach_self_question` VALUES ('1460634232555569157', 0, '155+886=?', '1041', '1030', '1033', '1026', NULL, NULL, NULL, '1041', '155+886=1041', '');
INSERT INTO `teach_self_question` VALUES ('1460634232555569158', 0, '557+789=?', '1339', '1334', '1346', '1340', NULL, NULL, NULL, '1346', '557+789=1346', '');
INSERT INTO `teach_self_question` VALUES ('1460634232626872321', 0, '125+518=?', '628', '643', '633', '636', NULL, NULL, NULL, '643', '125+518=643', '');
INSERT INTO `teach_self_question` VALUES ('1460634232626872322', 0, '371+744=?', '1102', '1109', '1107', '1115', NULL, NULL, NULL, '1115', '371+744=1115', '');
INSERT INTO `teach_self_question` VALUES ('1460634232626872323', 0, '674+459=?', '1127', '1126', '1133', '1120', NULL, NULL, NULL, '1133', '674+459=1133', '');
INSERT INTO `teach_self_question` VALUES ('1460634232626872324', 0, '48+486=?', '520', '519', '528', '534', NULL, NULL, NULL, '534', '48+486=534', '');
INSERT INTO `teach_self_question` VALUES ('1460634232626872325', 0, '737+942=?', '1667', '1679', '1671', '1668', NULL, NULL, NULL, '1679', '737+942=1679', '');
INSERT INTO `teach_self_question` VALUES ('1460634232689786881', 0, '432+941=?', '1373', '1367', '1367', '1358', NULL, NULL, NULL, '1373', '432+941=1373', '');
INSERT INTO `teach_self_question` VALUES ('1460634232689786882', 0, '911+924=?', '1835', '1822', '1826', '1820', NULL, NULL, NULL, '1835', '911+924=1835', '');
INSERT INTO `teach_self_question` VALUES ('1460634232689786883', 0, '869+858=?', '1713', '1715', '1713', '1727', NULL, NULL, NULL, '1727', '869+858=1727', '');
INSERT INTO `teach_self_question` VALUES ('1460634232689786884', 0, '225+580=?', '797', '805', '796', '793', NULL, NULL, NULL, '805', '225+580=805', '');
INSERT INTO `teach_self_question` VALUES ('1460634232689786885', 0, '725+595=?', '1320', '1306', '1313', '1309', NULL, NULL, NULL, '1320', '725+595=1320', '');
INSERT INTO `teach_self_question` VALUES ('1460634232756895745', 0, '297+500=?', '784', '797', '789', '788', NULL, NULL, NULL, '797', '297+500=797', '');
INSERT INTO `teach_self_question` VALUES ('1460634232756895746', 0, '733+929=?', '1655', '1654', '1651', '1662', NULL, NULL, NULL, '1662', '733+929=1662', '');
INSERT INTO `teach_self_question` VALUES ('1460634232756895747', 0, '703+747=?', '1440', '1450', '1438', '1435', NULL, NULL, NULL, '1450', '703+747=1450', '');
INSERT INTO `teach_self_question` VALUES ('1460634232756895748', 0, '217+3=?', '220', '211', '207', '205', NULL, NULL, NULL, '220', '217+3=220', '');
INSERT INTO `teach_self_question` VALUES ('1460634232756895749', 0, '527+985=?', '1503', '1505', '1498', '1512', NULL, NULL, NULL, '1512', '527+985=1512', '');
INSERT INTO `teach_self_question` VALUES ('1460634232824004609', 0, '211+602=?', '813', '806', '807', '805', NULL, NULL, NULL, '813', '211+602=813', '');
INSERT INTO `teach_self_question` VALUES ('1460634232824004610', 0, '51+903=?', '946', '943', '954', '940', NULL, NULL, NULL, '954', '51+903=954', '');
INSERT INTO `teach_self_question` VALUES ('1460634232824004611', 0, '477+833=?', '1304', '1298', '1295', '1310', NULL, NULL, NULL, '1310', '477+833=1310', '');
INSERT INTO `teach_self_question` VALUES ('1460634232824004612', 0, '940+641=?', '1581', '1572', '1571', '1567', NULL, NULL, NULL, '1581', '940+641=1581', '');
INSERT INTO `teach_self_question` VALUES ('1460634232824004613', 0, '633+723=?', '1356', '1341', '1341', '1343', NULL, NULL, NULL, '1356', '633+723=1356', '');
INSERT INTO `teach_self_question` VALUES ('1460634232891113473', 0, '318+576=?', '883', '894', '880', '887', NULL, NULL, NULL, '894', '318+576=894', '');
INSERT INTO `teach_self_question` VALUES ('1460634232891113474', 0, '497+803=?', '1287', '1290', '1300', '1288', NULL, NULL, NULL, '1300', '497+803=1300', '');
INSERT INTO `teach_self_question` VALUES ('1460634232891113475', 0, '313+32=?', '335', '335', '339', '345', NULL, NULL, NULL, '345', '313+32=345', '');
INSERT INTO `teach_self_question` VALUES ('1460634232891113476', 0, '685+405=?', '1082', '1090', '1077', '1080', NULL, NULL, NULL, '1090', '685+405=1090', '');
INSERT INTO `teach_self_question` VALUES ('1460634232958222337', 0, '624+234=?', '843', '844', '858', '852', NULL, NULL, NULL, '858', '624+234=858', '');
INSERT INTO `teach_self_question` VALUES ('1460634232958222338', 0, '275+45=?', '305', '320', '306', '314', NULL, NULL, NULL, '320', '275+45=320', '');
INSERT INTO `teach_self_question` VALUES ('1460634232958222339', 0, '245+69=?', '307', '305', '308', '314', NULL, NULL, NULL, '314', '245+69=314', '');
INSERT INTO `teach_self_question` VALUES ('1460634232958222340', 0, '582+355=?', '924', '925', '937', '928', NULL, NULL, NULL, '937', '582+355=937', '');
INSERT INTO `teach_self_question` VALUES ('1460634232958222341', 0, '118+378=?', '484', '485', '484', '496', NULL, NULL, NULL, '496', '118+378=496', '');
INSERT INTO `teach_self_question` VALUES ('1460634232958222342', 0, '187+812=?', '999', '992', '991', '988', NULL, NULL, NULL, '999', '187+812=999', '');
INSERT INTO `teach_self_question` VALUES ('1460634233025331202', 0, '975+125=?', '1091', '1091', '1088', '1100', NULL, NULL, NULL, '1100', '975+125=1100', '');
INSERT INTO `teach_self_question` VALUES ('1460634233025331203', 0, '74+601=?', '667', '660', '675', '661', NULL, NULL, NULL, '675', '74+601=675', '');
INSERT INTO `teach_self_question` VALUES ('1460634233025331204', 0, '470+574=?', '1035', '1036', '1030', '1044', NULL, NULL, NULL, '1044', '470+574=1044', '');
INSERT INTO `teach_self_question` VALUES ('1460634233025331205', 0, '447+127=?', '564', '564', '565', '574', NULL, NULL, NULL, '574', '447+127=574', '');
INSERT INTO `teach_self_question` VALUES ('1460634233025331206', 0, '287+788=?', '1068', '1066', '1067', '1075', NULL, NULL, NULL, '1075', '287+788=1075', '');
INSERT INTO `teach_self_question` VALUES ('1460634233092440065', 0, '170+788=?', '947', '945', '950', '958', NULL, NULL, NULL, '958', '170+788=958', '');
INSERT INTO `teach_self_question` VALUES ('1460634233092440066', 0, '196+877=?', '1060', '1063', '1073', '1060', NULL, NULL, NULL, '1073', '196+877=1073', '');
INSERT INTO `teach_self_question` VALUES ('1460634233092440067', 0, '194+822=?', '1016', '1005', '1003', '1006', NULL, NULL, NULL, '1016', '194+822=1016', '');
INSERT INTO `teach_self_question` VALUES ('1460634233092440068', 0, '474+538=?', '1000', '1004', '1012', '997', NULL, NULL, NULL, '1012', '474+538=1012', '');
INSERT INTO `teach_self_question` VALUES ('1460634233092440069', 0, '464+460=?', '924', '914', '916', '916', NULL, NULL, NULL, '924', '464+460=924', '');
INSERT INTO `teach_self_question` VALUES ('1460634233159548930', 0, '507+493=?', '986', '990', '986', '1000', NULL, NULL, NULL, '1000', '507+493=1000', '');
INSERT INTO `teach_self_question` VALUES ('1460634233159548931', 0, '942+86=?', '1021', '1028', '1018', '1019', NULL, NULL, NULL, '1028', '942+86=1028', '');
INSERT INTO `teach_self_question` VALUES ('1460634233159548932', 0, '897+702=?', '1587', '1599', '1589', '1590', NULL, NULL, NULL, '1599', '897+702=1599', '');
INSERT INTO `teach_self_question` VALUES ('1460634233159548933', 0, '579+723=?', '1287', '1290', '1302', '1294', NULL, NULL, NULL, '1302', '579+723=1302', '');
INSERT INTO `teach_self_question` VALUES ('1460634233159548934', 0, '907+74=?', '975', '968', '981', '974', NULL, NULL, NULL, '981', '907+74=981', '');
INSERT INTO `teach_self_question` VALUES ('1460634233226657794', 0, '504+438=?', '932', '933', '930', '942', NULL, NULL, NULL, '942', '504+438=942', '');
INSERT INTO `teach_self_question` VALUES ('1460634233226657795', 0, '338+316=?', '647', '647', '654', '648', NULL, NULL, NULL, '654', '338+316=654', '');
INSERT INTO `teach_self_question` VALUES ('1460634233226657796', 0, '722+807=?', '1520', '1514', '1516', '1529', NULL, NULL, NULL, '1529', '722+807=1529', '');
INSERT INTO `teach_self_question` VALUES ('1460634233226657797', 0, '818+896=?', '1704', '1708', '1714', '1706', NULL, NULL, NULL, '1714', '818+896=1714', '');
INSERT INTO `teach_self_question` VALUES ('1460634233226657798', 0, '935+805=?', '1740', '1730', '1731', '1734', NULL, NULL, NULL, '1740', '935+805=1740', '');
INSERT INTO `teach_self_question` VALUES ('1460634233226657799', 0, '475+370=?', '839', '845', '838', '837', NULL, NULL, NULL, '845', '475+370=845', '');
INSERT INTO `teach_self_question` VALUES ('1460634233293766657', 0, '252+872=?', '1115', '1114', '1124', '1113', NULL, NULL, NULL, '1124', '252+872=1124', '');
INSERT INTO `teach_self_question` VALUES ('1460634233293766658', 0, '203+327=?', '517', '515', '516', '530', NULL, NULL, NULL, '530', '203+327=530', '');
INSERT INTO `teach_self_question` VALUES ('1460634233293766659', 0, '547+429=?', '962', '969', '976', '965', NULL, NULL, NULL, '976', '547+429=976', '');
INSERT INTO `teach_self_question` VALUES ('1460634233293766660', 0, '886+377=?', '1263', '1250', '1252', '1248', NULL, NULL, NULL, '1263', '886+377=1263', '');
INSERT INTO `teach_self_question` VALUES ('1460634233293766661', 0, '830+53=?', '868', '869', '883', '870', NULL, NULL, NULL, '883', '830+53=883', '');
INSERT INTO `teach_self_question` VALUES ('1460634233360875521', 0, '991+622=?', '1606', '1601', '1600', '1613', NULL, NULL, NULL, '1613', '991+622=1613', '');
INSERT INTO `teach_self_question` VALUES ('1460634233360875522', 0, '312+47=?', '350', '349', '350', '359', NULL, NULL, NULL, '359', '312+47=359', '');
INSERT INTO `teach_self_question` VALUES ('1460634233360875523', 0, '694+152=?', '832', '831', '833', '846', NULL, NULL, NULL, '846', '694+152=846', '');
INSERT INTO `teach_self_question` VALUES ('1460634233427984385', 0, '420+177=?', '588', '585', '588', '597', NULL, NULL, NULL, '597', '420+177=597', '');
INSERT INTO `teach_self_question` VALUES ('1460634233427984386', 0, '776+7=?', '783', '774', '776', '773', NULL, NULL, NULL, '783', '776+7=783', '');
INSERT INTO `teach_self_question` VALUES ('1460634233427984387', 0, '833+940=?', '1766', '1760', '1773', '1761', NULL, NULL, NULL, '1773', '833+940=1773', '');
INSERT INTO `teach_self_question` VALUES ('1460634233427984388', 0, '131+9=?', '128', '133', '140', '134', NULL, NULL, NULL, '140', '131+9=140', '');
INSERT INTO `teach_self_question` VALUES ('1460634233503481858', 0, '716+800=?', '1507', '1501', '1506', '1516', NULL, NULL, NULL, '1516', '716+800=1516', '');
INSERT INTO `teach_self_question` VALUES ('1460634233503481859', 0, '369+394=?', '763', '752', '755', '756', NULL, NULL, NULL, '763', '369+394=763', '');
INSERT INTO `teach_self_question` VALUES ('1460634233503481860', 0, '933+849=?', '1769', '1770', '1773', '1782', NULL, NULL, NULL, '1782', '933+849=1782', '');
INSERT INTO `teach_self_question` VALUES ('1460634233503481861', 0, '394+835=?', '1221', '1215', '1229', '1215', NULL, NULL, NULL, '1229', '394+835=1229', '');
INSERT INTO `teach_self_question` VALUES ('1460634233558007809', 0, '197+153=?', '350', '344', '342', '344', NULL, NULL, NULL, '350', '197+153=350', '');
INSERT INTO `teach_self_question` VALUES ('1460634233558007810', 0, '44+646=?', '678', '676', '679', '690', NULL, NULL, NULL, '690', '44+646=690', '');
INSERT INTO `teach_self_question` VALUES ('1460634233558007811', 0, '590+248=?', '832', '827', '838', '824', NULL, NULL, NULL, '838', '590+248=838', '');
INSERT INTO `teach_self_question` VALUES ('1460634233558007812', 0, '767+329=?', '1085', '1081', '1096', '1083', NULL, NULL, NULL, '1096', '767+329=1096', '');
INSERT INTO `teach_self_question` VALUES ('1460634233620922369', 0, '522+954=?', '1466', '1462', '1466', '1476', NULL, NULL, NULL, '1476', '522+954=1476', '');
INSERT INTO `teach_self_question` VALUES ('1460634233620922370', 0, '446+226=?', '658', '658', '672', '662', NULL, NULL, NULL, '672', '446+226=672', '');
INSERT INTO `teach_self_question` VALUES ('1460634233620922371', 0, '347+16=?', '353', '349', '363', '352', NULL, NULL, NULL, '363', '347+16=363', '');
INSERT INTO `teach_self_question` VALUES ('1460634233620922372', 0, '685+510=?', '1182', '1181', '1195', '1186', NULL, NULL, NULL, '1195', '685+510=1195', '');
INSERT INTO `teach_self_question` VALUES ('1460634233620922373', 0, '723+772=?', '1495', '1482', '1488', '1486', NULL, NULL, NULL, '1495', '723+772=1495', '');
INSERT INTO `teach_self_question` VALUES ('1460634233709002753', 0, '210+55=?', '258', '265', '256', '254', NULL, NULL, NULL, '265', '210+55=265', '');
INSERT INTO `teach_self_question` VALUES ('1460634233709002754', 0, '705+465=?', '1163', '1162', '1160', '1170', NULL, NULL, NULL, '1170', '705+465=1170', '');
INSERT INTO `teach_self_question` VALUES ('1460634233709002755', 0, '501+917=?', '1409', '1412', '1412', '1418', NULL, NULL, NULL, '1418', '501+917=1418', '');
INSERT INTO `teach_self_question` VALUES ('1460634233776111617', 0, '366+903=?', '1256', '1269', '1263', '1263', NULL, NULL, NULL, '1269', '366+903=1269', '');
INSERT INTO `teach_self_question` VALUES ('1460634233780305921', 0, '64+549=?', '613', '604', '603', '601', NULL, NULL, NULL, '613', '64+549=613', '');
INSERT INTO `teach_self_question` VALUES ('1460634233822248962', 0, '786+430=?', '1216', '1208', '1206', '1201', NULL, NULL, NULL, '1216', '786+430=1216', '');
INSERT INTO `teach_self_question` VALUES ('1460634233822248963', 0, '543+962=?', '1499', '1505', '1495', '1491', NULL, NULL, NULL, '1505', '543+962=1505', '');
INSERT INTO `teach_self_question` VALUES ('1460634233893552129', 0, '565+556=?', '1110', '1111', '1109', '1121', NULL, NULL, NULL, '1121', '565+556=1121', '');
INSERT INTO `teach_self_question` VALUES ('1460634233960660993', 0, '215+133=?', '337', '339', '348', '335', NULL, NULL, NULL, '348', '215+133=348', '');
INSERT INTO `teach_self_question` VALUES ('1460634233960660994', 0, '696+926=?', '1616', '1615', '1616', '1622', NULL, NULL, NULL, '1622', '696+926=1622', '');
INSERT INTO `teach_self_question` VALUES ('1460634233960660995', 0, '244+738=?', '976', '970', '982', '974', NULL, NULL, NULL, '982', '244+738=982', '');
INSERT INTO `teach_self_question` VALUES ('1460634233960660996', 0, '851+41=?', '885', '881', '892', '885', NULL, NULL, NULL, '892', '851+41=892', '');
INSERT INTO `teach_self_question` VALUES ('1460634234019381250', 0, '469+978=?', '1437', '1439', '1440', '1447', NULL, NULL, NULL, '1447', '469+978=1447', '');
INSERT INTO `teach_self_question` VALUES ('1460634234019381251', 0, '485+637=?', '1110', '1109', '1122', '1108', NULL, NULL, NULL, '1122', '485+637=1122', '');
INSERT INTO `teach_self_question` VALUES ('1460634234019381252', 0, '200+374=?', '574', '568', '561', '561', NULL, NULL, NULL, '574', '200+374=574', '');
INSERT INTO `teach_self_question` VALUES ('1460634234019381253', 0, '778+807=?', '1585', '1578', '1576', '1570', NULL, NULL, NULL, '1585', '778+807=1585', '');
INSERT INTO `teach_self_question` VALUES ('1460634234019381254', 0, '239+279=?', '509', '512', '510', '518', NULL, NULL, NULL, '518', '239+279=518', '');
INSERT INTO `teach_self_question` VALUES ('1460634234086490113', 0, '509+32=?', '529', '541', '528', '534', NULL, NULL, NULL, '541', '509+32=541', '');
INSERT INTO `teach_self_question` VALUES ('1460634234086490114', 0, '201+330=?', '521', '521', '517', '531', NULL, NULL, NULL, '531', '201+330=531', '');
INSERT INTO `teach_self_question` VALUES ('1460634234174570498', 0, '840+159=?', '992', '989', '991', '999', NULL, NULL, NULL, '999', '840+159=999', '');
INSERT INTO `teach_self_question` VALUES ('1460634234174570499', 0, '402+451=?', '840', '853', '840', '846', NULL, NULL, NULL, '853', '402+451=853', '');
INSERT INTO `teach_self_question` VALUES ('1460634234174570500', 0, '828+713=?', '1531', '1527', '1534', '1541', NULL, NULL, NULL, '1541', '828+713=1541', '');
INSERT INTO `teach_self_question` VALUES ('1460634234224902145', 0, '121+846=?', '956', '957', '956', '967', NULL, NULL, NULL, '967', '121+846=967', '');
INSERT INTO `teach_self_question` VALUES ('1460634234224902146', 0, '767+921=?', '1673', '1675', '1688', '1673', NULL, NULL, NULL, '1688', '767+921=1688', '');
INSERT INTO `teach_self_question` VALUES ('1460634234224902147', 0, '181+64=?', '239', '245', '237', '231', NULL, NULL, NULL, '245', '181+64=245', '');
INSERT INTO `teach_self_question` VALUES ('1460634234224902148', 0, '150+33=?', '171', '183', '172', '172', NULL, NULL, NULL, '183', '150+33=183', '');
INSERT INTO `teach_self_question` VALUES ('1460634234224902149', 0, '979+110=?', '1078', '1083', '1089', '1080', NULL, NULL, NULL, '1089', '979+110=1089', '');
INSERT INTO `teach_self_question` VALUES ('1460634234287816705', 0, '726+846=?', '1558', '1564', '1560', '1572', NULL, NULL, NULL, '1572', '726+846=1572', '');
INSERT INTO `teach_self_question` VALUES ('1460634234287816706', 0, '876+937=?', '1806', '1807', '1802', '1813', NULL, NULL, NULL, '1813', '876+937=1813', '');
INSERT INTO `teach_self_question` VALUES ('1460634234287816707', 0, '245+160=?', '405', '392', '396', '391', NULL, NULL, NULL, '405', '245+160=405', '');
INSERT INTO `teach_self_question` VALUES ('1460634234287816708', 0, '962+270=?', '1223', '1232', '1221', '1221', NULL, NULL, NULL, '1232', '962+270=1232', '');
INSERT INTO `teach_self_question` VALUES ('1460634234380091393', 0, '958+319=?', '1267', '1271', '1277', '1266', NULL, NULL, NULL, '1277', '958+319=1277', '');
INSERT INTO `teach_self_question` VALUES ('1460634234380091394', 0, '850+107=?', '943', '947', '943', '957', NULL, NULL, NULL, '957', '850+107=957', '');
INSERT INTO `teach_self_question` VALUES ('1460634234443005953', 0, '956+11=?', '967', '961', '952', '955', NULL, NULL, NULL, '967', '956+11=967', '');
INSERT INTO `teach_self_question` VALUES ('1460634234443005954', 0, '536+332=?', '861', '853', '868', '857', NULL, NULL, NULL, '868', '536+332=868', '');
INSERT INTO `teach_self_question` VALUES ('1460634234443005955', 0, '807+57=?', '858', '852', '864', '857', NULL, NULL, NULL, '864', '807+57=864', '');
INSERT INTO `teach_self_question` VALUES ('1460634234493337602', 0, '91+858=?', '938', '937', '942', '949', NULL, NULL, NULL, '949', '91+858=949', '');
INSERT INTO `teach_self_question` VALUES ('1460634234493337603', 0, '941+577=?', '1518', '1505', '1509', '1507', NULL, NULL, NULL, '1518', '941+577=1518', '');
INSERT INTO `teach_self_question` VALUES ('1460634234493337604', 0, '557+3=?', '560', '545', '548', '551', NULL, NULL, NULL, '560', '557+3=560', '');
INSERT INTO `teach_self_question` VALUES ('1460634234493337605', 0, '10+637=?', '647', '640', '637', '635', NULL, NULL, NULL, '647', '10+637=647', '');
INSERT INTO `teach_self_question` VALUES ('1460634234581417985', 0, '494+562=?', '1043', '1049', '1056', '1043', NULL, NULL, NULL, '1056', '494+562=1056', '');
INSERT INTO `teach_self_question` VALUES ('1460634234581417986', 0, '869+532=?', '1401', '1390', '1386', '1390', NULL, NULL, NULL, '1401', '869+532=1401', '');
INSERT INTO `teach_self_question` VALUES ('1460634234581417987', 0, '507+981=?', '1474', '1480', '1488', '1481', NULL, NULL, NULL, '1488', '507+981=1488', '');
INSERT INTO `teach_self_question` VALUES ('1460634234635943937', 0, '746+616=?', '1356', '1350', '1362', '1354', NULL, NULL, NULL, '1362', '746+616=1362', '');
INSERT INTO `teach_self_question` VALUES ('1460634234635943938', 0, '367+774=?', '1133', '1141', '1131', '1128', NULL, NULL, NULL, '1141', '367+774=1141', '');
INSERT INTO `teach_self_question` VALUES ('1460634234744995842', 0, '294+828=?', '1122', '1114', '1108', '1115', NULL, NULL, NULL, '1122', '294+828=1122', '');
INSERT INTO `teach_self_question` VALUES ('1460634234761773058', 0, '794+1=?', '784', '785', '789', '795', NULL, NULL, NULL, '795', '794+1=795', '');
INSERT INTO `teach_self_question` VALUES ('1460634234761773059', 0, '174+139=?', '300', '306', '304', '313', NULL, NULL, NULL, '313', '174+139=313', '');
INSERT INTO `teach_self_question` VALUES ('1460634234761773060', 0, '756+890=?', '1635', '1635', '1646', '1631', NULL, NULL, NULL, '1646', '756+890=1646', '');
INSERT INTO `teach_self_question` VALUES ('1460634234845659137', 0, '282+136=?', '406', '410', '418', '404', NULL, NULL, NULL, '418', '282+136=418', '');
INSERT INTO `teach_self_question` VALUES ('1460634234845659138', 0, '176+564=?', '733', '727', '740', '730', NULL, NULL, NULL, '740', '176+564=740', '');
INSERT INTO `teach_self_question` VALUES ('1460634234845659139', 0, '925+722=?', '1638', '1647', '1637', '1635', NULL, NULL, NULL, '1647', '925+722=1647', '');
INSERT INTO `teach_self_question` VALUES ('1460634234887602178', 0, '472+272=?', '733', '732', '744', '731', NULL, NULL, NULL, '744', '472+272=744', '');
INSERT INTO `teach_self_question` VALUES ('1460634234887602179', 0, '164+954=?', '1108', '1118', '1104', '1110', NULL, NULL, NULL, '1118', '164+954=1118', '');
INSERT INTO `teach_self_question` VALUES ('1460634234887602180', 0, '991+149=?', '1125', '1134', '1140', '1131', NULL, NULL, NULL, '1140', '991+149=1140', '');
INSERT INTO `teach_self_question` VALUES ('1460634234887602181', 0, '696+752=?', '1438', '1448', '1437', '1437', NULL, NULL, NULL, '1448', '696+752=1448', '');
INSERT INTO `teach_self_question` VALUES ('1460634234887602182', 0, '711+581=?', '1292', '1279', '1277', '1285', NULL, NULL, NULL, '1292', '711+581=1292', '');
INSERT INTO `teach_self_question` VALUES ('1460634234887602183', 0, '475+534=?', '1009', '996', '1000', '995', NULL, NULL, NULL, '1009', '475+534=1009', '');
INSERT INTO `teach_self_question` VALUES ('1460634234992459777', 0, '356+543=?', '899', '884', '891', '892', NULL, NULL, NULL, '899', '356+543=899', '');
INSERT INTO `teach_self_question` VALUES ('1460634235042791425', 0, '77+380=?', '444', '443', '457', '444', NULL, NULL, NULL, '457', '77+380=457', '');
INSERT INTO `teach_self_question` VALUES ('1460634235042791426', 0, '104+571=?', '660', '667', '664', '675', NULL, NULL, NULL, '675', '104+571=675', '');
INSERT INTO `teach_self_question` VALUES ('1460634235093123073', 0, '480+873=?', '1340', '1345', '1353', '1344', NULL, NULL, NULL, '1353', '480+873=1353', '');
INSERT INTO `teach_self_question` VALUES ('1460634235093123074', 0, '157+144=?', '286', '301', '291', '292', NULL, NULL, NULL, '301', '157+144=301', '');
INSERT INTO `teach_self_question` VALUES ('1460634235093123075', 0, '387+994=?', '1368', '1370', '1381', '1370', NULL, NULL, NULL, '1381', '387+994=1381', '');
INSERT INTO `teach_self_question` VALUES ('1460634235156037633', 0, '111+838=?', '938', '940', '949', '937', NULL, NULL, NULL, '949', '111+838=949', '');
INSERT INTO `teach_self_question` VALUES ('1460634235156037634', 0, '980+927=?', '1900', '1896', '1907', '1901', NULL, NULL, NULL, '1907', '980+927=1907', '');
INSERT INTO `teach_self_question` VALUES ('1460634235156037635', 0, '366+654=?', '1012', '1020', '1011', '1007', NULL, NULL, NULL, '1020', '366+654=1020', '');
INSERT INTO `teach_self_question` VALUES ('1460634235156037636', 0, '458+185=?', '643', '633', '629', '636', NULL, NULL, NULL, '643', '458+185=643', '');
INSERT INTO `teach_self_question` VALUES ('1460634235260895233', 0, '158+455=?', '604', '598', '613', '607', NULL, NULL, NULL, '613', '158+455=613', '');
INSERT INTO `teach_self_question` VALUES ('1460634235260895234', 0, '786+432=?', '1212', '1218', '1205', '1206', NULL, NULL, NULL, '1218', '786+432=1218', '');
INSERT INTO `teach_self_question` VALUES ('1460634235260895235', 0, '60+181=?', '235', '241', '231', '232', NULL, NULL, NULL, '241', '60+181=241', '');
INSERT INTO `teach_self_question` VALUES ('1460634235311226882', 0, '907+172=?', '1066', '1067', '1073', '1079', NULL, NULL, NULL, '1079', '907+172=1079', '');
INSERT INTO `teach_self_question` VALUES ('1460634235311226883', 0, '478+144=?', '609', '622', '611', '616', NULL, NULL, NULL, '622', '478+144=622', '');
INSERT INTO `teach_self_question` VALUES ('1460634235311226884', 0, '580+944=?', '1509', '1524', '1517', '1511', NULL, NULL, NULL, '1524', '580+944=1524', '');
INSERT INTO `teach_self_question` VALUES ('1460634235311226885', 0, '674+425=?', '1093', '1099', '1093', '1086', NULL, NULL, NULL, '1099', '674+425=1099', '');
INSERT INTO `teach_self_question` VALUES ('1460634235357364226', 0, '822+198=?', '1014', '1020', '1014', '1013', NULL, NULL, NULL, '1020', '822+198=1020', '');
INSERT INTO `teach_self_question` VALUES ('1460634235357364227', 0, '826+107=?', '924', '920', '924', '933', NULL, NULL, NULL, '933', '826+107=933', '');
INSERT INTO `teach_self_question` VALUES ('1460634235357364228', 0, '416+160=?', '570', '565', '563', '576', NULL, NULL, NULL, '576', '416+160=576', '');
INSERT INTO `teach_self_question` VALUES ('1460634235424473090', 0, '818+410=?', '1228', '1220', '1222', '1213', NULL, NULL, NULL, '1228', '818+410=1228', '');
INSERT INTO `teach_self_question` VALUES ('1460634235533524993', 0, '826+195=?', '1021', '1012', '1015', '1010', NULL, NULL, NULL, '1021', '826+195=1021', '');
INSERT INTO `teach_self_question` VALUES ('1460634235554496513', 0, '689+622=?', '1298', '1311', '1301', '1305', NULL, NULL, NULL, '1311', '689+622=1311', '');
INSERT INTO `teach_self_question` VALUES ('1460634235554496514', 0, '837+568=?', '1405', '1396', '1393', '1390', NULL, NULL, NULL, '1405', '837+568=1405', '');
INSERT INTO `teach_self_question` VALUES ('1460634235554496515', 0, '221+754=?', '965', '975', '969', '962', NULL, NULL, NULL, '975', '221+754=975', '');
INSERT INTO `teach_self_question` VALUES ('1460634235554496516', 0, '237+146=?', '376', '375', '383', '376', NULL, NULL, NULL, '383', '237+146=383', '');
INSERT INTO `teach_self_question` VALUES ('1460634235621605378', 0, '815+928=?', '1729', '1729', '1732', '1743', NULL, NULL, NULL, '1743', '815+928=1743', '');
INSERT INTO `teach_self_question` VALUES ('1460634235621605379', 0, '734+213=?', '933', '933', '947', '936', NULL, NULL, NULL, '947', '734+213=947', '');
INSERT INTO `teach_self_question` VALUES ('1460634235713880066', 0, '87+7=?', '79', '94', '81', '81', NULL, NULL, NULL, '94', '87+7=94', '');
INSERT INTO `teach_self_question` VALUES ('1460634235713880067', 0, '823+726=?', '1535', '1542', '1549', '1536', NULL, NULL, NULL, '1549', '823+726=1549', '');
INSERT INTO `teach_self_question` VALUES ('1460634235713880068', 0, '406+787=?', '1193', '1181', '1187', '1185', NULL, NULL, NULL, '1193', '406+787=1193', '');
INSERT INTO `teach_self_question` VALUES ('1460634235760017409', 0, '654+242=?', '884', '882', '896', '888', NULL, NULL, NULL, '896', '654+242=896', '');
INSERT INTO `teach_self_question` VALUES ('1460634235760017410', 0, '943+330=?', '1259', '1260', '1273', '1260', NULL, NULL, NULL, '1273', '943+330=1273', '');
INSERT INTO `teach_self_question` VALUES ('1460634235760017411', 0, '199+88=?', '276', '277', '280', '287', NULL, NULL, NULL, '287', '199+88=287', '');
INSERT INTO `teach_self_question` VALUES ('1460634235760017412', 0, '623+323=?', '934', '936', '939', '946', NULL, NULL, NULL, '946', '623+323=946', '');
INSERT INTO `teach_self_question` VALUES ('1460634235760017413', 0, '555+935=?', '1480', '1490', '1476', '1484', NULL, NULL, NULL, '1490', '555+935=1490', '');
INSERT INTO `teach_self_question` VALUES ('1460634235831320578', 0, '625+910=?', '1526', '1523', '1525', '1535', NULL, NULL, NULL, '1535', '625+910=1535', '');
INSERT INTO `teach_self_question` VALUES ('1460634235831320579', 0, '233+835=?', '1053', '1054', '1068', '1054', NULL, NULL, NULL, '1068', '233+835=1068', '');
INSERT INTO `teach_self_question` VALUES ('1460634235831320580', 0, '162+593=?', '747', '755', '741', '746', NULL, NULL, NULL, '755', '162+593=755', '');
INSERT INTO `teach_self_question` VALUES ('1460634235890040833', 0, '717+81=?', '789', '798', '787', '791', NULL, NULL, NULL, '798', '717+81=798', '');
INSERT INTO `teach_self_question` VALUES ('1460634235973926913', 0, '426+235=?', '646', '654', '648', '661', NULL, NULL, NULL, '661', '426+235=661', '');
INSERT INTO `teach_self_question` VALUES ('1460634235973926914', 0, '814+729=?', '1543', '1533', '1532', '1530', NULL, NULL, NULL, '1543', '814+729=1543', '');
INSERT INTO `teach_self_question` VALUES ('1460634235973926915', 0, '358+852=?', '1210', '1197', '1203', '1201', NULL, NULL, NULL, '1210', '358+852=1210', '');
INSERT INTO `teach_self_question` VALUES ('1460634235973926916', 0, '668+422=?', '1090', '1078', '1077', '1082', NULL, NULL, NULL, '1090', '668+422=1090', '');
INSERT INTO `teach_self_question` VALUES ('1460634236070395906', 0, '630+723=?', '1345', '1353', '1341', '1347', NULL, NULL, NULL, '1353', '630+723=1353', '');
INSERT INTO `teach_self_question` VALUES ('1460634236112338945', 0, '573+418=?', '984', '991', '979', '985', NULL, NULL, NULL, '991', '573+418=991', '');
INSERT INTO `teach_self_question` VALUES ('1460634236112338946', 0, '95+22=?', '104', '109', '109', '117', NULL, NULL, NULL, '117', '95+22=117', '');
INSERT INTO `teach_self_question` VALUES ('1460634236112338947', 0, '698+524=?', '1222', '1211', '1207', '1214', NULL, NULL, NULL, '1222', '698+524=1222', '');
INSERT INTO `teach_self_question` VALUES ('1460634236112338948', 0, '243+262=?', '491', '492', '495', '505', NULL, NULL, NULL, '505', '243+262=505', '');
INSERT INTO `teach_self_question` VALUES ('1460634236179447810', 0, '523+420=?', '935', '943', '929', '932', NULL, NULL, NULL, '943', '523+420=943', '');
INSERT INTO `teach_self_question` VALUES ('1460634236179447811', 0, '913+270=?', '1175', '1177', '1183', '1174', NULL, NULL, NULL, '1183', '913+270=1183', '');
INSERT INTO `teach_self_question` VALUES ('1460634236179447812', 0, '373+706=?', '1070', '1079', '1069', '1066', NULL, NULL, NULL, '1079', '373+706=1079', '');
INSERT INTO `teach_self_question` VALUES ('1460634236179447813', 0, '92+28=?', '109', '113', '120', '113', NULL, NULL, NULL, '120', '92+28=120', '');
INSERT INTO `teach_self_question` VALUES ('1460634236225585153', 0, '426+393=?', '810', '819', '810', '810', NULL, NULL, NULL, '819', '426+393=819', '');
INSERT INTO `teach_self_question` VALUES ('1460634236242362369', 0, '345+836=?', '1174', '1171', '1181', '1174', NULL, NULL, NULL, '1181', '345+836=1181', '');
INSERT INTO `teach_self_question` VALUES ('1460634236242362370', 0, '192+961=?', '1146', '1143', '1153', '1144', NULL, NULL, NULL, '1153', '192+961=1153', '');
INSERT INTO `teach_self_question` VALUES ('1460634236242362371', 0, '949+598=?', '1539', '1538', '1547', '1536', NULL, NULL, NULL, '1547', '949+598=1547', '');
INSERT INTO `teach_self_question` VALUES ('1460634236288499713', 0, '696+141=?', '837', '826', '825', '823', NULL, NULL, NULL, '837', '696+141=837', '');
INSERT INTO `teach_self_question` VALUES ('1460634236288499714', 0, '74+366=?', '440', '431', '431', '427', NULL, NULL, NULL, '440', '74+366=440', '');
INSERT INTO `teach_self_question` VALUES ('1460634236288499715', 0, '636+485=?', '1121', '1111', '1109', '1114', NULL, NULL, NULL, '1121', '636+485=1121', '');
INSERT INTO `teach_self_question` VALUES ('1460634236288499716', 0, '228+434=?', '656', '656', '650', '662', NULL, NULL, NULL, '662', '228+434=662', '');
INSERT INTO `teach_self_question` VALUES ('1460634236401745922', 0, '319+66=?', '377', '385', '371', '378', NULL, NULL, NULL, '385', '319+66=385', '');
INSERT INTO `teach_self_question` VALUES ('1460634236422717441', 0, '831+8=?', '830', '826', '832', '839', NULL, NULL, NULL, '839', '831+8=839', '');
INSERT INTO `teach_self_question` VALUES ('1460634236422717442', 0, '592+130=?', '722', '710', '713', '707', NULL, NULL, NULL, '722', '592+130=722', '');
INSERT INTO `teach_self_question` VALUES ('1460634236422717443', 0, '19+844=?', '854', '856', '856', '863', NULL, NULL, NULL, '863', '19+844=863', '');
INSERT INTO `teach_self_question` VALUES ('1460634236489826305', 0, '227+705=?', '922', '920', '932', '926', NULL, NULL, NULL, '932', '227+705=932', '');
INSERT INTO `teach_self_question` VALUES ('1460634236489826306', 0, '251+918=?', '1155', '1154', '1160', '1169', NULL, NULL, NULL, '1169', '251+918=1169', '');
INSERT INTO `teach_self_question` VALUES ('1460634236489826307', 0, '756+10=?', '766', '752', '753', '760', NULL, NULL, NULL, '766', '756+10=766', '');
INSERT INTO `teach_self_question` VALUES ('1460634236577906690', 0, '264+621=?', '878', '878', '885', '872', NULL, NULL, NULL, '885', '264+621=885', '');
INSERT INTO `teach_self_question` VALUES ('1460634236577906691', 0, '529+45=?', '563', '574', '560', '563', NULL, NULL, NULL, '574', '529+45=574', '');
INSERT INTO `teach_self_question` VALUES ('1460634236577906692', 0, '682+485=?', '1153', '1157', '1155', '1167', NULL, NULL, NULL, '1167', '682+485=1167', '');
INSERT INTO `teach_self_question` VALUES ('1460634236577906693', 0, '589+723=?', '1312', '1301', '1301', '1297', NULL, NULL, NULL, '1312', '589+723=1312', '');
INSERT INTO `teach_self_question` VALUES ('1460634236653404162', 0, '225+731=?', '945', '956', '949', '950', NULL, NULL, NULL, '956', '225+731=956', '');
INSERT INTO `teach_self_question` VALUES ('1460634236712124418', 0, '521+861=?', '1368', '1382', '1370', '1369', NULL, NULL, NULL, '1382', '521+861=1382', '');
INSERT INTO `teach_self_question` VALUES ('1460634236712124419', 0, '871+306=?', '1177', '1168', '1168', '1170', NULL, NULL, NULL, '1177', '871+306=1177', '');
INSERT INTO `teach_self_question` VALUES ('1460634236762456065', 0, '469+409=?', '878', '869', '865', '870', NULL, NULL, NULL, '878', '469+409=878', '');
INSERT INTO `teach_self_question` VALUES ('1460634236762456066', 0, '977+332=?', '1300', '1294', '1309', '1302', NULL, NULL, NULL, '1309', '977+332=1309', '');
INSERT INTO `teach_self_question` VALUES ('1460634236762456067', 0, '301+968=?', '1269', '1254', '1256', '1255', NULL, NULL, NULL, '1269', '301+968=1269', '');
INSERT INTO `teach_self_question` VALUES ('1460634236833759233', 0, '18+353=?', '371', '359', '362', '356', NULL, NULL, NULL, '371', '18+353=371', '');
INSERT INTO `teach_self_question` VALUES ('1460634236833759234', 0, '142+922=?', '1055', '1050', '1064', '1051', NULL, NULL, NULL, '1064', '142+922=1064', '');
INSERT INTO `teach_self_question` VALUES ('1460634236833759235', 0, '368+615=?', '983', '977', '972', '973', NULL, NULL, NULL, '983', '368+615=983', '');
INSERT INTO `teach_self_question` VALUES ('1460634236833759236', 0, '776+818=?', '1587', '1585', '1594', '1580', NULL, NULL, NULL, '1594', '776+818=1594', '');
INSERT INTO `teach_self_question` VALUES ('1460634236896673794', 0, '630+518=?', '1136', '1148', '1137', '1140', NULL, NULL, NULL, '1148', '630+518=1148', '');
INSERT INTO `teach_self_question` VALUES ('1460634236896673795', 0, '624+426=?', '1050', '1040', '1036', '1040', NULL, NULL, NULL, '1050', '624+426=1050', '');
INSERT INTO `teach_self_question` VALUES ('1460634236896673796', 0, '633+578=?', '1199', '1211', '1199', '1200', NULL, NULL, NULL, '1211', '633+578=1211', '');
INSERT INTO `teach_self_question` VALUES ('1460634236896673797', 0, '130+27=?', '157', '142', '147', '148', NULL, NULL, NULL, '157', '130+27=157', '');
INSERT INTO `teach_self_question` VALUES ('1460634236976365570', 0, '710+111=?', '811', '821', '807', '810', NULL, NULL, NULL, '821', '710+111=821', '');
INSERT INTO `teach_self_question` VALUES ('1460634236976365571', 0, '893+671=?', '1554', '1564', '1557', '1555', NULL, NULL, NULL, '1564', '893+671=1564', '');
INSERT INTO `teach_self_question` VALUES ('1460634237056057346', 0, '674+288=?', '953', '956', '950', '962', NULL, NULL, NULL, '962', '674+288=962', '');
INSERT INTO `teach_self_question` VALUES ('1460634237056057347', 0, '876+545=?', '1415', '1413', '1406', '1421', NULL, NULL, NULL, '1421', '876+545=1421', '');
INSERT INTO `teach_self_question` VALUES ('1460634237089611777', 0, '131+375=?', '497', '496', '506', '500', NULL, NULL, NULL, '506', '131+375=506', '');
INSERT INTO `teach_self_question` VALUES ('1460634237152526338', 0, '581+250=?', '831', '825', '824', '825', NULL, NULL, NULL, '831', '581+250=831', '');
INSERT INTO `teach_self_question` VALUES ('1460634237152526339', 0, '238+739=?', '966', '963', '966', '977', NULL, NULL, NULL, '977', '238+739=977', '');
INSERT INTO `teach_self_question` VALUES ('1460634237152526340', 0, '410+7=?', '411', '408', '405', '417', NULL, NULL, NULL, '417', '410+7=417', '');
INSERT INTO `teach_self_question` VALUES ('1460634237152526341', 0, '660+939=?', '1591', '1599', '1586', '1586', NULL, NULL, NULL, '1599', '660+939=1599', '');
INSERT INTO `teach_self_question` VALUES ('1460634237152526342', 0, '777+681=?', '1458', '1449', '1444', '1450', NULL, NULL, NULL, '1458', '777+681=1458', '');
INSERT INTO `teach_self_question` VALUES ('1460634237223829506', 0, '816+139=?', '940', '947', '955', '947', NULL, NULL, NULL, '955', '816+139=955', '');
INSERT INTO `teach_self_question` VALUES ('1460634237223829507', 0, '863+430=?', '1278', '1279', '1287', '1293', NULL, NULL, NULL, '1293', '863+430=1293', '');
INSERT INTO `teach_self_question` VALUES ('1460634237223829508', 0, '328+702=?', '1030', '1021', '1016', '1020', NULL, NULL, NULL, '1030', '328+702=1030', '');
INSERT INTO `teach_self_question` VALUES ('1460634237290938369', 0, '469+265=?', '725', '726', '725', '734', NULL, NULL, NULL, '734', '469+265=734', '');
INSERT INTO `teach_self_question` VALUES ('1460634237290938370', 0, '561+158=?', '711', '709', '709', '719', NULL, NULL, NULL, '719', '561+158=719', '');
INSERT INTO `teach_self_question` VALUES ('1460634237290938371', 0, '24+78=?', '89', '102', '87', '89', NULL, NULL, NULL, '102', '24+78=102', '');
INSERT INTO `teach_self_question` VALUES ('1460634237290938372', 0, '569+777=?', '1337', '1346', '1334', '1334', NULL, NULL, NULL, '1346', '569+777=1346', '');
INSERT INTO `teach_self_question` VALUES ('1460634237349658626', 0, '98+374=?', '466', '460', '457', '472', NULL, NULL, NULL, '472', '98+374=472', '');
INSERT INTO `teach_self_question` VALUES ('1460634237349658627', 0, '859+184=?', '1043', '1033', '1031', '1032', NULL, NULL, NULL, '1043', '859+184=1043', '');
INSERT INTO `teach_self_question` VALUES ('1460634237349658628', 0, '707+14=?', '707', '713', '721', '713', NULL, NULL, NULL, '721', '707+14=721', '');
INSERT INTO `teach_self_question` VALUES ('1460634237349658629', 0, '563+2=?', '556', '565', '559', '554', NULL, NULL, NULL, '565', '563+2=565', '');
INSERT INTO `teach_self_question` VALUES ('1460634237349658630', 0, '494+914=?', '1408', '1401', '1396', '1396', NULL, NULL, NULL, '1408', '494+914=1408', '');
INSERT INTO `teach_self_question` VALUES ('1460634237349658631', 0, '546+169=?', '715', '709', '709', '701', NULL, NULL, NULL, '715', '546+169=715', '');
INSERT INTO `teach_self_question` VALUES ('1460634237420961794', 0, '961+77=?', '1029', '1028', '1038', '1025', NULL, NULL, NULL, '1038', '961+77=1038', '');
INSERT INTO `teach_self_question` VALUES ('1460634237420961795', 0, '521+50=?', '571', '561', '564', '556', NULL, NULL, NULL, '571', '521+50=571', '');
INSERT INTO `teach_self_question` VALUES ('1460634237420961796', 0, '890+335=?', '1225', '1213', '1211', '1214', NULL, NULL, NULL, '1225', '890+335=1225', '');
INSERT INTO `teach_self_question` VALUES ('1460634237479682049', 0, '87+575=?', '651', '662', '649', '649', NULL, NULL, NULL, '662', '87+575=662', '');
INSERT INTO `teach_self_question` VALUES ('1460634237479682050', 0, '143+210=?', '353', '340', '347', '340', NULL, NULL, NULL, '353', '143+210=353', '');
INSERT INTO `teach_self_question` VALUES ('1460634237479682051', 0, '496+706=?', '1195', '1202', '1194', '1187', NULL, NULL, NULL, '1202', '496+706=1202', '');
INSERT INTO `teach_self_question` VALUES ('1460634237479682052', 0, '389+127=?', '516', '507', '509', '510', NULL, NULL, NULL, '516', '389+127=516', '');
INSERT INTO `teach_self_question` VALUES ('1460634237479682053', 0, '883+346=?', '1220', '1214', '1229', '1218', NULL, NULL, NULL, '1229', '883+346=1229', '');
INSERT INTO `teach_self_question` VALUES ('1460634237584539650', 0, '603+260=?', '863', '850', '852', '856', NULL, NULL, NULL, '863', '603+260=863', '');
INSERT INTO `teach_self_question` VALUES ('1460634237630676993', 0, '518+381=?', '887', '899', '888', '887', NULL, NULL, NULL, '899', '518+381=899', '');
INSERT INTO `teach_self_question` VALUES ('1460634237681008642', 0, '860+969=?', '1820', '1814', '1816', '1829', NULL, NULL, NULL, '1829', '860+969=1829', '');
INSERT INTO `teach_self_question` VALUES ('1460634237681008643', 0, '384+357=?', '734', '735', '741', '729', NULL, NULL, NULL, '741', '384+357=741', '');
INSERT INTO `teach_self_question` VALUES ('1460634237681008644', 0, '234+897=?', '1119', '1118', '1122', '1131', NULL, NULL, NULL, '1131', '234+897=1131', '');
INSERT INTO `teach_self_question` VALUES ('1460634237681008645', 0, '148+273=?', '415', '412', '408', '421', NULL, NULL, NULL, '421', '148+273=421', '');
INSERT INTO `teach_self_question` VALUES ('1460634237681008646', 0, '470+612=?', '1072', '1082', '1075', '1067', NULL, NULL, NULL, '1082', '470+612=1082', '');
INSERT INTO `teach_self_question` VALUES ('1460634237743923202', 0, '404+335=?', '731', '732', '728', '739', NULL, NULL, NULL, '739', '404+335=739', '');
INSERT INTO `teach_self_question` VALUES ('1460634237743923203', 0, '936+409=?', '1332', '1333', '1334', '1345', NULL, NULL, NULL, '1345', '936+409=1345', '');
INSERT INTO `teach_self_question` VALUES ('1460634237743923204', 0, '565+552=?', '1110', '1103', '1117', '1109', NULL, NULL, NULL, '1117', '565+552=1117', '');
INSERT INTO `teach_self_question` VALUES ('1460634237743923205', 0, '399+564=?', '950', '950', '963', '948', NULL, NULL, NULL, '963', '399+564=963', '');
INSERT INTO `teach_self_question` VALUES ('1460634237974609921', 0, '761+993=?', '1746', '1742', '1744', '1754', NULL, NULL, NULL, '1754', '761+993=1754', '');
INSERT INTO `teach_self_question` VALUES ('1460634237974609922', 0, '657+540=?', '1197', '1187', '1183', '1183', NULL, NULL, NULL, '1197', '657+540=1197', '');
INSERT INTO `teach_self_question` VALUES ('1460634238008164354', 0, '199+929=?', '1122', '1128', '1117', '1114', NULL, NULL, NULL, '1128', '199+929=1128', '');
INSERT INTO `teach_self_question` VALUES ('1460634238008164355', 0, '130+851=?', '981', '974', '966', '974', NULL, NULL, NULL, '981', '130+851=981', '');
INSERT INTO `teach_self_question` VALUES ('1460634238008164356', 0, '461+386=?', '838', '833', '847', '839', NULL, NULL, NULL, '847', '461+386=847', '');
INSERT INTO `teach_self_question` VALUES ('1460634238008164357', 0, '743+746=?', '1482', '1480', '1474', '1489', NULL, NULL, NULL, '1489', '743+746=1489', '');
INSERT INTO `teach_self_question` VALUES ('1460634238113021954', 0, '83+676=?', '749', '759', '750', '750', NULL, NULL, NULL, '759', '83+676=759', '');
INSERT INTO `teach_self_question` VALUES ('1460634238146576386', 0, '264+906=?', '1156', '1161', '1161', '1170', NULL, NULL, NULL, '1170', '264+906=1170', '');
INSERT INTO `teach_self_question` VALUES ('1460634238289182722', 0, '129+664=?', '784', '782', '782', '793', NULL, NULL, NULL, '793', '129+664=793', '');
INSERT INTO `teach_self_question` VALUES ('1460634238289182723', 0, '184+6=?', '177', '184', '180', '190', NULL, NULL, NULL, '190', '184+6=190', '');
INSERT INTO `teach_self_question` VALUES ('1460634238339514369', 0, '392+665=?', '1042', '1042', '1047', '1057', NULL, NULL, NULL, '1057', '392+665=1057', '');
INSERT INTO `teach_self_question` VALUES ('1460634238398234625', 0, '0+234=?', '226', '223', '234', '225', NULL, NULL, NULL, '234', '0+234=234', '');
INSERT INTO `teach_self_question` VALUES ('1460634238398234626', 0, '606+20=?', '611', '626', '614', '617', NULL, NULL, NULL, '626', '606+20=626', '');
INSERT INTO `teach_self_question` VALUES ('1460634238398234627', 0, '910+719=?', '1620', '1618', '1618', '1629', NULL, NULL, NULL, '1629', '910+719=1629', '');
INSERT INTO `teach_self_question` VALUES ('1460634238494703617', 0, '437+72=?', '501', '509', '501', '503', NULL, NULL, NULL, '509', '437+72=509', '');
INSERT INTO `teach_self_question` VALUES ('1460634238586978305', 0, '455+621=?', '1069', '1070', '1076', '1064', NULL, NULL, NULL, '1076', '455+621=1076', '');
INSERT INTO `teach_self_question` VALUES ('1460634238586978306', 0, '116+645=?', '751', '761', '754', '747', NULL, NULL, NULL, '761', '116+645=761', '');
INSERT INTO `teach_self_question` VALUES ('1460634238586978307', 0, '418+222=?', '630', '625', '631', '640', NULL, NULL, NULL, '640', '418+222=640', '');
INSERT INTO `teach_self_question` VALUES ('1460634238654087170', 0, '700+675=?', '1368', '1365', '1361', '1375', NULL, NULL, NULL, '1375', '700+675=1375', '');
INSERT INTO `teach_self_question` VALUES ('1460634238654087171', 0, '13+759=?', '772', '763', '763', '758', NULL, NULL, NULL, '772', '13+759=772', '');
INSERT INTO `teach_self_question` VALUES ('1460634238721196033', 0, '588+779=?', '1367', '1357', '1353', '1359', NULL, NULL, NULL, '1367', '588+779=1367', '');
INSERT INTO `teach_self_question` VALUES ('1460634238721196034', 0, '871+187=?', '1050', '1058', '1047', '1050', NULL, NULL, NULL, '1058', '871+187=1058', '');
INSERT INTO `teach_self_question` VALUES ('1460634238721196035', 0, '167+703=?', '857', '870', '855', '861', NULL, NULL, NULL, '870', '167+703=870', '');
INSERT INTO `teach_self_question` VALUES ('1460634238721196036', 0, '193+272=?', '465', '455', '459', '457', NULL, NULL, NULL, '465', '193+272=465', '');
INSERT INTO `teach_self_question` VALUES ('1460634238792499201', 0, '109+495=?', '604', '595', '592', '592', NULL, NULL, NULL, '604', '109+495=604', '');
INSERT INTO `teach_self_question` VALUES ('1460634238792499202', 0, '114+9=?', '110', '114', '123', '112', NULL, NULL, NULL, '123', '114+9=123', '');
INSERT INTO `teach_self_question` VALUES ('1460634238859608066', 0, '11+20=?', '25', '21', '31', '19', NULL, NULL, NULL, '31', '11+20=31', '');
INSERT INTO `teach_self_question` VALUES ('1460634238859608067', 0, '464+849=?', '1313', '1306', '1301', '1306', NULL, NULL, NULL, '1313', '464+849=1313', '');
INSERT INTO `teach_self_question` VALUES ('1460634238859608068', 0, '133+928=?', '1046', '1051', '1046', '1061', NULL, NULL, NULL, '1061', '133+928=1061', '');
INSERT INTO `teach_self_question` VALUES ('1460634238859608069', 0, '948+265=?', '1204', '1200', '1206', '1213', NULL, NULL, NULL, '1213', '948+265=1213', '');
INSERT INTO `teach_self_question` VALUES ('1460634238939299841', 0, '268+608=?', '865', '867', '865', '876', NULL, NULL, NULL, '876', '268+608=876', '');
INSERT INTO `teach_self_question` VALUES ('1460634238939299842', 0, '351+324=?', '675', '669', '664', '660', NULL, NULL, NULL, '675', '351+324=675', '');
INSERT INTO `teach_self_question` VALUES ('1460634238939299843', 0, '262+331=?', '593', '581', '580', '586', NULL, NULL, NULL, '593', '262+331=593', '');
INSERT INTO `teach_self_question` VALUES ('1460634238939299844', 0, '413+732=?', '1135', '1145', '1137', '1131', NULL, NULL, NULL, '1145', '413+732=1145', '');
INSERT INTO `teach_self_question` VALUES ('1460634238939299845', 0, '507+176=?', '676', '673', '677', '683', NULL, NULL, NULL, '683', '507+176=683', '');
INSERT INTO `teach_self_question` VALUES ('1460634238939299846', 0, '243+731=?', '974', '967', '963', '963', NULL, NULL, NULL, '974', '243+731=974', '');
INSERT INTO `teach_self_question` VALUES ('1460634239060934657', 0, '563+102=?', '665', '657', '651', '657', NULL, NULL, NULL, '665', '563+102=665', '');
INSERT INTO `teach_self_question` VALUES ('1460634239060934658', 0, '668+379=?', '1035', '1047', '1041', '1036', NULL, NULL, NULL, '1047', '668+379=1047', '');
INSERT INTO `teach_self_question` VALUES ('1460634239060934659', 0, '1+772=?', '764', '763', '773', '760', NULL, NULL, NULL, '773', '1+772=773', '');
INSERT INTO `teach_self_question` VALUES ('1460634239060934660', 0, '560+669=?', '1223', '1219', '1229', '1219', NULL, NULL, NULL, '1229', '560+669=1229', '');
INSERT INTO `teach_self_question` VALUES ('1460634239060934661', 0, '740+382=?', '1108', '1116', '1108', '1122', NULL, NULL, NULL, '1122', '740+382=1122', '');
INSERT INTO `teach_self_question` VALUES ('1460634239144820737', 0, '442+149=?', '579', '591', '583', '583', NULL, NULL, NULL, '591', '442+149=591', '');
INSERT INTO `teach_self_question` VALUES ('1460634239325175810', 0, '688+194=?', '867', '872', '870', '882', NULL, NULL, NULL, '882', '688+194=882', '');
INSERT INTO `teach_self_question` VALUES ('1460634239413256194', 0, '11+376=?', '381', '374', '379', '387', NULL, NULL, NULL, '387', '11+376=387', '');
INSERT INTO `teach_self_question` VALUES ('1460634239413256195', 0, '76+267=?', '330', '337', '343', '335', NULL, NULL, NULL, '343', '76+267=343', '');
INSERT INTO `teach_self_question` VALUES ('1460634239413256196', 0, '252+214=?', '453', '466', '451', '453', NULL, NULL, NULL, '466', '252+214=466', '');
INSERT INTO `teach_self_question` VALUES ('1460634239455199233', 0, '931+881=?', '1798', '1801', '1799', '1812', NULL, NULL, NULL, '1812', '931+881=1812', '');
INSERT INTO `teach_self_question` VALUES ('1460634239455199234', 0, '466+690=?', '1144', '1146', '1156', '1150', NULL, NULL, NULL, '1156', '466+690=1156', '');
INSERT INTO `teach_self_question` VALUES ('1460634239539085314', 0, '592+648=?', '1240', '1232', '1233', '1226', NULL, NULL, NULL, '1240', '592+648=1240', '');
INSERT INTO `teach_self_question` VALUES ('1460634239539085315', 0, '724+20=?', '730', '731', '744', '737', NULL, NULL, NULL, '744', '724+20=744', '');
INSERT INTO `teach_self_question` VALUES ('1460634239539085316', 0, '602+777=?', '1368', '1366', '1379', '1364', NULL, NULL, NULL, '1379', '602+777=1379', '');
INSERT INTO `teach_self_question` VALUES ('1460634239581028354', 0, '110+920=?', '1030', '1016', '1019', '1024', NULL, NULL, NULL, '1030', '110+920=1030', '');
INSERT INTO `teach_self_question` VALUES ('1460634239581028355', 0, '704+82=?', '774', '778', '786', '774', NULL, NULL, NULL, '786', '704+82=786', '');
INSERT INTO `teach_self_question` VALUES ('1460634239660720130', 0, '383+470=?', '838', '844', '853', '843', NULL, NULL, NULL, '853', '383+470=853', '');
INSERT INTO `teach_self_question` VALUES ('1460634239660720131', 0, '688+834=?', '1522', '1507', '1513', '1515', NULL, NULL, NULL, '1522', '688+834=1522', '');
INSERT INTO `teach_self_question` VALUES ('1460634239748800513', 0, '435+565=?', '994', '993', '1000', '989', NULL, NULL, NULL, '1000', '435+565=1000', '');
INSERT INTO `teach_self_question` VALUES ('1460634239748800514', 0, '181+807=?', '975', '988', '973', '973', NULL, NULL, NULL, '988', '181+807=988', '');
INSERT INTO `teach_self_question` VALUES ('1460634239782354946', 0, '689+173=?', '849', '856', '862', '847', NULL, NULL, NULL, '862', '689+173=862', '');
INSERT INTO `teach_self_question` VALUES ('1460634239845269506', 0, '293+17=?', '295', '302', '300', '310', NULL, NULL, NULL, '310', '293+17=310', '');
INSERT INTO `teach_self_question` VALUES ('1460634239845269507', 0, '604+407=?', '1011', '996', '1004', '1001', NULL, NULL, NULL, '1011', '604+407=1011', '');
INSERT INTO `teach_self_question` VALUES ('1460634239845269508', 0, '314+407=?', '721', '710', '710', '715', NULL, NULL, NULL, '721', '314+407=721', '');
INSERT INTO `teach_self_question` VALUES ('1460634239845269509', 0, '730+867=?', '1597', '1588', '1582', '1587', NULL, NULL, NULL, '1597', '730+867=1597', '');
INSERT INTO `teach_self_question` VALUES ('1460634239845269510', 0, '700+859=?', '1549', '1546', '1547', '1559', NULL, NULL, NULL, '1559', '700+859=1559', '');
INSERT INTO `teach_self_question` VALUES ('1460634239958515714', 0, '947+864=?', '1798', '1801', '1797', '1811', NULL, NULL, NULL, '1811', '947+864=1811', '');
INSERT INTO `teach_self_question` VALUES ('1460634239979487234', 0, '842+70=?', '905', '902', '912', '898', NULL, NULL, NULL, '912', '842+70=912', '');
INSERT INTO `teach_self_question` VALUES ('1460634239979487235', 0, '785+25=?', '797', '803', '800', '810', NULL, NULL, NULL, '810', '785+25=810', '');
INSERT INTO `teach_self_question` VALUES ('1460634239979487236', 0, '466+691=?', '1145', '1157', '1144', '1151', NULL, NULL, NULL, '1157', '466+691=1157', '');
INSERT INTO `teach_self_question` VALUES ('1460634239979487237', 0, '173+783=?', '946', '948', '941', '956', NULL, NULL, NULL, '956', '173+783=956', '');
INSERT INTO `teach_self_question` VALUES ('1460634239979487238', 0, '493+913=?', '1392', '1393', '1393', '1406', NULL, NULL, NULL, '1406', '493+913=1406', '');
INSERT INTO `teach_self_question` VALUES ('1460634240084344833', 0, '346+742=?', '1074', '1074', '1082', '1088', NULL, NULL, NULL, '1088', '346+742=1088', '');
INSERT INTO `teach_self_question` VALUES ('1460634240159842306', 0, '125+708=?', '833', '822', '827', '824', NULL, NULL, NULL, '833', '125+708=833', '');
INSERT INTO `teach_self_question` VALUES ('1460634240159842307', 0, '122+998=?', '1106', '1105', '1120', '1113', NULL, NULL, NULL, '1120', '122+998=1120', '');
INSERT INTO `teach_self_question` VALUES ('1460634240256311298', 0, '504+91=?', '582', '582', '586', '595', NULL, NULL, NULL, '595', '504+91=595', '');
INSERT INTO `teach_self_question` VALUES ('1460634240256311299', 0, '484+743=?', '1219', '1227', '1215', '1214', NULL, NULL, NULL, '1227', '484+743=1227', '');
INSERT INTO `teach_self_question` VALUES ('1460634240256311300', 0, '22+751=?', '762', '762', '761', '773', NULL, NULL, NULL, '773', '22+751=773', '');
INSERT INTO `teach_self_question` VALUES ('1460634240256311301', 0, '229+221=?', '440', '436', '450', '439', NULL, NULL, NULL, '450', '229+221=450', '');
INSERT INTO `teach_self_question` VALUES ('1460634240315031554', 0, '892+422=?', '1314', '1305', '1302', '1308', NULL, NULL, NULL, '1314', '892+422=1314', '');
INSERT INTO `teach_self_question` VALUES ('1460634240315031555', 0, '186+320=?', '495', '506', '498', '493', NULL, NULL, NULL, '506', '186+320=506', '');
INSERT INTO `teach_self_question` VALUES ('1460634240315031556', 0, '1+494=?', '495', '487', '481', '486', NULL, NULL, NULL, '495', '1+494=495', '');
INSERT INTO `teach_self_question` VALUES ('1460634240315031557', 0, '870+278=?', '1134', '1148', '1136', '1137', NULL, NULL, NULL, '1148', '870+278=1148', '');
INSERT INTO `teach_self_question` VALUES ('1460634240315031558', 0, '192+774=?', '955', '952', '954', '966', NULL, NULL, NULL, '966', '192+774=966', '');
INSERT INTO `teach_self_question` VALUES ('1460634240377946113', 0, '158+398=?', '556', '546', '543', '544', NULL, NULL, NULL, '556', '158+398=556', '');
INSERT INTO `teach_self_question` VALUES ('1460634240377946114', 0, '825+438=?', '1257', '1252', '1263', '1252', NULL, NULL, NULL, '1263', '825+438=1263', '');
INSERT INTO `teach_self_question` VALUES ('1460634240377946115', 0, '150+655=?', '798', '805', '792', '792', NULL, NULL, NULL, '805', '150+655=805', '');
INSERT INTO `teach_self_question` VALUES ('1460634240377946116', 0, '545+167=?', '703', '697', '712', '699', NULL, NULL, NULL, '712', '545+167=712', '');
INSERT INTO `teach_self_question` VALUES ('1460634240440860674', 0, '56+626=?', '668', '674', '672', '682', NULL, NULL, NULL, '682', '56+626=682', '');
INSERT INTO `teach_self_question` VALUES ('1460634240440860675', 0, '761+341=?', '1092', '1102', '1087', '1095', NULL, NULL, NULL, '1102', '761+341=1102', '');
INSERT INTO `teach_self_question` VALUES ('1460634240440860676', 0, '450+142=?', '583', '592', '579', '578', NULL, NULL, NULL, '592', '450+142=592', '');
INSERT INTO `teach_self_question` VALUES ('1460634240512163842', 0, '825+594=?', '1419', '1409', '1409', '1410', NULL, NULL, NULL, '1419', '825+594=1419', '');
INSERT INTO `teach_self_question` VALUES ('1460634240512163843', 0, '365+984=?', '1349', '1343', '1343', '1338', NULL, NULL, NULL, '1349', '365+984=1349', '');
INSERT INTO `teach_self_question` VALUES ('1460634240512163844', 0, '803+9=?', '803', '812', '800', '802', NULL, NULL, NULL, '812', '803+9=812', '');
INSERT INTO `teach_self_question` VALUES ('1460634240583467009', 0, '627+187=?', '802', '802', '814', '804', NULL, NULL, NULL, '814', '627+187=814', '');
INSERT INTO `teach_self_question` VALUES ('1460634240642187265', 0, '672+832=?', '1492', '1492', '1492', '1504', NULL, NULL, NULL, '1504', '672+832=1504', '');
INSERT INTO `teach_self_question` VALUES ('1460634240642187266', 0, '979+675=?', '1646', '1654', '1644', '1648', NULL, NULL, NULL, '1654', '979+675=1654', '');
INSERT INTO `teach_self_question` VALUES ('1460634240642187267', 0, '923+583=?', '1493', '1494', '1506', '1497', NULL, NULL, NULL, '1506', '923+583=1506', '');
INSERT INTO `teach_self_question` VALUES ('1460634240726073345', 0, '21+79=?', '89', '91', '100', '87', NULL, NULL, NULL, '100', '21+79=100', '');
INSERT INTO `teach_self_question` VALUES ('1460634240726073346', 0, '276+569=?', '845', '832', '836', '839', NULL, NULL, NULL, '845', '276+569=845', '');
INSERT INTO `teach_self_question` VALUES ('1460634240726073347', 0, '389+611=?', '1000', '988', '990', '988', NULL, NULL, NULL, '1000', '389+611=1000', '');
INSERT INTO `teach_self_question` VALUES ('1460634240726073348', 0, '506+851=?', '1357', '1348', '1346', '1346', NULL, NULL, NULL, '1357', '506+851=1357', '');
INSERT INTO `teach_self_question` VALUES ('1460634240772210690', 0, '44+749=?', '783', '783', '793', '784', NULL, NULL, NULL, '793', '44+749=793', '');
INSERT INTO `teach_self_question` VALUES ('1460634240839319553', 0, '341+290=?', '622', '631', '617', '621', NULL, NULL, NULL, '631', '341+290=631', '');
INSERT INTO `teach_self_question` VALUES ('1460634240839319554', 0, '695+298=?', '983', '986', '982', '993', NULL, NULL, NULL, '993', '695+298=993', '');
INSERT INTO `teach_self_question` VALUES ('1460634240839319555', 0, '662+634=?', '1288', '1281', '1296', '1281', NULL, NULL, NULL, '1296', '662+634=1296', '');
INSERT INTO `teach_self_question` VALUES ('1460634240839319556', 0, '875+620=?', '1483', '1495', '1480', '1485', NULL, NULL, NULL, '1495', '875+620=1495', '');
INSERT INTO `teach_self_question` VALUES ('1460634240839319557', 0, '426+366=?', '792', '780', '782', '782', NULL, NULL, NULL, '792', '426+366=792', '');
INSERT INTO `teach_self_question` VALUES ('1460634240923205633', 0, '117+865=?', '968', '970', '976', '982', NULL, NULL, NULL, '982', '117+865=982', '');
INSERT INTO `teach_self_question` VALUES ('1460634240986120194', 0, '93+174=?', '256', '267', '253', '259', NULL, NULL, NULL, '267', '93+174=267', '');
INSERT INTO `teach_self_question` VALUES ('1460634240986120195', 0, '494+441=?', '922', '920', '935', '924', NULL, NULL, NULL, '935', '494+441=935', '');
INSERT INTO `teach_self_question` VALUES ('1460634241040646145', 0, '156+511=?', '661', '660', '653', '667', NULL, NULL, NULL, '667', '156+511=667', '');
INSERT INTO `teach_self_question` VALUES ('1460634241040646146', 0, '729+784=?', '1504', '1513', '1500', '1505', NULL, NULL, NULL, '1513', '729+784=1513', '');
INSERT INTO `teach_self_question` VALUES ('1460634241040646147', 0, '913+698=?', '1600', '1603', '1611', '1596', NULL, NULL, NULL, '1611', '913+698=1611', '');
INSERT INTO `teach_self_question` VALUES ('1460634241128726530', 0, '504+962=?', '1460', '1460', '1458', '1466', NULL, NULL, NULL, '1466', '504+962=1466', '');
INSERT INTO `teach_self_question` VALUES ('1460634241128726531', 0, '730+799=?', '1517', '1529', '1520', '1522', NULL, NULL, NULL, '1529', '730+799=1529', '');
INSERT INTO `teach_self_question` VALUES ('1460634241128726532', 0, '78+194=?', '257', '261', '272', '257', NULL, NULL, NULL, '272', '78+194=272', '');
INSERT INTO `teach_self_question` VALUES ('1460634241170669570', 0, '41+592=?', '633', '625', '625', '625', NULL, NULL, NULL, '633', '41+592=633', '');
INSERT INTO `teach_self_question` VALUES ('1460634241170669571', 0, '892+551=?', '1437', '1429', '1443', '1436', NULL, NULL, NULL, '1443', '892+551=1443', '');
INSERT INTO `teach_self_question` VALUES ('1460634241170669572', 0, '851+140=?', '981', '978', '976', '991', NULL, NULL, NULL, '991', '851+140=991', '');
INSERT INTO `teach_self_question` VALUES ('1460634241170669573', 0, '734+602=?', '1328', '1336', '1322', '1330', NULL, NULL, NULL, '1336', '734+602=1336', '');
INSERT INTO `teach_self_question` VALUES ('1460634241170669574', 0, '530+617=?', '1147', '1134', '1139', '1133', NULL, NULL, NULL, '1147', '530+617=1147', '');
INSERT INTO `teach_self_question` VALUES ('1460634241170669575', 0, '714+820=?', '1534', '1522', '1526', '1524', NULL, NULL, NULL, '1534', '714+820=1534', '');
INSERT INTO `teach_self_question` VALUES ('1460634241241972738', 0, '666+991=?', '1644', '1644', '1657', '1649', NULL, NULL, NULL, '1657', '666+991=1657', '');
INSERT INTO `teach_self_question` VALUES ('1460634241418133505', 0, '765+173=?', '926', '931', '938', '927', NULL, NULL, NULL, '938', '765+173=938', '');
INSERT INTO `teach_self_question` VALUES ('1460634241439105026', 0, '900+860=?', '1746', '1750', '1760', '1749', NULL, NULL, NULL, '1760', '900+860=1760', '');
INSERT INTO `teach_self_question` VALUES ('1460634241439105027', 0, '370+103=?', '473', '464', '463', '461', NULL, NULL, NULL, '473', '370+103=473', '');
INSERT INTO `teach_self_question` VALUES ('1460634241439105028', 0, '737+865=?', '1596', '1602', '1588', '1593', NULL, NULL, NULL, '1602', '737+865=1602', '');
INSERT INTO `teach_self_question` VALUES ('1460634241439105029', 0, '555+328=?', '883', '868', '869', '870', NULL, NULL, NULL, '883', '555+328=883', '');
INSERT INTO `teach_self_question` VALUES ('1460634241514602497', 0, '792+406=?', '1192', '1191', '1188', '1198', NULL, NULL, NULL, '1198', '792+406=1198', '');
INSERT INTO `teach_self_question` VALUES ('1460634241514602498', 0, '330+370=?', '690', '694', '700', '691', NULL, NULL, NULL, '700', '330+370=700', '');
INSERT INTO `teach_self_question` VALUES ('1460634241514602499', 0, '48+687=?', '735', '721', '726', '728', NULL, NULL, NULL, '735', '48+687=735', '');
INSERT INTO `teach_self_question` VALUES ('1460634241514602500', 0, '180+77=?', '257', '246', '243', '249', NULL, NULL, NULL, '257', '180+77=257', '');
INSERT INTO `teach_self_question` VALUES ('1460634241581711362', 0, '364+227=?', '577', '582', '580', '591', NULL, NULL, NULL, '591', '364+227=591', '');
INSERT INTO `teach_self_question` VALUES ('1460634241581711363', 0, '166+75=?', '227', '241', '233', '226', NULL, NULL, NULL, '241', '166+75=241', '');
INSERT INTO `teach_self_question` VALUES ('1460634241581711364', 0, '535+46=?', '573', '568', '573', '581', NULL, NULL, NULL, '581', '535+46=581', '');
INSERT INTO `teach_self_question` VALUES ('1460634241581711365', 0, '693+456=?', '1137', '1141', '1134', '1149', NULL, NULL, NULL, '1149', '693+456=1149', '');
INSERT INTO `teach_self_question` VALUES ('1460634241581711366', 0, '546+489=?', '1024', '1024', '1026', '1035', NULL, NULL, NULL, '1035', '546+489=1035', '');
INSERT INTO `teach_self_question` VALUES ('1460634241644625922', 0, '5+42=?', '47', '41', '33', '32', NULL, NULL, NULL, '47', '5+42=47', '');
INSERT INTO `teach_self_question` VALUES ('1460634241644625923', 0, '126+209=?', '322', '322', '335', '323', NULL, NULL, NULL, '335', '126+209=335', '');
INSERT INTO `teach_self_question` VALUES ('1460634241644625924', 0, '47+224=?', '258', '265', '271', '265', NULL, NULL, NULL, '271', '47+224=271', '');
INSERT INTO `teach_self_question` VALUES ('1460634241753677826', 0, '763+224=?', '980', '976', '987', '980', NULL, NULL, NULL, '987', '763+224=987', '');
INSERT INTO `teach_self_question` VALUES ('1460634241841758209', 0, '289+969=?', '1251', '1249', '1258', '1247', NULL, NULL, NULL, '1258', '289+969=1258', '');
INSERT INTO `teach_self_question` VALUES ('1460634241841758210', 0, '490+299=?', '781', '789', '781', '780', NULL, NULL, NULL, '789', '490+299=789', '');
INSERT INTO `teach_self_question` VALUES ('1460634241925644290', 0, '845+309=?', '1154', '1142', '1141', '1145', NULL, NULL, NULL, '1154', '845+309=1154', '');
INSERT INTO `teach_self_question` VALUES ('1460634241925644291', 0, '887+333=?', '1205', '1214', '1220', '1205', NULL, NULL, NULL, '1220', '887+333=1220', '');
INSERT INTO `teach_self_question` VALUES ('1460634241925644292', 0, '462+588=?', '1050', '1041', '1044', '1043', NULL, NULL, NULL, '1050', '462+588=1050', '');
INSERT INTO `teach_self_question` VALUES ('1460634242001141762', 0, '964+325=?', '1280', '1289', '1277', '1275', NULL, NULL, NULL, '1289', '964+325=1289', '');
INSERT INTO `teach_self_question` VALUES ('1460634242001141763', 0, '720+631=?', '1343', '1351', '1340', '1345', NULL, NULL, NULL, '1351', '720+631=1351', '');
INSERT INTO `teach_self_question` VALUES ('1460634242047279105', 0, '183+289=?', '472', '460', '458', '457', NULL, NULL, NULL, '472', '183+289=472', '');
INSERT INTO `teach_self_question` VALUES ('1460634242047279106', 0, '705+52=?', '744', '746', '747', '757', NULL, NULL, NULL, '757', '705+52=757', '');
INSERT INTO `teach_self_question` VALUES ('1460634242047279107', 0, '292+349=?', '633', '626', '641', '634', NULL, NULL, NULL, '641', '292+349=641', '');
INSERT INTO `teach_self_question` VALUES ('1460634242126970881', 0, '769+941=?', '1696', '1710', '1695', '1696', NULL, NULL, NULL, '1710', '769+941=1710', '');
INSERT INTO `teach_self_question` VALUES ('1460634242126970882', 0, '870+893=?', '1752', '1755', '1763', '1755', NULL, NULL, NULL, '1763', '870+893=1763', '');
INSERT INTO `teach_self_question` VALUES ('1460634242173108226', 0, '916+174=?', '1078', '1075', '1090', '1079', NULL, NULL, NULL, '1090', '916+174=1090', '');
INSERT INTO `teach_self_question` VALUES ('1460634242173108227', 0, '480+146=?', '615', '618', '611', '626', NULL, NULL, NULL, '626', '480+146=626', '');
INSERT INTO `teach_self_question` VALUES ('1460634242173108228', 0, '204+999=?', '1195', '1197', '1203', '1193', NULL, NULL, NULL, '1203', '204+999=1203', '');
INSERT INTO `teach_self_question` VALUES ('1460634242173108229', 0, '710+455=?', '1152', '1155', '1154', '1165', NULL, NULL, NULL, '1165', '710+455=1165', '');
INSERT INTO `teach_self_question` VALUES ('1460634242173108230', 0, '6+727=?', '718', '726', '733', '718', NULL, NULL, NULL, '733', '6+727=733', '');
INSERT INTO `teach_self_question` VALUES ('1460634242248605697', 0, '672+146=?', '809', '808', '818', '804', NULL, NULL, NULL, '818', '672+146=818', '');
INSERT INTO `teach_self_question` VALUES ('1460634242248605698', 0, '224+197=?', '421', '413', '408', '408', NULL, NULL, NULL, '421', '224+197=421', '');
INSERT INTO `teach_self_question` VALUES ('1460634242248605699', 0, '702+740=?', '1430', '1436', '1442', '1432', NULL, NULL, NULL, '1442', '702+740=1442', '');
INSERT INTO `teach_self_question` VALUES ('1460634242248605700', 0, '45+970=?', '1015', '1009', '1000', '1007', NULL, NULL, NULL, '1015', '45+970=1015', '');
INSERT INTO `teach_self_question` VALUES ('1460634242298937346', 0, '723+648=?', '1360', '1357', '1364', '1371', NULL, NULL, NULL, '1371', '723+648=1371', '');
INSERT INTO `teach_self_question` VALUES ('1460634242298937347', 0, '712+737=?', '1438', '1438', '1449', '1440', NULL, NULL, NULL, '1449', '712+737=1449', '');
INSERT INTO `teach_self_question` VALUES ('1460634242298937348', 0, '570+856=?', '1426', '1415', '1412', '1415', NULL, NULL, NULL, '1426', '570+856=1426', '');
INSERT INTO `teach_self_question` VALUES ('1460634242298937349', 0, '503+288=?', '791', '782', '785', '776', NULL, NULL, NULL, '791', '503+288=791', '');
INSERT INTO `teach_self_question` VALUES ('1460634242298937350', 0, '384+868=?', '1240', '1244', '1252', '1241', NULL, NULL, NULL, '1252', '384+868=1252', '');
INSERT INTO `teach_self_question` VALUES ('1460634242382823425', 0, '379+791=?', '1159', '1159', '1170', '1156', NULL, NULL, NULL, '1170', '379+791=1170', '');
INSERT INTO `teach_self_question` VALUES ('1460634242382823426', 0, '819+143=?', '947', '954', '949', '962', NULL, NULL, NULL, '962', '819+143=962', '');
INSERT INTO `teach_self_question` VALUES ('1460634242382823427', 0, '987+292=?', '1264', '1270', '1270', '1279', NULL, NULL, NULL, '1279', '987+292=1279', '');
INSERT INTO `teach_self_question` VALUES ('1460634242382823428', 0, '342+778=?', '1114', '1107', '1120', '1109', NULL, NULL, NULL, '1120', '342+778=1120', '');
INSERT INTO `teach_self_question` VALUES ('1460634242441543682', 0, '784+945=?', '1723', '1717', '1721', '1729', NULL, NULL, NULL, '1729', '784+945=1729', '');
INSERT INTO `teach_self_question` VALUES ('1460634242441543683', 0, '657+994=?', '1641', '1641', '1637', '1651', NULL, NULL, NULL, '1651', '657+994=1651', '');
INSERT INTO `teach_self_question` VALUES ('1460634242441543684', 0, '369+812=?', '1174', '1166', '1181', '1172', NULL, NULL, NULL, '1181', '369+812=1181', '');
INSERT INTO `teach_self_question` VALUES ('1460634242441543685', 0, '326+377=?', '695', '697', '703', '688', NULL, NULL, NULL, '703', '326+377=703', '');
INSERT INTO `teach_self_question` VALUES ('1460634242512846850', 0, '54+314=?', '355', '355', '368', '357', NULL, NULL, NULL, '368', '54+314=368', '');
INSERT INTO `teach_self_question` VALUES ('1460634242512846851', 0, '641+628=?', '1260', '1260', '1255', '1269', NULL, NULL, NULL, '1269', '641+628=1269', '');
INSERT INTO `teach_self_question` VALUES ('1460634242512846852', 0, '478+616=?', '1094', '1087', '1085', '1088', NULL, NULL, NULL, '1094', '478+616=1094', '');
INSERT INTO `teach_self_question` VALUES ('1460634242567372802', 0, '731+941=?', '1660', '1662', '1662', '1672', NULL, NULL, NULL, '1672', '731+941=1672', '');
INSERT INTO `teach_self_question` VALUES ('1460634242567372803', 0, '623+161=?', '784', '772', '769', '772', NULL, NULL, NULL, '784', '623+161=784', '');
INSERT INTO `teach_self_question` VALUES ('1460634242567372804', 0, '306+899=?', '1195', '1191', '1205', '1192', NULL, NULL, NULL, '1205', '306+899=1205', '');
INSERT INTO `teach_self_question` VALUES ('1460634242567372805', 0, '62+561=?', '610', '609', '623', '610', NULL, NULL, NULL, '623', '62+561=623', '');
INSERT INTO `teach_self_question` VALUES ('1460634242638675970', 0, '443+194=?', '637', '626', '626', '624', NULL, NULL, NULL, '637', '443+194=637', '');
INSERT INTO `teach_self_question` VALUES ('1460634242638675971', 0, '896+972=?', '1858', '1868', '1860', '1853', NULL, NULL, NULL, '1868', '896+972=1868', '');
INSERT INTO `teach_self_question` VALUES ('1460634242638675972', 0, '298+382=?', '671', '680', '674', '666', NULL, NULL, NULL, '680', '298+382=680', '');
INSERT INTO `teach_self_question` VALUES ('1460634242701590529', 0, '925+557=?', '1482', '1472', '1475', '1470', NULL, NULL, NULL, '1482', '925+557=1482', '');
INSERT INTO `teach_self_question` VALUES ('1460634242701590530', 0, '710+681=?', '1377', '1391', '1382', '1377', NULL, NULL, NULL, '1391', '710+681=1391', '');
INSERT INTO `teach_self_question` VALUES ('1460634242701590531', 0, '908+211=?', '1112', '1119', '1110', '1110', NULL, NULL, NULL, '1119', '908+211=1119', '');
INSERT INTO `teach_self_question` VALUES ('1460634242701590532', 0, '11+534=?', '532', '545', '534', '534', NULL, NULL, NULL, '545', '11+534=545', '');
INSERT INTO `teach_self_question` VALUES ('1460634242764505089', 0, '7+914=?', '910', '908', '921', '913', NULL, NULL, NULL, '921', '7+914=921', '');
INSERT INTO `teach_self_question` VALUES ('1460634242764505090', 0, '432+9=?', '441', '431', '435', '431', NULL, NULL, NULL, '441', '432+9=441', '');
INSERT INTO `teach_self_question` VALUES ('1460634242764505091', 0, '26+973=?', '999', '993', '989', '986', NULL, NULL, NULL, '999', '26+973=999', '');
INSERT INTO `teach_self_question` VALUES ('1460634242764505092', 0, '14+570=?', '584', '569', '576', '569', NULL, NULL, NULL, '584', '14+570=584', '');
INSERT INTO `teach_self_question` VALUES ('1460634242764505093', 0, '446+936=?', '1376', '1373', '1374', '1382', NULL, NULL, NULL, '1382', '446+936=1382', '');
INSERT INTO `teach_self_question` VALUES ('1460634242831613953', 0, '37+626=?', '650', '655', '651', '663', NULL, NULL, NULL, '663', '37+626=663', '');
INSERT INTO `teach_self_question` VALUES ('1460634242831613954', 0, '214+369=?', '583', '577', '577', '568', NULL, NULL, NULL, '583', '214+369=583', '');
INSERT INTO `teach_self_question` VALUES ('1460634242831613955', 0, '777+628=?', '1405', '1391', '1397', '1394', NULL, NULL, NULL, '1405', '777+628=1405', '');
INSERT INTO `teach_self_question` VALUES ('1460634242831613956', 0, '45+610=?', '640', '642', '655', '644', NULL, NULL, NULL, '655', '45+610=655', '');
INSERT INTO `teach_self_question` VALUES ('1460634242831613957', 0, '586+941=?', '1519', '1512', '1520', '1527', NULL, NULL, NULL, '1527', '586+941=1527', '');
INSERT INTO `teach_self_question` VALUES ('1460634242902917122', 0, '671+287=?', '949', '949', '948', '958', NULL, NULL, NULL, '958', '671+287=958', '');
INSERT INTO `teach_self_question` VALUES ('1460634242902917123', 0, '591+290=?', '881', '867', '867', '874', NULL, NULL, NULL, '881', '591+290=881', '');
INSERT INTO `teach_self_question` VALUES ('1460634242902917124', 0, '381+924=?', '1297', '1299', '1305', '1290', NULL, NULL, NULL, '1305', '381+924=1305', '');
INSERT INTO `teach_self_question` VALUES ('1460634242902917125', 0, '602+1=?', '589', '603', '588', '596', NULL, NULL, NULL, '603', '602+1=603', '');
INSERT INTO `teach_self_question` VALUES ('1460634242974220290', 0, '2+331=?', '323', '333', '324', '323', NULL, NULL, NULL, '333', '2+331=333', '');
INSERT INTO `teach_self_question` VALUES ('1460634242990997506', 0, '503+451=?', '947', '945', '944', '954', NULL, NULL, NULL, '954', '503+451=954', '');
INSERT INTO `teach_self_question` VALUES ('1460634243007774722', 0, '109+68=?', '177', '163', '165', '164', NULL, NULL, NULL, '177', '109+68=177', '');
INSERT INTO `teach_self_question` VALUES ('1460634243007774723', 0, '814+711=?', '1517', '1512', '1513', '1525', NULL, NULL, NULL, '1525', '814+711=1525', '');
INSERT INTO `teach_self_question` VALUES ('1460634243007774724', 0, '206+589=?', '788', '781', '788', '795', NULL, NULL, NULL, '795', '206+589=795', '');
INSERT INTO `teach_self_question` VALUES ('1460634243032940546', 0, '289+257=?', '546', '532', '539', '531', NULL, NULL, NULL, '546', '289+257=546', '');
INSERT INTO `teach_self_question` VALUES ('1460634243032940547', 0, '270+391=?', '654', '650', '661', '655', NULL, NULL, NULL, '661', '270+391=661', '');
INSERT INTO `teach_self_question` VALUES ('1460634243032940548', 0, '17+361=?', '378', '368', '363', '366', NULL, NULL, NULL, '378', '17+361=378', '');
INSERT INTO `teach_self_question` VALUES ('1460634243032940549', 0, '227+769=?', '989', '989', '996', '982', NULL, NULL, NULL, '996', '227+769=996', '');
INSERT INTO `teach_self_question` VALUES ('1460634243032940550', 0, '386+479=?', '852', '853', '865', '857', NULL, NULL, NULL, '865', '386+479=865', '');
INSERT INTO `teach_self_question` VALUES ('1460634243100049410', 0, '237+349=?', '576', '571', '586', '574', NULL, NULL, NULL, '586', '237+349=586', '');
INSERT INTO `teach_self_question` VALUES ('1460634243100049411', 0, '733+498=?', '1224', '1219', '1231', '1218', NULL, NULL, NULL, '1231', '733+498=1231', '');
INSERT INTO `teach_self_question` VALUES ('1460634243100049412', 0, '290+304=?', '580', '594', '586', '580', NULL, NULL, NULL, '594', '290+304=594', '');
INSERT INTO `teach_self_question` VALUES ('1460634243100049413', 0, '850+514=?', '1357', '1364', '1353', '1350', NULL, NULL, NULL, '1364', '850+514=1364', '');
INSERT INTO `teach_self_question` VALUES ('1460634243100049414', 0, '719+480=?', '1184', '1199', '1188', '1193', NULL, NULL, NULL, '1199', '719+480=1199', '');
INSERT INTO `teach_self_question` VALUES ('1460634243167158273', 0, '592+342=?', '926', '934', '920', '919', NULL, NULL, NULL, '934', '592+342=934', '');
INSERT INTO `teach_self_question` VALUES ('1460634243167158274', 0, '49+827=?', '866', '867', '876', '865', NULL, NULL, NULL, '876', '49+827=876', '');
INSERT INTO `teach_self_question` VALUES ('1460634243167158275', 0, '442+769=?', '1202', '1203', '1211', '1200', NULL, NULL, NULL, '1211', '442+769=1211', '');
INSERT INTO `teach_self_question` VALUES ('1460634243167158276', 0, '75+712=?', '779', '787', '774', '777', NULL, NULL, NULL, '787', '75+712=787', '');
INSERT INTO `teach_self_question` VALUES ('1460634243167158277', 0, '581+701=?', '1274', '1282', '1270', '1271', NULL, NULL, NULL, '1282', '581+701=1282', '');
INSERT INTO `teach_self_question` VALUES ('1460634243234267138', 0, '378+350=?', '715', '728', '718', '719', NULL, NULL, NULL, '728', '378+350=728', '');
INSERT INTO `teach_self_question` VALUES ('1460634243234267139', 0, '442+783=?', '1214', '1214', '1225', '1218', NULL, NULL, NULL, '1225', '442+783=1225', '');
INSERT INTO `teach_self_question` VALUES ('1460634243234267140', 0, '780+14=?', '780', '794', '782', '786', NULL, NULL, NULL, '794', '780+14=794', '');
INSERT INTO `teach_self_question` VALUES ('1460634243234267141', 0, '376+183=?', '553', '546', '559', '549', NULL, NULL, NULL, '559', '376+183=559', '');
INSERT INTO `teach_self_question` VALUES ('1460634243234267142', 0, '50+779=?', '816', '816', '822', '829', NULL, NULL, NULL, '829', '50+779=829', '');
INSERT INTO `teach_self_question` VALUES ('1460634243301376002', 0, '799+393=?', '1186', '1182', '1185', '1192', NULL, NULL, NULL, '1192', '799+393=1192', '');
INSERT INTO `teach_self_question` VALUES ('1460634243301376003', 0, '35+886=?', '906', '912', '912', '921', NULL, NULL, NULL, '921', '35+886=921', '');
INSERT INTO `teach_self_question` VALUES ('1460634243301376004', 0, '727+287=?', '1001', '1014', '1008', '1002', NULL, NULL, NULL, '1014', '727+287=1014', '');
INSERT INTO `teach_self_question` VALUES ('1460634243301376005', 0, '522+869=?', '1380', '1381', '1391', '1378', NULL, NULL, NULL, '1391', '522+869=1391', '');
INSERT INTO `teach_self_question` VALUES ('1460634243301376006', 0, '481+591=?', '1066', '1072', '1062', '1059', NULL, NULL, NULL, '1072', '481+591=1072', '');
INSERT INTO `teach_self_question` VALUES ('1460634243301376007', 0, '418+989=?', '1398', '1407', '1401', '1395', NULL, NULL, NULL, '1407', '418+989=1407', '');
INSERT INTO `teach_self_question` VALUES ('1460634243372679170', 0, '684+367=?', '1051', '1045', '1037', '1045', NULL, NULL, NULL, '1051', '684+367=1051', '');
INSERT INTO `teach_self_question` VALUES ('1460634243372679171', 0, '704+457=?', '1149', '1151', '1161', '1154', NULL, NULL, NULL, '1161', '704+457=1161', '');
INSERT INTO `teach_self_question` VALUES ('1460634243372679172', 0, '941+156=?', '1085', '1097', '1087', '1091', NULL, NULL, NULL, '1097', '941+156=1097', '');
INSERT INTO `teach_self_question` VALUES ('1460634243372679173', 0, '568+749=?', '1304', '1309', '1317', '1306', NULL, NULL, NULL, '1317', '568+749=1317', '');
INSERT INTO `teach_self_question` VALUES ('1460634243431399425', 0, '87+274=?', '354', '361', '353', '348', NULL, NULL, NULL, '361', '87+274=361', '');
INSERT INTO `teach_self_question` VALUES ('1460634243431399426', 0, '868+41=?', '897', '909', '894', '901', NULL, NULL, NULL, '909', '868+41=909', '');
INSERT INTO `teach_self_question` VALUES ('1460634243431399427', 0, '209+643=?', '852', '838', '843', '845', NULL, NULL, NULL, '852', '209+643=852', '');
INSERT INTO `teach_self_question` VALUES ('1460634243431399428', 0, '821+203=?', '1009', '1014', '1024', '1009', NULL, NULL, NULL, '1024', '821+203=1024', '');
INSERT INTO `teach_self_question` VALUES ('1460634243431399429', 0, '930+632=?', '1551', '1562', '1547', '1551', NULL, NULL, NULL, '1562', '930+632=1562', '');
INSERT INTO `teach_self_question` VALUES ('1460634243431399430', 0, '923+648=?', '1560', '1571', '1559', '1564', NULL, NULL, NULL, '1571', '923+648=1571', '');
INSERT INTO `teach_self_question` VALUES ('1460634243498508289', 0, '436+568=?', '990', '1004', '994', '992', NULL, NULL, NULL, '1004', '436+568=1004', '');
INSERT INTO `teach_self_question` VALUES ('1460634243498508290', 0, '134+345=?', '479', '465', '465', '469', NULL, NULL, NULL, '479', '134+345=479', '');
INSERT INTO `teach_self_question` VALUES ('1460634243498508291', 0, '519+894=?', '1407', '1399', '1402', '1413', NULL, NULL, NULL, '1413', '519+894=1413', '');
INSERT INTO `teach_self_question` VALUES ('1460634243498508292', 0, '465+27=?', '479', '482', '492', '481', NULL, NULL, NULL, '492', '465+27=492', '');
INSERT INTO `teach_self_question` VALUES ('1460634243498508293', 0, '429+535=?', '964', '950', '954', '950', NULL, NULL, NULL, '964', '429+535=964', '');
INSERT INTO `teach_self_question` VALUES ('1460634243565617153', 0, '919+108=?', '1018', '1027', '1020', '1014', NULL, NULL, NULL, '1027', '919+108=1027', '');
INSERT INTO `teach_self_question` VALUES ('1460634243565617154', 0, '898+518=?', '1403', '1402', '1416', '1405', NULL, NULL, NULL, '1416', '898+518=1416', '');
INSERT INTO `teach_self_question` VALUES ('1460634243565617155', 0, '99+46=?', '145', '132', '130', '135', NULL, NULL, NULL, '145', '99+46=145', '');
INSERT INTO `teach_self_question` VALUES ('1460634243565617156', 0, '986+248=?', '1219', '1223', '1234', '1219', NULL, NULL, NULL, '1234', '986+248=1234', '');
INSERT INTO `teach_self_question` VALUES ('1460634243565617157', 0, '771+480=?', '1241', '1243', '1251', '1245', NULL, NULL, NULL, '1251', '771+480=1251', '');
INSERT INTO `teach_self_question` VALUES ('1460634243632726017', 0, '800+872=?', '1672', '1658', '1661', '1661', NULL, NULL, NULL, '1672', '800+872=1672', '');
INSERT INTO `teach_self_question` VALUES ('1460634243632726018', 0, '484+426=?', '900', '910', '897', '903', NULL, NULL, NULL, '910', '484+426=910', '');
INSERT INTO `teach_self_question` VALUES ('1460634243632726019', 0, '130+757=?', '880', '881', '887', '876', NULL, NULL, NULL, '887', '130+757=887', '');
INSERT INTO `teach_self_question` VALUES ('1460634243632726020', 0, '533+582=?', '1104', '1103', '1115', '1107', NULL, NULL, NULL, '1115', '533+582=1115', '');
INSERT INTO `teach_self_question` VALUES ('1460634243632726021', 0, '441+572=?', '998', '1013', '1005', '1003', NULL, NULL, NULL, '1013', '441+572=1013', '');
INSERT INTO `teach_self_question` VALUES ('1460634243699834882', 0, '704+152=?', '856', '849', '850', '845', NULL, NULL, NULL, '856', '704+152=856', '');
INSERT INTO `teach_self_question` VALUES ('1460634243699834883', 0, '106+971=?', '1067', '1077', '1067', '1064', NULL, NULL, NULL, '1077', '106+971=1077', '');
INSERT INTO `teach_self_question` VALUES ('1460634243699834884', 0, '381+785=?', '1166', '1157', '1158', '1154', NULL, NULL, NULL, '1166', '381+785=1166', '');
INSERT INTO `teach_self_question` VALUES ('1460634243699834885', 0, '539+85=?', '617', '624', '616', '614', NULL, NULL, NULL, '624', '539+85=624', '');
INSERT INTO `teach_self_question` VALUES ('1460634243699834886', 0, '91+277=?', '368', '353', '361', '355', NULL, NULL, NULL, '368', '91+277=368', '');
INSERT INTO `teach_self_question` VALUES ('1460634243762749442', 0, '517+143=?', '650', '660', '653', '646', NULL, NULL, NULL, '660', '517+143=660', '');
INSERT INTO `teach_self_question` VALUES ('1460634243762749443', 0, '362+434=?', '782', '787', '796', '783', NULL, NULL, NULL, '796', '362+434=796', '');
INSERT INTO `teach_self_question` VALUES ('1460634243762749444', 0, '630+211=?', '834', '834', '841', '830', NULL, NULL, NULL, '841', '630+211=841', '');
INSERT INTO `teach_self_question` VALUES ('1460634243762749445', 0, '942+227=?', '1163', '1161', '1159', '1169', NULL, NULL, NULL, '1169', '942+227=1169', '');
INSERT INTO `teach_self_question` VALUES ('1460634243834052610', 0, '463+944=?', '1392', '1398', '1407', '1401', NULL, NULL, NULL, '1407', '463+944=1407', '');
INSERT INTO `teach_self_question` VALUES ('1460634243842441218', 0, '842+613=?', '1447', '1448', '1455', '1444', NULL, NULL, NULL, '1455', '842+613=1455', '');
INSERT INTO `teach_self_question` VALUES ('1460634243850829826', 0, '878+450=?', '1316', '1328', '1320', '1320', NULL, NULL, NULL, '1328', '878+450=1328', '');
INSERT INTO `teach_self_question` VALUES ('1460634243850829827', 0, '645+989=?', '1634', '1624', '1624', '1623', NULL, NULL, NULL, '1634', '645+989=1634', '');
INSERT INTO `teach_self_question` VALUES ('1460634243850829828', 0, '554+758=?', '1312', '1305', '1304', '1302', NULL, NULL, NULL, '1312', '554+758=1312', '');
INSERT INTO `teach_self_question` VALUES ('1460634243850829829', 0, '727+756=?', '1483', '1474', '1473', '1469', NULL, NULL, NULL, '1483', '727+756=1483', '');
INSERT INTO `teach_self_question` VALUES ('1460634243905355777', 0, '151+130=?', '269', '268', '281', '270', NULL, NULL, NULL, '281', '151+130=281', '');
INSERT INTO `teach_self_question` VALUES ('1460634243905355778', 0, '882+823=?', '1696', '1705', '1694', '1699', NULL, NULL, NULL, '1705', '882+823=1705', '');
INSERT INTO `teach_self_question` VALUES ('1460634243905355779', 0, '347+678=?', '1015', '1014', '1017', '1025', NULL, NULL, NULL, '1025', '347+678=1025', '');
INSERT INTO `teach_self_question` VALUES ('1460634243968270337', 0, '153+631=?', '784', '771', '776', '777', NULL, NULL, NULL, '784', '153+631=784', '');
INSERT INTO `teach_self_question` VALUES ('1460634243968270338', 0, '890+680=?', '1555', '1570', '1561', '1558', NULL, NULL, NULL, '1570', '890+680=1570', '');
INSERT INTO `teach_self_question` VALUES ('1460634243968270339', 0, '123+74=?', '184', '197', '185', '188', NULL, NULL, NULL, '197', '123+74=197', '');
INSERT INTO `teach_self_question` VALUES ('1460634243968270340', 0, '567+157=?', '709', '724', '718', '716', NULL, NULL, NULL, '724', '567+157=724', '');
INSERT INTO `teach_self_question` VALUES ('1460634243968270341', 0, '708+749=?', '1451', '1448', '1457', '1450', NULL, NULL, NULL, '1457', '708+749=1457', '');
INSERT INTO `teach_self_question` VALUES ('1460634244035379201', 0, '858+569=?', '1427', '1418', '1421', '1416', NULL, NULL, NULL, '1427', '858+569=1427', '');
INSERT INTO `teach_self_question` VALUES ('1460634244035379202', 0, '237+917=?', '1146', '1139', '1154', '1143', NULL, NULL, NULL, '1154', '237+917=1154', '');
INSERT INTO `teach_self_question` VALUES ('1460634244035379203', 0, '919+72=?', '977', '976', '976', '991', NULL, NULL, NULL, '991', '919+72=991', '');
INSERT INTO `teach_self_question` VALUES ('1460634244035379204', 0, '714+634=?', '1336', '1335', '1338', '1348', NULL, NULL, NULL, '1348', '714+634=1348', '');
INSERT INTO `teach_self_question` VALUES ('1460634244089905153', 0, '808+422=?', '1223', '1219', '1220', '1230', NULL, NULL, NULL, '1230', '808+422=1230', '');
INSERT INTO `teach_self_question` VALUES ('1460634244089905154', 0, '740+296=?', '1036', '1028', '1030', '1022', NULL, NULL, NULL, '1036', '740+296=1036', '');
INSERT INTO `teach_self_question` VALUES ('1460634244089905155', 0, '976+11=?', '978', '987', '974', '977', NULL, NULL, NULL, '987', '976+11=987', '');
INSERT INTO `teach_self_question` VALUES ('1460634244089905156', 0, '143+588=?', '719', '716', '719', '731', NULL, NULL, NULL, '731', '143+588=731', '');
INSERT INTO `teach_self_question` VALUES ('1460634244152819714', 0, '600+158=?', '751', '748', '747', '758', NULL, NULL, NULL, '758', '600+158=758', '');
INSERT INTO `teach_self_question` VALUES ('1460634244152819715', 0, '266+354=?', '606', '620', '613', '613', NULL, NULL, NULL, '620', '266+354=620', '');
INSERT INTO `teach_self_question` VALUES ('1460634244152819716', 0, '65+525=?', '581', '578', '590', '580', NULL, NULL, NULL, '590', '65+525=590', '');
INSERT INTO `teach_self_question` VALUES ('1460634244152819717', 0, '158+910=?', '1062', '1062', '1068', '1053', NULL, NULL, NULL, '1068', '158+910=1068', '');
INSERT INTO `teach_self_question` VALUES ('1460634244152819718', 0, '678+849=?', '1520', '1514', '1517', '1527', NULL, NULL, NULL, '1527', '678+849=1527', '');
INSERT INTO `teach_self_question` VALUES ('1460634244152819719', 0, '73+239=?', '303', '299', '312', '306', NULL, NULL, NULL, '312', '73+239=312', '');
INSERT INTO `teach_self_question` VALUES ('1460634244219928577', 0, '568+671=?', '1227', '1229', '1233', '1239', NULL, NULL, NULL, '1239', '568+671=1239', '');
INSERT INTO `teach_self_question` VALUES ('1460634244219928578', 0, '869+239=?', '1100', '1101', '1099', '1108', NULL, NULL, NULL, '1108', '869+239=1108', '');
INSERT INTO `teach_self_question` VALUES ('1460634244219928579', 0, '927+116=?', '1043', '1028', '1031', '1032', NULL, NULL, NULL, '1043', '927+116=1043', '');
INSERT INTO `teach_self_question` VALUES ('1460634244219928580', 0, '750+32=?', '782', '773', '773', '768', NULL, NULL, NULL, '782', '750+32=782', '');
INSERT INTO `teach_self_question` VALUES ('1460634244219928581', 0, '502+948=?', '1450', '1436', '1435', '1436', NULL, NULL, NULL, '1450', '502+948=1450', '');
INSERT INTO `teach_self_question` VALUES ('1460634244282843138', 0, '584+794=?', '1372', '1366', '1364', '1378', NULL, NULL, NULL, '1378', '584+794=1378', '');
INSERT INTO `teach_self_question` VALUES ('1460634244282843139', 0, '940+216=?', '1145', '1142', '1156', '1146', NULL, NULL, NULL, '1156', '940+216=1156', '');
INSERT INTO `teach_self_question` VALUES ('1460634244282843140', 0, '675+324=?', '990', '988', '991', '999', NULL, NULL, NULL, '999', '675+324=999', '');
INSERT INTO `teach_self_question` VALUES ('1460634244282843141', 0, '95+403=?', '498', '485', '488', '491', NULL, NULL, NULL, '498', '95+403=498', '');
INSERT INTO `teach_self_question` VALUES ('1460634244282843142', 0, '300+714=?', '999', '1002', '1008', '1014', NULL, NULL, NULL, '1014', '300+714=1014', '');
INSERT INTO `teach_self_question` VALUES ('1460634244349952002', 0, '10+521=?', '521', '531', '522', '518', NULL, NULL, NULL, '531', '10+521=531', '');
INSERT INTO `teach_self_question` VALUES ('1460634244349952003', 0, '720+906=?', '1626', '1618', '1620', '1612', NULL, NULL, NULL, '1626', '720+906=1626', '');
INSERT INTO `teach_self_question` VALUES ('1460634244349952004', 0, '453+433=?', '874', '874', '873', '886', NULL, NULL, NULL, '886', '453+433=886', '');
INSERT INTO `teach_self_question` VALUES ('1460634244349952005', 0, '310+468=?', '778', '769', '772', '766', NULL, NULL, NULL, '778', '310+468=778', '');
INSERT INTO `teach_self_question` VALUES ('1460634244349952006', 0, '252+798=?', '1038', '1039', '1040', '1050', NULL, NULL, NULL, '1050', '252+798=1050', '');
INSERT INTO `teach_self_question` VALUES ('1460634244417060866', 0, '110+315=?', '417', '416', '425', '419', NULL, NULL, NULL, '425', '110+315=425', '');
INSERT INTO `teach_self_question` VALUES ('1460634244417060867', 0, '242+285=?', '516', '515', '513', '527', NULL, NULL, NULL, '527', '242+285=527', '');
INSERT INTO `teach_self_question` VALUES ('1460634244417060868', 0, '986+869=?', '1840', '1840', '1855', '1843', NULL, NULL, NULL, '1855', '986+869=1855', '');
INSERT INTO `teach_self_question` VALUES ('1460634244417060869', 0, '628+479=?', '1095', '1094', '1107', '1100', NULL, NULL, NULL, '1107', '628+479=1107', '');
INSERT INTO `teach_self_question` VALUES ('1460634244417060870', 0, '85+11=?', '89', '87', '90', '96', NULL, NULL, NULL, '96', '85+11=96', '');
INSERT INTO `teach_self_question` VALUES ('1460634244488364034', 0, '164+344=?', '508', '493', '497', '499', NULL, NULL, NULL, '508', '164+344=508', '');
INSERT INTO `teach_self_question` VALUES ('1460634244488364035', 0, '220+310=?', '524', '516', '515', '530', NULL, NULL, NULL, '530', '220+310=530', '');
INSERT INTO `teach_self_question` VALUES ('1460634244488364036', 0, '660+89=?', '749', '734', '738', '739', NULL, NULL, NULL, '749', '660+89=749', '');
INSERT INTO `teach_self_question` VALUES ('1460634244488364037', 0, '266+31=?', '288', '283', '297', '283', NULL, NULL, NULL, '297', '266+31=297', '');
INSERT INTO `teach_self_question` VALUES ('1460634244488364038', 0, '119+159=?', '272', '268', '278', '271', NULL, NULL, NULL, '278', '119+159=278', '');
INSERT INTO `teach_self_question` VALUES ('1460634244488364039', 0, '805+374=?', '1179', '1169', '1166', '1166', NULL, NULL, NULL, '1179', '805+374=1179', '');
INSERT INTO `teach_self_question` VALUES ('1460634244555472897', 0, '882+680=?', '1551', '1556', '1551', '1562', NULL, NULL, NULL, '1562', '882+680=1562', '');
INSERT INTO `teach_self_question` VALUES ('1460634244555472898', 0, '328+350=?', '666', '663', '678', '672', NULL, NULL, NULL, '678', '328+350=678', '');
INSERT INTO `teach_self_question` VALUES ('1460634244555472899', 0, '429+963=?', '1385', '1392', '1381', '1386', NULL, NULL, NULL, '1392', '429+963=1392', '');
INSERT INTO `teach_self_question` VALUES ('1460634244555472900', 0, '553+266=?', '805', '807', '819', '804', NULL, NULL, NULL, '819', '553+266=819', '');
INSERT INTO `teach_self_question` VALUES ('1460634244555472901', 0, '492+911=?', '1391', '1396', '1394', '1403', NULL, NULL, NULL, '1403', '492+911=1403', '');
INSERT INTO `teach_self_question` VALUES ('1460634244555472902', 0, '578+921=?', '1493', '1486', '1499', '1484', NULL, NULL, NULL, '1499', '578+921=1499', '');
INSERT INTO `teach_self_question` VALUES ('1460634244626776065', 0, '759+258=?', '1008', '1011', '1004', '1017', NULL, NULL, NULL, '1017', '759+258=1017', '');
INSERT INTO `teach_self_question` VALUES ('1460634244626776066', 0, '436+811=?', '1247', '1236', '1232', '1241', NULL, NULL, NULL, '1247', '436+811=1247', '');
INSERT INTO `teach_self_question` VALUES ('1460634244626776067', 0, '988+319=?', '1300', '1297', '1301', '1307', NULL, NULL, NULL, '1307', '988+319=1307', '');
INSERT INTO `teach_self_question` VALUES ('1460634244626776068', 0, '446+358=?', '804', '798', '798', '794', NULL, NULL, NULL, '804', '446+358=804', '');
INSERT INTO `teach_self_question` VALUES ('1460634244626776069', 0, '307+718=?', '1025', '1018', '1015', '1016', NULL, NULL, NULL, '1025', '307+718=1025', '');
INSERT INTO `teach_self_question` VALUES ('1460634244698079234', 0, '415+368=?', '769', '776', '783', '769', NULL, NULL, NULL, '783', '415+368=783', '');
INSERT INTO `teach_self_question` VALUES ('1460634244698079235', 0, '920+414=?', '1328', '1334', '1323', '1324', NULL, NULL, NULL, '1334', '920+414=1334', '');
INSERT INTO `teach_self_question` VALUES ('1460634244698079236', 0, '213+639=?', '841', '852', '840', '845', NULL, NULL, NULL, '852', '213+639=852', '');
INSERT INTO `teach_self_question` VALUES ('1460634244698079237', 0, '136+457=?', '593', '581', '587', '584', NULL, NULL, NULL, '593', '136+457=593', '');
INSERT INTO `teach_self_question` VALUES ('1460634244698079238', 0, '125+468=?', '582', '581', '593', '583', NULL, NULL, NULL, '593', '125+468=593', '');
INSERT INTO `teach_self_question` VALUES ('1460634244765188097', 0, '813+668=?', '1474', '1481', '1472', '1473', NULL, NULL, NULL, '1481', '813+668=1481', '');
INSERT INTO `teach_self_question` VALUES ('1460634244765188098', 0, '800+324=?', '1112', '1124', '1115', '1114', NULL, NULL, NULL, '1124', '800+324=1124', '');
INSERT INTO `teach_self_question` VALUES ('1460634244765188099', 0, '368+189=?', '557', '550', '546', '551', NULL, NULL, NULL, '557', '368+189=557', '');
INSERT INTO `teach_self_question` VALUES ('1460634244765188100', 0, '632+467=?', '1084', '1099', '1090', '1093', NULL, NULL, NULL, '1099', '632+467=1099', '');
INSERT INTO `teach_self_question` VALUES ('1460634244765188101', 0, '597+822=?', '1419', '1406', '1406', '1413', NULL, NULL, NULL, '1419', '597+822=1419', '');
INSERT INTO `teach_self_question` VALUES ('1460634244819714050', 0, '504+582=?', '1071', '1086', '1078', '1080', NULL, NULL, NULL, '1086', '504+582=1086', '');
INSERT INTO `teach_self_question` VALUES ('1460634244819714051', 0, '478+994=?', '1461', '1458', '1461', '1472', NULL, NULL, NULL, '1472', '478+994=1472', '');
INSERT INTO `teach_self_question` VALUES ('1460634244819714052', 0, '898+21=?', '911', '904', '905', '919', NULL, NULL, NULL, '919', '898+21=919', '');
INSERT INTO `teach_self_question` VALUES ('1460634244819714053', 0, '921+843=?', '1764', '1757', '1750', '1758', NULL, NULL, NULL, '1764', '921+843=1764', '');
INSERT INTO `teach_self_question` VALUES ('1460634244819714054', 0, '252+693=?', '933', '936', '945', '936', NULL, NULL, NULL, '945', '252+693=945', '');
INSERT INTO `teach_self_question` VALUES ('1460634244882628610', 0, '315+250=?', '550', '557', '565', '559', NULL, NULL, NULL, '565', '315+250=565', '');
INSERT INTO `teach_self_question` VALUES ('1460634244882628611', 0, '996+631=?', '1620', '1627', '1614', '1612', NULL, NULL, NULL, '1627', '996+631=1627', '');
INSERT INTO `teach_self_question` VALUES ('1460634244882628612', 0, '881+802=?', '1668', '1669', '1683', '1668', NULL, NULL, NULL, '1683', '881+802=1683', '');
INSERT INTO `teach_self_question` VALUES ('1460634244882628613', 0, '588+648=?', '1223', '1229', '1236', '1227', NULL, NULL, NULL, '1236', '588+648=1236', '');
INSERT INTO `teach_self_question` VALUES ('1460634244882628614', 0, '818+905=?', '1710', '1723', '1712', '1709', NULL, NULL, NULL, '1723', '818+905=1723', '');
INSERT INTO `teach_self_question` VALUES ('1460634244945543170', 0, '916+449=?', '1353', '1354', '1354', '1365', NULL, NULL, NULL, '1365', '916+449=1365', '');
INSERT INTO `teach_self_question` VALUES ('1460634244945543171', 0, '719+809=?', '1519', '1513', '1528', '1518', NULL, NULL, NULL, '1528', '719+809=1528', '');
INSERT INTO `teach_self_question` VALUES ('1460634244945543172', 0, '82+641=?', '723', '711', '712', '713', NULL, NULL, NULL, '723', '82+641=723', '');
INSERT INTO `teach_self_question` VALUES ('1460634244945543173', 0, '221+276=?', '497', '485', '486', '483', NULL, NULL, NULL, '497', '221+276=497', '');
INSERT INTO `teach_self_question` VALUES ('1460634244945543174', 0, '633+871=?', '1495', '1493', '1495', '1504', NULL, NULL, NULL, '1504', '633+871=1504', '');
INSERT INTO `teach_self_question` VALUES ('1460634245012652033', 0, '139+339=?', '464', '478', '472', '470', NULL, NULL, NULL, '478', '139+339=478', '');
INSERT INTO `teach_self_question` VALUES ('1460634245012652034', 0, '721+988=?', '1695', '1702', '1709', '1697', NULL, NULL, NULL, '1709', '721+988=1709', '');
INSERT INTO `teach_self_question` VALUES ('1460634245012652035', 0, '621+592=?', '1204', '1206', '1213', '1202', NULL, NULL, NULL, '1213', '621+592=1213', '');
INSERT INTO `teach_self_question` VALUES ('1460634245012652036', 0, '712+613=?', '1316', '1325', '1313', '1317', NULL, NULL, NULL, '1325', '712+613=1325', '');
INSERT INTO `teach_self_question` VALUES ('1460634245012652037', 0, '394+511=?', '895', '905', '891', '897', NULL, NULL, NULL, '905', '394+511=905', '');
INSERT INTO `teach_self_question` VALUES ('1460634245012652038', 0, '694+385=?', '1079', '1073', '1069', '1072', NULL, NULL, NULL, '1079', '694+385=1079', '');
INSERT INTO `teach_self_question` VALUES ('1460634245079760898', 0, '537+520=?', '1043', '1042', '1057', '1042', NULL, NULL, NULL, '1057', '537+520=1057', '');
INSERT INTO `teach_self_question` VALUES ('1460634245079760899', 0, '954+140=?', '1094', '1082', '1085', '1088', NULL, NULL, NULL, '1094', '954+140=1094', '');
INSERT INTO `teach_self_question` VALUES ('1460634245079760900', 0, '11+586=?', '591', '585', '589', '597', NULL, NULL, NULL, '597', '11+586=597', '');
INSERT INTO `teach_self_question` VALUES ('1460634245079760901', 0, '922+241=?', '1163', '1153', '1148', '1151', NULL, NULL, NULL, '1163', '922+241=1163', '');
INSERT INTO `teach_self_question` VALUES ('1460634245079760902', 0, '172+981=?', '1146', '1153', '1142', '1145', NULL, NULL, NULL, '1153', '172+981=1153', '');
INSERT INTO `teach_self_question` VALUES ('1460634245151064065', 0, '726+314=?', '1025', '1030', '1034', '1040', NULL, NULL, NULL, '1040', '726+314=1040', '');
INSERT INTO `teach_self_question` VALUES ('1460634245151064066', 0, '827+524=?', '1341', '1341', '1351', '1338', NULL, NULL, NULL, '1351', '827+524=1351', '');
INSERT INTO `teach_self_question` VALUES ('1460634245151064067', 0, '201+956=?', '1148', '1143', '1144', '1157', NULL, NULL, NULL, '1157', '201+956=1157', '');
INSERT INTO `teach_self_question` VALUES ('1460634245151064068', 0, '532+952=?', '1476', '1470', '1470', '1484', NULL, NULL, NULL, '1484', '532+952=1484', '');
INSERT INTO `teach_self_question` VALUES ('1460634245151064069', 0, '992+976=?', '1968', '1961', '1961', '1962', NULL, NULL, NULL, '1968', '992+976=1968', '');
INSERT INTO `teach_self_question` VALUES ('1460634245213978625', 0, '459+825=?', '1273', '1275', '1277', '1284', NULL, NULL, NULL, '1284', '459+825=1284', '');
INSERT INTO `teach_self_question` VALUES ('1460634245213978626', 0, '689+673=?', '1362', '1349', '1347', '1348', NULL, NULL, NULL, '1362', '689+673=1362', '');
INSERT INTO `teach_self_question` VALUES ('1460634245213978627', 0, '478+525=?', '989', '996', '1003', '996', NULL, NULL, NULL, '1003', '478+525=1003', '');
INSERT INTO `teach_self_question` VALUES ('1460634245213978628', 0, '151+531=?', '676', '674', '671', '682', NULL, NULL, NULL, '682', '151+531=682', '');
INSERT INTO `teach_self_question` VALUES ('1460634245213978629', 0, '319+497=?', '816', '809', '804', '802', NULL, NULL, NULL, '816', '319+497=816', '');
INSERT INTO `teach_self_question` VALUES ('1460634245285281794', 0, '827+557=?', '1373', '1372', '1369', '1384', NULL, NULL, NULL, '1384', '827+557=1384', '');
INSERT INTO `teach_self_question` VALUES ('1460634245285281795', 0, '329+805=?', '1134', '1120', '1120', '1120', NULL, NULL, NULL, '1134', '329+805=1134', '');
INSERT INTO `teach_self_question` VALUES ('1460634245285281796', 0, '963+614=?', '1566', '1577', '1562', '1568', NULL, NULL, NULL, '1577', '963+614=1577', '');
INSERT INTO `teach_self_question` VALUES ('1460634245285281797', 0, '586+461=?', '1032', '1047', '1035', '1039', NULL, NULL, NULL, '1047', '586+461=1047', '');
INSERT INTO `teach_self_question` VALUES ('1460634245285281798', 0, '360+531=?', '891', '883', '882', '879', NULL, NULL, NULL, '891', '360+531=891', '');
INSERT INTO `teach_self_question` VALUES ('1460634245348196354', 0, '574+57=?', '622', '617', '631', '616', NULL, NULL, NULL, '631', '574+57=631', '');
INSERT INTO `teach_self_question` VALUES ('1460634245348196355', 0, '0+930=?', '930', '922', '924', '919', NULL, NULL, NULL, '930', '0+930=930', '');
INSERT INTO `teach_self_question` VALUES ('1460634245348196356', 0, '505+627=?', '1120', '1120', '1132', '1117', NULL, NULL, NULL, '1132', '505+627=1132', '');
INSERT INTO `teach_self_question` VALUES ('1460634245348196357', 0, '732+899=?', '1622', '1621', '1616', '1631', NULL, NULL, NULL, '1631', '732+899=1631', '');
INSERT INTO `teach_self_question` VALUES ('1460634245348196358', 0, '357+652=?', '1009', '1003', '1000', '996', NULL, NULL, NULL, '1009', '357+652=1009', '');
INSERT INTO `teach_self_question` VALUES ('1460634245348196359', 0, '446+203=?', '641', '641', '649', '640', NULL, NULL, NULL, '649', '446+203=649', '');
INSERT INTO `teach_self_question` VALUES ('1460634245415305218', 0, '524+394=?', '910', '906', '904', '918', NULL, NULL, NULL, '918', '524+394=918', '');
INSERT INTO `teach_self_question` VALUES ('1460634245415305219', 0, '688+996=?', '1684', '1676', '1673', '1671', NULL, NULL, NULL, '1684', '688+996=1684', '');
INSERT INTO `teach_self_question` VALUES ('1460634245415305220', 0, '793+458=?', '1251', '1244', '1237', '1240', NULL, NULL, NULL, '1251', '793+458=1251', '');
INSERT INTO `teach_self_question` VALUES ('1460634245415305221', 0, '485+389=?', '866', '874', '862', '863', NULL, NULL, NULL, '874', '485+389=874', '');
INSERT INTO `teach_self_question` VALUES ('1460634245415305222', 0, '128+992=?', '1113', '1109', '1110', '1120', NULL, NULL, NULL, '1120', '128+992=1120', '');
INSERT INTO `teach_self_question` VALUES ('1460634245482414082', 0, '509+422=?', '919', '916', '931', '916', NULL, NULL, NULL, '931', '509+422=931', '');
INSERT INTO `teach_self_question` VALUES ('1460634245482414083', 0, '954+975=?', '1929', '1918', '1914', '1921', NULL, NULL, NULL, '1929', '954+975=1929', '');
INSERT INTO `teach_self_question` VALUES ('1460634245482414084', 0, '959+323=?', '1269', '1282', '1269', '1275', NULL, NULL, NULL, '1282', '959+323=1282', '');
INSERT INTO `teach_self_question` VALUES ('1460634245482414085', 0, '673+604=?', '1263', '1265', '1265', '1277', NULL, NULL, NULL, '1277', '673+604=1277', '');
INSERT INTO `teach_self_question` VALUES ('1460634245482414086', 0, '622+200=?', '808', '822', '814', '809', NULL, NULL, NULL, '822', '622+200=822', '');
INSERT INTO `teach_self_question` VALUES ('1460634245482414087', 0, '50+621=?', '656', '657', '659', '671', NULL, NULL, NULL, '671', '50+621=671', '');
INSERT INTO `teach_self_question` VALUES ('1460634245549522945', 0, '6+495=?', '501', '494', '495', '495', NULL, NULL, NULL, '501', '6+495=501', '');
INSERT INTO `teach_self_question` VALUES ('1460634245549522946', 0, '79+535=?', '601', '607', '605', '614', NULL, NULL, NULL, '614', '79+535=614', '');
INSERT INTO `teach_self_question` VALUES ('1460634245549522947', 0, '48+785=?', '827', '833', '823', '823', NULL, NULL, NULL, '833', '48+785=833', '');
INSERT INTO `teach_self_question` VALUES ('1460634245549522948', 0, '178+281=?', '451', '451', '450', '459', NULL, NULL, NULL, '459', '178+281=459', '');
INSERT INTO `teach_self_question` VALUES ('1460634245549522949', 0, '876+761=?', '1631', '1637', '1624', '1629', NULL, NULL, NULL, '1637', '876+761=1637', '');
INSERT INTO `teach_self_question` VALUES ('1460634245616631809', 0, '702+247=?', '942', '949', '937', '936', NULL, NULL, NULL, '949', '702+247=949', '');
INSERT INTO `teach_self_question` VALUES ('1460634245616631810', 0, '634+420=?', '1045', '1054', '1042', '1048', NULL, NULL, NULL, '1054', '634+420=1054', '');
INSERT INTO `teach_self_question` VALUES ('1460634245616631811', 0, '451+993=?', '1444', '1433', '1438', '1432', NULL, NULL, NULL, '1444', '451+993=1444', '');
INSERT INTO `teach_self_question` VALUES ('1460634245616631812', 0, '466+953=?', '1407', '1404', '1413', '1419', NULL, NULL, NULL, '1419', '466+953=1419', '');
INSERT INTO `teach_self_question` VALUES ('1460634245616631813', 0, '384+619=?', '992', '989', '1003', '990', NULL, NULL, NULL, '1003', '384+619=1003', '');
INSERT INTO `teach_self_question` VALUES ('1460634245616631814', 0, '162+60=?', '212', '214', '207', '222', NULL, NULL, NULL, '222', '162+60=222', '');
INSERT INTO `teach_self_question` VALUES ('1460634245692129282', 0, '230+716=?', '932', '931', '946', '937', NULL, NULL, NULL, '946', '230+716=946', '');
INSERT INTO `teach_self_question` VALUES ('1460634245692129283', 0, '826+959=?', '1776', '1773', '1774', '1785', NULL, NULL, NULL, '1785', '826+959=1785', '');
INSERT INTO `teach_self_question` VALUES ('1460634245692129284', 0, '110+143=?', '245', '242', '253', '241', NULL, NULL, NULL, '253', '110+143=253', '');
INSERT INTO `teach_self_question` VALUES ('1460634245692129285', 0, '954+967=?', '1912', '1914', '1912', '1921', NULL, NULL, NULL, '1921', '954+967=1921', '');
INSERT INTO `teach_self_question` VALUES ('1460634245750849537', 0, '302+171=?', '466', '473', '466', '460', NULL, NULL, NULL, '473', '302+171=473', '');
INSERT INTO `teach_self_question` VALUES ('1460634245750849538', 0, '918+466=?', '1369', '1378', '1373', '1384', NULL, NULL, NULL, '1384', '918+466=1384', '');
INSERT INTO `teach_self_question` VALUES ('1460634245750849539', 0, '448+135=?', '573', '570', '576', '583', NULL, NULL, NULL, '583', '448+135=583', '');
INSERT INTO `teach_self_question` VALUES ('1460634245750849540', 0, '879+807=?', '1686', '1674', '1673', '1678', NULL, NULL, NULL, '1686', '879+807=1686', '');
INSERT INTO `teach_self_question` VALUES ('1460634245750849541', 0, '815+678=?', '1487', '1478', '1493', '1485', NULL, NULL, NULL, '1493', '815+678=1493', '');
INSERT INTO `teach_self_question` VALUES ('1460634245750849542', 0, '716+383=?', '1099', '1088', '1086', '1089', NULL, NULL, NULL, '1099', '716+383=1099', '');
INSERT INTO `teach_self_question` VALUES ('1460634245817958402', 0, '494+723=?', '1217', '1205', '1208', '1204', NULL, NULL, NULL, '1217', '494+723=1217', '');
INSERT INTO `teach_self_question` VALUES ('1460634245817958403', 0, '784+777=?', '1549', '1546', '1561', '1546', NULL, NULL, NULL, '1561', '784+777=1561', '');
INSERT INTO `teach_self_question` VALUES ('1460634245817958404', 0, '788+417=?', '1205', '1194', '1196', '1197', NULL, NULL, NULL, '1205', '788+417=1205', '');
INSERT INTO `teach_self_question` VALUES ('1460634245817958405', 0, '772+111=?', '873', '868', '883', '874', NULL, NULL, NULL, '883', '772+111=883', '');
INSERT INTO `teach_self_question` VALUES ('1460634245817958406', 0, '846+638=?', '1474', '1471', '1484', '1469', NULL, NULL, NULL, '1484', '846+638=1484', '');
INSERT INTO `teach_self_question` VALUES ('1460634245817958407', 0, '308+477=?', '776', '777', '785', '778', NULL, NULL, NULL, '785', '308+477=785', '');
INSERT INTO `teach_self_question` VALUES ('1460634245885067265', 0, '939+393=?', '1326', '1332', '1321', '1318', NULL, NULL, NULL, '1332', '939+393=1332', '');
INSERT INTO `teach_self_question` VALUES ('1460634245885067266', 0, '189+165=?', '339', '346', '354', '341', NULL, NULL, NULL, '354', '189+165=354', '');
INSERT INTO `teach_self_question` VALUES ('1460634245885067267', 0, '591+924=?', '1501', '1515', '1508', '1500', NULL, NULL, NULL, '1515', '591+924=1515', '');
INSERT INTO `teach_self_question` VALUES ('1460634245885067268', 0, '297+21=?', '306', '307', '318', '308', NULL, NULL, NULL, '318', '297+21=318', '');
INSERT INTO `teach_self_question` VALUES ('1460634245885067269', 0, '760+609=?', '1361', '1362', '1369', '1354', NULL, NULL, NULL, '1369', '760+609=1369', '');
INSERT INTO `teach_self_question` VALUES ('1460634245960564737', 0, '25+718=?', '732', '735', '729', '743', NULL, NULL, NULL, '743', '25+718=743', '');

SET FOREIGN_KEY_CHECKS = 1;
