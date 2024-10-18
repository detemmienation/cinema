/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : cinema_manager

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 08/07/2023 19:14:05
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_bill
-- ----------------------------
DROP TABLE IF EXISTS `sys_bill`;
CREATE TABLE `sys_bill`  (
  `bill_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `pay_state` tinyint(0) NOT NULL DEFAULT 0 COMMENT '支付状态，0未支付，1已支付',
  `cancel_state` tinyint(0) NOT NULL DEFAULT 0 COMMENT '取消状态，0未取消，1取消',
  `user_id` bigint(0) UNSIGNED NOT NULL COMMENT '用户编号',
  `session_id` bigint(0) UNSIGNED NOT NULL COMMENT '场次编号',
  `seats` varchar(1600) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '购买的座位号，可能为多个，使用varchar(1600)传输',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `deadline` datetime NULL DEFAULT NULL COMMENT '失效时间',
  `cancel_time` datetime NULL DEFAULT NULL COMMENT '取消时间，标志用户取消订单，非系统超时取消',
  PRIMARY KEY (`bill_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_bill
-- ----------------------------
INSERT INTO `sys_bill` VALUES (1, 1, 0, 2, 1, '[\"1排3座\", \"1排4座\", \"1排5座\", \"1排6座\", \"1排7座\"]', '2023-07-08 12:28:37', '2023-07-08 12:43:34', NULL);
INSERT INTO `sys_bill` VALUES (77, 1, 0, 2, 1, '[\"2排9座\", \"2排10座\"]', '2023-07-08 14:28:59', '2023-07-08 14:43:57', NULL);

-- ----------------------------
-- Table structure for sys_cinema
-- ----------------------------
DROP TABLE IF EXISTS `sys_cinema`;
CREATE TABLE `sys_cinema`  (
  `cinema_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '影院编号',
  `cinema_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '影院名称',
  `hall_category_list` varchar(1600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拥有影厅类别',
  `cinema_picture` varchar(1600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '影院图片，varchar(1600)类型存储多张图片',
  `cinema_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '影院电话',
  `cinema_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '影院地址',
  `work_start_time` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开始营业时间',
  `work_end_time` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结束营业时间',
  PRIMARY KEY (`cinema_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_cinema
-- ----------------------------
INSERT INTO `sys_cinema` VALUES (1, '兔兔影院', '[\"N号激光厅\", \"IMAX巨幕厅\"]', '[\"/images/cinema/2023/07/03/92084bfd162a4a4698b77332c83700a0.jpg\"]', '010-8888-8888', '北京市海淀区', '00:00', '23:59');

-- ----------------------------
-- Table structure for sys_hall
-- ----------------------------
DROP TABLE IF EXISTS `sys_hall`;
CREATE TABLE `sys_hall`  (
  `hall_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '影厅编号',
  `cinema_id` bigint(0) UNSIGNED NOT NULL DEFAULT 1 COMMENT '影院编号',
  `hall_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '影厅名称',
  `hall_category` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '影厅类别',
  `row_start` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '排开始编号，如1排/A排，默认1排',
  `row_nums` smallint(0) UNSIGNED NOT NULL DEFAULT 10 COMMENT '总排数，默认10',
  `seat_nums_row` smallint(0) UNSIGNED NOT NULL DEFAULT 18 COMMENT '每排的座位数，默认18',
  `seat_nums` smallint(0) UNSIGNED NOT NULL DEFAULT 180 COMMENT '总可用座位数，用于判断影厅是否做满，默认180',
  `seat_state` varchar(1600) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所有座位的状态，0表示可用，1表示禁用，2表示售出，在场次表中体现',
  `del_state` tinyint(0) NOT NULL DEFAULT 0 COMMENT '删除标记，0未删除，1删除，默认0',
  PRIMARY KEY (`hall_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_hall
-- ----------------------------
INSERT INTO `sys_hall` VALUES (1, 1, '激光1号厅', 'N号激光厅', '1', 10, 10, 100, '{\"1\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"2\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"3\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"4\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"5\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"6\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"7\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"8\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"9\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"10\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]}', 0);
INSERT INTO `sys_hall` VALUES (2, 1, '激光2号厅', 'N号激光厅', '1', 10, 10, 100, '{\"1\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"2\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"3\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"4\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"5\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"6\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"7\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"8\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"9\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"10\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]}', 0);
INSERT INTO `sys_hall` VALUES (3, 1, '激光3号厅', 'N号激光厅', '1', 10, 10, 100, '{\"1\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"2\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"3\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"4\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"5\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"6\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"7\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"8\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"9\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"10\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]}', 0);
INSERT INTO `sys_hall` VALUES (4, 1, '巨幕1号厅', 'IMAX巨幕厅', '1', 20, 20, 400, '{\"1\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"2\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"3\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"4\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"5\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"6\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"7\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"8\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"9\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"10\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"11\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"12\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"13\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"14\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"15\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"16\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"17\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"18\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"19\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"20\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]}', 0);
INSERT INTO `sys_hall` VALUES (5, 1, '巨幕2号厅', 'IMAX巨幕厅', '1', 20, 20, 400, '{\"1\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"2\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"3\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"4\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"5\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"6\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"7\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"8\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"9\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"10\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"11\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"12\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"13\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"14\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"15\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"16\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"17\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"18\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"19\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"20\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]}', 0);

-- ----------------------------
-- Table structure for sys_movie
-- ----------------------------
DROP TABLE IF EXISTS `sys_movie`;
CREATE TABLE `sys_movie`  (
  `movie_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '电影编号',
  `movie_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电影名称',
  `movie_length` int(0) NULL DEFAULT NULL COMMENT '电影时长(单位: 分钟)',
  `movie_poster` varchar(1600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电影海报',
  `movie_area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电影区域',
  `release_date` datetime NULL DEFAULT NULL COMMENT '上映时间',
  `movie_box_office` decimal(20, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '电影总票房',
  `movie_introduction` varchar(1600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电影简介',
  `movie_pictures` varchar(1600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电影图集',
  `del_state` tinyint(0) NOT NULL DEFAULT 0 COMMENT '删除标记，0未删除，1删除，默认0',
  PRIMARY KEY (`movie_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_movie
-- ----------------------------
INSERT INTO `sys_movie` VALUES (1, '八角笼中', 120, '[\"/images/movie/2023/07/08/b62fd514a5b7408e9cd41b228b1195b9.jpg\"]', '中国大陆', '2023-07-08 12:25:20', 266.00, '年度最受期待现实佳作！根据真实事件改编，王宝强诚意打造普通人改写命运之路！电影讲述了向腾辉（王宝强 饰）倾注心血想把当地无人照料的孩子培养成才，这让生活本没有出路的孩子们看到了一丝通向未来的曙光。然而，随着往日的表演视频被爆出，这些“残忍、血腥”的画面刺激了不明真相的人们的神经。一夜之间，舆论开始发酵。向腾辉的生活、孩子们的前途都陷入到人们以善良为名编织的大网中，让 他们难以挣脱，重回泥沼，关于未来，他们的“出路”又将在哪……', '[\"/images/movie/2023/07/08/d719ce09e35347999b243847f1eab610.jpg\", \"/images/movie/2023/07/08/e56b01ef8b2748a4812760ff94ccffcc.jpg\", \"/images/movie/2023/07/08/487d7c27d8234044b860e6d2a10123bf.jpg\", \"/images/movie/2023/07/08/50ad852d85704661818907b6fa8a809c.jpg\", \"/images/movie/2023/07/08/f5c6d4b533a6433faaa74f972cfe6bce.jpg\"]', 0);
INSERT INTO `sys_movie` VALUES (2, '消失的她', 120, '[\"/images/movie/2023/07/08/251ad032e1d04ca4b41c6d5dc545439b.jpg\"]', '中国大陆', '2023-07-08 12:25:27', 0.00, '金牌监制陈思诚继《误杀》系列后又一悬疑力作，朱一龙、倪妮、文咏珊、杜江俊男美女狂飙演技，剧情过山车反转停不下来！何非（朱一龙 饰）的妻子李木子（文咏珊 饰）在结婚周年旅行中离奇消失，在何非苦寻无果之时妻子再次现身，何非却坚持眼前的陌生女人并非妻子，妻子拿出了身份证明进行自证，夫妻二人似乎都有不可告人的秘密，随着金牌律师陈麦（倪妮 饰）介入到这起离奇案件中，更多的谜团慢慢浮现……究竟谁在说谎？端午佳节一起沉浸解谜。', '[\"/images/movie/2023/07/08/a546b6b4277844328dc1e4c52c9c6a69.jpg\", \"/images/movie/2023/07/08/b37d19c3ae304aefb6ef8bf99437e85d.jpg\", \"/images/movie/2023/07/08/a64c759d80e746b9a6c80b1181cd6ca0.jpg\", \"/images/movie/2023/07/08/c62af834ee5c49d29b9d7e17a0133d64.jpg\", \"/images/movie/2023/07/08/9c7b4cff4fa8438393df319c6d58a195.jpg\"]', 0);
INSERT INTO `sys_movie` VALUES (3, '长安三万里', 120, '[\"/images/movie/2023/07/08/a284e9179d954164b15448ef25277df3.jpg\"]', '中国大陆', '2023-07-07 12:25:31', 0.00, '安史之乱爆发后数年，吐蕃大军攻打西南。大唐节度使高适交战不利，长安岌岌可危。困守孤城的高适向监军太监回忆起自己与李白的一生往事。', '[\"/images/movie/2023/07/08/51bec9afe30045f78d456dd27f50f6db.jpg\", \"/images/movie/2023/07/08/f2d5f2baf63f4316b025a04d29cd2cbb.jpg\", \"/images/movie/2023/07/08/b93b27fa19214cc9b4a4c45876e1c866.jpg\", \"/images/movie/2023/07/08/559b24d427a2427885424af59dce96c9.jpg\", \"/images/movie/2023/07/08/4a13f8fac2e54728bd8050a890c2b3fe.jpg\"]', 0);
INSERT INTO `sys_movie` VALUES (4, '扫毒3：人在天涯', 120, '[\"/images/movie/2023/07/08/bbaadec5d93e4c9ca5f7b69592833c51.jpg\"]', '中国大陆', '2023-07-08 12:25:35', 0.00, '邱礼涛继《扫毒2》《拆弹专家2》后携《扫毒3：人在天涯》强势回归，古天乐郭富城刘青云三大影帝首次同台飙戏荡平金三角！毒枭康素差（刘青云 饰）和手下张建行（郭富城 饰）、欧志远（古天乐 饰）因一次意外有了过命交情，三人情同手足。康素差被香港警方通缉后带领团队逃到金三角发展，却意外发现身边藏有卧底。曾经的生死兄弟如今分崩离析，敌友难辨，何去何从……', '[\"/images/movie/2023/07/08/5f4fe51072604f4f8462b4ec48099949.jpg\", \"/images/movie/2023/07/08/a1fd14630e0d448ba64fba9a9041fbba.jpg\", \"/images/movie/2023/07/08/6126fc55631047a3b07d27ad4e71372c.jpg\", \"/images/movie/2023/07/08/bbf4b074d6f649508d25f798bc2ff8bc.jpg\", \"/images/movie/2023/07/08/e79f8b5cc069451ca305ffc39597524c.jpg\"]', 0);
INSERT INTO `sys_movie` VALUES (5, '封神第一部', 120, '[\"/images/movie/2023/07/08/0e21bc454f54498193bf8d49a84941f0.jpg\"]', '中国大陆', '2023-07-07 12:25:41', 0.00, '中国国民神话史诗大片，震撼视效燃炸暑期！《封神第一部》讲述商王殷寿勾结狐妖妲己，暴虐无道，引发天谴。昆仑仙人姜子牙携“封神榜”下山，寻找天下共主，以救苍生。西伯侯之子姬发逐渐发现殷寿的本来面目，反出朝歌。各方势力暗流涌动，风云变幻端倪初显……三千年想象成真，恢弘史诗再创新，见证中国神话崛起！', '[\"/images/movie/2023/07/08/57c6d183aa94440fb1ba794c6a38deae.jpg\", \"/images/movie/2023/07/08/2d049461480946478e34524fc96a3b16.jpg\", \"/images/movie/2023/07/08/f1c5db2c9ed44e419736713ec46f741c.jpg\", \"/images/movie/2023/07/08/5c4f08c6670a4a0f95f34a8ba1b25c7c.jpg\", \"/images/movie/2023/07/08/7bffc009cb3c4ba2a93c37c7ad0de204.jpg\"]', 0);
INSERT INTO `sys_movie` VALUES (6, '我爱你！', 120, '[\"/images/movie/2023/07/08/fe5caaf26e54486089581917d79fcbaf.jpg\"]', '中国大陆', '2023-07-07 12:25:46', 0.00, '影帝影后绝赞演技，年度爱情片神作，带你领悟爱情真谛。你是否想过自己会如何老去？四个花甲老人，两段迟暮之恋，他们的爱善良而纯粹、浪漫又浓烈。在生命这段有限的旅程里，趁还来得及，我要对你说声“我爱你！”。', '[\"/images/movie/2023/07/08/5e54da8a222a43b7a8ea6b440a693a42.jpg\", \"/images/movie/2023/07/08/b3bc5af799354b18b77d0a402a0a0332.jpg\", \"/images/movie/2023/07/08/87ba4f68fae34520a2b664038564ba28.jpg\", \"/images/movie/2023/07/08/c111499f7068491bb3bbf99714ab1c61.jpg\", \"/images/movie/2023/07/08/d5116527077e4f30939eb58703a51460.jpg\"]', 0);
INSERT INTO `sys_movie` VALUES (7, ' 变形金刚：超能勇士崛起', 130, '[\"/images/movie/2023/07/08/e04f06dc02b84d38bc4d1ba2b39add0d.jpg\"]', '美国', '2023-07-07 12:25:49', 0.00, '2023年顶级大银幕视觉盛宴来袭！时隔5年，变形金刚震撼归来！故事重返上世纪90年代，终极反派宇宙大帝从天而降，驱使以天灾为首的恐惧兽掀起地球危机。绝境之中，蛰伏许久的巨无霸终觉醒，联合汽车人变形出发！一场前所未有的史诗决战即将上演！', '[\"/images/movie/2023/07/08/abd8b63064cb41babbb8d9c1608daebb.jpg\", \"/images/movie/2023/07/08/67e51c6e84bd49efa0abbd6d7262a7cd.jpg\", \"/images/movie/2023/07/08/d6eb9956a31942bebac3ef8f3e65f1fe.jpg\", \"/images/movie/2023/07/08/f0ee1b5dc1a446cba6f90b577f3fa203.jpg\", \"/images/movie/2023/07/08/a9dc4522a74f4441b941b6c72442bcb5.jpg\"]', 0);
INSERT INTO `sys_movie` VALUES (8, '超级飞侠：乐迪加速', 140, '[\"/images/movie/2023/07/08/c940dfecf0fc4ced810c8107f0182f02.png\"]', '中国大陆', '2023-07-08 12:25:56', 0.00, '超级飞侠乐迪接到一项新任务！一个神秘的包裹，一次跨越大洲的派送，乐迪却因此偶然介入了一场将世界陷于危机的恶作剧中。面对危机，乐迪和其他超级飞侠将发挥各自的救援能力，争分夺秒合力拯救世界！', '[\"/images/movie/2023/07/08/5bf5afbdf78e49058917e3e810e06f53.jpg\", \"/images/movie/2023/07/08/ba022fa6124b42d89869ca020473eaa9.jpg\", \"/images/movie/2023/07/08/6f176713bb784aa5a37940b9d76a3699.jpg\", \"/images/movie/2023/07/08/12224d79b05743e894d95f94fa16b63c.jpg\", \"/images/movie/2023/07/08/b73b804fc0cd4c4fbe4e13eae13f5203.jpg\"]', 0);
INSERT INTO `sys_movie` VALUES (9, '荒野咖啡馆', 140, '[\"/images/movie/2023/07/08/56439786da7548c188e785da3e9f636b.jpg\"]', '中国大陆', '2029-11-02 00:02:00', 0.00, '在中国西部一座工业小城里，以寒远芳、大梨、小安为代表的年轻人，心中充满了对“远方”的幻想和执着，电影将以冷静沉着的笔调，勾勒寂寞小镇里平凡少年与少女的躁动与不安。有人在不甘中沉沦，也有人在冲动之下勇敢迈出了求变的步伐。青春的力量裹挟着人们，在时代的大背景下，奔赴梦想。据主创介绍，影片的整体风格将在真实性与形式感之间寻求一种完美的平衡，以映衬现实的残酷和青春的美好。', '[\"/images/movie/2023/07/08/08cbbda0dce14d26a7827803df275b88.jpg\", \"/images/movie/2023/07/08/78a24b55bdf047e2a3a9737a8650eec2.jpg\", \"/images/movie/2023/07/08/05dc8e859d464d4eab415398abe29e7d.jpg\", \"/images/movie/2023/07/08/62a548a7529a4231bcd97150e251868a.jpg\", \"/images/movie/2023/07/08/175aa5b46b8245c4af7d8ed6ebc9da0e.jpg\"]', 0);
INSERT INTO `sys_movie` VALUES (10, '战狼', 200, '[\"/images/movie/2023/07/08/690577aa9fdf4fde81bfbb61d487eb91.jpg\"]', '中国大陆', '2029-10-15 00:00:00', 0.00, '痞性十足的冷锋 （ 吴京 饰）屡屡惹祸，有人说他是 流氓，是 痞子， 也有人说他是 英雄，是传奇，在一次行动中冷锋违抗军令打死了恐怖分子，要被开除出队，却意外得到了神秘部队战狼的接纳，但本想换个地方继续惹祸的他却跳进了另外一个深渊，冷傲的战狼副队长，擦出暧昧火花的性感女队长 （ 余男 饰），心计颇深腹黑的毒枭，枉死的队友， 雇佣兵跨过边境线入侵中国，一切都使他陷入了麻烦中。一切都在考验这个团队的毒瘤冷锋，他不知该何去何从。', '[\"/images/movie/2023/07/08/22503c98b340436580cf12b154d8ae29.jpg\", \"/images/movie/2023/07/08/38ed7dfa541341bcbbcabd097ffb2598.jpg\", \"/images/movie/2023/07/08/f3fb556653f841d980c31057d0e2608b.jpg\", \"/images/movie/2023/07/08/272661536e044168befb799e85a6b934.jpg\", \"/images/movie/2023/07/08/60c7d1baf2a74239bad393c39767adff.jpg\"]', 0);
INSERT INTO `sys_movie` VALUES (11, '舞者', 100, '[\"/images/movie/2023/07/08/2edebbc29c4c4b8491d45cd85bbfd49d.jpg\"]', '中国大陆', '2029-05-21 00:00:00', 0.00, '小学六年级的学生夏思梦自幼热爱舞蹈，心中一直藏着一个舞蹈家的梦想，她有着良好的舞蹈基础，却从来不在人前跳舞，只有当她在独处之时，她才会随着潺潺溪流，在风中翩翩起舞……', '[\"/images/movie/2023/07/08/383abfce44934bbcb6441715979ca079.jpeg\", \"/images/movie/2023/07/08/49f7835cda2949b4b1ab93070ac95a15.jpeg\", \"/images/movie/2023/07/08/381d7593694d4952b62a003b7f8ef425.jpeg\", \"/images/movie/2023/07/08/3ce7ec91b3c14c398e7595ff7fc435cf.jpeg\", \"/images/movie/2023/07/08/553600afb5114f358ab825c1fc4644aa.jpeg\"]', 0);
INSERT INTO `sys_movie` VALUES (12, '碟中谍7：致命清算（上）', 140, '[\"/images/movie/2023/07/08/736dcfa997ed4712ac3ed94dfd49c234.jpg\"]', '美国', '2029-10-24 00:00:00', 0.00, '刷新极限的传奇特工系列火线回归，感受今夏最真实震撼的银幕冒险！特工伊森·亨特（汤姆·克鲁斯饰）和他的IMF小组将开启迄今为止最危险的一次任务：追踪一种会危及全人类性命的新型武器，并阻止其落入坏人之手。与此同时，伊森曾对抗过的黑暗势力也正在卷土重来，整个世界的命运岌岌可危。面对神秘而强大的敌人，他不得不面对选择使命还是至爱的终极抉择。', '[\"/images/movie/2023/07/08/99096ff662db40cf944399639dd5c431.jpg\", \"/images/movie/2023/07/08/e60f6a7a52f2466281fdf213687e0413.jpg\", \"/images/movie/2023/07/08/2bc813e9e2f74b5489cb5d165ceb351d.jpg\", \"/images/movie/2023/07/08/4b28a354249b46a19aee33da8b7e6977.jpg\", \"/images/movie/2023/07/08/b9d414ccd4ee4078bd206f67a297efbd.jpg\"]', 0);

-- ----------------------------
-- Table structure for sys_movie_category
-- ----------------------------
DROP TABLE IF EXISTS `sys_movie_category`;
CREATE TABLE `sys_movie_category`  (
  `movie_category_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '电影类别编号',
  `movie_category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电影类别名称',
  PRIMARY KEY (`movie_category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_movie_category
-- ----------------------------
INSERT INTO `sys_movie_category` VALUES (1, '爱情');
INSERT INTO `sys_movie_category` VALUES (2, '喜剧');
INSERT INTO `sys_movie_category` VALUES (3, '动画');
INSERT INTO `sys_movie_category` VALUES (4, '剧情');
INSERT INTO `sys_movie_category` VALUES (5, '恐怖');
INSERT INTO `sys_movie_category` VALUES (6, '动作');
INSERT INTO `sys_movie_category` VALUES (7, '科幻');
INSERT INTO `sys_movie_category` VALUES (8, '悬疑');
INSERT INTO `sys_movie_category` VALUES (9, '惊悚');
INSERT INTO `sys_movie_category` VALUES (10, '犯罪');
INSERT INTO `sys_movie_category` VALUES (11, '冒险');
INSERT INTO `sys_movie_category` VALUES (12, '战争');
INSERT INTO `sys_movie_category` VALUES (13, '奇幻');
INSERT INTO `sys_movie_category` VALUES (14, '运动');
INSERT INTO `sys_movie_category` VALUES (15, '家庭');
INSERT INTO `sys_movie_category` VALUES (16, '古装');
INSERT INTO `sys_movie_category` VALUES (17, '武侠');
INSERT INTO `sys_movie_category` VALUES (18, '西部');
INSERT INTO `sys_movie_category` VALUES (19, '历史');
INSERT INTO `sys_movie_category` VALUES (20, '传记');
INSERT INTO `sys_movie_category` VALUES (21, '歌舞');
INSERT INTO `sys_movie_category` VALUES (22, '黑色电影');
INSERT INTO `sys_movie_category` VALUES (23, '短片');
INSERT INTO `sys_movie_category` VALUES (24, '纪录片');
INSERT INTO `sys_movie_category` VALUES (25, '其他');
INSERT INTO `sys_movie_category` VALUES (26, '历史');

-- ----------------------------
-- Table structure for sys_movie_to_category
-- ----------------------------
DROP TABLE IF EXISTS `sys_movie_to_category`;
CREATE TABLE `sys_movie_to_category`  (
  `movie_id` bigint(0) UNSIGNED NOT NULL COMMENT '电影编号',
  `movie_category_id` bigint(0) UNSIGNED NOT NULL COMMENT '电影类别编号',
  PRIMARY KEY (`movie_id`, `movie_category_id`) USING BTREE,
  INDEX `movie_category_id`(`movie_category_id`) USING BTREE,
  CONSTRAINT `sys_movie_to_category_ibfk_1` FOREIGN KEY (`movie_category_id`) REFERENCES `sys_movie_category` (`movie_category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_movie_to_category
-- ----------------------------
INSERT INTO `sys_movie_to_category` VALUES (1, 1);
INSERT INTO `sys_movie_to_category` VALUES (3, 1);
INSERT INTO `sys_movie_to_category` VALUES (4, 1);
INSERT INTO `sys_movie_to_category` VALUES (20, 1);
INSERT INTO `sys_movie_to_category` VALUES (23, 1);
INSERT INTO `sys_movie_to_category` VALUES (31, 1);
INSERT INTO `sys_movie_to_category` VALUES (1, 2);
INSERT INTO `sys_movie_to_category` VALUES (8, 2);
INSERT INTO `sys_movie_to_category` VALUES (9, 2);
INSERT INTO `sys_movie_to_category` VALUES (12, 2);
INSERT INTO `sys_movie_to_category` VALUES (16, 2);
INSERT INTO `sys_movie_to_category` VALUES (18, 2);
INSERT INTO `sys_movie_to_category` VALUES (20, 2);
INSERT INTO `sys_movie_to_category` VALUES (31, 2);
INSERT INTO `sys_movie_to_category` VALUES (1, 3);
INSERT INTO `sys_movie_to_category` VALUES (4, 3);
INSERT INTO `sys_movie_to_category` VALUES (5, 3);
INSERT INTO `sys_movie_to_category` VALUES (15, 3);
INSERT INTO `sys_movie_to_category` VALUES (16, 3);
INSERT INTO `sys_movie_to_category` VALUES (17, 3);
INSERT INTO `sys_movie_to_category` VALUES (20, 3);
INSERT INTO `sys_movie_to_category` VALUES (23, 3);
INSERT INTO `sys_movie_to_category` VALUES (31, 3);
INSERT INTO `sys_movie_to_category` VALUES (1, 4);
INSERT INTO `sys_movie_to_category` VALUES (2, 4);
INSERT INTO `sys_movie_to_category` VALUES (5, 4);
INSERT INTO `sys_movie_to_category` VALUES (9, 4);
INSERT INTO `sys_movie_to_category` VALUES (17, 4);
INSERT INTO `sys_movie_to_category` VALUES (19, 4);
INSERT INTO `sys_movie_to_category` VALUES (10, 5);
INSERT INTO `sys_movie_to_category` VALUES (3, 6);
INSERT INTO `sys_movie_to_category` VALUES (8, 6);
INSERT INTO `sys_movie_to_category` VALUES (10, 6);
INSERT INTO `sys_movie_to_category` VALUES (11, 6);
INSERT INTO `sys_movie_to_category` VALUES (14, 6);
INSERT INTO `sys_movie_to_category` VALUES (15, 6);
INSERT INTO `sys_movie_to_category` VALUES (16, 6);
INSERT INTO `sys_movie_to_category` VALUES (18, 6);
INSERT INTO `sys_movie_to_category` VALUES (6, 7);
INSERT INTO `sys_movie_to_category` VALUES (11, 7);
INSERT INTO `sys_movie_to_category` VALUES (18, 7);
INSERT INTO `sys_movie_to_category` VALUES (2, 8);
INSERT INTO `sys_movie_to_category` VALUES (4, 8);
INSERT INTO `sys_movie_to_category` VALUES (20, 8);
INSERT INTO `sys_movie_to_category` VALUES (2, 9);
INSERT INTO `sys_movie_to_category` VALUES (20, 9);
INSERT INTO `sys_movie_to_category` VALUES (8, 10);
INSERT INTO `sys_movie_to_category` VALUES (14, 10);
INSERT INTO `sys_movie_to_category` VALUES (16, 10);
INSERT INTO `sys_movie_to_category` VALUES (20, 10);
INSERT INTO `sys_movie_to_category` VALUES (7, 11);
INSERT INTO `sys_movie_to_category` VALUES (14, 11);
INSERT INTO `sys_movie_to_category` VALUES (5, 13);
INSERT INTO `sys_movie_to_category` VALUES (6, 13);
INSERT INTO `sys_movie_to_category` VALUES (7, 14);
INSERT INTO `sys_movie_to_category` VALUES (12, 15);
INSERT INTO `sys_movie_to_category` VALUES (6, 19);
INSERT INTO `sys_movie_to_category` VALUES (13, 23);
INSERT INTO `sys_movie_to_category` VALUES (13, 24);

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource`  (
  `resource_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '资源编号',
  `resource_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单路径，用于保存页面地址',
  `level` int(0) UNSIGNED NOT NULL DEFAULT 1 COMMENT '资源权限等级,1表示该资源为最高级权限',
  `parent_id` bigint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '当前菜单父菜单编号',
  PRIMARY KEY (`resource_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 623 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
INSERT INTO `sys_resource` VALUES (1, '影院信息', 'cinema', 1, 0);
INSERT INTO `sys_resource` VALUES (2, '影片管理', 'movie', 1, 0);
INSERT INTO `sys_resource` VALUES (3, '影厅管理', 'room', 1, 0);
INSERT INTO `sys_resource` VALUES (4, '订单管理', 'order', 1, 0);
INSERT INTO `sys_resource` VALUES (5, '用户管理', 'user', 1, 0);
INSERT INTO `sys_resource` VALUES (6, '角色权限管理', 'permission', 1, 0);
INSERT INTO `sys_resource` VALUES (11, '影院信息管理', 'cinema', 2, 1);
INSERT INTO `sys_resource` VALUES (21, '电影信息管理', 'movie', 2, 2);
INSERT INTO `sys_resource` VALUES (22, '电影类别管理', 'movieCategory', 2, 2);
INSERT INTO `sys_resource` VALUES (31, '影厅信息管理', 'hall', 2, 3);
INSERT INTO `sys_resource` VALUES (32, '场次信息管理', 'session', 2, 3);
INSERT INTO `sys_resource` VALUES (41, '订单信息管理', 'bill', 2, 4);
INSERT INTO `sys_resource` VALUES (51, '用户信息管理', 'user', 2, 5);
INSERT INTO `sys_resource` VALUES (61, '角色信息管理', 'role', 2, 6);
INSERT INTO `sys_resource` VALUES (62, '权限信息管理', 'resource', 2, 6);
INSERT INTO `sys_resource` VALUES (111, '查询影院信息权限', '', 3, 11);
INSERT INTO `sys_resource` VALUES (112, '修改影院信息权限', '', 3, 11);
INSERT INTO `sys_resource` VALUES (211, '查询电影信息权限', '', 3, 21);
INSERT INTO `sys_resource` VALUES (212, '修改电影信息权限', '', 3, 21);
INSERT INTO `sys_resource` VALUES (221, '查询电影类别权限', '', 3, 22);
INSERT INTO `sys_resource` VALUES (222, '修改电影类别权限', '', 3, 22);
INSERT INTO `sys_resource` VALUES (311, '查询影厅信息权限', '', 3, 31);
INSERT INTO `sys_resource` VALUES (312, '修改影厅信息权限', '', 3, 31);
INSERT INTO `sys_resource` VALUES (321, '查询场次信息权限', '', 3, 32);
INSERT INTO `sys_resource` VALUES (322, '修改场次信息权限', '', 3, 32);
INSERT INTO `sys_resource` VALUES (411, '查询订单信息权限', '', 3, 41);
INSERT INTO `sys_resource` VALUES (412, '修改订单信息权限', '', 3, 41);
INSERT INTO `sys_resource` VALUES (511, '查询用户信息权限', '', 3, 51);
INSERT INTO `sys_resource` VALUES (512, '修改用户信息权限', '', 3, 51);
INSERT INTO `sys_resource` VALUES (611, '查询角色信息权限', '', 3, 61);
INSERT INTO `sys_resource` VALUES (612, '修改角色信息权限', '', 3, 61);
INSERT INTO `sys_resource` VALUES (621, '查询资源信息权限', '', 3, 62);
INSERT INTO `sys_resource` VALUES (622, '修改资源信息权限', '', 3, 62);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色描述',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '系统管理员', '管理整个影院在线售票系统');
INSERT INTO `sys_role` VALUES (2, '用户', '用户，仅能使用前台浏览相关信息、下单、修改个人信息等功能');

-- ----------------------------
-- Table structure for sys_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resource`;
CREATE TABLE `sys_role_resource`  (
  `role_id` bigint(0) UNSIGNED NOT NULL COMMENT '角色编号',
  `resource_id` bigint(0) UNSIGNED NOT NULL COMMENT '资源编号，只以3级权限作为权限判断的依据',
  PRIMARY KEY (`role_id`, `resource_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_resource
-- ----------------------------
INSERT INTO `sys_role_resource` VALUES (1, 111);
INSERT INTO `sys_role_resource` VALUES (1, 112);
INSERT INTO `sys_role_resource` VALUES (1, 211);
INSERT INTO `sys_role_resource` VALUES (1, 212);
INSERT INTO `sys_role_resource` VALUES (1, 221);
INSERT INTO `sys_role_resource` VALUES (1, 222);
INSERT INTO `sys_role_resource` VALUES (1, 311);
INSERT INTO `sys_role_resource` VALUES (1, 312);
INSERT INTO `sys_role_resource` VALUES (1, 321);
INSERT INTO `sys_role_resource` VALUES (1, 322);
INSERT INTO `sys_role_resource` VALUES (1, 411);
INSERT INTO `sys_role_resource` VALUES (1, 412);
INSERT INTO `sys_role_resource` VALUES (1, 511);
INSERT INTO `sys_role_resource` VALUES (1, 512);
INSERT INTO `sys_role_resource` VALUES (1, 611);
INSERT INTO `sys_role_resource` VALUES (1, 612);
INSERT INTO `sys_role_resource` VALUES (1, 621);
INSERT INTO `sys_role_resource` VALUES (1, 622);
INSERT INTO `sys_role_resource` VALUES (2, 211);
INSERT INTO `sys_role_resource` VALUES (2, 221);
INSERT INTO `sys_role_resource` VALUES (2, 231);
INSERT INTO `sys_role_resource` VALUES (2, 241);
INSERT INTO `sys_role_resource` VALUES (2, 251);
INSERT INTO `sys_role_resource` VALUES (2, 261);
INSERT INTO `sys_role_resource` VALUES (2, 311);
INSERT INTO `sys_role_resource` VALUES (2, 312);
INSERT INTO `sys_role_resource` VALUES (2, 321);
INSERT INTO `sys_role_resource` VALUES (2, 411);
INSERT INTO `sys_role_resource` VALUES (2, 412);
INSERT INTO `sys_role_resource` VALUES (2, 511);
INSERT INTO `sys_role_resource` VALUES (2, 621);
INSERT INTO `sys_role_resource` VALUES (10, 621);
INSERT INTO `sys_role_resource` VALUES (10, 622);

-- ----------------------------
-- Table structure for sys_session
-- ----------------------------
DROP TABLE IF EXISTS `sys_session`;
CREATE TABLE `sys_session`  (
  `session_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '场次编号',
  `hall_id` bigint(0) UNSIGNED NOT NULL COMMENT '影厅编号',
  `language_version` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '语言版本',
  `movie_id` bigint(0) UNSIGNED NOT NULL COMMENT '电影编号',
  `play_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '播放时间',
  `end_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '散场时间',
  `deadline` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '检测到的截止时间，没过这个时间不能删电影、影厅信息',
  `session_date` date NOT NULL COMMENT '场次日期',
  `session_price` decimal(10, 2) NOT NULL COMMENT '票价',
  `session_tips` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '影厅提示(如是否需要戴口罩，有什么福利，显示在选座购票位置的影厅后边，格式类似：6号Barco厅-（戴口罩勿饮食）凭票领券免费停车3小时)',
  `session_seats` varchar(1600) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '座位信息，采用{key: [], key: []}存储每一个座位的状态，其中key表示排，数组(下标+1)表示几号座，存储的值为0表示可选，1表示空(无座位)，值为2表示已选择，值为3表示已售出，',
  `seat_nums` smallint(0) UNSIGNED NULL DEFAULT 0 COMMENT '总座位数',
  `sall_nums` smallint(0) NOT NULL DEFAULT 0 COMMENT '售出座位数',
  `del_state` tinyint(0) NOT NULL DEFAULT 0 COMMENT '删除标记，0未删除，1删除，默认0',
  PRIMARY KEY (`session_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_session
-- ----------------------------
INSERT INTO `sys_session` VALUES (1, 1, '国语', 1, '12:26', '14:26', '2023-07-08 14:46:00', '2023-07-08', 38.00, '独家首映', '{\"1\": [0, 0, 3, 3, 3, 3, 3, 0, 0, 0], \"2\": [0, 0, 0, 0, 0, 0, 0, 0, 3, 3], \"3\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"4\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"5\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"6\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"7\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"8\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"9\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"10\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]}', 100, 7, 0);
INSERT INTO `sys_session` VALUES (2, 3, '国语', 2, '12:32', '14:32', '2023-07-08 14:52:00', '2023-07-08', 40.00, NULL, '{\"1\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"2\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"3\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"4\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"5\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"6\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"7\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"8\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"9\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"10\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]}', 100, 0, 0);
INSERT INTO `sys_session` VALUES (3, 4, '英语', 7, '12:32', '14:42', '2023-07-07 15:02:00', '2023-07-07', 35.00, NULL, '{\"1\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"2\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"3\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"4\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"5\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"6\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"7\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"8\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"9\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"10\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"11\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"12\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"13\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"14\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"15\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"16\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"17\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"18\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"19\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"20\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]}', 400, 0, 0);
INSERT INTO `sys_session` VALUES (4, 5, '国语', 4, '12:32', '14:32', '2023-07-08 14:52:00', '2023-07-08', 50.00, NULL, '{\"1\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"2\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"3\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"4\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"5\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"6\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"7\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"8\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"9\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"10\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"11\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"12\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"13\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"14\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"15\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"16\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"17\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"18\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"19\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"20\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]}', 400, 0, 0);
INSERT INTO `sys_session` VALUES (5, 3, '国语', 6, '14:25', '16:25', '2023-07-07 16:45:00', '2023-07-07', 60.00, NULL, '{\"1\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"2\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"3\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"4\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"5\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"6\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"7\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"8\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"9\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"10\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]}', 100, 0, 0);
INSERT INTO `sys_session` VALUES (6, 3, '英语', 12, '14:25', '16:45', '2029-12-05 17:05:00', '2029-12-05', 70.00, NULL, '{\"1\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"2\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"3\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"4\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"5\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"6\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"7\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"8\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"9\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"10\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]}', 100, 0, 0);
INSERT INTO `sys_session` VALUES (7, 2, '国语', 1, '14:25', '16:25', '2029-05-07 16:45:00', '2029-05-07', 60.00, NULL, '{\"1\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"2\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"3\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"4\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"5\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"6\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"7\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"8\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"9\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"10\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]}', 100, 0, 0);
INSERT INTO `sys_session` VALUES (8, 4, '国语', 2, '14:25', '16:25', '2029-12-29 16:45:00', '2029-12-29', 40.00, NULL, '{\"1\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"2\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"3\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"4\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"5\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"6\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"7\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"8\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"9\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"10\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"11\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"12\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"13\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"14\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"15\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"16\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"17\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"18\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"19\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"20\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]}', 400, 0, 0);
INSERT INTO `sys_session` VALUES (9, 3, '英语', 7, '14:25', '16:35', '2029-12-04 16:55:00', '2029-12-04', 80.00, NULL, '{\"1\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"2\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"3\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"4\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"5\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"6\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"7\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"8\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"9\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"10\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]}', 100, 0, 0);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名称(用于登录，添加时验证唯一性)',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码(密文存储)',
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盐',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户邮箱，记录个人信息和发送通知',
  `phone_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户电话号码，用于注册和发送通知',
  `sex` tinyint(0) UNSIGNED NOT NULL COMMENT '用户性别，1为男性0为女性',
  `user_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `role_id` bigint(0) UNSIGNED NOT NULL DEFAULT 3 COMMENT '角色编号',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `autograph` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个性签名',
  `del_state` tinyint(0) NOT NULL DEFAULT 0 COMMENT '删除标记，0未删除，1删除，默认0',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '2f6b5c3044b271f5c07545aa862cf35c', '0v#C4w&i', '17777744455@qq.com', '13111212312', 1, '[\"/images/user/2021/05/19/2b1e80fb2b4746aa8fd21feab6088679.png\"]', 1, '1999-10-15', '爱拼才会赢123', 0);
INSERT INTO `sys_user` VALUES (2, 'user', 'de24bcd64d58e024b252268641a672de', 'DIm1GWgN', '123@qq.com', '13333333333', 1, '[\"/images/user/2023/07/08/b7d88e8b54d84818826f1c1f87de835e.jpg\"]', 3, '2023-07-12', NULL, 0);

SET FOREIGN_KEY_CHECKS = 1;
