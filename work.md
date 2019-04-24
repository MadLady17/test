# MySQL简单设计
---
## 设计要素
+ 学院、班级、学生分别为一个表
+ 表中每一列为属性
+ 各个表的某些列相互关联（通过外键约束实现

## SQL代码

>  Navicat MySQL Data Transfer

 Source Server         : work1
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : work1

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 24/04/2019 21:41:14 数据库相关信息

### 学院

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
> 建立学院表，并添加name（学院名称）列。将name设为主键约束。
   
    -- ----------------------------
    -- Records of colleges
    -- ----------------------------
    INSERT INTO `colleges` VALUES ('传媒学院');
    INSERT INTO `colleges` VALUES ('哲学学院');
    INSERT INTO `colleges` VALUES ('电气工程学院');
    INSERT INTO `colleges` VALUES ('计算机科学与技术学院');

    SET FOREIGN_KEY_CHECKS = 1;
> 此处添加四个学院实例。

### 班级
  
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
    
> 建立班级表，并添加class_number（班级名）、class_college（所属学院）等列。将class_college,class_number设为联合主键约束。将class_college与colleges(name)设为外键约束，使得学院表与班级表关联。

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


> 以每个学院两个班为标准，添加八个班实例，并加上每个班的所属学院。

### 学生

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
> 建立学生表，并添加student_id（学号）、name（姓名）、from_class（所属班级）、from_college（所属学院）等列。将student_id设为主键约束。将from_class与classes(class_number)、from_college与colleges(name)分别建立外键约束，使得学生表与班级表，学生表与学院表关联。
   
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
> 此处以每个班两个人为标准，建立共十六人的实例，加上每人的学号，姓名，班级，学院。

##个人总结
  此数据库的简单设计有点类似与编程中的面向对象编程的类思想，表就是类，列就是属性（或者成员数据？）不同的学院、不同的班级、不同的人，不同的记录就是不同的对象或或者实例。就此设计，个人设计较为简单（仅仅使用了约束），本来是应该使用可视化工具，下了一个NAVICAT，可没学数据库基础也不知道怎么用，所以花了几个小时看了看数据库的基础（仅仅到约束）。事实上此数据库的建立也是在CMD中进行的，以下是我使用的命令

    create table colleges(
      name varchar(20),
      primary key(name)
    );

    insert into colleges values('电气工程学院');
    insert into colleges values('计算机科学与技术学院');
    insert into colleges values('哲学学院');
    insert into colleges values('传媒学院');

    create table classes(
      class_number int,
      class_college varchar(20),
      foreign key(class_college) references colleges(name),
      primary key(class_college,class_number)
    );
  
    insert into classes values(101,'传媒学院');
    insert into classes values(102,'传媒学院');  
    insert into classes values(201,'哲学学院');  
    insert into classes values(202,'哲学学院');  
    insert into classes values(301,'电气工程学院');  
    insert into classes values(302,'电气工程学院');  
    insert into classes values(401,'计算机科学与技术学院');  
    insert into classes values(402,'计算机科学与技术学院');  

    create table students(
      student_id varchar(20),
      name varchar(20),
      from_class int,
      from_college varchar(20),
      foreign key(from_college) references colleges(name),
      primary key(student_id)
    );

    insert into students values(1001,'方此贤',101,'传媒学院');
    insert into students values(1002,'言婴',101,'传媒学院');
    insert into students values(1003,'玛托妮卡斯特罗',102,'传媒学院');
    insert into students values(1004,'陈成',102,'传媒学院');
    insert into students values(1005,'温幼菊',201,'哲学学院');
    insert into students values(1006,'温幼兰',201,'哲学学院');
    insert into students values(1007,'陈迎',202,'哲学学院');
    insert into students values(1008,'可先',202,'哲学学院');
    insert into students values(1009,'明石绫子',301,'电气工程学院');
    insert into students values(1010,'纸月',301,'电气工程学院');
    insert into students values(1011,'吾井昭太郎',302,'电气工程学院');
    insert into students values(1012,'松下小津',302,'电气工程学院');
    insert into students values(1013,'汉姆约翰逊',401,'计算机科学与技术学院');
    insert into students values(1014,'张小明',401,'计算机科学与技术学院');
    insert into students values(1015,'李明峰',402,'计算机科学与技术学院');
    insert into students values(1016,'何其',402,'计算机科学与技术学院');

当然，还结合了可视化工具，让我可以在做一些修改时更方便。而且在学生表中，from_class与classes（class_number）建立外键约束时，似乎因为没弄清楚主表与副表的关系而不能建立，所以这一步是在NAVICAT上进行的。从学习到完成大概用了一整天的时间，但也有好久没有这么花一整天的时间干一件事了（之前天天都是玩，没学习好几个月了，惭愧）。但个人还是觉得有点捞（感觉比C++那个还简单啊）。希望今后还能像今天这样学习，也希望学长多指教吧。
