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

 Date: 24/04/2019 21:41:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for classes
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes`  (
  `class_number` int(11) NOT NULL,
  `class_college` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`class_college`, `class_number`) USING BTREE,
  INDEX `class_number`(`class_number`) USING BTREE,
  CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`class_college`) REFERENCES `colleges` (`name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classes
-- ----------------------------
INSERT INTO `classes` VALUES (101, '传媒学院');
INSERT INTO `classes` VALUES (102, '传媒学院');
INSERT INTO `classes` VALUES (201, '哲学学院');
INSERT INTO `classes` VALUES (202, '哲学学院');
INSERT INTO `classes` VALUES (301, '电气工程学院');
INSERT INTO `classes` VALUES (302, '电气工程学院');
INSERT INTO `classes` VALUES (401, '计算机科学与技术学院');
INSERT INTO `classes` VALUES (402, '计算机科学与技术学院');

SET FOREIGN_KEY_CHECKS = 1;
