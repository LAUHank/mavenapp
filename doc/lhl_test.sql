/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50173
Source Host           : 192.168.56.101:3306
Source Database       : lhl_test

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2018-06-14 10:49:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for people
-- ----------------------------
DROP TABLE IF EXISTS `people`;
CREATE TABLE `people` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  KEY `idx_pp_n` (`name`),
  KEY `idx_pp_id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of people
-- ----------------------------
INSERT INTO `people` VALUES ('1', null);
INSERT INTO `people` VALUES ('2', 'xiaoHong');

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of person
-- ----------------------------

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `score` double DEFAULT NULL,
  `teacher_id` int(11) NOT NULL,
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '小红', '99.8', '0');
INSERT INTO `student` VALUES ('2', '小明', '23', '0');
INSERT INTO `student` VALUES ('3', '小雷', '67', '0');
INSERT INTO `student` VALUES ('4', 'xiaoLei', '45.32', '2');

-- ----------------------------
-- Table structure for student_score
-- ----------------------------
DROP TABLE IF EXISTS `student_score`;
CREATE TABLE `student_score` (
  `id` int(11) NOT NULL DEFAULT '0',
  `sname` varchar(100) NOT NULL DEFAULT '',
  `cname` varchar(100) NOT NULL DEFAULT '',
  `score` decimal(18,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_score
-- ----------------------------
INSERT INTO `student_score` VALUES ('1', '小王', 'MySQL', '33.00');
INSERT INTO `student_score` VALUES ('2', '小李', 'MySQL', '78.00');
INSERT INTO `student_score` VALUES ('3', '小王', 'Java', '20.00');
INSERT INTO `student_score` VALUES ('4', '小明', 'Java', '88.00');
INSERT INTO `student_score` VALUES ('5', '小李', 'Java', '98.00');
INSERT INTO `student_score` VALUES ('6', '小明', 'MySQL', '88.00');

-- ----------------------------
-- Table structure for student2
-- ----------------------------
DROP TABLE IF EXISTS `student2`;
CREATE TABLE `student2` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `score` decimal(18,2) NOT NULL DEFAULT '0.00',
  `teacher_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `student2_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student2
-- ----------------------------

-- ----------------------------
-- Table structure for student3
-- ----------------------------
DROP TABLE IF EXISTS `student3`;
CREATE TABLE `student3` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `score` decimal(18,2) NOT NULL DEFAULT '0.00',
  `teacher_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `student3_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student3
-- ----------------------------

-- ----------------------------
-- Table structure for student4
-- ----------------------------
DROP TABLE IF EXISTS `student4`;
CREATE TABLE `student4` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `score` double DEFAULT NULL,
  `teacher_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student4
-- ----------------------------
INSERT INTO `student4` VALUES ('1', '小红', '99.8', '0');
INSERT INTO `student4` VALUES ('2', '小明', '23', '0');
INSERT INTO `student4` VALUES ('3', '小雷', '67', '0');
INSERT INTO `student4` VALUES ('4', 'xiaoLei', '45.32', '2');
INSERT INTO `student4` VALUES ('1', '小红', '99.8', '0');
INSERT INTO `student4` VALUES ('2', '小明', '23', '0');
INSERT INTO `student4` VALUES ('3', '小雷', '67', '0');
INSERT INTO `student4` VALUES ('4', 'xiaoLei', '45.32', '2');
INSERT INTO `student4` VALUES ('1', '小红', '99.8', '0');
INSERT INTO `student4` VALUES ('2', '小明', '23', '0');
INSERT INTO `student4` VALUES ('3', '小雷', '67', '0');
INSERT INTO `student4` VALUES ('4', 'xiaoLei', '45.32', '2');
INSERT INTO `student4` VALUES ('1', '小红', '99.8', '0');
INSERT INTO `student4` VALUES ('2', '小明', '23', '0');
INSERT INTO `student4` VALUES ('3', '小雷', '67', '0');
INSERT INTO `student4` VALUES ('4', 'xiaoLei', '45.32', '2');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `birthday` datetime NOT NULL,
  `salary` decimal(18,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('0', 'hehe', '0000-00-00 00:00:00', '0.00');
INSERT INTO `teacher` VALUES ('2', 'xiaohong', '0000-00-00 00:00:00', '0.00');

-- ----------------------------
-- Table structure for teacher_bak
-- ----------------------------
DROP TABLE IF EXISTS `teacher_bak`;
CREATE TABLE `teacher_bak` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `birthday` datetime NOT NULL,
  `salary` decimal(18,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher_bak
-- ----------------------------
INSERT INTO `teacher_bak` VALUES ('0', 'hehe', '0000-00-00 00:00:00', '0.00');
INSERT INTO `teacher_bak` VALUES ('2', 'xiaohong', '0000-00-00 00:00:00', '0.00');

-- ----------------------------
-- Table structure for test_table
-- ----------------------------
DROP TABLE IF EXISTS `test_table`;
CREATE TABLE `test_table` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test_table
-- ----------------------------
INSERT INTO `test_table` VALUES ('6', '测试类6');
INSERT INTO `test_table` VALUES ('5', '测试类3');
INSERT INTO `test_table` VALUES ('2', 'lhl2');
INSERT INTO `test_table` VALUES ('7', '测试类7');
INSERT INTO `test_table` VALUES ('3', 'lhl3');
INSERT INTO `test_table` VALUES ('3', 'lhl3');
INSERT INTO `test_table` VALUES ('4', 'lhl4');
INSERT INTO `test_table` VALUES ('5', 'lhl5');
INSERT INTO `test_table` VALUES ('6', 'lhl6');
INSERT INTO `test_table` VALUES ('7', 'lhl7');
INSERT INTO `test_table` VALUES ('8', 'lhl8');
INSERT INTO `test_table` VALUES ('9', 'lhl9');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` int(11) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', 'lhl', '000');
INSERT INTO `user_info` VALUES ('2', 'david', '456');
INSERT INTO `user_info` VALUES ('3', 'cheerui', '789');
