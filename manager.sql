SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色标识',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'admin', '管理员', 'http://localhost:9090/files/1697438073596-avatar.png', 'ADMIN', '13677889922', 'admin@xm.com');

-- ----------------------------
-- Table structure for building
-- ----------------------------
DROP TABLE IF EXISTS `building`;
CREATE TABLE `building`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '位置',
  `num` int(10) NULL DEFAULT 0 COMMENT '宿舍数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '宿舍楼信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of building
-- ----------------------------
INSERT INTO `building` VALUES (1, 'A栋', '南区生活区', 4);
INSERT INTO `building` VALUES (2, 'B栋', '北苑生活区', 2);
INSERT INTO `building` VALUES (3, 'C栋', '西湖生活区', 0);
INSERT INTO `building` VALUES (4, 'D栋', '清湖生活区', 0);

-- ----------------------------
-- Table structure for dormitory
-- ----------------------------
DROP TABLE IF EXISTS `dormitory`;
CREATE TABLE `dormitory`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '寝室号',
  `building_id` int(10) NULL DEFAULT NULL COMMENT '宿舍楼ID',
  `num` int(10) NULL DEFAULT NULL COMMENT '容纳数',
  `now_num` int(10) NULL DEFAULT 0 COMMENT '已住人数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '宿舍信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dormitory
-- ----------------------------
INSERT INTO `dormitory` VALUES (3, 'A101', 1, 4, 4);
INSERT INTO `dormitory` VALUES (4, 'A102', 1, 4, 1);
INSERT INTO `dormitory` VALUES (5, 'A103', 1, 4, 0);
INSERT INTO `dormitory` VALUES (6, 'A104', 1, 4, 0);
INSERT INTO `dormitory` VALUES (7, 'C101', 2, 4, 0);
INSERT INTO `dormitory` VALUES (9, 'B102', 2, 4, 0);

-- ----------------------------
-- Table structure for electro
-- ----------------------------
DROP TABLE IF EXISTS `electro`;
CREATE TABLE `electro`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `dormitory_id` int(10) NULL DEFAULT NULL COMMENT '宿舍ID',
  `price` double(10, 2) NULL DEFAULT NULL COMMENT '费用',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '费用说明',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '缴费状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '电费缴纳表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of electro
-- ----------------------------
INSERT INTO `electro` VALUES (1, 3, 200.00, '第一学期电费', '已缴费');
INSERT INTO `electro` VALUES (2, 4, 200.00, '第一学期电费', '已缴费');
INSERT INTO `electro` VALUES (3, 5, 200.00, '第二学期电费', '未缴费');

-- ----------------------------
-- Table structure for exchanges
-- ----------------------------
DROP TABLE IF EXISTS `exchanges`;
CREATE TABLE `exchanges`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `studenta` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学生A姓名',
  `studentb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学生B姓名',
  `dormitorya` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学生A原寝室',
  `dormitoryb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学生B原寝室',
  `beda` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学生A原床位',
  `bedb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学生B原床位',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更换时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '换寝记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exchanges
-- ----------------------------
INSERT INTO `exchanges` VALUES (7, '萧炎', '石昊', 'A102', 'A101', '1号', '2号', '2024-04-18 15:21:46');
INSERT INTO `exchanges` VALUES (8, '张三分', '王战国', 'A101', 'A101', '1号', '3号', '2024-04-18 15:22:51');

-- ----------------------------
-- Table structure for fix
-- ----------------------------
DROP TABLE IF EXISTS `fix`;
CREATE TABLE `fix`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `student_id` int(10) NULL DEFAULT NULL COMMENT '学生ID',
  `dormitory_id` int(10) NULL DEFAULT NULL COMMENT '宿舍ID',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '报修说明',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '报修图片',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '报修时间',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '处理状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '寝室报修表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fix
-- ----------------------------
INSERT INTO `fix` VALUES (1, 1, 3, '宿舍的灯坏了，请师傅来修一下！', 'http://localhost:9090/files/img_1.png', '2026-04-18 15:58:41', '已处理');
INSERT INTO `fix` VALUES (3, 2, 4, '空调坏了', 'http://localhost:9090/files/img.png', '2026-04-18 16:33:02', '已处理');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建时间',
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '公告信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '今天系统正式上线，开始内测', '今天系统正式上线，开始内测', '2026-04-05', 'admin');
INSERT INTO `notice` VALUES (2, '今天下雨，注意收取晾晒衣服', '今天下雨，注意收取晾晒衣服', '2026-09-05', 'admin');
INSERT INTO `notice` VALUES (3, '今天天气很不错，tiantiankaixin', '今天天气很不错，天天开心', '2026-09-05', 'admin');

-- ----------------------------
-- Table structure for stay
-- ----------------------------
DROP TABLE IF EXISTS `stay`;
CREATE TABLE `stay`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `student_id` int(10) NULL DEFAULT NULL COMMENT '学生ID',
  `dormitory_id` int(10) NULL DEFAULT NULL COMMENT '寝室ID',
  `building_id` int(10) NULL DEFAULT NULL COMMENT '宿舍楼ID',
  `bed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '床位号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '住宿信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stay
-- ----------------------------
INSERT INTO `stay` VALUES (4, 2, 3, 1, '2号');
INSERT INTO `stay` VALUES (5, 1, 3, 1, '3号');
INSERT INTO `stay` VALUES (6, 3, 3, 1, '1号');
INSERT INTO `stay` VALUES (7, 4, 3, 1, '4号');
INSERT INTO `stay` VALUES (9, 5, 4, 1, '1号');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'STUDENT' COMMENT '角色',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '学生信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, 'http://localhost:9090/files/1712824656163-柴犬.jpeg', 'zhangsan', '123456', '张三分', 'STUDENT', '18800009999', 'zhangsan@xm.com');
INSERT INTO `student` VALUES (2, 'http://localhost:9090/files/1712824687292-柯基.jpeg', 'lisi', '123456', '李坦克', 'STUDENT', '188800001111', 'lisi@xm.com');
INSERT INTO `student` VALUES (3, 'http://localhost:9090/files/1747226740700-R-C.jpg', 'wangwu', '123456', '王战国', 'STUDENT', '18877776666', 'wangwu@xm.com');
INSERT INTO `student` VALUES (4, 'http://localhost:9090/files/1747226669hhh.png', 'xiaoyan', '123456', '萧炎', 'STUDENT', '18877776666', 'zhaoliu@xm.com');
INSERT INTO `student` VALUES (5, 'http://localhost:9090/files/1747227.jpg', 'shihao', '123456', '石昊', 'STUDENT', '18877776666', 'liqi@xm.com');

-- ----------------------------
-- Table structure for visit
-- ----------------------------
DROP TABLE IF EXISTS `visit`;
CREATE TABLE `visit`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `dormitory_id` int(10) NULL DEFAULT NULL COMMENT '宿舍ID',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '来访说明',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '登记时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '来访登记表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of visit
-- ----------------------------
INSERT INTO `visit` (`dormitory_id`, `content`, `time`) VALUES (3, '检查宿舍', '2026-04-18 16:56:04');
INSERT INTO `visit` (`dormitory_id`, `content`, `time`) VALUES (3, '探亲', '2026-08-18 16:52:04');

SET FOREIGN_KEY_CHECKS = 1;