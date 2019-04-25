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

 Date: 24/04/2019 21:41:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for students
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students`  (
  `student_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `from_class` int(11) NULL DEFAULT NULL,
  `from_college` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`student_id`) USING BTREE,
  INDEX `from_college`(`from_college`) USING BTREE,
  INDEX `students_ibfk_2`(`from_class`) USING BTREE,
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`from_college`) REFERENCES `colleges` (`name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `students_ibfk_2` FOREIGN KEY (`from_class`) REFERENCES `classes` (`class_number`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO `students` VALUES ('1001', '方此贤', 101, '传媒学院');
INSERT INTO `students` VALUES ('1002', '言婴', 101, '传媒学院');
INSERT INTO `students` VALUES ('1003', '玛托妮卡斯特罗', 102, '传媒学院');
INSERT INTO `students` VALUES ('1004', '陈成', 102, '传媒学院');
INSERT INTO `students` VALUES ('1005', '温幼菊', 201, '哲学学院');
INSERT INTO `students` VALUES ('1006', '温幼兰', 201, '哲学学院');
INSERT INTO `students` VALUES ('1007', '陈迎', 202, '哲学学院');
INSERT INTO `students` VALUES ('1008', '可先', 202, '哲学学院');
INSERT INTO `students` VALUES ('1009', '明石绫子', 301, '电气工程学院');
INSERT INTO `students` VALUES ('1010', '纸月', 301, '电气工程学院');
INSERT INTO `students` VALUES ('1011', '吾井昭太郎', 302, '电气工程学院');
INSERT INTO `students` VALUES ('1012', '松下小津', 302, '电气工程学院');
INSERT INTO `students` VALUES ('1013', '汉姆约翰逊', 401, '计算机科学与技术学院');
INSERT INTO `students` VALUES ('1014', '张小明', 401, '计算机科学与技术学院');
INSERT INTO `students` VALUES ('1015', '李明峰', 402, '计算机科学与技术学院');
INSERT INTO `students` VALUES ('1016', '何其', 402, '计算机科学与技术学院');

SET FOREIGN_KEY_CHECKS = 1;
