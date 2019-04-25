/*
 Navicat MySQL Data Transfer

 Source Server         : work1
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : work1

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 24/04/2019 21:41:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for colleges
-- ----------------------------
DROP TABLE IF EXISTS `colleges`;
CREATE TABLE `colleges`  (
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of colleges
-- ----------------------------
INSERT INTO `colleges` VALUES ('传媒学院');
INSERT INTO `colleges` VALUES ('哲学学院');
INSERT INTO `colleges` VALUES ('电气工程学院');
INSERT INTO `colleges` VALUES ('计算机科学与技术学院');

SET FOREIGN_KEY_CHECKS = 1;
