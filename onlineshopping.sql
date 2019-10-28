/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : onlineshopping

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 28/10/2019 09:49:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add 用户', 7, 'add_user');
INSERT INTO `auth_permission` VALUES (26, 'Can change 用户', 7, 'change_user');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 用户', 7, 'delete_user');
INSERT INTO `auth_permission` VALUES (28, 'Can view 用户', 7, 'view_user');
INSERT INTO `auth_permission` VALUES (29, 'Can add 地址', 8, 'add_address');
INSERT INTO `auth_permission` VALUES (30, 'Can change 地址', 8, 'change_address');
INSERT INTO `auth_permission` VALUES (31, 'Can delete 地址', 8, 'delete_address');
INSERT INTO `auth_permission` VALUES (32, 'Can view 地址', 8, 'view_address');
INSERT INTO `auth_permission` VALUES (33, 'Can add 主页促销活动', 9, 'add_indexpromotionbanner');
INSERT INTO `auth_permission` VALUES (34, 'Can change 主页促销活动', 9, 'change_indexpromotionbanner');
INSERT INTO `auth_permission` VALUES (35, 'Can delete 主页促销活动', 9, 'delete_indexpromotionbanner');
INSERT INTO `auth_permission` VALUES (36, 'Can view 主页促销活动', 9, 'view_indexpromotionbanner');
INSERT INTO `auth_permission` VALUES (37, 'Can add 商品', 10, 'add_goodssku');
INSERT INTO `auth_permission` VALUES (38, 'Can change 商品', 10, 'change_goodssku');
INSERT INTO `auth_permission` VALUES (39, 'Can delete 商品', 10, 'delete_goodssku');
INSERT INTO `auth_permission` VALUES (40, 'Can view 商品', 10, 'view_goodssku');
INSERT INTO `auth_permission` VALUES (41, 'Can add 商品SPU', 11, 'add_goods');
INSERT INTO `auth_permission` VALUES (42, 'Can change 商品SPU', 11, 'change_goods');
INSERT INTO `auth_permission` VALUES (43, 'Can delete 商品SPU', 11, 'delete_goods');
INSERT INTO `auth_permission` VALUES (44, 'Can view 商品SPU', 11, 'view_goods');
INSERT INTO `auth_permission` VALUES (45, 'Can add 商品图片', 12, 'add_goodsimage');
INSERT INTO `auth_permission` VALUES (46, 'Can change 商品图片', 12, 'change_goodsimage');
INSERT INTO `auth_permission` VALUES (47, 'Can delete 商品图片', 12, 'delete_goodsimage');
INSERT INTO `auth_permission` VALUES (48, 'Can view 商品图片', 12, 'view_goodsimage');
INSERT INTO `auth_permission` VALUES (49, 'Can add 首页分类展示商品', 13, 'add_indextypegoodsbanner');
INSERT INTO `auth_permission` VALUES (50, 'Can change 首页分类展示商品', 13, 'change_indextypegoodsbanner');
INSERT INTO `auth_permission` VALUES (51, 'Can delete 首页分类展示商品', 13, 'delete_indextypegoodsbanner');
INSERT INTO `auth_permission` VALUES (52, 'Can view 首页分类展示商品', 13, 'view_indextypegoodsbanner');
INSERT INTO `auth_permission` VALUES (53, 'Can add 首页轮播商品', 14, 'add_indexgoodsbanner');
INSERT INTO `auth_permission` VALUES (54, 'Can change 首页轮播商品', 14, 'change_indexgoodsbanner');
INSERT INTO `auth_permission` VALUES (55, 'Can delete 首页轮播商品', 14, 'delete_indexgoodsbanner');
INSERT INTO `auth_permission` VALUES (56, 'Can view 首页轮播商品', 14, 'view_indexgoodsbanner');
INSERT INTO `auth_permission` VALUES (57, 'Can add 商品种类', 15, 'add_goodstype');
INSERT INTO `auth_permission` VALUES (58, 'Can change 商品种类', 15, 'change_goodstype');
INSERT INTO `auth_permission` VALUES (59, 'Can delete 商品种类', 15, 'delete_goodstype');
INSERT INTO `auth_permission` VALUES (60, 'Can view 商品种类', 15, 'view_goodstype');
INSERT INTO `auth_permission` VALUES (61, 'Can add 订单商品', 16, 'add_ordergoods');
INSERT INTO `auth_permission` VALUES (62, 'Can change 订单商品', 16, 'change_ordergoods');
INSERT INTO `auth_permission` VALUES (63, 'Can delete 订单商品', 16, 'delete_ordergoods');
INSERT INTO `auth_permission` VALUES (64, 'Can view 订单商品', 16, 'view_ordergoods');
INSERT INTO `auth_permission` VALUES (65, 'Can add 订单详情', 17, 'add_orderinfo');
INSERT INTO `auth_permission` VALUES (66, 'Can change 订单详情', 17, 'change_orderinfo');
INSERT INTO `auth_permission` VALUES (67, 'Can delete 订单详情', 17, 'delete_orderinfo');
INSERT INTO `auth_permission` VALUES (68, 'Can view 订单详情', 17, 'view_orderinfo');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (3, 'pbkdf2_sha256$150000$kruaaM37J8k9$g5r1XxJZ6xChawMYxi2hl9KSKEA8SZ3SWeIuL3cJrj0=', '2019-09-13 06:01:46.153888', 1, 'admin', '', '', '', 1, 1, '2019-07-13 08:33:56.506600');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 183 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2019-07-15 01:30:47.390914', '18', '草莓111', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (2, '2019-07-15 01:55:29.962101', '18', '草莓222', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (3, '2019-07-15 01:55:52.119722', '18', '草莓', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (4, '2019-07-15 01:55:58.767606', '3', '草莓123', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (5, '2019-07-15 01:56:14.564361', '3', '草莓', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (6, '2019-07-15 06:25:24.708345', '18', '特价草莓', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (7, '2019-07-15 13:49:12.170833', '18', '特价草莓', 2, '[{\"changed\": {\"fields\": [\"desc\", \"image\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (8, '2019-07-15 13:52:15.457170', '19', '奶油葡萄', 1, '[{\"added\": {}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (9, '2019-07-15 13:53:29.670135', '12', '鲜芒果', 2, '[{\"changed\": {\"fields\": [\"image\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (10, '2019-07-15 13:53:41.700759', '13', '加州提子', 2, '[{\"changed\": {\"fields\": [\"image\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (11, '2019-07-15 13:53:57.690491', '14', '亚马孙牛油果', 2, '[{\"changed\": {\"fields\": [\"image\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (12, '2019-07-15 13:55:01.819027', '1', '草莓', 2, '[{\"changed\": {\"fields\": [\"image\"]}}]', 12, 3);
INSERT INTO `django_admin_log` VALUES (13, '2019-07-15 13:57:30.229619', '2', '葡萄', 3, '', 12, 3);
INSERT INTO `django_admin_log` VALUES (14, '2019-07-15 13:57:34.917733', '1', '草莓', 3, '', 12, 3);
INSERT INTO `django_admin_log` VALUES (15, '2019-07-15 14:01:31.023544', '15', '河虾', 2, '[{\"changed\": {\"fields\": [\"image\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (16, '2019-07-15 14:02:42.847117', '18', '特价草莓', 2, '[{\"changed\": {\"fields\": [\"image\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (17, '2019-07-15 14:03:43.105611', '14', '亚马孙牛油果', 2, '[{\"changed\": {\"fields\": [\"image\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (18, '2019-07-15 14:04:48.587068', '13', '加州提子', 2, '[{\"changed\": {\"fields\": [\"image\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (19, '2019-07-15 14:05:35.214656', '12', '鲜芒果', 2, '[{\"changed\": {\"fields\": [\"image\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (20, '2019-07-16 01:33:12.722364', '4', '零食保健', 2, '[{\"changed\": {\"fields\": [\"image\"]}}]', 9, 3);
INSERT INTO `django_admin_log` VALUES (21, '2019-07-16 01:33:22.289058', '3', '吃货打折', 2, '[{\"changed\": {\"fields\": [\"image\"]}}]', 9, 3);
INSERT INTO `django_admin_log` VALUES (22, '2019-09-09 13:13:57.684340', '4', '草莓', 2, '[{\"changed\": {\"fields\": [\"index\"]}}]', 14, 3);
INSERT INTO `django_admin_log` VALUES (23, '2019-09-09 13:14:15.922799', '4', '草莓', 2, '[{\"changed\": {\"fields\": [\"index\"]}}]', 14, 3);
INSERT INTO `django_admin_log` VALUES (24, '2019-09-09 13:22:43.391492', '4', '草莓', 2, '[{\"changed\": {\"fields\": [\"index\"]}}]', 14, 3);
INSERT INTO `django_admin_log` VALUES (25, '2019-09-09 13:22:54.288100', '4', '草莓', 2, '[{\"changed\": {\"fields\": [\"index\"]}}]', 14, 3);
INSERT INTO `django_admin_log` VALUES (26, '2019-09-10 11:58:01.875029', '3', '草莓123', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (27, '2019-09-10 11:58:23.383519', '3', '草莓', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (28, '2019-09-10 12:00:25.549841', '3', '草莓123', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (29, '2019-09-10 12:00:43.127672', '3', '草莓123', 2, '[{\"changed\": {\"fields\": [\"price\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (30, '2019-09-10 12:00:58.312209', '3', '草莓', 2, '[{\"changed\": {\"fields\": [\"name\", \"price\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (31, '2019-09-10 12:01:47.279145', '3', '草莓123', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (32, '2019-09-10 12:02:18.680251', '3', '草莓', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (33, '2019-09-10 12:19:16.098749', '4', '葡萄1', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (34, '2019-09-10 12:19:27.316392', '4', '葡萄', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (35, '2019-09-10 12:22:07.146884', '3', '草莓1', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (36, '2019-09-10 12:22:21.818475', '3', '草莓', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (37, '2019-09-10 12:23:52.351591', '3', '新鲜水果1', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 15, 3);
INSERT INTO `django_admin_log` VALUES (38, '2019-09-10 12:24:36.242035', '3', '新鲜水果', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 15, 3);
INSERT INTO `django_admin_log` VALUES (39, '2019-09-10 12:32:20.498591', '3', '新鲜水果1', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 15, 3);
INSERT INTO `django_admin_log` VALUES (40, '2019-09-10 12:32:29.355922', '3', '新鲜水果', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 15, 3);
INSERT INTO `django_admin_log` VALUES (41, '2019-09-11 17:01:10.249933', '16', '猪肉', 1, '[{\"added\": {}}]', 11, 3);
INSERT INTO `django_admin_log` VALUES (42, '2019-09-11 17:01:37.924516', '17', '牛肉', 1, '[{\"added\": {}}]', 11, 3);
INSERT INTO `django_admin_log` VALUES (43, '2019-09-11 17:02:08.395813', '18', '羊肉', 1, '[{\"added\": {}}]', 11, 3);
INSERT INTO `django_admin_log` VALUES (44, '2019-09-11 17:02:46.889138', '19', '鸡肉', 1, '[{\"added\": {}}]', 11, 3);
INSERT INTO `django_admin_log` VALUES (45, '2019-09-11 17:03:42.158537', '20', '猪肉片', 1, '[{\"added\": {}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (46, '2019-09-11 17:04:30.464851', '21', '新鲜牛肉', 1, '[{\"added\": {}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (47, '2019-09-11 17:05:28.297354', '22', '草原羔羊', 1, '[{\"added\": {}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (48, '2019-09-11 17:06:17.429999', '23', '优质肉鸡', 1, '[{\"added\": {}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (49, '2019-09-11 17:06:41.740699', '14', '猪肉片', 2, '[{\"changed\": {\"fields\": [\"sku\"]}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (50, '2019-09-11 17:06:58.337799', '15', '新鲜牛肉', 2, '[{\"changed\": {\"fields\": [\"sku\"]}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (51, '2019-09-11 17:07:08.650414', '16', '草原羔羊', 2, '[{\"changed\": {\"fields\": [\"sku\"]}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (52, '2019-09-11 17:07:16.852207', '18', '优质肉鸡', 2, '[{\"changed\": {\"fields\": [\"sku\"]}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (53, '2019-09-11 17:07:35.999122', '19', '优质肉鸡', 2, '[{\"changed\": {\"fields\": [\"sku\"]}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (54, '2019-09-11 17:08:51.731697', '34', '优质肉鸡', 2, '[{\"changed\": {\"fields\": [\"sku\"]}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (55, '2019-09-11 17:09:08.817350', '36', '青岛野生海捕大青虾', 2, '[{\"changed\": {\"fields\": [\"type\"]}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (56, '2019-09-11 17:09:16.453537', '35', '冷冻秋刀鱼', 2, '[{\"changed\": {\"fields\": [\"type\"]}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (57, '2019-09-11 17:19:25.841567', '14', '亚马孙牛油果', 2, '[{\"changed\": {\"fields\": [\"image\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (58, '2019-09-11 17:19:54.389068', '13', '加州提子', 2, '[{\"changed\": {\"fields\": [\"image\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (59, '2019-09-11 17:20:10.371100', '12', '鲜芒果', 2, '[{\"changed\": {\"fields\": [\"image\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (60, '2019-09-11 17:31:59.127588', '3', '草莓', 2, '[{\"changed\": {\"fields\": [\"image\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (61, '2019-09-11 17:33:09.520945', '3', '草莓', 2, '[{\"changed\": {\"fields\": [\"image\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (62, '2019-09-11 17:33:30.987153', '4', '葡萄', 2, '[{\"changed\": {\"fields\": [\"image\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (63, '2019-09-11 17:34:00.253794', '5', '柠檬', 2, '[{\"changed\": {\"fields\": [\"image\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (64, '2019-09-11 17:34:43.412769', '6', '奇异果', 2, '[{\"changed\": {\"fields\": [\"image\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (65, '2019-09-11 17:36:10.601271', '14', '螃蟹', 2, '[{\"changed\": {\"fields\": [\"name\", \"detail\"]}}]', 11, 3);
INSERT INTO `django_admin_log` VALUES (66, '2019-09-11 17:37:04.485252', '15', '鲤鱼', 2, '[{\"changed\": {\"fields\": [\"name\", \"detail\"]}}]', 11, 3);
INSERT INTO `django_admin_log` VALUES (67, '2019-09-11 17:39:01.765571', '20', '三文鱼', 1, '[{\"added\": {}}]', 11, 3);
INSERT INTO `django_admin_log` VALUES (68, '2019-09-11 17:40:48.884952', '15', '阳澄湖大闸蟹', 2, '[{\"changed\": {\"fields\": [\"name\", \"desc\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (69, '2019-09-12 08:11:07.719067', '15', '阳澄湖大闸蟹', 2, '[{\"changed\": {\"fields\": [\"price\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (70, '2019-09-12 08:11:20.273575', '15', '阳澄湖大闸蟹', 2, '[{\"changed\": {\"fields\": [\"stock\", \"sales\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (71, '2019-09-12 08:12:29.883071', '16', '扇贝1', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (72, '2019-09-12 10:54:42.095735', '15', '鱿鱼', 2, '[{\"changed\": {\"fields\": [\"name\", \"detail\"]}}]', 11, 3);
INSERT INTO `django_admin_log` VALUES (73, '2019-09-12 10:55:39.924319', '16', '深海大鱿鱼', 2, '[{\"changed\": {\"fields\": [\"name\", \"desc\", \"stock\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (74, '2019-09-12 10:56:19.709899', '16', '深海大鱿鱼', 2, '[{\"changed\": {\"fields\": [\"goods\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (75, '2019-09-12 10:57:21.265324', '24', '优质三文鱼', 1, '[{\"added\": {}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (76, '2019-09-12 10:58:33.755041', '33', '阳澄湖大闸蟹', 2, '[{\"changed\": {\"fields\": [\"sku\"]}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (77, '2019-09-12 10:58:47.859921', '33', '深海大鱿鱼', 2, '[{\"changed\": {\"fields\": [\"sku\"]}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (78, '2019-09-12 10:59:19.951464', '35', '优质三文鱼', 2, '[{\"changed\": {\"fields\": [\"sku\"]}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (79, '2019-09-12 10:59:38.626485', '36', '青岛野生海捕大青虾', 3, '', 13, 3);
INSERT INTO `django_admin_log` VALUES (80, '2019-09-12 11:02:48.261440', '24', '优质三文鱼', 2, '[{\"changed\": {\"fields\": [\"image\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (81, '2019-09-12 11:05:21.181591', '16', '深海大鱿鱼', 2, '[{\"changed\": {\"fields\": [\"image\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (82, '2019-09-12 11:06:54.386198', '15', '阳澄湖大闸蟹', 2, '[{\"changed\": {\"fields\": [\"image\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (83, '2019-09-12 11:14:04.861223', '10', '基围虾', 2, '[{\"changed\": {\"fields\": [\"image\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (84, '2019-09-12 11:14:19.271338', '9', '冷冻秋刀鱼', 2, '[{\"changed\": {\"fields\": [\"image\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (85, '2019-09-12 11:14:36.869105', '8', '扇贝', 2, '[{\"changed\": {\"fields\": [\"image\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (86, '2019-09-12 11:14:57.635125', '7', '青岛野生海捕大青虾', 2, '[{\"changed\": {\"fields\": [\"image\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (87, '2019-09-12 11:17:00.261588', '21', '野生乌鸡', 1, '[{\"added\": {}}]', 11, 3);
INSERT INTO `django_admin_log` VALUES (88, '2019-09-12 11:17:43.384025', '22', '鲜嫩大羊腰', 1, '[{\"added\": {}}]', 11, 3);
INSERT INTO `django_admin_log` VALUES (89, '2019-09-12 11:18:21.872487', '23', '驴肉', 1, '[{\"added\": {}}]', 11, 3);
INSERT INTO `django_admin_log` VALUES (90, '2019-09-12 11:20:14.020618', '25', '野生乌鸡', 1, '[{\"added\": {}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (91, '2019-09-12 11:23:18.799759', '26', '驴肉', 1, '[{\"added\": {}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (92, '2019-09-12 11:26:20.018460', '27', '鲜嫩大羊腰', 1, '[{\"added\": {}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (93, '2019-09-12 11:27:42.886237', '29', '驴肉', 2, '[{\"changed\": {\"fields\": [\"type\", \"sku\", \"display_type\"]}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (94, '2019-09-12 11:28:03.269384', '28', '野生乌鸡', 2, '[{\"changed\": {\"fields\": [\"type\", \"sku\", \"display_type\"]}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (95, '2019-09-12 11:28:15.656408', '27', '鲜嫩大羊腰', 2, '[{\"changed\": {\"fields\": [\"type\", \"sku\", \"display_type\"]}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (96, '2019-09-12 11:36:54.872614', '24', '鹌鹑蛋', 1, '[{\"added\": {}}]', 11, 3);
INSERT INTO `django_admin_log` VALUES (97, '2019-09-12 11:37:27.854015', '25', '松花蛋', 1, '[{\"added\": {}}]', 11, 3);
INSERT INTO `django_admin_log` VALUES (98, '2019-09-12 11:38:05.042749', '26', '柴鸡蛋', 1, '[{\"added\": {}}]', 11, 3);
INSERT INTO `django_admin_log` VALUES (99, '2019-09-12 11:38:28.071002', '27', '咸鸭蛋', 1, '[{\"added\": {}}]', 11, 3);
INSERT INTO `django_admin_log` VALUES (100, '2019-09-12 11:44:27.828817', '28', '乡巴佬鸡蛋', 1, '[{\"added\": {}}]', 11, 3);
INSERT INTO `django_admin_log` VALUES (101, '2019-09-12 11:44:39.747651', '29', '茶叶蛋', 1, '[{\"added\": {}}]', 11, 3);
INSERT INTO `django_admin_log` VALUES (102, '2019-09-12 11:44:58.583003', '30', '鹌鹑蛋罐头', 1, '[{\"added\": {}}]', 11, 3);
INSERT INTO `django_admin_log` VALUES (103, '2019-09-12 11:46:08.869822', '11', '柴鸡蛋', 2, '[{\"changed\": {\"fields\": [\"type\", \"goods\", \"name\", \"desc\", \"price\", \"image\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (104, '2019-09-12 11:46:51.925671', '28', '松花蛋', 1, '[{\"added\": {}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (105, '2019-09-12 11:47:45.647410', '29', '鹌鹑蛋', 1, '[{\"added\": {}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (106, '2019-09-12 11:48:40.461282', '30', '咸鸭蛋', 1, '[{\"added\": {}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (107, '2019-09-12 11:49:24.427041', '31', '乡巴佬鸡蛋', 1, '[{\"added\": {}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (108, '2019-09-12 11:50:02.844852', '32', '茶叶蛋', 1, '[{\"added\": {}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (109, '2019-09-12 11:50:55.527577', '33', '鹌鹑蛋罐头', 1, '[{\"added\": {}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (110, '2019-09-12 11:51:31.268228', '26', '柴鸡蛋', 2, '[{\"changed\": {\"fields\": [\"type\"]}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (111, '2019-09-12 11:51:50.372789', '25', '松花蛋', 2, '[{\"changed\": {\"fields\": [\"type\", \"sku\"]}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (112, '2019-09-12 11:52:13.428452', '22', '咸鸭蛋', 2, '[{\"changed\": {\"fields\": [\"type\", \"sku\"]}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (113, '2019-09-12 11:52:27.267343', '24', '鹌鹑蛋', 2, '[{\"changed\": {\"fields\": [\"type\", \"sku\"]}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (114, '2019-09-12 11:52:54.341155', '20', '柴鸡蛋', 2, '[]', 13, 3);
INSERT INTO `django_admin_log` VALUES (115, '2019-09-12 11:53:08.627374', '21', '柴鸡蛋', 2, '[{\"changed\": {\"fields\": [\"type\"]}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (116, '2019-09-12 11:53:40.315712', '19', '柴鸡蛋', 2, '[{\"changed\": {\"fields\": [\"sku\"]}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (117, '2019-09-12 11:54:25.826873', '19', '松花蛋', 2, '[{\"changed\": {\"fields\": [\"sku\"]}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (118, '2019-09-12 11:54:42.937403', '18', '柴鸡蛋', 2, '[{\"changed\": {\"fields\": [\"sku\"]}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (119, '2019-09-12 11:55:02.721636', '20', '咸鸭蛋', 2, '[{\"changed\": {\"fields\": [\"sku\"]}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (120, '2019-09-12 11:55:13.501177', '23', '鹌鹑蛋', 2, '[{\"changed\": {\"fields\": [\"sku\"]}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (121, '2019-09-12 11:55:33.470561', '22', '鹌鹑蛋', 2, '[{\"changed\": {\"fields\": [\"sku\"]}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (122, '2019-09-12 11:56:19.787426', '26', '乡巴佬鸡蛋', 2, '[{\"changed\": {\"fields\": [\"sku\", \"display_type\"]}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (123, '2019-09-12 11:56:37.596794', '25', '鹌鹑蛋罐头', 2, '[{\"changed\": {\"fields\": [\"sku\", \"display_type\"]}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (124, '2019-09-12 11:56:51.128000', '24', '茶叶蛋', 2, '[{\"changed\": {\"fields\": [\"sku\"]}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (125, '2019-09-12 11:56:59.920699', '24', '茶叶蛋', 2, '[{\"changed\": {\"fields\": [\"display_type\"]}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (126, '2019-09-12 12:02:22.952522', '31', '胡萝卜', 1, '[{\"added\": {}}]', 11, 3);
INSERT INTO `django_admin_log` VALUES (127, '2019-09-12 12:02:43.272734', '32', '紫甘蓝', 1, '[{\"added\": {}}]', 11, 3);
INSERT INTO `django_admin_log` VALUES (128, '2019-09-12 12:03:08.252400', '33', '荷兰豆', 1, '[{\"added\": {}}]', 11, 3);
INSERT INTO `django_admin_log` VALUES (129, '2019-09-12 12:03:23.914951', '34', '生菜', 1, '[{\"added\": {}}]', 11, 3);
INSERT INTO `django_admin_log` VALUES (130, '2019-09-12 12:04:07.488002', '35', '茼蒿', 1, '[{\"added\": {}}]', 11, 3);
INSERT INTO `django_admin_log` VALUES (131, '2019-09-12 12:04:28.187593', '36', '秋葵', 1, '[{\"added\": {}}]', 11, 3);
INSERT INTO `django_admin_log` VALUES (132, '2019-09-12 12:04:57.099771', '37', '辣椒', 1, '[{\"added\": {}}]', 11, 3);
INSERT INTO `django_admin_log` VALUES (133, '2019-09-12 13:00:46.584483', '34', '胡萝卜', 1, '[{\"added\": {}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (134, '2019-09-12 13:01:38.703565', '35', '紫甘蓝', 1, '[{\"added\": {}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (135, '2019-09-12 13:02:11.497018', '36', '荷兰豆', 1, '[{\"added\": {}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (136, '2019-09-12 13:03:03.893462', '37', '原叶生菜', 1, '[{\"added\": {}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (137, '2019-09-12 13:03:48.028018', '38', '茼蒿', 1, '[{\"added\": {}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (138, '2019-09-12 13:04:26.050753', '39', '秋葵', 1, '[{\"added\": {}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (139, '2019-09-12 13:05:02.208302', '40', '辣椒', 1, '[{\"added\": {}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (140, '2019-09-12 13:05:23.431941', '23', '胡萝卜', 2, '[{\"changed\": {\"fields\": [\"sku\"]}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (141, '2019-09-12 13:05:45.597964', '37', '紫甘蓝', 1, '[{\"added\": {}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (142, '2019-09-12 13:05:57.346777', '38', '荷兰豆', 1, '[{\"added\": {}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (143, '2019-09-12 13:06:07.632419', '39', '原叶生菜', 1, '[{\"added\": {}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (144, '2019-09-12 13:06:20.131020', '40', '茼蒿', 1, '[{\"added\": {}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (145, '2019-09-12 13:06:31.730063', '41', '秋葵', 1, '[{\"added\": {}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (146, '2019-09-12 13:06:43.666869', '42', '辣椒', 1, '[{\"added\": {}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (147, '2019-09-12 13:12:41.668577', '38', '可爱多', 1, '[{\"added\": {}}]', 11, 3);
INSERT INTO `django_admin_log` VALUES (148, '2019-09-12 13:12:58.163601', '39', '梦龙', 1, '[{\"added\": {}}]', 11, 3);
INSERT INTO `django_admin_log` VALUES (149, '2019-09-12 13:13:17.422234', '40', '八喜', 1, '[{\"added\": {}}]', 11, 3);
INSERT INTO `django_admin_log` VALUES (150, '2019-09-12 13:13:36.291853', '41', '千层雪', 1, '[{\"added\": {}}]', 11, 3);
INSERT INTO `django_admin_log` VALUES (151, '2019-09-12 13:13:52.430860', '42', '雪人', 1, '[{\"added\": {}}]', 11, 3);
INSERT INTO `django_admin_log` VALUES (152, '2019-09-12 13:14:15.098103', '43', '火炬', 1, '[{\"added\": {}}]', 11, 3);
INSERT INTO `django_admin_log` VALUES (153, '2019-09-12 13:14:45.283496', '44', '双棒', 1, '[{\"added\": {}}]', 11, 3);
INSERT INTO `django_admin_log` VALUES (154, '2019-09-12 13:18:11.532226', '41', '可爱多', 1, '[{\"added\": {}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (155, '2019-09-12 13:20:06.588067', '42', '梦龙', 1, '[{\"added\": {}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (156, '2019-09-12 13:21:58.561164', '43', '八喜', 1, '[{\"added\": {}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (157, '2019-09-12 13:23:36.139751', '44', '千层雪', 1, '[{\"added\": {}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (158, '2019-09-12 13:25:10.280956', '45', '雪人', 1, '[{\"added\": {}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (159, '2019-09-12 13:26:39.396913', '46', '火炬', 1, '[{\"added\": {}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (160, '2019-09-12 13:28:04.184188', '47', '双棒', 1, '[{\"added\": {}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (161, '2019-09-12 13:28:37.259959', '21', '可爱多', 2, '[{\"changed\": {\"fields\": [\"sku\"]}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (162, '2019-09-12 13:28:56.421693', '43', '梦龙', 1, '[{\"added\": {}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (163, '2019-09-12 13:29:05.461330', '44', '八喜', 1, '[{\"added\": {}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (164, '2019-09-12 13:29:15.080928', '45', '千层雪', 1, '[{\"added\": {}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (165, '2019-09-12 13:29:26.989884', '46', '雪人', 1, '[{\"added\": {}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (166, '2019-09-12 13:29:39.700062', '47', '火炬', 1, '[{\"added\": {}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (167, '2019-09-12 13:29:53.995459', '48', '双棒', 1, '[{\"added\": {}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (168, '2019-09-12 13:30:41.608588', '44', '千层雪', 2, '[{\"changed\": {\"fields\": [\"image\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (169, '2019-09-12 13:33:11.622303', '12', '基围虾', 2, '[{\"changed\": {\"fields\": [\"display_type\"]}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (170, '2019-09-12 13:33:18.379289', '32', '阳澄湖大闸蟹', 2, '[{\"changed\": {\"fields\": [\"display_type\"]}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (171, '2019-09-12 15:58:47.319808', '1', '草莓', 1, '[{\"added\": {}}]', 12, 3);
INSERT INTO `django_admin_log` VALUES (172, '2019-09-12 15:58:57.541126', '2', '草莓', 1, '[{\"added\": {}}]', 12, 3);
INSERT INTO `django_admin_log` VALUES (173, '2019-09-12 16:34:55.431628', '3', '盒装草莓', 1, '[{\"added\": {}}]', 12, 3);
INSERT INTO `django_admin_log` VALUES (174, '2019-09-12 16:35:17.138743', '4', '盒装草莓', 1, '[{\"added\": {}}]', 12, 3);
INSERT INTO `django_admin_log` VALUES (175, '2019-09-12 16:39:52.260092', '5', '草莓', 1, '[{\"added\": {}}]', 12, 3);
INSERT INTO `django_admin_log` VALUES (176, '2019-09-12 16:40:02.751200', '6', '草莓', 1, '[{\"added\": {}}]', 12, 3);
INSERT INTO `django_admin_log` VALUES (177, '2019-09-12 16:40:31.568359', '6', '特价草莓', 2, '[{\"changed\": {\"fields\": [\"sku\"]}}]', 12, 3);
INSERT INTO `django_admin_log` VALUES (178, '2019-09-12 16:40:39.639801', '5', '特价草莓', 2, '[{\"changed\": {\"fields\": [\"sku\"]}}]', 12, 3);
INSERT INTO `django_admin_log` VALUES (179, '2019-09-12 16:44:57.881769', '18', '特价草莓', 2, '[{\"changed\": {\"fields\": [\"image\"]}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (180, '2019-09-12 16:46:32.513114', '19', '奶油葡萄', 3, '', 10, 3);
INSERT INTO `django_admin_log` VALUES (181, '2019-09-12 16:52:00.350528', '3', '草莓', 2, '[{\"changed\": {\"fields\": [\"detail\"]}}]', 11, 3);
INSERT INTO `django_admin_log` VALUES (182, '2019-09-12 16:52:41.586874', '3', '草莓', 2, '[{\"changed\": {\"fields\": [\"detail\"]}}]', 11, 3);
INSERT INTO `django_admin_log` VALUES (183, '2019-09-12 16:54:17.392041', '3', '草莓', 2, '[{\"changed\": {\"fields\": [\"detail\"]}}]', 11, 3);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (11, 'goods', 'goods');
INSERT INTO `django_content_type` VALUES (12, 'goods', 'goodsimage');
INSERT INTO `django_content_type` VALUES (10, 'goods', 'goodssku');
INSERT INTO `django_content_type` VALUES (15, 'goods', 'goodstype');
INSERT INTO `django_content_type` VALUES (14, 'goods', 'indexgoodsbanner');
INSERT INTO `django_content_type` VALUES (9, 'goods', 'indexpromotionbanner');
INSERT INTO `django_content_type` VALUES (13, 'goods', 'indextypegoodsbanner');
INSERT INTO `django_content_type` VALUES (16, 'order', 'ordergoods');
INSERT INTO `django_content_type` VALUES (17, 'order', 'orderinfo');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (8, 'user', 'address');
INSERT INTO `django_content_type` VALUES (7, 'user', 'user');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2019-07-13 08:08:17.877300');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2019-07-13 08:08:26.366165');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2019-07-13 08:08:28.187271');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2019-07-13 08:08:28.314674');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2019-07-13 08:08:28.438723');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2019-07-13 08:08:29.517940');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2019-07-13 08:08:30.214378');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2019-07-13 08:08:30.900769');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2019-07-13 08:08:30.986779');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2019-07-13 08:08:31.521635');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2019-07-13 08:08:31.576622');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2019-07-13 08:08:31.659643');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2019-07-13 08:08:32.471676');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2019-07-13 08:08:33.118691');
INSERT INTO `django_migrations` VALUES (15, 'sessions', '0001_initial', '2019-07-13 08:08:33.826549');
INSERT INTO `django_migrations` VALUES (16, 'goods', '0001_initial', '2019-07-13 08:19:26.374975');
INSERT INTO `django_migrations` VALUES (17, 'user', '0001_initial', '2019-07-13 08:19:28.328700');
INSERT INTO `django_migrations` VALUES (18, 'order', '0001_initial', '2019-07-13 08:19:33.266846');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('ec13nfwaro2livumvzizfa19b63kn2xi', 'ODliMjAyY2QwZWMxYTRiMTY3OTQzZmVlNjI2Y2RhMzU1NjlkMGY4YTp7InVzZXIiOiJ7XCJweS9yZWR1Y2VcIjogW3tcInB5L2Z1bmN0aW9uXCI6IFwiZGphbmdvLmRiLm1vZGVscy5iYXNlLm1vZGVsX3VucGlja2xlXCJ9LCB7XCJweS90dXBsZVwiOiBbe1wicHkvdHVwbGVcIjogW1widXNlclwiLCBcIlVzZXJcIl19XX0sIHtcIl9kamFuZ29fdmVyc2lvblwiOiBcIjIuMi42XCIsIFwiX3N0YXRlXCI6IHtcImFkZGluZ1wiOiBmYWxzZSwgXCJkYlwiOiBcImRlZmF1bHRcIiwgXCJweS9vYmplY3RcIjogXCJkamFuZ28uZGIubW9kZWxzLmJhc2UuTW9kZWxTdGF0ZVwifSwgXCJjcmVhdGVfdGltZVwiOiB7XCJfX3JlZHVjZV9fXCI6IFt7XCJweS90eXBlXCI6IFwiZGF0ZXRpbWUuZGF0ZXRpbWVcIn0sIFtcIkIrTUtGQWd0RHdEVjhRPT1cIiwge1wicHkvcmVkdWNlXCI6IFt7XCJweS9mdW5jdGlvblwiOiBcInB5dHouX1VUQ1wifSwge1wicHkvdHVwbGVcIjogW119XX1dXSwgXCJweS9vYmplY3RcIjogXCJkYXRldGltZS5kYXRldGltZVwifSwgXCJlbWFpbFwiOiBcIndxemhwdUAxNjMuY29tXCIsIFwiaWRcIjogOTIsIFwiaXNfYWN0aXZlXCI6IDEsIFwiaXNfZGVsZXRlXCI6IGZhbHNlLCBcInBhc3N3b3JkXCI6IFwiYWRtaW5cIiwgXCJ1cGRhdGVfdGltZVwiOiB7XCJfX3JlZHVjZV9fXCI6IFt7XCJweS90eXBlXCI6IFwiZGF0ZXRpbWUuZGF0ZXRpbWVcIn0sIFtcIkIrTUtGQWd0RHdEVjhRPT1cIiwge1wicHkvaWRcIjogM31dXSwgXCJweS9vYmplY3RcIjogXCJkYXRldGltZS5kYXRldGltZVwifSwgXCJ1c2VybmFtZVwiOiBcImFkbWluXCJ9XX0ifQ==', '2019-11-05 06:49:13.358788');
INSERT INTO `django_session` VALUES ('i4cvpl4376wpklcb3q71875nbkd19ecb', 'ODliMjAyY2QwZWMxYTRiMTY3OTQzZmVlNjI2Y2RhMzU1NjlkMGY4YTp7InVzZXIiOiJ7XCJweS9yZWR1Y2VcIjogW3tcInB5L2Z1bmN0aW9uXCI6IFwiZGphbmdvLmRiLm1vZGVscy5iYXNlLm1vZGVsX3VucGlja2xlXCJ9LCB7XCJweS90dXBsZVwiOiBbe1wicHkvdHVwbGVcIjogW1widXNlclwiLCBcIlVzZXJcIl19XX0sIHtcIl9kamFuZ29fdmVyc2lvblwiOiBcIjIuMi42XCIsIFwiX3N0YXRlXCI6IHtcImFkZGluZ1wiOiBmYWxzZSwgXCJkYlwiOiBcImRlZmF1bHRcIiwgXCJweS9vYmplY3RcIjogXCJkamFuZ28uZGIubW9kZWxzLmJhc2UuTW9kZWxTdGF0ZVwifSwgXCJjcmVhdGVfdGltZVwiOiB7XCJfX3JlZHVjZV9fXCI6IFt7XCJweS90eXBlXCI6IFwiZGF0ZXRpbWUuZGF0ZXRpbWVcIn0sIFtcIkIrTUtGQWd0RHdEVjhRPT1cIiwge1wicHkvcmVkdWNlXCI6IFt7XCJweS9mdW5jdGlvblwiOiBcInB5dHouX1VUQ1wifSwge1wicHkvdHVwbGVcIjogW119XX1dXSwgXCJweS9vYmplY3RcIjogXCJkYXRldGltZS5kYXRldGltZVwifSwgXCJlbWFpbFwiOiBcIndxemhwdUAxNjMuY29tXCIsIFwiaWRcIjogOTIsIFwiaXNfYWN0aXZlXCI6IDEsIFwiaXNfZGVsZXRlXCI6IGZhbHNlLCBcInBhc3N3b3JkXCI6IFwiYWRtaW5cIiwgXCJ1cGRhdGVfdGltZVwiOiB7XCJfX3JlZHVjZV9fXCI6IFt7XCJweS90eXBlXCI6IFwiZGF0ZXRpbWUuZGF0ZXRpbWVcIn0sIFtcIkIrTUtGQWd0RHdEVjhRPT1cIiwge1wicHkvaWRcIjogM31dXSwgXCJweS9vYmplY3RcIjogXCJkYXRldGltZS5kYXRldGltZVwifSwgXCJ1c2VybmFtZVwiOiBcImFkbWluXCJ9XX0ifQ==', '2019-11-03 08:46:18.698993');
INSERT INTO `django_session` VALUES ('qo3nkyd0vnfunik3ythmw0j7u69dsb7x', 'YWM1YmE5ZTA3NDZlMmIxMzY2MjI3NjBiNjViNjQxNDhkYTU3MDFjMTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZGNlYzQyN2VlNWI2NWI1Yjg3NjI5MDM0ZWY4ZjNlY2QxZTMxMzczIiwidXNlciI6IntcInB5L3JlZHVjZVwiOiBbe1wicHkvZnVuY3Rpb25cIjogXCJkamFuZ28uZGIubW9kZWxzLmJhc2UubW9kZWxfdW5waWNrbGVcIn0sIHtcInB5L3R1cGxlXCI6IFt7XCJweS90dXBsZVwiOiBbXCJ1c2VyXCIsIFwiVXNlclwiXX1dfSwge1wiX2RqYW5nb192ZXJzaW9uXCI6IFwiMi4yLjRcIiwgXCJfc3RhdGVcIjoge1wiYWRkaW5nXCI6IGZhbHNlLCBcImRiXCI6IFwiZGVmYXVsdFwiLCBcInB5L29iamVjdFwiOiBcImRqYW5nby5kYi5tb2RlbHMuYmFzZS5Nb2RlbFN0YXRlXCJ9LCBcImNyZWF0ZV90aW1lXCI6IHtcIl9fcmVkdWNlX19cIjogW3tcInB5L3R5cGVcIjogXCJkYXRldGltZS5kYXRldGltZVwifSwgW1wiQitNR0RnWXlNQVloVWc9PVwiLCB7XCJweS9yZWR1Y2VcIjogW3tcInB5L2Z1bmN0aW9uXCI6IFwicHl0ei5fVVRDXCJ9LCB7XCJweS90dXBsZVwiOiBbXX1dfV1dLCBcInB5L29iamVjdFwiOiBcImRhdGV0aW1lLmRhdGV0aW1lXCJ9LCBcImVtYWlsXCI6IFwibWxfMzEzQDE2My5jb21cIiwgXCJpZFwiOiA1NCwgXCJpc19hY3RpdmVcIjogMSwgXCJpc19kZWxldGVcIjogZmFsc2UsIFwicGFzc3dvcmRcIjogXCJhZG1pbjEyM1wiLCBcInVwZGF0ZV90aW1lXCI6IHtcIl9fcmVkdWNlX19cIjogW3tcInB5L3R5cGVcIjogXCJkYXRldGltZS5kYXRldGltZVwifSwgW1wiQitNR0RnWXlPd0pPQWc9PVwiLCB7XCJweS9pZFwiOiAzfV1dLCBcInB5L29iamVjdFwiOiBcImRhdGV0aW1lLmRhdGV0aW1lXCJ9LCBcInVzZXJuYW1lXCI6IFwiYWRtaW4xXCJ9XX0ifQ==', '2019-09-19 06:45:43.135563');

-- ----------------------------
-- Table structure for pr_address
-- ----------------------------
DROP TABLE IF EXISTS `pr_address`;
CREATE TABLE `pr_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `receiver` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `addr` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `zip_code` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pr_address_user_id_6c1601ca_fk_pr_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `pr_address_user_id_6c1601ca_fk_pr_user_id` FOREIGN KEY (`user_id`) REFERENCES `pr_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pr_address
-- ----------------------------
INSERT INTO `pr_address` VALUES (2, '2019-06-17 06:29:16.754476', '2019-06-17 06:29:16.755476', 0, '小李', '北京市 门头沟区 大于街道', '102300', '18201128276', 1, 54);
INSERT INTO `pr_address` VALUES (14, '2019-10-22 07:29:32.170591', '2019-10-22 07:29:32.170591', 0, '关羽', 'asdasd', '123456', '13019419870', 0, 92);
INSERT INTO `pr_address` VALUES (15, '2019-10-22 07:32:51.767617', '2019-10-22 07:32:51.767617', 0, '关羽', '奥士达大厦', '123456', '13019419870', 1, 92);

-- ----------------------------
-- Table structure for pr_goods
-- ----------------------------
DROP TABLE IF EXISTS `pr_goods`;
CREATE TABLE `pr_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `detail` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pr_goods
-- ----------------------------
INSERT INTO `pr_goods` VALUES (3, '2019-06-18 08:34:14.609253', '2019-09-12 16:54:17.390417', 0, '草莓', '<p><span style=\"margin: 15px; padding: 0px; color: #404040; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\"><span style=\"margin: 0px; padding: 0px; font-size: 36px;\"><span style=\"margin: 0px; padding: 0px; color: #cc0000;\" data-spm-anchor-id=\"a220o.1000855.0.i0.32a95dcd2jxOFI\">此款链接是小颗粒装，一盒28颗小果，四盒45.8元，包邮价格！商用草莓，偏酸请知悉。欢迎奶茶店，蛋糕店，烘培店，前来咨询量大更有优惠</span></span></span></p>');
INSERT INTO `pr_goods` VALUES (4, '2019-06-18 08:35:55.139680', '2019-06-18 08:35:55.139680', 0, '葡萄', '<h2><strong>新鲜如初的甜蜜，甜到心底的幸福滋味~~~</strong></h2>');
INSERT INTO `pr_goods` VALUES (5, '2019-06-18 08:37:07.144512', '2019-06-18 08:37:07.144512', 0, '柠檬', '<p>海南青柠檬，来自海南原产地的美味~~~酸酸甜甜就是我~</p>');
INSERT INTO `pr_goods` VALUES (6, '2019-06-18 08:37:44.495964', '2019-06-18 08:37:44.495964', 0, '奇异果', '<p>奇异果很是美味~~~</p>');
INSERT INTO `pr_goods` VALUES (7, '2019-06-18 08:38:15.160292', '2019-06-18 08:38:15.160292', 0, '青岛野生海捕大青虾', '<p><span style=\"font-size: 10px;\">青岛野生海捕大青虾，真心不错~~~</span></p>');
INSERT INTO `pr_goods` VALUES (8, '2019-06-18 08:38:29.921182', '2019-06-18 08:38:29.921182', 0, '扇贝', '<p>扇贝，很棒！</p>');
INSERT INTO `pr_goods` VALUES (9, '2019-06-18 08:38:44.848884', '2019-06-18 08:38:44.848884', 0, '冷冻秋刀鱼', '<p><span style=\"font-size: 10px;\">冷冻秋刀鱼，不错！</span></p>');
INSERT INTO `pr_goods` VALUES (10, '2019-06-18 08:39:09.064388', '2019-06-18 08:39:09.064388', 0, '基围虾', '<p><span style=\"font-size: 10px;\">基围虾，很鲜很闲~~</span></p>');
INSERT INTO `pr_goods` VALUES (11, '2019-06-18 08:40:46.504122', '2019-06-18 08:40:46.504122', 0, '鲜芒果', '<p><span style=\"font-size: 10px;\">鲜芒果,香甜可口~</span></p>');
INSERT INTO `pr_goods` VALUES (12, '2019-06-18 08:41:12.076399', '2019-06-18 08:41:12.077392', 0, '加州提子', '<p>每一颗都让人回味无穷~</p>');
INSERT INTO `pr_goods` VALUES (13, '2019-06-18 08:41:35.966721', '2019-06-18 08:41:35.966721', 0, '亚马孙牛油果', '<p><span style=\"font-size: 10px;\">亚马孙牛油果，真心实惠~~~</span></p>');
INSERT INTO `pr_goods` VALUES (14, '2019-06-18 08:42:11.047523', '2019-09-11 17:36:10.599083', 0, '螃蟹', '<p><span style=\"font-size: 10px;\">螃蟹，每只都是那么大~~</span></p>');
INSERT INTO `pr_goods` VALUES (15, '2019-06-18 08:42:47.902204', '2019-09-12 10:54:42.094116', 0, '鱿鱼', '<p>又大又新鲜的大鱿鱼！~</p>');
INSERT INTO `pr_goods` VALUES (16, '2019-09-11 17:01:10.247191', '2019-09-11 17:01:10.247232', 0, '猪肉', '<p>很新鲜，五花三层~</p>');
INSERT INTO `pr_goods` VALUES (17, '2019-09-11 17:01:37.922782', '2019-09-11 17:01:37.922818', 0, '牛肉', '<p>货真价实，吃了后就近冲天~</p>');
INSERT INTO `pr_goods` VALUES (18, '2019-09-11 17:02:08.394699', '2019-09-11 17:02:08.394742', 0, '羊肉', '<p>草原新鲜羔羊，假一罚十！</p>');
INSERT INTO `pr_goods` VALUES (19, '2019-09-11 17:02:46.887926', '2019-09-11 17:02:46.887970', 0, '鸡肉', '<p>肉质鲜美，还原大自然最初的感觉~~</p>');
INSERT INTO `pr_goods` VALUES (20, '2019-09-11 17:39:01.764721', '2019-09-11 17:39:01.764758', 0, '三文鱼', '<p>油光锃亮，肥而不腻!</p>');
INSERT INTO `pr_goods` VALUES (21, '2019-09-12 11:17:00.260260', '2019-09-12 11:17:00.260299', 0, '野生乌鸡', '<p>拒绝人工喂养，纯天然~~</p>');
INSERT INTO `pr_goods` VALUES (22, '2019-09-12 11:17:43.382973', '2019-09-12 11:17:43.383025', 0, '鲜嫩大羊腰', '<p>烧烤至尊，价格公道！</p>');
INSERT INTO `pr_goods` VALUES (23, '2019-09-12 11:18:21.871236', '2019-09-12 11:18:21.871287', 0, '驴肉', '<p>天上龙肉，地上驴肉，啥都不说了，自己品尝吧！~~</p>');
INSERT INTO `pr_goods` VALUES (24, '2019-09-12 11:36:54.871511', '2019-09-12 11:36:54.871557', 0, '鹌鹑蛋', '<p>小桥玲玲，回味无穷~</p>');
INSERT INTO `pr_goods` VALUES (25, '2019-09-12 11:37:27.853292', '2019-09-12 11:37:27.853328', 0, '松花蛋', '<p>姜汁松花蛋，越吃越好吃~</p>');
INSERT INTO `pr_goods` VALUES (26, '2019-09-12 11:38:05.041700', '2019-09-12 11:38:05.041747', 0, '柴鸡蛋', '<p>天然纯正，回归自然~</p>');
INSERT INTO `pr_goods` VALUES (27, '2019-09-12 11:38:28.069992', '2019-09-12 11:38:28.070032', 0, '咸鸭蛋', '<p>咸鸭蛋就米饭，香！</p>');
INSERT INTO `pr_goods` VALUES (28, '2019-09-12 11:44:27.827787', '2019-09-12 11:44:27.827832', 0, '乡巴佬鸡蛋', '<p>速食食品，老幼皆宜！</p>');
INSERT INTO `pr_goods` VALUES (29, '2019-09-12 11:44:39.746644', '2019-09-12 11:44:39.746688', 0, '茶叶蛋', '<p>老北京的最爱！</p>');
INSERT INTO `pr_goods` VALUES (30, '2019-09-12 11:44:58.581922', '2019-09-12 11:44:58.581964', 0, '鹌鹑蛋罐头', '<p>可以连皮一起吃的罐头~~</p>');
INSERT INTO `pr_goods` VALUES (31, '2019-09-12 12:02:22.951401', '2019-09-12 12:02:22.951445', 0, '胡萝卜', '<p>&nbsp;富含丰富的维生素，对眼睛老好了~</p>');
INSERT INTO `pr_goods` VALUES (32, '2019-09-12 12:02:43.271429', '2019-09-12 12:02:43.271473', 0, '紫甘蓝', '<p>蔬菜沙拉，必不可少！</p>');
INSERT INTO `pr_goods` VALUES (33, '2019-09-12 12:03:08.251219', '2019-09-12 12:03:08.251264', 0, '荷兰豆', '<p>蒜蓉荷兰豆，想想就香！</p>');
INSERT INTO `pr_goods` VALUES (34, '2019-09-12 12:03:23.913926', '2019-09-12 12:03:23.913971', 0, '生菜', '<p>多吃生菜，身体健康~</p>');
INSERT INTO `pr_goods` VALUES (35, '2019-09-12 12:04:07.486966', '2019-09-12 12:04:07.487009', 0, '茼蒿', '<p>不知可以涮火锅，也可爆炒~</p>');
INSERT INTO `pr_goods` VALUES (36, '2019-09-12 12:04:28.186398', '2019-09-12 12:04:28.186440', 0, '秋葵', '<p>蔬菜中的王者！</p>');
INSERT INTO `pr_goods` VALUES (37, '2019-09-12 12:04:57.098959', '2019-09-12 12:04:57.098997', 0, '辣椒', '<p>看到鲜红的辣椒，想起四川峨眉山的素贞了么~~</p>');
INSERT INTO `pr_goods` VALUES (38, '2019-09-12 13:12:41.667461', '2019-09-12 13:12:41.667506', 0, '可爱多', '<p>全世界的小朋友都爱它~</p>');
INSERT INTO `pr_goods` VALUES (39, '2019-09-12 13:12:58.162595', '2019-09-12 13:12:58.162635', 0, '梦龙', '<p>优雅成熟的冰品首选~</p>');
INSERT INTO `pr_goods` VALUES (40, '2019-09-12 13:13:17.420915', '2019-09-12 13:13:17.420956', 0, '八喜', '<p>看着就喜庆的冰激凌~</p>');
INSERT INTO `pr_goods` VALUES (41, '2019-09-12 13:13:36.290758', '2019-09-12 13:13:36.290805', 0, '千层雪', '<p>和路雪经典老品牌~不多说了~</p>');
INSERT INTO `pr_goods` VALUES (42, '2019-09-12 13:13:52.429756', '2019-09-12 13:13:52.429800', 0, '雪人', '<p>重试童年的回忆~</p>');
INSERT INTO `pr_goods` VALUES (43, '2019-09-12 13:14:15.097132', '2019-09-12 13:14:15.097174', 0, '火炬', '<p>小时候的我最爱她，妈妈的味道~</p>');
INSERT INTO `pr_goods` VALUES (44, '2019-09-12 13:14:45.282450', '2019-09-12 13:14:45.282497', 0, '双棒', '<p>拉近朋友间关系的必备雪糕，一份钱两份吃！</p>');

-- ----------------------------
-- Table structure for pr_goods_image
-- ----------------------------
DROP TABLE IF EXISTS `pr_goods_image`;
CREATE TABLE `pr_goods_image`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sku_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pr_goods_image_sku_id_8c69f6c6_fk_pr_goods_sku_id`(`sku_id`) USING BTREE,
  CONSTRAINT `pr_goods_image_sku_id_8c69f6c6_fk_pr_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `pr_goods_sku` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pr_goods_image
-- ----------------------------
INSERT INTO `pr_goods_image` VALUES (1, '2019-09-12 15:58:47.312870', '2019-09-12 15:58:47.312911', 0, 'goods_image/草莓2.png', 3);
INSERT INTO `pr_goods_image` VALUES (2, '2019-09-12 15:58:57.539331', '2019-09-12 15:58:57.539371', 0, 'goods_image/草莓3.png', 3);
INSERT INTO `pr_goods_image` VALUES (3, '2019-09-12 16:34:55.430122', '2019-09-12 16:34:55.430161', 0, 'goods_image/盒装草莓2.png', 17);
INSERT INTO `pr_goods_image` VALUES (4, '2019-09-12 16:35:17.137077', '2019-09-12 16:35:17.137117', 0, 'goods_image/盒装草莓3.png', 17);
INSERT INTO `pr_goods_image` VALUES (5, '2019-09-12 16:39:52.258427', '2019-09-12 16:40:39.638274', 0, 'goods_image/特价草莓2.png', 18);
INSERT INTO `pr_goods_image` VALUES (6, '2019-09-12 16:40:02.749238', '2019-09-12 16:40:31.566834', 0, 'goods_image/特价草莓3.png', 18);

-- ----------------------------
-- Table structure for pr_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `pr_goods_sku`;
CREATE TABLE `pr_goods_sku`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `unite` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stock` int(11) NOT NULL,
  `sales` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pr_goods_sku_goods_id_36e2132f_fk_pr_goods_id`(`goods_id`) USING BTREE,
  INDEX `pr_goods_sku_type_id_3fecbb6c_fk_pr_goods_type_id`(`type_id`) USING BTREE,
  CONSTRAINT `pr_goods_sku_goods_id_36e2132f_fk_pr_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `pr_goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pr_goods_sku_type_id_3fecbb6c_fk_pr_goods_type_id` FOREIGN KEY (`type_id`) REFERENCES `pr_goods_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pr_goods_sku
-- ----------------------------
INSERT INTO `pr_goods_sku` VALUES (3, '2019-06-18 08:50:53.027395', '2019-09-11 17:33:09.513150', 0, '草莓', '草莓的简介', 30.00, '500g', 'goods_sku/草莓_0zOz1j0.png', 46, 86, 1, 3, 3);
INSERT INTO `pr_goods_sku` VALUES (4, '2019-06-18 09:31:28.602794', '2019-09-11 17:33:30.984809', 0, '葡萄', '葡萄的简介', 16.70, '350g', 'goods_sku/葡萄.png', 91, 38, 1, 4, 3);
INSERT INTO `pr_goods_sku` VALUES (5, '2019-06-18 09:32:47.770284', '2019-09-11 17:34:00.251396', 0, '柠檬', '柠檬的简介', 27.00, '450g', 'goods_sku/柠檬.png', 34, 32, 1, 5, 3);
INSERT INTO `pr_goods_sku` VALUES (6, '2019-06-18 09:34:40.032187', '2019-09-11 17:34:43.410321', 0, '奇异果', '奇异果的简介', 38.80, '320g', 'goods_sku/奇异果.png', 82, 73, 1, 6, 3);
INSERT INTO `pr_goods_sku` VALUES (7, '2019-06-18 09:35:31.552011', '2019-09-12 11:14:57.632355', 0, '青岛野生海捕大青虾', '青岛野生海捕大青虾的简介', 56.00, '200g', 'goods_sku/大青虾.png', 51, 60, 1, 7, 4);
INSERT INTO `pr_goods_sku` VALUES (8, '2019-06-18 09:36:05.204337', '2019-09-12 11:14:36.866676', 0, '扇贝', '扇贝的简介', 44.60, '600g', 'goods_sku/扇贝.png', 14, 12, 1, 8, 4);
INSERT INTO `pr_goods_sku` VALUES (9, '2019-06-18 09:36:39.266129', '2019-09-12 11:14:19.268707', 0, '冷冻秋刀鱼', '冷冻秋刀鱼的简介', 54.00, '300g', 'goods_sku/秋刀鱼.png', 23, 33, 1, 9, 4);
INSERT INTO `pr_goods_sku` VALUES (10, '2019-06-18 09:37:16.651481', '2019-09-12 11:14:04.858652', 0, '基围虾', '基围虾的简介', 88.00, '335g', 'goods_sku/基围虾.png', 70, 62, 1, 10, 4);
INSERT INTO `pr_goods_sku` VALUES (11, '2019-06-18 09:40:02.910085', '2019-09-12 11:46:08.867084', 0, '柴鸡蛋', '柴鸡蛋的简介', 22.00, '350g', 'goods_sku/柴鸡蛋.png', 55, 33, 1, 26, 6);
INSERT INTO `pr_goods_sku` VALUES (12, '2019-06-21 08:23:59.049585', '2019-09-11 17:20:10.369043', 0, '鲜芒果', '鲜芒果的简介', 23.00, '450g', 'goods_sku/鲜芒果.png', 54, 44, 1, 11, 3);
INSERT INTO `pr_goods_sku` VALUES (13, '2019-06-21 08:24:38.797145', '2019-09-11 17:19:54.386907', 0, '加州提子', '加州提子的简介', 33.40, '310g', 'goods_sku/加州提子.png', 44, 4, 1, 12, 3);
INSERT INTO `pr_goods_sku` VALUES (14, '2019-06-21 08:25:24.748780', '2019-09-11 17:19:25.833382', 0, '亚马孙牛油果', '亚马孙牛油果的简介', 55.00, '55g', 'goods_sku/亚马孙牛油果.png', 12, 2, 1, 13, 3);
INSERT INTO `pr_goods_sku` VALUES (15, '2019-06-21 08:26:05.006868', '2019-09-12 11:06:54.383854', 0, '阳澄湖大闸蟹', '阳澄湖大闸蟹的简介', 88.00, '233g', 'goods_sku/大闸蟹.png', 73, 38, 1, 14, 4);
INSERT INTO `pr_goods_sku` VALUES (16, '2019-06-21 08:26:37.668155', '2019-09-12 11:05:21.179201', 0, '深海大鱿鱼', '深海大鱿鱼的简介', 44.00, '444g', 'goods_sku/鱿鱼.png', 23, 3, 1, 15, 4);
INSERT INTO `pr_goods_sku` VALUES (17, '2019-06-22 00:24:44.592860', '2019-06-22 00:24:44.592860', 0, '盒装草莓', '盒装草莓的简介', 55.00, '200g', 'goods_sku/goods_detail.jpg', 66, 6, 1, 3, 3);
INSERT INTO `pr_goods_sku` VALUES (18, '2019-06-22 06:53:39.368262', '2019-09-12 16:44:57.879389', 0, '特价草莓', '特价草莓的简介', 22.00, '200g', 'goods_sku/特价草莓.png', 1, 0, 1, 3, 3);
INSERT INTO `pr_goods_sku` VALUES (20, '2019-09-11 17:03:42.155972', '2019-09-11 17:03:42.156006', 0, '猪肉片', '猪肉片的简介', 40.00, '100', 'goods_sku/猪肉.png', 13, 44, 1, 16, 5);
INSERT INTO `pr_goods_sku` VALUES (21, '2019-09-11 17:04:30.462602', '2019-09-11 17:04:30.462635', 0, '新鲜牛肉', '新鲜牛头的简介', 44.00, '55', 'goods_sku/牛肉.png', 55, 0, 1, 17, 5);
INSERT INTO `pr_goods_sku` VALUES (22, '2019-09-11 17:05:28.295752', '2019-09-11 17:05:28.295787', 0, '草原羔羊', '草原羔羊的简介', 66.00, '67', 'goods_sku/羊肉.png', 55, 0, 1, 18, 5);
INSERT INTO `pr_goods_sku` VALUES (23, '2019-09-11 17:06:17.428575', '2019-09-11 17:06:17.428608', 0, '优质肉鸡', '优质肉鸡的简介', 34.00, '33', 'goods_sku/鸡肉.png', 56, 0, 1, 19, 5);
INSERT INTO `pr_goods_sku` VALUES (24, '2019-09-12 10:57:21.263332', '2019-09-12 11:02:48.258693', 0, '优质三文鱼', '优质三文鱼的简介', 55.00, '55', 'goods_sku/三文鱼.png', 55, 11, 1, 20, 4);
INSERT INTO `pr_goods_sku` VALUES (25, '2019-09-12 11:20:14.018957', '2019-09-12 11:20:14.018996', 0, '野生乌鸡', '野生乌鸡的简介', 39.00, '33', 'goods_sku/乌鸡.png', 49, 12, 1, 21, 5);
INSERT INTO `pr_goods_sku` VALUES (26, '2019-09-12 11:23:18.797966', '2019-09-12 11:23:18.798005', 0, '驴肉', '驴肉的简介', 88.00, '34', 'goods_sku/驴肉.png', 34, 13, 1, 23, 5);
INSERT INTO `pr_goods_sku` VALUES (27, '2019-09-12 11:26:20.016681', '2019-09-12 11:26:20.016725', 0, '鲜嫩大羊腰', '鲜嫩大羊腰的简介', 24.00, '18', 'goods_sku/大羊腰子.png', 56, 22, 1, 22, 5);
INSERT INTO `pr_goods_sku` VALUES (28, '2019-09-12 11:46:51.924246', '2019-09-12 11:46:51.924279', 0, '松花蛋', '松花蛋的简介', 13.00, '10', 'goods_sku/松花蛋.png', 43, 3, 1, 25, 6);
INSERT INTO `pr_goods_sku` VALUES (29, '2019-09-12 11:47:45.645806', '2019-09-12 11:47:45.645844', 0, '鹌鹑蛋', '鹌鹑蛋的简介', 15.00, '24', 'goods_sku/鹌鹑蛋.png', 12, 1, 1, 24, 6);
INSERT INTO `pr_goods_sku` VALUES (30, '2019-09-12 11:48:40.459393', '2019-09-12 11:48:40.459432', 0, '咸鸭蛋', '咸鸭蛋的简介', 18.00, '9', 'goods_sku/咸鸭蛋.png', 19, 2, 1, 27, 6);
INSERT INTO `pr_goods_sku` VALUES (31, '2019-09-12 11:49:24.425446', '2019-09-12 11:49:24.425483', 0, '乡巴佬鸡蛋', '乡巴佬鸡蛋的简介', 14.00, '4', 'goods_sku/乡巴佬鸡蛋.png', 88, 28, 1, 28, 6);
INSERT INTO `pr_goods_sku` VALUES (32, '2019-09-12 11:50:02.843325', '2019-09-12 11:50:02.843360', 0, '茶叶蛋', '茶叶蛋的简介', 13.00, '5', 'goods_sku/茶叶蛋.png', 34, 5, 1, 29, 6);
INSERT INTO `pr_goods_sku` VALUES (33, '2019-09-12 11:50:55.526129', '2019-09-12 11:50:55.526163', 0, '鹌鹑蛋罐头', '鹌鹑蛋罐头的简介', 13.00, '50', 'goods_sku/鹌鹑蛋罐头.png', 34, 5, 1, 30, 6);
INSERT INTO `pr_goods_sku` VALUES (34, '2019-09-12 13:00:46.582783', '2019-09-12 13:00:46.582819', 0, '胡萝卜', '胡萝卜的简介', 6.00, '100', 'goods_sku/胡萝卜.png', 51, 6, 1, 31, 7);
INSERT INTO `pr_goods_sku` VALUES (35, '2019-09-12 13:01:38.701820', '2019-09-12 13:01:38.701855', 0, '紫甘蓝', '紫甘蓝的简介', 11.00, '80', 'goods_sku/紫甘蓝.png', 27, 7, 1, 32, 7);
INSERT INTO `pr_goods_sku` VALUES (36, '2019-09-12 13:02:11.495363', '2019-09-12 13:02:11.495410', 0, '荷兰豆', '荷兰豆的简介', 4.00, '30', 'goods_sku/荷兰豆.png', 34, 2, 1, 33, 7);
INSERT INTO `pr_goods_sku` VALUES (37, '2019-09-12 13:03:03.891974', '2019-09-12 13:03:03.892011', 0, '原叶生菜', '原叶生菜的交接', 8.00, '20', 'goods_sku/生菜.png', 44, 4, 1, 34, 7);
INSERT INTO `pr_goods_sku` VALUES (38, '2019-09-12 13:03:48.026465', '2019-09-12 13:03:48.026502', 0, '茼蒿', '茼蒿的简介', 54.00, '40', 'goods_sku/茼蒿.png', 43, 3, 1, 35, 7);
INSERT INTO `pr_goods_sku` VALUES (39, '2019-09-12 13:04:26.049233', '2019-09-12 13:04:26.049270', 0, '秋葵', '秋葵的简介', 55.00, '50', 'goods_sku/秋葵.png', 32, 10, 1, 36, 7);
INSERT INTO `pr_goods_sku` VALUES (40, '2019-09-12 13:05:02.206883', '2019-09-12 13:05:02.206919', 0, '辣椒', '辣椒的简介', 65.00, '60', 'goods_sku/辣椒.png', 54, 5, 1, 37, 7);
INSERT INTO `pr_goods_sku` VALUES (41, '2019-09-12 13:18:11.530509', '2019-09-12 13:18:11.530548', 0, '可爱多', '可爱多的简介', 5.00, '8', 'goods_sku/可爱多.png', 66, 6, 1, 38, 8);
INSERT INTO `pr_goods_sku` VALUES (42, '2019-09-12 13:20:06.586424', '2019-09-12 13:20:06.586459', 0, '梦龙', '梦龙的简介', 33.00, '10', 'goods_sku/梦龙.png', 57, 9, 1, 39, 8);
INSERT INTO `pr_goods_sku` VALUES (43, '2019-09-12 13:21:58.559338', '2019-09-12 13:21:58.559381', 0, '八喜', '八喜的简介', 23.00, '450', 'goods_sku/八喜.png', 40, 10, 1, 40, 8);
INSERT INTO `pr_goods_sku` VALUES (44, '2019-09-12 13:23:36.138330', '2019-09-12 13:30:41.606050', 0, '千层雪', '千层雪的简介', 8.00, '80', 'goods_sku/千层雪.png', 34, 2, 1, 41, 8);
INSERT INTO `pr_goods_sku` VALUES (45, '2019-09-12 13:25:10.279391', '2019-09-12 13:25:10.279427', 0, '雪人', '雪人的简介', 3.00, '45', 'goods_sku/雪人.png', 88, 38, 1, 42, 8);
INSERT INTO `pr_goods_sku` VALUES (46, '2019-09-12 13:26:39.395408', '2019-09-12 13:26:39.395444', 0, '火炬', '火炬的简介', 4.00, '30', 'goods_sku/火炬.png', 67, 7, 1, 43, 8);
INSERT INTO `pr_goods_sku` VALUES (47, '2019-09-12 13:28:04.182515', '2019-09-12 13:28:04.182550', 0, '双棒', '双棒的简介', 49.00, '25', 'goods_sku/双棒.png', 34, 4, 1, 44, 8);

-- ----------------------------
-- Table structure for pr_goods_type
-- ----------------------------
DROP TABLE IF EXISTS `pr_goods_type`;
CREATE TABLE `pr_goods_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `logo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pr_goods_type
-- ----------------------------
INSERT INTO `pr_goods_type` VALUES (3, '2019-06-18 08:24:03.031801', '2019-09-10 12:32:29.354153', 0, '新鲜水果', 'fruit', 'goos_type/banner01.jpg');
INSERT INTO `pr_goods_type` VALUES (4, '2019-06-18 08:25:10.972438', '2019-06-18 09:50:37.988566', 0, '海鲜水产', 'seafood', 'goos_type/banner02.jpg');
INSERT INTO `pr_goods_type` VALUES (5, '2019-06-18 08:25:35.623353', '2019-06-18 09:50:45.827561', 0, '猪牛羊肉', 'meet', 'goos_type/banner03.jpg');
INSERT INTO `pr_goods_type` VALUES (6, '2019-06-18 08:26:10.460482', '2019-06-18 09:50:54.266980', 0, '禽类蛋品', 'egg', 'goos_type/banner04.jpg');
INSERT INTO `pr_goods_type` VALUES (7, '2019-06-18 08:26:32.887237', '2019-06-18 09:51:02.368183', 0, '新鲜蔬菜', 'vegetables', 'goos_type/banner05.jpg');
INSERT INTO `pr_goods_type` VALUES (8, '2019-06-18 08:27:39.593932', '2019-06-18 09:51:10.910846', 0, '速冻食品', 'ice', 'goos_type/banner06.jpg');

-- ----------------------------
-- Table structure for pr_index_banner
-- ----------------------------
DROP TABLE IF EXISTS `pr_index_banner`;
CREATE TABLE `pr_index_banner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `index` smallint(6) NOT NULL,
  `sku_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pr_index_banner_sku_id_c0ce499f_fk_pr_goods_sku_id`(`sku_id`) USING BTREE,
  CONSTRAINT `pr_index_banner_sku_id_c0ce499f_fk_pr_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `pr_goods_sku` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pr_index_banner
-- ----------------------------
INSERT INTO `pr_index_banner` VALUES (4, '2019-06-18 10:06:40.389528', '2019-09-09 13:22:54.287065', 0, 'index_banner/slide.jpg', 0, 3);
INSERT INTO `pr_index_banner` VALUES (5, '2019-06-18 10:07:15.505009', '2019-06-18 10:07:15.506009', 0, 'index_banner/slide02.jpg', 1, 5);
INSERT INTO `pr_index_banner` VALUES (6, '2019-06-18 10:08:35.405124', '2019-06-18 10:08:35.405124', 0, 'index_banner/slide03.jpg', 2, 8);
INSERT INTO `pr_index_banner` VALUES (7, '2019-06-18 10:08:50.050967', '2019-06-18 10:08:50.050967', 0, 'index_banner/slide04.jpg', 3, 10);

-- ----------------------------
-- Table structure for pr_index_promotion
-- ----------------------------
DROP TABLE IF EXISTS `pr_index_promotion`;
CREATE TABLE `pr_index_promotion`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `index` smallint(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pr_index_promotion
-- ----------------------------
INSERT INTO `pr_index_promotion` VALUES (3, '2019-06-21 00:44:29.073601', '2019-07-16 01:33:22.277067', 0, '吃货打折', 'http://www.baidu.com', 'promo_banner/adv01.jpg', 0);
INSERT INTO `pr_index_promotion` VALUES (4, '2019-06-21 00:44:43.791135', '2019-07-16 01:33:12.703374', 0, '零食保健', 'http://www.jd.com', 'promo_banner/adv02.jpg', 1);

-- ----------------------------
-- Table structure for pr_index_type_goods
-- ----------------------------
DROP TABLE IF EXISTS `pr_index_type_goods`;
CREATE TABLE `pr_index_type_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `display_type` smallint(6) NOT NULL,
  `index` smallint(6) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pr_index_type_goods_sku_id_8f54bdc4_fk_pr_goods_sku_id`(`sku_id`) USING BTREE,
  INDEX `pr_index_type_goods_type_id_007858a0_fk_pr_goods_type_id`(`type_id`) USING BTREE,
  CONSTRAINT `pr_index_type_goods_sku_id_8f54bdc4_fk_pr_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `pr_goods_sku` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pr_index_type_goods_type_id_007858a0_fk_pr_goods_type_id` FOREIGN KEY (`type_id`) REFERENCES `pr_goods_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pr_index_type_goods
-- ----------------------------
INSERT INTO `pr_index_type_goods` VALUES (5, '2019-06-18 09:58:03.630362', '2019-06-18 09:58:03.631346', 0, 1, 0, 3, 3);
INSERT INTO `pr_index_type_goods` VALUES (6, '2019-06-18 09:58:20.196404', '2019-06-18 10:03:25.565414', 0, 1, 1, 4, 3);
INSERT INTO `pr_index_type_goods` VALUES (7, '2019-06-18 09:58:28.706544', '2019-06-18 10:03:32.479789', 0, 1, 2, 5, 3);
INSERT INTO `pr_index_type_goods` VALUES (8, '2019-06-18 09:58:34.367284', '2019-06-18 10:03:38.817814', 0, 1, 3, 6, 3);
INSERT INTO `pr_index_type_goods` VALUES (9, '2019-06-18 09:58:53.887913', '2019-06-18 09:58:53.887913', 0, 1, 0, 7, 4);
INSERT INTO `pr_index_type_goods` VALUES (10, '2019-06-18 09:58:58.882708', '2019-06-18 10:04:31.822215', 0, 1, 1, 8, 4);
INSERT INTO `pr_index_type_goods` VALUES (11, '2019-06-18 09:59:05.366687', '2019-06-18 10:04:57.230495', 0, 1, 2, 9, 4);
INSERT INTO `pr_index_type_goods` VALUES (12, '2019-06-18 09:59:10.533304', '2019-09-12 13:33:11.621059', 0, 0, 3, 10, 4);
INSERT INTO `pr_index_type_goods` VALUES (13, '2019-06-18 09:59:57.559159', '2019-06-21 08:27:32.087966', 0, 0, 0, 12, 3);
INSERT INTO `pr_index_type_goods` VALUES (14, '2019-06-18 10:00:07.007506', '2019-09-11 17:06:41.733694', 0, 1, 0, 20, 5);
INSERT INTO `pr_index_type_goods` VALUES (15, '2019-06-18 10:00:11.333824', '2019-09-11 17:06:58.336312', 0, 1, 0, 21, 5);
INSERT INTO `pr_index_type_goods` VALUES (16, '2019-06-18 10:00:30.646051', '2019-09-11 17:07:08.649076', 0, 1, 0, 22, 5);
INSERT INTO `pr_index_type_goods` VALUES (18, '2019-06-18 10:01:26.794115', '2019-09-12 11:54:42.936045', 0, 1, 0, 11, 6);
INSERT INTO `pr_index_type_goods` VALUES (19, '2019-06-18 10:01:34.025994', '2019-09-12 11:54:25.825606', 0, 1, 0, 28, 6);
INSERT INTO `pr_index_type_goods` VALUES (20, '2019-06-18 10:01:46.280986', '2019-09-12 11:55:02.720059', 0, 1, 0, 30, 6);
INSERT INTO `pr_index_type_goods` VALUES (21, '2019-06-18 10:01:58.794818', '2019-09-12 13:28:37.258632', 0, 1, 0, 41, 8);
INSERT INTO `pr_index_type_goods` VALUES (22, '2019-06-18 10:02:14.154135', '2019-09-12 11:55:33.469352', 0, 1, 0, 29, 6);
INSERT INTO `pr_index_type_goods` VALUES (23, '2019-06-18 10:02:18.826921', '2019-09-12 13:05:23.430635', 0, 1, 0, 34, 7);
INSERT INTO `pr_index_type_goods` VALUES (24, '2019-06-18 10:02:23.409255', '2019-09-12 11:56:59.919521', 0, 0, 0, 32, 6);
INSERT INTO `pr_index_type_goods` VALUES (25, '2019-06-18 10:02:28.959245', '2019-09-12 11:56:37.595430', 0, 0, 0, 33, 6);
INSERT INTO `pr_index_type_goods` VALUES (26, '2019-06-18 10:02:32.814650', '2019-09-12 11:56:19.786176', 0, 0, 0, 31, 6);
INSERT INTO `pr_index_type_goods` VALUES (27, '2019-06-18 10:02:36.811186', '2019-09-12 11:28:15.654662', 0, 0, 0, 27, 5);
INSERT INTO `pr_index_type_goods` VALUES (28, '2019-06-18 10:02:41.331939', '2019-09-12 11:28:03.268045', 0, 0, 0, 25, 5);
INSERT INTO `pr_index_type_goods` VALUES (29, '2019-06-18 10:02:47.359545', '2019-09-12 11:27:42.884110', 0, 0, 0, 26, 5);
INSERT INTO `pr_index_type_goods` VALUES (30, '2019-06-21 08:27:39.199126', '2019-06-21 08:27:39.199126', 0, 0, 1, 13, 3);
INSERT INTO `pr_index_type_goods` VALUES (31, '2019-06-21 08:27:53.224562', '2019-06-21 08:27:53.224562', 0, 0, 2, 14, 3);
INSERT INTO `pr_index_type_goods` VALUES (32, '2019-06-21 08:28:03.151813', '2019-09-12 13:33:18.378072', 0, 1, 0, 15, 4);
INSERT INTO `pr_index_type_goods` VALUES (33, '2019-06-21 08:28:12.115293', '2019-09-12 10:58:47.858111', 0, 0, 1, 16, 4);
INSERT INTO `pr_index_type_goods` VALUES (34, '2019-06-21 08:28:55.144593', '2019-09-11 17:08:51.730327', 0, 1, 0, 23, 5);
INSERT INTO `pr_index_type_goods` VALUES (35, '2019-06-21 08:29:50.901251', '2019-09-12 10:59:19.949991', 0, 0, 0, 24, 4);
INSERT INTO `pr_index_type_goods` VALUES (37, '2019-09-12 13:05:45.597099', '2019-09-12 13:05:45.597138', 0, 1, 0, 35, 7);
INSERT INTO `pr_index_type_goods` VALUES (38, '2019-09-12 13:05:57.345900', '2019-09-12 13:05:57.345941', 0, 1, 0, 36, 7);
INSERT INTO `pr_index_type_goods` VALUES (39, '2019-09-12 13:06:07.630809', '2019-09-12 13:06:07.630854', 0, 1, 0, 37, 7);
INSERT INTO `pr_index_type_goods` VALUES (40, '2019-09-12 13:06:20.130109', '2019-09-12 13:06:20.130149', 0, 0, 0, 38, 7);
INSERT INTO `pr_index_type_goods` VALUES (41, '2019-09-12 13:06:31.729114', '2019-09-12 13:06:31.729155', 0, 0, 0, 39, 7);
INSERT INTO `pr_index_type_goods` VALUES (42, '2019-09-12 13:06:43.666010', '2019-09-12 13:06:43.666051', 0, 0, 0, 40, 7);
INSERT INTO `pr_index_type_goods` VALUES (43, '2019-09-12 13:28:56.420582', '2019-09-12 13:28:56.420622', 0, 1, 0, 42, 8);
INSERT INTO `pr_index_type_goods` VALUES (44, '2019-09-12 13:29:05.460353', '2019-09-12 13:29:05.460393', 0, 1, 0, 43, 8);
INSERT INTO `pr_index_type_goods` VALUES (45, '2019-09-12 13:29:15.080049', '2019-09-12 13:29:15.080089', 0, 1, 0, 44, 8);
INSERT INTO `pr_index_type_goods` VALUES (46, '2019-09-12 13:29:26.988988', '2019-09-12 13:29:26.989029', 0, 0, 0, 45, 8);
INSERT INTO `pr_index_type_goods` VALUES (47, '2019-09-12 13:29:39.699157', '2019-09-12 13:29:39.699195', 0, 0, 0, 46, 8);
INSERT INTO `pr_index_type_goods` VALUES (48, '2019-09-12 13:29:53.994584', '2019-09-12 13:29:53.994624', 0, 0, 0, 47, 8);

-- ----------------------------
-- Table structure for pr_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `pr_order_goods`;
CREATE TABLE `pr_order_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `count` int(11) NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `comment` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sku_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pr_order_goods_order_id_7e56f36d_fk_pr_order_info_order_id`(`order_id`) USING BTREE,
  INDEX `pr_order_goods_sku_id_92743faa_fk_pr_goods_sku_id`(`sku_id`) USING BTREE,
  CONSTRAINT `pr_order_goods_order_id_7e56f36d_fk_pr_order_info_order_id` FOREIGN KEY (`order_id`) REFERENCES `pr_order_info` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pr_order_goods_sku_id_92743faa_fk_pr_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `pr_goods_sku` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pr_order_goods
-- ----------------------------
INSERT INTO `pr_order_goods` VALUES (67, '2019-07-20 07:17:38.369408', '2019-07-21 11:19:55.164819', 0, 3, 16.70, '这个葡萄不好吃啊~~', '2019072015173854', 4);
INSERT INTO `pr_order_goods` VALUES (68, '2019-07-20 07:17:38.810463', '2019-07-21 11:19:55.358887', 0, 1, 38.80, '这个奇异果好奇异啊~~', '2019072015173854', 6);
INSERT INTO `pr_order_goods` VALUES (69, '2019-10-22 07:51:57.290043', '2019-10-22 07:51:57.290043', 0, 2, 54.00, '', '2019102215515792', 9);
INSERT INTO `pr_order_goods` VALUES (70, '2019-10-22 07:53:21.600208', '2019-10-22 07:53:21.600208', 0, 3, 30.00, '', '2019102215532192', 3);
INSERT INTO `pr_order_goods` VALUES (71, '2019-10-22 11:33:14.193456', '2019-10-22 11:33:14.193456', 0, 4, 30.00, '', '2019102219331492', 3);
INSERT INTO `pr_order_goods` VALUES (72, '2019-10-22 12:38:32.167108', '2019-10-22 12:38:32.167108', 0, 1, 16.70, '', '2019102220383292', 4);

-- ----------------------------
-- Table structure for pr_order_info
-- ----------------------------
DROP TABLE IF EXISTS `pr_order_info`;
CREATE TABLE `pr_order_info`  (
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `order_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pay_method` smallint(6) NOT NULL,
  `total_count` int(11) NOT NULL,
  `total_price` decimal(10, 2) NOT NULL,
  `transit_price` decimal(10, 2) NOT NULL,
  `order_status` smallint(6) NOT NULL,
  `trade_on` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `addr_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `pr_order_info_addr_id_394120ee_fk_pr_address_id`(`addr_id`) USING BTREE,
  INDEX `pr_order_info_user_id_fd5eb38c_fk_pr_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `pr_order_info_addr_id_394120ee_fk_pr_address_id` FOREIGN KEY (`addr_id`) REFERENCES `pr_address` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pr_order_info_user_id_fd5eb38c_fk_pr_user_id` FOREIGN KEY (`user_id`) REFERENCES `pr_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pr_order_info
-- ----------------------------
INSERT INTO `pr_order_info` VALUES ('2019-07-20 07:17:38.211389', '2019-07-21 11:19:55.402893', 0, '2019072015173854', 3, 4, 88.90, 10.00, 5, '', 2, 54);
INSERT INTO `pr_order_info` VALUES ('2019-10-22 07:51:57.270057', '2019-10-22 07:51:57.270057', 0, '2019102215515792', 1, 2, 108.00, 10.00, 1, '', 15, 92);
INSERT INTO `pr_order_info` VALUES ('2019-10-22 07:53:21.584216', '2019-10-22 07:53:21.584216', 0, '2019102215532192', 1, 3, 90.00, 10.00, 1, '', 15, 92);
INSERT INTO `pr_order_info` VALUES ('2019-10-22 11:33:14.157479', '2019-10-22 11:33:14.157479', 0, '2019102219331492', 3, 4, 120.00, 10.00, 1, '', 15, 92);
INSERT INTO `pr_order_info` VALUES ('2019-10-22 12:38:32.142124', '2019-10-22 12:38:32.142124', 0, '2019102220383292', 3, 1, 16.70, 10.00, 1, '', 15, 92);

-- ----------------------------
-- Table structure for pr_user
-- ----------------------------
DROP TABLE IF EXISTS `pr_user`;
CREATE TABLE `pr_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_active` smallint(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 92 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pr_user
-- ----------------------------
INSERT INTO `pr_user` VALUES (54, '2019-06-14 06:50:48.401746', '2019-06-14 06:50:59.151042', 0, 'admin1', 'admin123', 'ml_313@163.com', 1);
INSERT INTO `pr_user` VALUES (92, '2019-10-20 08:45:15.054769', '2019-10-20 08:45:15.054769', 0, 'admin', 'admin', 'wqzhpu@163.com', 1);

SET FOREIGN_KEY_CHECKS = 1;
