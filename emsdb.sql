/*
Navicat MySQL Data Transfer

Source Server         : c2n
Source Server Version : 50153
Source Host           : localhost:3306
Source Database       : emsdb

Target Server Type    : MYSQL
Target Server Version : 50153
File Encoding         : 65001

Date: 2017-07-15 20:16:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for employees
-- ----------------------------
DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(255) DEFAULT NULL,
  `joindate` datetime DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of employees
-- ----------------------------
INSERT INTO `employees` VALUES ('1', 'balaji', 'balaji5', 'abcdef', 'balaji.siddi@gmail,.com', '8179919865', '2017-07-15 00:00:00', 'Developer');
INSERT INTO `employees` VALUES ('2', 'balaji', 'balajiongole', 'abcdef', 'balaji.ongole@gmail.com', '7788994455', '2017-07-07 00:00:00', 'Developer');
INSERT INTO `employees` VALUES ('3', 'dkdkd', 'dkdk', 'dkdsk', 'kdkdd', '74785', '2017-07-15 00:00:00', 'Developer');
INSERT INTO `employees` VALUES ('4', 'dkjakj', 'jkdkjd', 'jkjkjk', 'jkjkdkjkdkj', '785', '2017-07-15 00:00:00', 'Developer');
INSERT INTO `employees` VALUES ('5', 'dkdsdk', 'kdddkj', 'dkdsksdkj', 'dkjdkdkkdj', '5656565', '2017-07-15 00:00:00', 'Developer');
INSERT INTO `employees` VALUES ('6', 'kdjdkk', 'dkdkdk', 'dkdkdkdk', 'dkdkkd', '85555', '2017-07-22 00:00:00', 'Developer');

-- ----------------------------
-- Table structure for profiles
-- ----------------------------
DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of profiles
-- ----------------------------
INSERT INTO `profiles` VALUES ('1', 'balaji', 'balaji5', 'EMPLOYEE');
INSERT INTO `profiles` VALUES ('2', 'alex', 'alex', 'ADMIN');
INSERT INTO `profiles` VALUES ('3', 'koti', 'koti', 'MANAGER');

-- ----------------------------
-- Table structure for projects
-- ----------------------------
DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(255) DEFAULT NULL,
  `client_name` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of projects
-- ----------------------------
