/*
 Navicat Premium Data Transfer

 Source Server         : Vue_admin
 Source Server Type    : MySQL
 Source Server Version : 50719 (5.7.19)
 Source Host           : localhost:3307
 Source Schema         : vue_admin

 Target Server Type    : MySQL
 Target Server Version : 50719 (5.7.19)
 File Encoding         : 65001

 Date: 17/03/2024 13:50:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dict
-- ----------------------------
DROP TABLE IF EXISTS `dict`;
CREATE TABLE `dict`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型字符',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dict
-- ----------------------------
INSERT INTO `dict` VALUES (1, '字典1', 'type1', '第一', '2023-05-25 10:29:01', '2023-03-27 17:35:34');
INSERT INTO `dict` VALUES (2, '字典2', 'type2', '第二1', '2023-05-26 10:31:51', '2023-03-30 14:36:52');

-- ----------------------------
-- Table structure for dict_item
-- ----------------------------
DROP TABLE IF EXISTS `dict_item`;
CREATE TABLE `dict_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `dict_id` int(255) NULL DEFAULT NULL COMMENT '字典父级id',
  `dict_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '标签',
  `dict_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '值',
  `dict_sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  `dict_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '样式',
  `status` int(11) NULL DEFAULT 1 COMMENT '状态',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dict_item
-- ----------------------------

-- ----------------------------
-- Table structure for ditor
-- ----------------------------
DROP TABLE IF EXISTS `ditor`;
CREATE TABLE `ditor`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `val` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '富文本值',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ditor
-- ----------------------------
INSERT INTO `ditor` VALUES (1, '<h2 style=\"text-align: left;\">一、项目预览地址</h2><ul><li style=\"text-align: left;\">vue+node后台管理预览地址：点击进入效果预览</li><li style=\"text-align: left;\">默认账号：admin</li><li style=\"text-align: left;\">默认密码：666666</li></ul><h2 style=\"text-align: left;\">二、交流群、问题解答入口</h2><ul><li style=\"text-align: left;\">点击加入 问题解答交流社区</li></ul><h2 style=\"text-align: left;\">三、项目启动</h2><ul><li style=\"text-align: left;\">前端页面启动</li></ul><ol><li style=\"text-align: left;\">#克隆项目git https://gitee.com/MMinter/vue_node.git</li><li style=\"text-align: left;\">#进入目录cd item</li><li style=\"text-align: left;\">#安装依赖（建议使用node版本16以下 10以上）npm install</li><li style=\"text-align: left;\">#启动项目npm run dev</li></ol><ul><li style=\"text-align: left;\">数据库导入</li></ul><ol><li style=\"text-align: left;\">#创建数据库创建数据库 名：vue_admin基字符集 选：默认（default） 或者 utf8排序规则 选：默认（default） 或者 utf8_general_ci</li><li style=\"text-align: left;\">#导入数据库将APP/数据库 文件夹的vue_admin.sql导入新建的vue_admin库中。</li><li style=\"text-align: left;\">#数据库配置信息//配置文件在APP/poo.js 中，请根据自身环境配置 const pool=mysql.createPool({ host:\"127.0.0.1\", port:3306,//端口 user:\"root\",//账户名 password:\"root\",//登录密码 database:\"vue_admin\",//数据库名称 connectionLimit:15 });</li></ol><ul><li style=\"text-align: left;\">后端服务启动</li></ul><ol><li style=\"text-align: left;\">#克隆项目（如果已经执行了前端页面启动的克隆，可略过这点）git clone https://gitee.com/MMinter/vue_node.git</li><li style=\"text-align: left;\">#进入目录cd APP</li><li style=\"text-align: left;\">#安装依赖npm install</li><li style=\"text-align: left;\">#启动服务npm run dev</li></ol><h2 style=\"text-align: left;\">四、功能简明</h2><ul><li style=\"text-align: left;\">前端功能 (点击进入前端功能详细文档)​ 动态路由 ​ 菜单管理 ​ 用户管理 ​ 角色管理 ​ 多账号管理 ​ 字典管理 ​ 主题自定义 ​ 菜单权限 ​ 角色权限</li><li style=\"text-align: left;\">后端功能 (点击进入后端功能详细文档)​ jsonwebtoken（token） ​ 菜单权限拦截 ​ 角色权限拦截 ​ 错误日志log`</li></ul><h2 style=\"text-align: left;\">五、效果截图</h2><p style=\"text-align: left;\"><img src=\"https://foruda.gitee.com/images/1681197680240561436/dfbf1881_8986810.png\" alt=\"登录\" data-href=\"\" style=\"width: 626.00px;height: 302.88px;\"></p><table style=\"width: auto; text-align: left;\"><tbody><tr><th colspan=\"1\" rowspan=\"1\" width=\"auto\"><img src=\"https://foruda.gitee.com/images/1681197937191145993/c434e92e_8986810.png\" alt=\"用户管理\" data-href=\"\" style=\"\"></th><th colspan=\"1\" rowspan=\"1\" width=\"auto\"><img src=\"https://foruda.gitee.com/images/1681263456631597583/3077263f_8986810.png\" alt=\"主题修改\" data-href=\"\" style=\"\"></th></tr><tr><td colspan=\"1\" rowspan=\"1\" width=\"auto\"><img src=\"https://foruda.gitee.com/images/1681197808163981644/96f27575_8986810.png\" alt=\"菜单管理\" data-href=\"\" style=\"\"></td><td colspan=\"1\" rowspan=\"1\" width=\"auto\"><img src=\"https://foruda.gitee.com/images/1681197825348384952/281da67c_8986810.png\" alt=\"菜单修改\" data-href=\"\" style=\"\"></td></tr><tr><td colspan=\"1\" rowspan=\"1\" width=\"auto\"><img src=\"https://foruda.gitee.com/images/1681197773630264222/4ec415e3_8986810.png\" alt=\"角色管理\" data-href=\"\" style=\"\"></td><td colspan=\"1\" rowspan=\"1\" width=\"auto\"><img src=\"https://foruda.gitee.com/images/1681197948454663203/788cbd7e_8986810.png\" alt=\"字典管理\" data-href=\"\" style=\"\"></td></tr></tbody></table><p><br></p>', '2023-06-21 14:31:25', '2023-06-21 14:25:45');

-- ----------------------------
-- Table structure for files
-- ----------------------------
DROP TABLE IF EXISTS `files`;
CREATE TABLE `files`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `val` varchar(6000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值',
  `type` int(11) NULL DEFAULT 1 COMMENT '判断1图片，2其他',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of files
-- ----------------------------
INSERT INTO `files` VALUES (1, '[{\"url\":\"http://127.0.0.1:3000/171048424707102548193264224745-preview.jpg\",\"name\":\"preview\",\"originalname\":\"preview.jpg\",\"filename\":\"171048424707102548193264224745-preview.jpg\"}]', 1, '2024-03-15 14:30:54', '2023-06-19 16:28:23');

-- ----------------------------
-- Table structure for more
-- ----------------------------
DROP TABLE IF EXISTS `more`;
CREATE TABLE `more`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '账号昵称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of more
-- ----------------------------
INSERT INTO `more` VALUES (8, '第二家店铺', '', '2023-06-16 15:42:24', '2023-04-06 15:44:53');
INSERT INTO `more` VALUES (5, '第一家店铺', '', '2023-06-16 15:42:26', '2023-04-06 15:44:53');

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remarks` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES (1, '水果类', '新鲜水果，适合生吃和加工', '2024-03-14 23:06:50', '2024-03-14 14:53:23', 1);
INSERT INTO `product_category` VALUES (2, '新鲜蔬菜', '富含维生素，适合做各种菜肴', '2024-03-14 23:07:26', '2024-03-14 14:53:23', 1);
INSERT INTO `product_category` VALUES (3, '畜牧产品', '人们日常重要食材，可直接食用或加工', '2024-03-14 23:07:07', '2024-03-14 14:53:23', 1);
INSERT INTO `product_category` VALUES (7, '粮食类', '适合制作食品和饲料', '2024-03-14 23:04:05', '2024-03-14 23:04:05', 1);
INSERT INTO `product_category` VALUES (8, '乳制产品', '制作奶酪、黄油等重要原料', '2024-03-14 23:04:47', '2024-03-14 23:04:47', 1);
INSERT INTO `product_category` VALUES (9, '茶叶类', '国传统饮品原料，有多种品种', '2024-03-14 23:06:31', '2024-03-14 23:06:31', 1);
INSERT INTO `product_category` VALUES (10, '油料类', '可榨油，也可作为零食食用', '2024-03-14 23:07:58', '2024-03-14 23:07:58', 1);

-- ----------------------------
-- Table structure for product_info
-- ----------------------------
DROP TABLE IF EXISTS `product_info`;
CREATE TABLE `product_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sellAmount` int(11) NULL DEFAULT NULL,
  `favorites` int(11) NULL DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `category_id` int(11) NULL DEFAULT NULL,
  `inventory` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE,
  CONSTRAINT `product_info_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_info
-- ----------------------------
INSERT INTO `product_info` VALUES (1, '苹果', 5.99, 'http://127.0.0.1:3000/171043229805407757575384034667-R-C (4).jpg', 1000, 500, '九江市', '2024-03-14 14:53:31', '2024-03-15 00:04:58', 1, 0);
INSERT INTO `product_info` VALUES (3, '牛肉', 12.99, 'http://127.0.0.1:3000/171043172734308719943107103705-R-C.jpg', 500, 200, '宜春市', '2024-03-14 14:53:31', '2024-03-14 23:55:28', 3, 0);
INSERT INTO `product_info` VALUES (4, '花生', 300.00, 'http://127.0.0.1:3000/1710431588717007514741513083179-1755.jpg_wh860.jpg', 10, 200, '九江市', '2024-03-14 23:53:10', '2024-03-14 23:53:10', 10, 3000);
INSERT INTO `product_info` VALUES (5, '大豆', 300.00, 'http://127.0.0.1:3000/171043179228004388531131536677-R-C (3).jpg', 10, 300, '九江市', '2024-03-14 23:56:34', '2024-03-14 23:56:34', 10, 3000);
INSERT INTO `product_info` VALUES (6, '龙井茶', 60.00, 'http://127.0.0.1:3000/1710431845890046791825847051527-0147af59127798b5b3086ed479bc00.jpg@1280w_1l_2o_100sh.jpg', 298, 100, '宜春市', '2024-03-14 23:57:26', '2024-03-14 23:57:26', 9, 200);
INSERT INTO `product_info` VALUES (7, '红茶', 100.00, 'http://127.0.0.1:3000/17104318758310928145159987656-0151b25c6687f0a801203d22554227.jpg@1280w_1l_2o_100sh.jpg', 98, 120, '九江市', '2024-03-14 23:57:57', '2024-03-14 23:57:57', 9, 200);
INSERT INTO `product_info` VALUES (8, '牛奶', 260.00, 'http://127.0.0.1:3000/171043198768607536068385229253-R-C (2).jpg', 5, 300, '宜春市', '2024-03-14 23:59:48', '2024-03-14 23:59:48', 8, 500);
INSERT INTO `product_info` VALUES (9, '奶酪', 120.00, 'http://127.0.0.1:3000/1710432020105008439114360264166-01869f5b990b46a8012099c86ea5a8.jpg@1280w_1l_2o_100sh.jpg', 16, 300, '南昌市', '2024-03-15 00:00:21', '2024-03-15 00:00:21', 8, 500);
INSERT INTO `product_info` VALUES (10, '猪肉', 150.00, 'http://127.0.0.1:3000/1710432063958006854102247829941-t01ed1cf8536f704c84.jpg', 10, 200, '九江市', '2024-03-15 00:01:05', '2024-03-15 00:01:05', 3, 300);
INSERT INTO `product_info` VALUES (11, '黄瓜', 110.00, 'http://127.0.0.1:3000/171043210397001814992625294396-t0174e6fb787ea68efa.jpg', 5, 123, '宜春市', '2024-03-15 00:01:44', '2024-03-15 00:01:44', 2, 300);
INSERT INTO `product_info` VALUES (12, '白菜', 200.00, 'http://127.0.0.1:3000/171043213669607746456832145003-31153231_223426345087_2.jpg', 4, 321, '九江市', '2024-03-15 00:02:17', '2024-03-15 00:02:17', 2, 400);
INSERT INTO `product_info` VALUES (13, '香蕉', 80.00, 'http://127.0.0.1:3000/171043218816505881192082144895-R-C (1).jpg', 5, 80, '宜春市', '2024-03-15 00:03:09', '2024-03-15 00:03:09', 1, 100);
INSERT INTO `product_info` VALUES (14, '玉米', 100.00, 'http://127.0.0.1:3000/171043222314503985522048432921-01d86a603f8e6311013ef90fcbd272.jpg@1280w_1l_2o_100sh.jpg', 7, 150, '九江市', '2024-03-15 00:03:45', '2024-03-15 00:03:45', 7, 300);
INSERT INTO `product_info` VALUES (15, '小麦', 1400.00, 'http://127.0.0.1:3000/171043225148702659779436037839-14e34a7449875913704887c775134415.jpg', 3, 2000, '宜春市', '2024-03-15 00:04:12', '2024-03-15 00:04:12', 7, 4000);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `roles` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '权限标识',
  `checked_roles` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '权限默认选中标识',
  `role_key` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '权限字符',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'admin', '8,9,10,2,5,11,17,1', '8,9,10,5,11,17', 'admin', NULL, '2023-04-06 15:39:40');
INSERT INTO `roles` VALUES (12, '中级管家2', '49,30,43,31,122,121,123,128,125,124,1,10,8,26,27,69,76,32,113,44,65,68', '49,43,31,32,68', 'middle', '2023-06-16 15:45:04', '2023-04-06 15:39:40');
INSERT INTO `roles` VALUES (13, '初级管家1', '30,43,31,122,121,123,125,124,1,10,8,26,27,69,76,32,113,44,65,66', '49,43,31,10,8,26,27,76,32,113,110,109,108,107,105,104,103,102,100,99,98,97,96,92,91,90,89,66,68', 'primary', '2023-06-16 15:45:11', '2023-04-06 15:39:40');

-- ----------------------------
-- Table structure for router_menu
-- ----------------------------
DROP TABLE IF EXISTS `router_menu`;
CREATE TABLE `router_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '父级id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '标题',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '图标',
  `no_cache` int(11) NULL DEFAULT 1 COMMENT '是否缓存',
  `meta` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '其他对象',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '/' COMMENT '路由地址',
  `hidden` tinyint(1) NOT NULL DEFAULT 0 COMMENT ' 当设置 true 的时候该路由不会在侧边栏出现 如401，login等页面',
  `redirect` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '当设置 noRedirect 的时候该路由在面包屑导航中不可被点击',
  `always_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '你可以设置 alwaysShow: true，这样它就会忽略之前定义的规则，一直显示根路由',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '设定路由的名字，一定要填写不然使用<keep-alive>时会出现各种问题',
  `layout` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否需要含导航栏，只需一级才设置这个（默认为false）',
  `parent_view` tinyint(1) NOT NULL DEFAULT 0 COMMENT '如果第二级里面还需要套级，需在当前级设置为true',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '/' COMMENT '对应的页面路径',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `alone` int(11) NOT NULL DEFAULT 0 COMMENT '是否独立的（一级）',
  `role_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '权限字符',
  `menu_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'C' COMMENT '菜单类型区分',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 135 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of router_menu
-- ----------------------------
INSERT INTO `router_menu` VALUES (1, 0, '系统设置', 'international', 1, '{}', '/menus', 0, '', 0, '', 1, 0, '/', 11, 0, '', 'M', '2023-06-15 14:48:47', '2023-05-26 11:11:07');
INSERT INTO `router_menu` VALUES (26, 1, '用户管理', 'user', 1, '{}', '/user', 0, '', 0, 'user', 0, 0, 'admin/user', 2, 0, '', 'C', '2023-04-10 09:40:38', '2023-05-26 11:11:07');
INSERT INTO `router_menu` VALUES (27, 1, '多账号管理', 'peoples', 1, '{}', '/more', 0, '', 0, 'more', 0, 0, 'admin/more', 3, 0, '', 'C', '2023-04-10 09:40:51', '2023-05-26 11:11:07');
INSERT INTO `router_menu` VALUES (49, 0, '图标', 'icon', 1, '{}', '/icon', 0, '', 0, 'Icon', 1, 0, 'icons/index', 0, 0, NULL, 'C', '2023-05-26 11:14:27', '2023-05-26 11:11:07');
INSERT INTO `router_menu` VALUES (8, 1, '角色管理', 'role', 1, '{}', '/role', 0, '', 0, 'Role', 0, 0, 'admin/role', 1, 0, '', 'C', '2023-05-25 11:20:21', '2023-05-26 11:11:07');
INSERT INTO `router_menu` VALUES (30, 0, '测试数据', 'bug', 1, '{}', '/test', 0, '', 0, '', 1, 0, '/', 0, 0, '', 'M', '2023-05-26 11:14:24', '2023-05-26 11:11:07');
INSERT INTO `router_menu` VALUES (10, 1, '菜单管理', 'list', 1, '{}', '/menu', 0, '', 0, 'Menu', 0, 0, 'admin/menu', 0, 0, '', 'C', '2023-05-26 11:14:37', '2023-05-26 11:11:07');
INSERT INTO `router_menu` VALUES (31, 30, '多账号测试', 'bug', 1, '{}', '/index', 0, '', 0, 'testMore', 0, 0, 'test/index', 1, 0, '', 'C', '2023-03-30 16:17:06', '2023-05-26 11:11:07');
INSERT INTO `router_menu` VALUES (134, 130, '商品详情', 'shopping', 0, '{}', '/product/goods', 0, '', 0, 'Goods', 0, 0, 'product/goods/index', 0, 0, NULL, 'C', '2024-03-14 19:16:55', '2024-03-14 14:44:11');
INSERT INTO `router_menu` VALUES (65, 44, '测试数据', 'eye', 1, '{}', '', 1, '', 0, '', 0, 0, '/', 0, 0, NULL, 'F', '2023-03-27 15:18:34', '2023-05-26 11:11:07');
INSERT INTO `router_menu` VALUES (44, 0, '菜单权限字符', 'eye', 1, '{}', '', 1, '', 0, '', 1, 0, '/', 100, 0, NULL, 'F', '2023-04-11 11:24:29', '2023-05-26 11:11:07');
INSERT INTO `router_menu` VALUES (66, 65, '权限测试1', 'form', 1, '{}', '', 1, '', 0, '', 0, 0, '/', 0, 0, 'roleKey2', 'F', '2023-06-07 16:44:24', '2023-05-26 11:11:07');
INSERT INTO `router_menu` VALUES (43, 30, '权限隐藏API测试', 'eye', 1, '{}', '/RoleApi', 0, '', 0, 'RoleApi', 0, 0, 'test/roleApi', 0, 0, '', 'C', '2023-03-15 15:52:16', '2023-05-26 11:11:07');
INSERT INTO `router_menu` VALUES (68, 65, '权限测试2', 'example', 1, '{}', '', 1, '', 0, '', 0, 0, '/', 1, 0, 'roleKey2', 'F', '2023-03-27 15:23:59', '2023-05-26 11:11:07');
INSERT INTO `router_menu` VALUES (69, 1, '字典管理', 'dashboard', 1, '{}', '/dict', 0, '', 0, 'Dict', 0, 0, 'admin/dict', 4, 0, NULL, 'C', '2023-03-30 16:58:47', '2023-05-26 11:11:07');
INSERT INTO `router_menu` VALUES (97, 95, '用户新增', 'user', 1, '{}', '/', 0, '', 0, '', 0, 0, '/', 0, 0, 'user_add', 'F', '2023-04-03 16:47:22', '2023-05-26 11:11:07');
INSERT INTO `router_menu` VALUES (85, 44, '系统设置', 'lock', 1, '{}', '/', 1, '', 0, '', 0, 0, '/', 0, 0, '', 'F', '2023-04-03 15:21:17', '2023-05-26 11:11:07');
INSERT INTO `router_menu` VALUES (88, 85, '菜单管理', 'documentation', 1, '{}', '/', 0, '', 0, '', 0, 0, '/', 0, 0, NULL, 'F', '2023-04-03 15:21:49', '2023-05-26 11:11:07');
INSERT INTO `router_menu` VALUES (89, 88, '菜单查询', 'example', 1, '{}', '/', 0, '', 0, '', 0, 0, '/', 0, 0, 'menu_query', 'F', '2023-04-03 15:22:46', '2023-05-26 11:11:07');
INSERT INTO `router_menu` VALUES (90, 88, '菜单新增', 'example', 1, '{}', '/', 0, '', 0, '', 0, 0, '/', 0, 0, 'menu_add', 'F', '2023-04-03 15:35:28', '2023-05-26 11:11:07');
INSERT INTO `router_menu` VALUES (91, 88, '菜单修改', 'example', 1, '{}', '/', 0, '', 0, '', 0, 0, '/', 0, 0, 'menu_up', 'F', '2023-04-03 15:36:06', '2023-05-26 11:11:07');
INSERT INTO `router_menu` VALUES (92, 88, '菜单删除', 'example', 1, '{}', '/', 0, '', 0, '', 0, 0, '/', 0, 0, 'menu_delete', 'F', '2023-04-03 15:36:19', '2023-05-26 11:11:07');
INSERT INTO `router_menu` VALUES (76, 69, '字典项目', 'form', 1, '{}', '/dictItem', 0, '', 0, 'DictItem', 0, 0, 'admin/dictItem', 0, 0, '', 'C', '2023-03-30 15:55:52', '2023-05-26 11:11:07');
INSERT INTO `router_menu` VALUES (95, 85, '用户管理', 'user', 1, '{}', '/', 0, '', 0, '', 0, 0, '/', 0, 0, NULL, 'F', '2023-04-03 16:46:18', '2023-05-26 11:11:07');
INSERT INTO `router_menu` VALUES (96, 95, '用户查询', 'user', 1, '{}', '/', 0, '', 0, '', 0, 0, '/', 0, 0, 'user_query', 'F', '2023-04-03 16:46:56', '2023-05-26 11:11:07');
INSERT INTO `router_menu` VALUES (98, 95, '用户修改', 'user', 1, '{}', '/', 0, '', 0, '', 0, 0, '/', 0, 0, 'user_up', 'F', '2023-04-03 16:52:31', '2023-05-26 11:11:07');
INSERT INTO `router_menu` VALUES (99, 95, '用户删除', 'user', 1, '{}', '/', 0, '', 0, '', 0, 0, '/', 0, 0, 'user_delete', 'F', '2023-04-03 16:52:47', '2023-05-26 11:11:07');
INSERT INTO `router_menu` VALUES (100, 95, '用户修改密码', 'eye', 1, '{}', '/', 0, '', 0, '', 0, 0, '/', 0, 0, 'user_pwd', 'F', '2023-04-03 16:56:33', '2023-05-26 11:11:07');
INSERT INTO `router_menu` VALUES (101, 85, '角色管理', 'peoples', 1, '{}', '/', 0, '', 0, '', 0, 0, '/', 0, 0, NULL, 'F', '2023-04-03 16:59:20', '2023-05-26 11:11:07');
INSERT INTO `router_menu` VALUES (102, 101, '角色查询', 'peoples', 1, '{}', '/', 0, '', 0, '', 0, 0, '/', 0, 0, 'role_query', 'F', '2023-04-03 16:59:33', '2023-05-26 11:11:07');
INSERT INTO `router_menu` VALUES (103, 101, '角色新增', 'peoples', 1, '{}', '/', 0, '', 0, '', 0, 0, '/', 0, 0, 'role_add', 'F', '2023-04-03 16:59:46', '2023-05-26 11:11:07');
INSERT INTO `router_menu` VALUES (104, 101, '角色修改', 'peoples', 1, '{}', '/', 0, '', 0, '', 0, 0, '/', 0, 0, 'role_up', 'F', '2023-04-03 17:00:04', '2023-05-26 11:11:07');
INSERT INTO `router_menu` VALUES (105, 101, '角色删除', 'peoples', 1, '{}', '/', 0, '', 0, '', 0, 0, '/', 0, 0, 'role_delete', 'F', '2023-04-03 17:00:24', '2023-05-26 11:11:07');
INSERT INTO `router_menu` VALUES (106, 85, '多账户管理', 'nested', 1, '{}', '/', 0, '', 0, '', 0, 0, '/', 0, 0, NULL, 'F', '2023-04-03 17:12:25', '2023-05-26 11:11:07');
INSERT INTO `router_menu` VALUES (107, 106, '多账户查询', 'people', 1, '{}', '/', 0, '', 0, '', 0, 0, '/', 0, 0, 'more_query', 'F', '2023-04-03 17:31:07', '2023-05-26 11:11:07');
INSERT INTO `router_menu` VALUES (108, 106, '多账户新增', 'people', 1, '{}', '/', 0, '', 0, '', 0, 0, '/', 0, 0, 'more_add', 'F', '2023-04-03 17:31:30', '2023-05-26 11:11:07');
INSERT INTO `router_menu` VALUES (109, 106, '多账户修改', 'people', 1, '{}', '/', 0, '', 0, '', 0, 0, '/', 0, 0, 'more_up', 'F', '2023-04-03 17:31:47', '2023-05-26 11:11:07');
INSERT INTO `router_menu` VALUES (110, 106, '多账户删除', 'people', 1, '{}', '/', 0, '', 0, '', 0, 0, '/', 0, 0, 'more_delete', 'F', '2023-04-03 17:32:07', '2023-05-26 11:11:07');
INSERT INTO `router_menu` VALUES (130, 0, '商品管理', 'tab', 1, '{}', '/product', 0, '', 0, '', 1, 0, '/', 2, 0, NULL, 'M', '2024-03-13 23:26:58', '2024-03-13 23:21:58');
INSERT INTO `router_menu` VALUES (121, 122, '上传图片', 'education', 1, '{}', '/img', 0, '', 0, 'Img', 0, 0, 'components/img', 0, 0, NULL, 'C', '2023-05-29 14:35:29', '2023-05-26 16:18:37');
INSERT INTO `router_menu` VALUES (122, 0, '文件管理', 'zip', 1, '{}', '/file', 0, '', 0, '', 1, 0, '/', 0, 0, NULL, 'M', NULL, '2023-05-29 14:35:16');
INSERT INTO `router_menu` VALUES (123, 122, '上传文件', 'zip', 1, '{}', '/file', 0, '', 0, 'File', 0, 0, 'components/file', 0, 0, NULL, 'C', NULL, '2023-05-30 15:13:26');
INSERT INTO `router_menu` VALUES (124, 0, '我的信息', 'user', 1, '{}', '/info', 0, '', 0, 'Info', 1, 0, 'admin/info', 0, 0, 'www1', 'C', '2024-03-13 23:27:38', '2023-05-31 15:09:24');
INSERT INTO `router_menu` VALUES (125, 0, '富文本编辑', 'form', 1, '{}', '/ditor', 0, '', 0, 'Ditor', 1, 0, 'components/ditor', 1, 0, NULL, 'C', '2023-06-15 14:38:54', '2023-06-02 10:00:59');
INSERT INTO `router_menu` VALUES (128, 0, '大屏展示', 'chart', 1, '{}', '/echart', 0, '', 0, 'Echart', 1, 0, 'components/echart', 0, 0, NULL, 'C', NULL, '2023-06-13 10:24:44');
INSERT INTO `router_menu` VALUES (132, 130, '商品分类', 'theme', 0, '{}', '/product/category', 0, '', 0, 'Category', 0, 0, 'product/category/index', 0, 0, NULL, 'C', '2024-03-13 23:27:15', '2024-03-13 23:26:36');

-- ----------------------------
-- Table structure for tests
-- ----------------------------
DROP TABLE IF EXISTS `tests`;
CREATE TABLE `tests`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `more_id` int(11) NULL DEFAULT NULL COMMENT '多账号编号',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tests
-- ----------------------------
INSERT INTO `tests` VALUES (72, '名称6', '备注6', 6, NULL, '2023-06-21 14:21:53');
INSERT INTO `tests` VALUES (71, '名称5', '备注5', 5, NULL, '2023-06-21 14:21:53');
INSERT INTO `tests` VALUES (70, '名称4', '备注4', 4, NULL, '2023-06-21 14:21:53');
INSERT INTO `tests` VALUES (69, '名称3', '备注3', 3, NULL, '2023-06-21 14:21:53');
INSERT INTO `tests` VALUES (68, '名称2', '备注2', 2, NULL, '2023-06-21 14:21:53');
INSERT INTO `tests` VALUES (67, '名称6', '备注6啊撒打发', 6, '2023-06-21 14:07:43', '2023-06-21 14:00:36');
INSERT INTO `tests` VALUES (66, '名称5', '备注5', 5, NULL, '2023-06-21 14:00:36');
INSERT INTO `tests` VALUES (65, '名称4', '备注4', 4, NULL, '2023-06-21 14:00:36');
INSERT INTO `tests` VALUES (64, '名称3', '备注3', 3, NULL, '2023-06-21 14:00:36');
INSERT INTO `tests` VALUES (63, '名称2', '备注2', 2, NULL, '2023-06-21 14:00:36');
INSERT INTO `tests` VALUES (62, '名称6', '备注6', 6, NULL, '2023-06-21 14:00:29');
INSERT INTO `tests` VALUES (61, '名称5', '备注5', 5, NULL, '2023-06-21 14:00:29');
INSERT INTO `tests` VALUES (60, '名称4', '备注4', 4, NULL, '2023-06-21 14:00:29');
INSERT INTO `tests` VALUES (59, '名称3', '备注3', 3, NULL, '2023-06-21 14:00:29');
INSERT INTO `tests` VALUES (58, '名称2', '备注2', 2, NULL, '2023-06-21 14:00:29');
INSERT INTO `tests` VALUES (57, '名称6', '备注6', 6, NULL, '2023-06-20 17:18:37');
INSERT INTO `tests` VALUES (56, '名称5', '备注5', 5, NULL, '2023-06-20 17:18:37');
INSERT INTO `tests` VALUES (55, '名称4', '备注4', 4, NULL, '2023-06-20 17:18:37');
INSERT INTO `tests` VALUES (54, '名称3', '备注3', 3, NULL, '2023-06-20 17:18:37');
INSERT INTO `tests` VALUES (53, '名称2', NULL, 2, NULL, '2023-06-20 17:18:37');

-- ----------------------------
-- Table structure for theme
-- ----------------------------
DROP TABLE IF EXISTS `theme`;
CREATE TABLE `theme`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `menu_bg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '默认背景',
  `menu_sub_bg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '展开背景',
  `menu_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '默认文字',
  `menu_active_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '选中文字',
  `menu_sub_active_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '当前选中展开文字',
  `menu_hover_bg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'hover背景',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of theme
-- ----------------------------
INSERT INTO `theme` VALUES (1, 1, '#304156', '#304156', '#bfcad5', '#409eff', '#fff', '#001528', '2024-03-14 14:17:36', '2023-05-26 11:30:29');
INSERT INTO `theme` VALUES (25, 53, '#304156', '#304156', '#bfcad5', '#409eff', '#fff', '#001528', NULL, '2023-06-16 15:18:24');
INSERT INTO `theme` VALUES (26, 54, '#304156', '#304156', '#bfcad5', '#409eff', '#fff', '#001528', NULL, '2023-06-16 15:18:55');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '状态',
  `roles_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色编号',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `admin` int(11) NOT NULL DEFAULT 0 COMMENT '管理员',
  `pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `more_id` int(11) NOT NULL DEFAULT 0 COMMENT '账号编号',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'http://127.0.0.1:3000/171034222305906719641043250526-头像.jpg', 1, '1', '管理员', 1, '63f6deb737ab85677d6f11beea14a08b', 5, '2024-03-13 23:03:47', '2023-04-05 15:32:33');
INSERT INTO `user` VALUES (54, '用户2', 'http://127.0.0.1:3000/1710395965497011882079557203218-preview.jpg', 1, '12', NULL, 0, '63f6deb737ab85677d6f11beea14a08b', 8, '2024-03-14 13:59:27', '2023-06-16 15:18:55');
INSERT INTO `user` VALUES (53, '用户1', 'http://127.0.0.1:3000/171039599133601076725786805044-preview.jpg', 1, '13', NULL, 0, '63f6deb737ab85677d6f11beea14a08b', 5, '2024-03-14 13:59:52', '2023-06-16 15:18:24');

SET FOREIGN_KEY_CHECKS = 1;
