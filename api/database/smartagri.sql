/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1_copy_156
Source Server Version : 50547
Source Host           : localhost:3307
Source Database       : smartagri

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2016-12-24 16:46:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `soil_target_id` int(11) DEFAULT NULL,
  `acreage` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of area
-- ----------------------------
INSERT INTO `area` VALUES ('1', 'Đồng mô Vĩnh Phúc', 'f748432b-9240-4745-ac43-d35d54ab7813', '2016-09-21 15:24:43', '2016-11-10 13:28:12', null, 'AREA-0', '1', null, '1', null);

-- ----------------------------
-- Table structure for area_object
-- ----------------------------
DROP TABLE IF EXISTS `area_object`;
CREATE TABLE `area_object` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `area_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of area_object
-- ----------------------------
INSERT INTO `area_object` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for authentication_code
-- ----------------------------
DROP TABLE IF EXISTS `authentication_code`;
CREATE TABLE `authentication_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) NOT NULL,
  `certid` int(11) DEFAULT NULL,
  `expireDate` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `requestId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authentication_code
-- ----------------------------

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('1', 'TNC', 'TNC', 'TNC', 'TNC', '2016-12-17 18:11:13', '2016-12-17 18:11:13');

-- ----------------------------
-- Table structure for company_user
-- ----------------------------
DROP TABLE IF EXISTS `company_user`;
CREATE TABLE `company_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company_user
-- ----------------------------
INSERT INTO `company_user` VALUES ('2', '1', '5');

-- ----------------------------
-- Table structure for condition
-- ----------------------------
DROP TABLE IF EXISTS `condition`;
CREATE TABLE `condition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phase` int(11) DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `temp_min_from` int(11) DEFAULT NULL,
  `temp_min_to` int(11) DEFAULT NULL,
  `temp_max_from` int(11) DEFAULT NULL,
  `temp_max_to` int(11) DEFAULT NULL,
  `temp_opt_from` int(11) DEFAULT NULL,
  `temp_opt_to` int(11) DEFAULT NULL,
  `ph_from` int(11) DEFAULT NULL,
  `ph_to` int(11) DEFAULT NULL,
  `light_from` int(11) DEFAULT NULL,
  `light_to` int(11) DEFAULT NULL,
  `water_from` int(11) DEFAULT NULL,
  `water_to` int(11) DEFAULT NULL,
  `humidity_from` int(11) DEFAULT NULL,
  `humidity_to` int(11) DEFAULT NULL,
  `wind` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `object_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of condition
-- ----------------------------

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `type` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=513 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('511', '0000-00-00 00:00:00', '2016-09-21 23:01:29', 'LOGO', 'LOGO', 'Logo', 'aae151246529270b5d33cee8d3ce3d8f.png', '3');
INSERT INTO `config` VALUES ('491', '0000-00-00 00:00:00', '2016-11-03 11:07:32', 'ANNOUNCEMENT', 'ANNOUNCEMENT', 'Notification for Dashboard', '<p>\r\n	Information</p>\r\n', '2');
INSERT INTO `config` VALUES ('512', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'TENANTAUTHTOKEN', 'TENANTAUTHTOKEN', 'Ternant authentication token', 'sitewhere1234567890', '1');

-- ----------------------------
-- Table structure for device
-- ----------------------------
DROP TABLE IF EXISTS `device`;
CREATE TABLE `device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `devicetype_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `long` double DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `manufacture_date` datetime DEFAULT NULL,
  `warranty_date` datetime DEFAULT NULL,
  `gateway_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `assign_date` datetime DEFAULT NULL,
  `pin` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device
-- ----------------------------
INSERT INTO `device` VALUES ('1', 'GATEWAY1', 'cf4c9523-6952-4517-9e45-8bfd53aefdd5', '1', '3', null, null, '2016-12-15 15:54:19', '-123.9113187789917', '45.98885184990983', '2016-12-11 11:38:18', '2016-12-11 11:38:25', '0', null, '2016-12-11 11:38:37', null);

-- ----------------------------
-- Table structure for device_specification
-- ----------------------------
DROP TABLE IF EXISTS `device_specification`;
CREATE TABLE `device_specification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `devicetype_id` int(11) NOT NULL,
  `name` text,
  `value` text,
  `description` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device_specification
-- ----------------------------
INSERT INTO `device_specification` VALUES ('1', '3', '1', '1', '1', null, null);
INSERT INTO `device_specification` VALUES ('2', '3', '2', '2', '2', null, null);

-- ----------------------------
-- Table structure for device_type
-- ----------------------------
DROP TABLE IF EXISTS `device_type`;
CREATE TABLE `device_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device_type
-- ----------------------------
INSERT INTO `device_type` VALUES ('1', 'Controller', '9bdefe3d-6994-430d-9cd0-5f59fb89bd83', null, null);
INSERT INTO `device_type` VALUES ('2', 'Temperature Sensor', 'd42a4deb-d47f-4515-878b-2d5ae26640ea', null, null);
INSERT INTO `device_type` VALUES ('3', 'Gateway', '75126a52-0607-4cca-b995-df40e73a707b', null, null);

-- ----------------------------
-- Table structure for growth
-- ----------------------------
DROP TABLE IF EXISTS `growth`;
CREATE TABLE `growth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phase` int(255) DEFAULT NULL,
  `days` int(255) DEFAULT NULL,
  `body_length` int(11) DEFAULT NULL,
  `body_wide` int(255) DEFAULT NULL,
  `leaf_length` int(11) DEFAULT NULL,
  `left_wide` int(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `object_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of growth
-- ----------------------------

-- ----------------------------
-- Table structure for irrigation_type
-- ----------------------------
DROP TABLE IF EXISTS `irrigation_type`;
CREATE TABLE `irrigation_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of irrigation_type
-- ----------------------------
INSERT INTO `irrigation_type` VALUES ('3', 'Sprinkler', null, null, null);
INSERT INTO `irrigation_type` VALUES ('4', 'In-line drip', null, null, null);
INSERT INTO `irrigation_type` VALUES ('5', 'On-line drip', null, null, null);
INSERT INTO `irrigation_type` VALUES ('6', 'Spray Minisprinkler', null, null, null);

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `browser` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('2015_08_25_042718_create_administrative_unit_table', '1');
INSERT INTO `migrations` VALUES ('2015_08_25_042718_create_config_table', '1');
INSERT INTO `migrations` VALUES ('2015_08_25_042718_create_employee_administrative_unit_table', '1');
INSERT INTO `migrations` VALUES ('2015_08_25_042718_create_employee_table', '1');
INSERT INTO `migrations` VALUES ('2015_08_25_042718_create_salary_history_table', '1');
INSERT INTO `migrations` VALUES ('2015_08_25_042728_create_foreign_keys', '1');
INSERT INTO `migrations` VALUES ('2015_10_20_172059_entrust_setup_tables', '2');

-- ----------------------------
-- Table structure for notification
-- ----------------------------
DROP TABLE IF EXISTS `notification`;
CREATE TABLE `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text,
  `content` text,
  `user_id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notification
-- ----------------------------
INSERT INTO `notification` VALUES ('59', 'Your request to buy 20 BTC is processing. ', 'Your request to buy 20 BTC is processing. ', '83', '3', '2016-08-30 23:46:54', '2016-08-30 23:46:54');
INSERT INTO `notification` VALUES ('60', 'You received 2.2222 Btc from hoasen', '1', '83', '3', '2016-08-30 23:51:29', '2016-08-30 23:51:29');
INSERT INTO `notification` VALUES ('61', 'You received 5.5544 Btc from namanh0103', '1', '83', '3', '2016-08-30 23:52:44', '2016-08-30 23:52:44');
INSERT INTO `notification` VALUES ('62', 'You received 2 Token from namanh0103', '', '238', '3', '2016-08-30 23:53:50', '2016-08-30 23:53:50');
INSERT INTO `notification` VALUES ('63', 'You received 1 Token from hoasen', '', '164', '3', '2016-08-30 23:57:26', '2016-08-30 23:57:26');
INSERT INTO `notification` VALUES ('64', 'You received 2.2222 Btc from phongvan', '', '164', '3', '2016-08-30 23:59:26', '2016-08-30 23:59:26');
INSERT INTO `notification` VALUES ('65', 'Recover Transaction Password!', 'You have successfully changed the Transaction Password!', '164', '3', '2016-08-31 00:32:04', '2016-08-31 00:32:04');
INSERT INTO `notification` VALUES ('66', 'You received 1 Token from phongvan', '', '268', '3', '2016-08-31 00:39:36', '2016-08-31 00:39:36');
INSERT INTO `notification` VALUES ('67', 'You have successfully paid2.2222 BTC and 1 Token', 'You have just paid 2.2222 BTC and 1 Token for your invest', '268', '3', '2016-08-31 00:40:48', '2016-08-31 00:40:48');
INSERT INTO `notification` VALUES ('68', 'You received 10 % commission', 'You received 0.22222 BTC', '164', '3', '2016-08-31 00:40:48', '2016-08-31 00:40:48');
INSERT INTO `notification` VALUES ('69', 'You received 0.05 % commission', 'You received 0.011111 BTC', '162', '3', '2016-08-31 00:40:48', '2016-08-31 00:40:48');
INSERT INTO `notification` VALUES ('70', 'You received 0.05 % commission', 'You received 0.011111 BTC', '159', '3', '2016-08-31 00:40:48', '2016-08-31 00:40:48');
INSERT INTO `notification` VALUES ('71', 'You received 0.05 % commission', 'You received 0.011111 BTC', '126', '3', '2016-08-31 00:40:48', '2016-08-31 00:40:48');
INSERT INTO `notification` VALUES ('72', 'You received 0.05 % commission', 'You received 0.011111 BTC', '98', '3', '2016-08-31 00:40:48', '2016-08-31 00:40:48');
INSERT INTO `notification` VALUES ('73', 'You received 0.05 % commission', 'You received 0.011111 BTC', '87', '3', '2016-08-31 00:40:48', '2016-08-31 00:40:48');
INSERT INTO `notification` VALUES ('74', 'You received 0.05 % commission', 'You received 0.011111 BTC', '83', '3', '2016-08-31 00:40:48', '2016-08-31 00:40:48');
INSERT INTO `notification` VALUES ('75', 'You received 0.05 % commission', 'You received 0.011111 BTC', '5', '3', '2016-08-31 00:40:48', '2016-08-31 00:40:48');
INSERT INTO `notification` VALUES ('76', 'You received 2.2220 Btc from minhhieu', '', '83', '3', '2016-08-31 00:54:03', '2016-08-31 00:54:03');
INSERT INTO `notification` VALUES ('77', 'You received 1 Token from minhhieu', '', '162', '3', '2016-08-31 00:54:38', '2016-08-31 00:54:38');
INSERT INTO `notification` VALUES ('78', 'You received 1 Token from quangbach', '', '176', '3', '2016-08-31 00:55:19', '2016-08-31 00:55:19');
INSERT INTO `notification` VALUES ('79', 'You received 2.2221 Btc from quangbach', '', '83', '3', '2016-08-31 00:56:40', '2016-08-31 00:56:40');
INSERT INTO `notification` VALUES ('80', 'You received 2.2211 Btc from quanghieutyphu', '', '83', '3', '2016-08-31 00:57:41', '2016-08-31 00:57:41');
INSERT INTO `notification` VALUES ('81', 'You received 1.1110 Btc from Diepanh2014', '', '83', '3', '2016-08-31 00:58:32', '2016-08-31 00:58:32');
INSERT INTO `notification` VALUES ('82', 'You received 2.2222 Btc from quynhanh89', '', '83', '3', '2016-08-31 01:01:00', '2016-08-31 01:01:00');
INSERT INTO `notification` VALUES ('83', 'You received 1 Token from quynhanh89', '', '266', '3', '2016-08-31 01:02:37', '2016-08-31 01:02:37');
INSERT INTO `notification` VALUES ('84', 'You received 1 Token from Diepanh2014', '', '258', '3', '2016-08-31 01:03:02', '2016-08-31 01:03:02');
INSERT INTO `notification` VALUES ('85', 'You received 1 Token from quanghieutyphu', '', '260', '3', '2016-08-31 01:03:43', '2016-08-31 01:03:43');
INSERT INTO `notification` VALUES ('86', 'Recover Transaction Password!', 'You have successfully changed the Transaction Password!', '176', '3', '2016-08-31 01:25:24', '2016-08-31 01:25:24');
INSERT INTO `notification` VALUES ('87', 'You have successfully paid2.2221 BTC and 1 Token', 'You have just paid 2.2221 BTC and 1 Token for your invest', '176', '3', '2016-08-31 01:26:13', '2016-08-31 01:26:13');
INSERT INTO `notification` VALUES ('88', 'You received 10 % commission', 'You received 0.44443 BTC', '164', '3', '2016-08-31 01:26:13', '2016-08-31 01:26:13');
INSERT INTO `notification` VALUES ('89', 'You received 0.05 % commission', 'You received 0.0222215 BTC', '162', '3', '2016-08-31 01:26:13', '2016-08-31 01:26:13');
INSERT INTO `notification` VALUES ('90', 'You received 0.05 % commission', 'You received 0.0222215 BTC', '159', '3', '2016-08-31 01:26:13', '2016-08-31 01:26:13');
INSERT INTO `notification` VALUES ('91', 'You received 0.05 % commission', 'You received 0.0222215 BTC', '126', '3', '2016-08-31 01:26:13', '2016-08-31 01:26:13');
INSERT INTO `notification` VALUES ('92', 'You received 0.05 % commission', 'You received 0.0222215 BTC', '98', '3', '2016-08-31 01:26:13', '2016-08-31 01:26:13');
INSERT INTO `notification` VALUES ('93', 'You received 0.05 % commission', 'You received 0.0222215 BTC', '87', '3', '2016-08-31 01:26:13', '2016-08-31 01:26:13');
INSERT INTO `notification` VALUES ('94', 'You received 0.05 % commission', 'You received 0.0222215 BTC', '83', '3', '2016-08-31 01:26:13', '2016-08-31 01:26:13');
INSERT INTO `notification` VALUES ('95', 'You received 0.05 % commission', 'You received 0.0222215 BTC', '5', '3', '2016-08-31 01:26:13', '2016-08-31 01:26:13');
INSERT INTO `notification` VALUES ('96', 'You have successfully paid5.5544 BTC and 2 Token', 'You have just paid 5.5544 BTC and 2 Token for your invest', '238', '3', '2016-08-31 07:55:02', '2016-08-31 07:55:02');
INSERT INTO `notification` VALUES ('97', 'You received 10 % commission', 'You received 0.99987 BTC', '164', '3', '2016-08-31 07:55:02', '2016-08-31 07:55:02');
INSERT INTO `notification` VALUES ('98', 'You have been up 1 level! My level: 1', 'You have been up 1 level! My level: 1', '164', '3', '2016-08-31 07:55:02', '2016-08-31 07:55:02');
INSERT INTO `notification` VALUES ('99', 'You received 0.05 % commission', 'You received 0.0499935 BTC', '162', '3', '2016-08-31 07:55:02', '2016-08-31 07:55:02');
INSERT INTO `notification` VALUES ('100', 'You received 0.05 % commission', 'You received 0.0499935 BTC', '159', '3', '2016-08-31 07:55:02', '2016-08-31 07:55:02');
INSERT INTO `notification` VALUES ('101', 'You received 0.05 % commission', 'You received 0.0499935 BTC', '126', '3', '2016-08-31 07:55:02', '2016-08-31 07:55:02');
INSERT INTO `notification` VALUES ('102', 'You received 0.05 % commission', 'You received 0.0499935 BTC', '98', '3', '2016-08-31 07:55:02', '2016-08-31 07:55:02');
INSERT INTO `notification` VALUES ('103', 'You received 0.05 % commission', 'You received 0.0499935 BTC', '87', '3', '2016-08-31 07:55:02', '2016-08-31 07:55:02');
INSERT INTO `notification` VALUES ('104', 'You received 0.05 % commission', 'You received 0.0499935 BTC', '83', '3', '2016-08-31 07:55:02', '2016-08-31 07:55:02');
INSERT INTO `notification` VALUES ('105', 'You received 0.05 % commission', 'You received 0.0499935 BTC', '5', '3', '2016-08-31 07:55:02', '2016-08-31 07:55:02');
INSERT INTO `notification` VALUES ('106', 'Recover Transaction Password!', 'You have successfully changed the Transaction Password!', '162', '3', '2016-08-31 07:59:32', '2016-08-31 07:59:32');
INSERT INTO `notification` VALUES ('107', 'Recover Transaction Password!', 'You have successfully changed the Transaction Password!', '266', '3', '2016-08-31 08:10:58', '2016-08-31 08:10:58');
INSERT INTO `notification` VALUES ('108', 'Recover Transaction Password!', 'You have successfully changed the Transaction Password!', '162', '3', '2016-08-31 10:15:29', '2016-08-31 10:15:29');
INSERT INTO `notification` VALUES ('109', 'You have successfully paid2.2220 BTC and 1 Token', 'You have just paid 2.2220 BTC and 1 Token for your invest', '162', '3', '2016-08-31 10:16:25', '2016-08-31 10:16:25');
INSERT INTO `notification` VALUES ('110', 'You received 10 % commission', 'You received 0.2721935 BTC', '159', '3', '2016-08-31 10:16:25', '2016-08-31 10:16:25');
INSERT INTO `notification` VALUES ('111', 'You received 0.05 % commission', 'You received 0.0611035 BTC', '126', '3', '2016-08-31 10:16:25', '2016-08-31 10:16:25');
INSERT INTO `notification` VALUES ('112', 'You received 0.05 % commission', 'You received 0.0611035 BTC', '98', '3', '2016-08-31 10:16:25', '2016-08-31 10:16:25');
INSERT INTO `notification` VALUES ('113', 'You received 0.05 % commission', 'You received 0.0611035 BTC', '87', '3', '2016-08-31 10:16:25', '2016-08-31 10:16:25');
INSERT INTO `notification` VALUES ('114', 'You received 0.05 % commission', 'You received 0.0611035 BTC', '83', '3', '2016-08-31 10:16:25', '2016-08-31 10:16:25');
INSERT INTO `notification` VALUES ('115', 'You received 0.05 % commission', 'You received 0.0611035 BTC', '5', '3', '2016-08-31 10:16:25', '2016-08-31 10:16:25');
INSERT INTO `notification` VALUES ('116', 'You have successfully paid 1.111 BTC and 1 Token', 'You have just paid  1.111 BTC and 1 Token for your invest', '258', '3', '2016-08-31 10:21:13', '2016-08-31 10:21:13');
INSERT INTO `notification` VALUES ('117', 'You received 10 % commission', 'You received 0.1111 BTC', '238', '3', '2016-08-31 10:21:13', '2016-08-31 10:21:13');
INSERT INTO `notification` VALUES ('118', 'You received 1 % commission', 'You received 1.01098 BTC', '164', '3', '2016-08-31 10:21:13', '2016-08-31 10:21:13');
INSERT INTO `notification` VALUES ('119', 'You have successfully paid2.2211 BTC and 1 Token', 'You have just paid 2.2211 BTC and 1 Token for your invest', '260', '3', '2016-08-31 10:23:04', '2016-08-31 10:23:04');
INSERT INTO `notification` VALUES ('120', 'You received 10 % commission', 'You received 1.23309 BTC', '164', '3', '2016-08-31 10:23:04', '2016-08-31 10:23:04');
INSERT INTO `notification` VALUES ('121', 'Invest by end of GH', 'Invest by end of GH', '268', '3', '2016-08-31 11:00:02', '2016-08-31 11:00:02');
INSERT INTO `notification` VALUES ('122', 'Invest by end of GH', 'Invest by end of GH', '176', '3', '2016-08-31 11:00:02', '2016-08-31 11:00:02');
INSERT INTO `notification` VALUES ('123', 'Invest by end of GH', 'Invest by end of GH', '238', '3', '2016-08-31 11:00:02', '2016-08-31 11:00:02');
INSERT INTO `notification` VALUES ('124', 'Invest by end of GH', 'Invest by end of GH', '258', '3', '2016-08-31 11:00:02', '2016-08-31 11:00:02');
INSERT INTO `notification` VALUES ('125', 'Invest by end of GH', 'Invest by end of GH', '260', '3', '2016-08-31 11:00:02', '2016-08-31 11:00:02');
INSERT INTO `notification` VALUES ('126', 'Recover Transaction Password!', 'You have successfully changed the Transaction Password!', '266', '3', '2016-08-31 11:25:52', '2016-08-31 11:25:52');
INSERT INTO `notification` VALUES ('127', 'You have successfully paid2.2222 BTC and 1 Token', 'You have just paid 2.2222 BTC and 1 Token for your invest', '266', '3', '2016-08-31 11:26:30', '2016-08-31 11:26:30');
INSERT INTO `notification` VALUES ('128', 'You received 10 % commission', 'You received 0.33332 BTC', '238', '3', '2016-08-31 11:26:30', '2016-08-31 11:26:30');
INSERT INTO `notification` VALUES ('129', 'You received 1 % commission', 'You received 1.255312 BTC', '164', '3', '2016-08-31 11:26:30', '2016-08-31 11:26:30');
INSERT INTO `notification` VALUES ('130', 'Invest by end of GH', 'Invest by end of GH', '162', '3', '2016-08-31 12:00:01', '2016-08-31 12:00:01');
INSERT INTO `notification` VALUES ('131', 'Invest by end of GH', 'Invest by end of GH', '266', '3', '2016-08-31 12:00:01', '2016-08-31 12:00:01');
INSERT INTO `notification` VALUES ('132', 'Invest by end of GH', 'Invest by end of GH', '83', '3', '2016-08-31 18:01:01', '2016-08-31 18:01:01');
INSERT INTO `notification` VALUES ('133', 'Your request to withdraw 0.001 is processing. ', 'Your request to withdraw 0.001 is processing. ', '83', '3', '2016-08-31 18:31:01', '2016-08-31 18:31:01');
INSERT INTO `notification` VALUES ('134', 'Your request to withdraw 0.2221 is processing. ', 'Your request to withdraw 0.2221 is processing. ', '238', '3', '2016-08-31 21:27:14', '2016-08-31 21:27:14');
INSERT INTO `notification` VALUES ('135', 'Recover Transaction Password!', 'You have successfully changed the Transaction Password!', '266', '3', '2016-08-31 22:06:52', '2016-08-31 22:06:52');
INSERT INTO `notification` VALUES ('136', 'Your request to withdraw 0.03 is processing. ', 'Your request to withdraw 0.03 is processing. ', '266', '3', '2016-08-31 22:16:03', '2016-08-31 22:16:03');
INSERT INTO `notification` VALUES ('137', 'Invest by end of GH', 'Invest by end of GH', '268', '3', '2016-09-01 11:00:02', '2016-09-01 11:00:02');
INSERT INTO `notification` VALUES ('138', 'Invest by end of GH', 'Invest by end of GH', '176', '3', '2016-09-01 11:00:02', '2016-09-01 11:00:02');
INSERT INTO `notification` VALUES ('139', 'Invest by end of GH', 'Invest by end of GH', '238', '3', '2016-09-01 11:00:02', '2016-09-01 11:00:02');
INSERT INTO `notification` VALUES ('140', 'Invest by end of GH', 'Invest by end of GH', '258', '3', '2016-09-01 11:00:02', '2016-09-01 11:00:02');
INSERT INTO `notification` VALUES ('141', 'Invest by end of GH', 'Invest by end of GH', '260', '3', '2016-09-01 11:00:02', '2016-09-01 11:00:02');
INSERT INTO `notification` VALUES ('142', 'Invest by end of GH', 'Invest by end of GH', '162', '3', '2016-09-01 12:00:02', '2016-09-01 12:00:02');
INSERT INTO `notification` VALUES ('143', 'Invest by end of GH', 'Invest by end of GH', '266', '3', '2016-09-01 12:00:02', '2016-09-01 12:00:02');
INSERT INTO `notification` VALUES ('144', 'Your request to withdraw 0.0888 is processing. ', 'Your request to withdraw 0.0888 is processing. ', '258', '3', '2016-09-01 14:36:01', '2016-09-01 14:36:01');
INSERT INTO `notification` VALUES ('145', 'Your request to withdraw 0.1776 is processing. ', 'Your request to withdraw 0.1776 is processing. ', '260', '3', '2016-09-01 14:40:33', '2016-09-01 14:40:33');
INSERT INTO `notification` VALUES ('146', 'Invest by end of GH', 'Invest by end of GH', '83', '3', '2016-09-01 18:01:02', '2016-09-01 18:01:02');
INSERT INTO `notification` VALUES ('147', 'Invest by end of GH', 'Invest by end of GH', '268', '3', '2016-09-02 11:00:01', '2016-09-02 11:00:01');
INSERT INTO `notification` VALUES ('148', 'Invest by end of GH', 'Invest by end of GH', '176', '3', '2016-09-02 11:00:01', '2016-09-02 11:00:01');
INSERT INTO `notification` VALUES ('149', 'Invest by end of GH', 'Invest by end of GH', '238', '3', '2016-09-02 11:00:01', '2016-09-02 11:00:01');
INSERT INTO `notification` VALUES ('150', 'Invest by end of GH', 'Invest by end of GH', '258', '3', '2016-09-02 11:00:01', '2016-09-02 11:00:01');
INSERT INTO `notification` VALUES ('151', 'Invest by end of GH', 'Invest by end of GH', '260', '3', '2016-09-02 11:00:01', '2016-09-02 11:00:01');
INSERT INTO `notification` VALUES ('152', 'Invest by end of GH', 'Invest by end of GH', '162', '3', '2016-09-02 12:00:01', '2016-09-02 12:00:01');
INSERT INTO `notification` VALUES ('153', 'Invest by end of GH', 'Invest by end of GH', '266', '3', '2016-09-02 12:00:01', '2016-09-02 12:00:01');
INSERT INTO `notification` VALUES ('154', 'Invest by end of GH', 'Invest by end of GH', '83', '3', '2016-09-02 18:01:02', '2016-09-02 18:01:02');
INSERT INTO `notification` VALUES ('155', 'Invest by end of GH', 'Invest by end of GH', '268', '3', '2016-09-03 11:00:02', '2016-09-03 11:00:02');
INSERT INTO `notification` VALUES ('156', 'Invest by end of GH', 'Invest by end of GH', '176', '3', '2016-09-03 11:00:02', '2016-09-03 11:00:02');
INSERT INTO `notification` VALUES ('157', 'Invest by end of GH', 'Invest by end of GH', '238', '3', '2016-09-03 11:00:02', '2016-09-03 11:00:02');
INSERT INTO `notification` VALUES ('158', 'Invest by end of GH', 'Invest by end of GH', '258', '3', '2016-09-03 11:00:02', '2016-09-03 11:00:02');
INSERT INTO `notification` VALUES ('159', 'Invest by end of GH', 'Invest by end of GH', '260', '3', '2016-09-03 11:00:02', '2016-09-03 11:00:02');
INSERT INTO `notification` VALUES ('160', 'Invest by end of GH', 'Invest by end of GH', '162', '3', '2016-09-03 12:00:02', '2016-09-03 12:00:02');
INSERT INTO `notification` VALUES ('161', 'Invest by end of GH', 'Invest by end of GH', '266', '3', '2016-09-03 12:00:02', '2016-09-03 12:00:02');
INSERT INTO `notification` VALUES ('162', 'Recover Transaction Password!', 'You have successfully changed the Transaction Password!', '266', '3', '2016-09-03 12:06:10', '2016-09-03 12:06:10');
INSERT INTO `notification` VALUES ('163', 'Your request to withdraw 0.1 is processing. ', 'Your request to withdraw 0.1 is processing. ', '266', '3', '2016-09-03 12:08:26', '2016-09-03 12:08:26');
INSERT INTO `notification` VALUES ('164', 'Invest by end of GH', 'Invest by end of GH', '83', '3', '2016-09-03 18:01:01', '2016-09-03 18:01:01');
INSERT INTO `notification` VALUES ('165', 'Your request to withdraw 0.5 is processing. ', 'Your request to withdraw 0.5 is processing. ', '238', '3', '2016-09-03 22:57:56', '2016-09-03 22:57:56');
INSERT INTO `notification` VALUES ('166', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '83', '3', '2016-09-04 16:48:01', '2016-09-04 16:48:01');
INSERT INTO `notification` VALUES ('167', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '268', '3', '2016-09-04 16:48:01', '2016-09-04 16:48:01');
INSERT INTO `notification` VALUES ('168', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '176', '3', '2016-09-04 16:48:01', '2016-09-04 16:48:01');
INSERT INTO `notification` VALUES ('169', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '238', '3', '2016-09-04 16:48:01', '2016-09-04 16:48:01');
INSERT INTO `notification` VALUES ('170', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '162', '3', '2016-09-04 16:48:01', '2016-09-04 16:48:01');
INSERT INTO `notification` VALUES ('171', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '258', '3', '2016-09-04 16:48:01', '2016-09-04 16:48:01');
INSERT INTO `notification` VALUES ('172', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '260', '3', '2016-09-04 16:48:01', '2016-09-04 16:48:01');
INSERT INTO `notification` VALUES ('173', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '266', '3', '2016-09-04 16:48:01', '2016-09-04 16:48:01');
INSERT INTO `notification` VALUES ('174', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '268', '3', '2016-09-04 16:48:01', '2016-09-04 16:48:01');
INSERT INTO `notification` VALUES ('175', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '176', '3', '2016-09-04 16:48:01', '2016-09-04 16:48:01');
INSERT INTO `notification` VALUES ('176', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '238', '3', '2016-09-04 16:48:01', '2016-09-04 16:48:01');
INSERT INTO `notification` VALUES ('177', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '162', '3', '2016-09-04 16:48:01', '2016-09-04 16:48:01');
INSERT INTO `notification` VALUES ('178', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '258', '3', '2016-09-04 16:48:02', '2016-09-04 16:48:02');
INSERT INTO `notification` VALUES ('179', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '260', '3', '2016-09-04 16:48:02', '2016-09-04 16:48:02');
INSERT INTO `notification` VALUES ('180', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '266', '3', '2016-09-04 16:48:02', '2016-09-04 16:48:02');
INSERT INTO `notification` VALUES ('181', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '83', '3', '2016-09-04 17:54:01', '2016-09-04 17:54:01');
INSERT INTO `notification` VALUES ('182', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '268', '3', '2016-09-04 17:54:01', '2016-09-04 17:54:01');
INSERT INTO `notification` VALUES ('183', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '176', '3', '2016-09-04 17:54:01', '2016-09-04 17:54:01');
INSERT INTO `notification` VALUES ('184', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '238', '3', '2016-09-04 17:54:01', '2016-09-04 17:54:01');
INSERT INTO `notification` VALUES ('185', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '162', '3', '2016-09-04 17:54:01', '2016-09-04 17:54:01');
INSERT INTO `notification` VALUES ('186', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '258', '3', '2016-09-04 17:54:01', '2016-09-04 17:54:01');
INSERT INTO `notification` VALUES ('187', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '260', '3', '2016-09-04 17:54:01', '2016-09-04 17:54:01');
INSERT INTO `notification` VALUES ('188', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '266', '3', '2016-09-04 17:54:01', '2016-09-04 17:54:01');
INSERT INTO `notification` VALUES ('189', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '83', '3', '2016-09-04 18:01:01', '2016-09-04 18:01:01');
INSERT INTO `notification` VALUES ('190', 'Your request to withdraw 0.1334 is processing. ', 'Your request to withdraw 0.1334 is processing. ', '258', '3', '2016-09-04 18:03:05', '2016-09-04 18:03:05');
INSERT INTO `notification` VALUES ('191', 'Your request to withdraw 0.2666 is processing. ', 'Your request to withdraw 0.2666 is processing. ', '260', '3', '2016-09-04 18:08:36', '2016-09-04 18:08:36');
INSERT INTO `notification` VALUES ('192', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '268', '3', '2016-09-05 11:00:01', '2016-09-05 11:00:01');
INSERT INTO `notification` VALUES ('193', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '176', '3', '2016-09-05 11:00:01', '2016-09-05 11:00:01');
INSERT INTO `notification` VALUES ('194', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '238', '3', '2016-09-05 11:00:01', '2016-09-05 11:00:01');
INSERT INTO `notification` VALUES ('195', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '258', '3', '2016-09-05 11:00:01', '2016-09-05 11:00:01');
INSERT INTO `notification` VALUES ('196', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '260', '3', '2016-09-05 11:00:01', '2016-09-05 11:00:01');
INSERT INTO `notification` VALUES ('197', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '162', '3', '2016-09-05 12:00:02', '2016-09-05 12:00:02');
INSERT INTO `notification` VALUES ('198', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '266', '3', '2016-09-05 12:00:02', '2016-09-05 12:00:02');
INSERT INTO `notification` VALUES ('199', 'Your request to withdraw 0.5 is processing. ', 'Your request to withdraw 0.5 is processing. ', '176', '3', '2016-09-05 12:15:40', '2016-09-05 12:15:40');
INSERT INTO `notification` VALUES ('200', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '83', '3', '2016-09-05 18:01:02', '2016-09-05 18:01:02');
INSERT INTO `notification` VALUES ('201', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '268', '3', '2016-09-06 11:00:02', '2016-09-06 11:00:02');
INSERT INTO `notification` VALUES ('202', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '176', '3', '2016-09-06 11:00:02', '2016-09-06 11:00:02');
INSERT INTO `notification` VALUES ('203', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '238', '3', '2016-09-06 11:00:02', '2016-09-06 11:00:02');
INSERT INTO `notification` VALUES ('204', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '258', '3', '2016-09-06 11:00:02', '2016-09-06 11:00:02');
INSERT INTO `notification` VALUES ('205', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '260', '3', '2016-09-06 11:00:02', '2016-09-06 11:00:02');
INSERT INTO `notification` VALUES ('206', 'Your request to withdraw 0.1777 is processing. ', 'Your request to withdraw 0.1777 is processing. ', '260', '3', '2016-09-06 11:39:47', '2016-09-06 11:39:47');
INSERT INTO `notification` VALUES ('207', 'Your request to withdraw 0.0888 is processing. ', 'Your request to withdraw 0.0888 is processing. ', '258', '3', '2016-09-06 11:44:55', '2016-09-06 11:44:55');
INSERT INTO `notification` VALUES ('208', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '162', '3', '2016-09-06 12:00:01', '2016-09-06 12:00:01');
INSERT INTO `notification` VALUES ('209', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '266', '3', '2016-09-06 12:00:01', '2016-09-06 12:00:01');
INSERT INTO `notification` VALUES ('210', 'Your request to buy 1.0165 BTC is processing. ', 'Your request to buy 1.0165 BTC is processing. ', '292', '3', '2016-09-06 16:29:05', '2016-09-06 16:29:05');
INSERT INTO `notification` VALUES ('211', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '83', '3', '2016-09-06 18:01:01', '2016-09-06 18:01:01');
INSERT INTO `notification` VALUES ('212', 'Your request to withdraw 0.4 is processing. ', 'Your request to withdraw 0.4 is processing. ', '266', '3', '2016-09-06 18:39:11', '2016-09-06 18:39:11');
INSERT INTO `notification` VALUES ('213', 'Recover Transaction Password!', 'You have successfully changed the Transaction Password!', '292', '3', '2016-09-07 00:34:47', '2016-09-07 00:34:47');
INSERT INTO `notification` VALUES ('214', 'You have successfully paid0.99 BTC and 1 Token', 'You have just paid 0.99 BTC and 1 Token for your invest', '292', '11', '2016-09-07 00:36:27', '2016-09-07 00:36:27');
INSERT INTO `notification` VALUES ('215', 'You received 10 % commission', 'You received 0.099 BTC', '260', '9', '2016-09-07 00:36:27', '2016-09-07 00:36:27');
INSERT INTO `notification` VALUES ('216', 'You received 1 % commission', 'You received 0.0099 BTC', '164', '10', '2016-09-07 00:36:27', '2016-09-07 00:36:27');
INSERT INTO `notification` VALUES ('217', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '268', '3', '2016-09-07 11:00:02', '2016-09-07 11:00:02');
INSERT INTO `notification` VALUES ('218', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '176', '3', '2016-09-07 11:00:02', '2016-09-07 11:00:02');
INSERT INTO `notification` VALUES ('219', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '238', '3', '2016-09-07 11:00:02', '2016-09-07 11:00:02');
INSERT INTO `notification` VALUES ('220', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '258', '3', '2016-09-07 11:00:02', '2016-09-07 11:00:02');
INSERT INTO `notification` VALUES ('221', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '260', '3', '2016-09-07 11:00:02', '2016-09-07 11:00:02');
INSERT INTO `notification` VALUES ('222', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '162', '3', '2016-09-07 12:00:01', '2016-09-07 12:00:01');
INSERT INTO `notification` VALUES ('223', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '266', '3', '2016-09-07 12:00:01', '2016-09-07 12:00:01');
INSERT INTO `notification` VALUES ('224', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '83', '3', '2016-09-07 18:01:01', '2016-09-07 18:01:01');
INSERT INTO `notification` VALUES ('225', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '292', '3', '2016-09-08 00:37:01', '2016-09-08 00:37:01');
INSERT INTO `notification` VALUES ('226', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '268', '3', '2016-09-08 11:00:01', '2016-09-08 11:00:01');
INSERT INTO `notification` VALUES ('227', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '176', '3', '2016-09-08 11:00:01', '2016-09-08 11:00:01');
INSERT INTO `notification` VALUES ('228', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '238', '3', '2016-09-08 11:00:01', '2016-09-08 11:00:01');
INSERT INTO `notification` VALUES ('229', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '258', '3', '2016-09-08 11:00:01', '2016-09-08 11:00:01');
INSERT INTO `notification` VALUES ('230', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '260', '3', '2016-09-08 11:00:01', '2016-09-08 11:00:01');
INSERT INTO `notification` VALUES ('231', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '162', '3', '2016-09-08 12:00:01', '2016-09-08 12:00:01');
INSERT INTO `notification` VALUES ('232', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '266', '3', '2016-09-08 12:00:01', '2016-09-08 12:00:01');
INSERT INTO `notification` VALUES ('233', 'Your request to withdraw 0.1776 is processing. ', 'Your request to withdraw 0.1776 is processing. ', '260', '3', '2016-09-08 12:31:59', '2016-09-08 12:31:59');
INSERT INTO `notification` VALUES ('234', 'Your request to withdraw 0.0889 is processing. ', 'Your request to withdraw 0.0889 is processing. ', '258', '3', '2016-09-08 12:33:32', '2016-09-08 12:33:32');
INSERT INTO `notification` VALUES ('235', 'Invest by end of GH 4%', 'Invest by end of GH 4%', '83', '3', '2016-09-08 18:01:02', '2016-09-08 18:01:02');

-- ----------------------------
-- Table structure for nutrition
-- ----------------------------
DROP TABLE IF EXISTS `nutrition`;
CREATE TABLE `nutrition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phase` int(11) DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `zn` int(11) DEFAULT NULL,
  `cn` int(11) DEFAULT NULL,
  `nh4` int(11) DEFAULT NULL,
  `p2o5` int(11) DEFAULT NULL,
  `k2o` int(11) DEFAULT NULL,
  `caco3` int(11) DEFAULT NULL,
  `mo` int(11) DEFAULT NULL,
  `s` int(11) DEFAULT NULL,
  `bo` int(11) DEFAULT NULL,
  `cu` int(11) DEFAULT NULL,
  `fe` int(11) DEFAULT NULL,
  `mn` int(11) DEFAULT NULL,
  `nano` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `object_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nutrition
-- ----------------------------
INSERT INTO `nutrition` VALUES ('1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');

-- ----------------------------
-- Table structure for nutrition_box
-- ----------------------------
DROP TABLE IF EXISTS `nutrition_box`;
CREATE TABLE `nutrition_box` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `formula_name` varchar(255) DEFAULT NULL,
  `transaction_date` datetime DEFAULT NULL,
  `quantity_balance_lit` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nutrition_box
-- ----------------------------
INSERT INTO `nutrition_box` VALUES ('1', '0', 'Dung dịch Zn', 'BOX.2016.12.14.001', '#ffffff', '1', 'Zn', '2016-12-23 10:28:59', '50', '2016-12-23 10:29:04', '2016-12-23 10:29:06');

-- ----------------------------
-- Table structure for nutrition_pump
-- ----------------------------
DROP TABLE IF EXISTS `nutrition_pump`;
CREATE TABLE `nutrition_pump` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flowrate_lit_hour` int(11) DEFAULT NULL,
  `pressure_kg_cm2` int(11) DEFAULT NULL,
  `delay_pipe_second` int(255) DEFAULT NULL,
  `transaction_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nutrition_pump
-- ----------------------------

-- ----------------------------
-- Table structure for object
-- ----------------------------
DROP TABLE IF EXISTS `object`;
CREATE TABLE `object` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `quantity` varchar(100) NOT NULL,
  `is_del` bit(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of object
-- ----------------------------
INSERT INTO `object` VALUES ('1', 'CACHUA', 'CACHUA', '10', '', '2016-09-21 14:44:29', '2016-11-10 12:50:38', 'tomatoes.jpg', 'CACHUA');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------
INSERT INTO `password_resets` VALUES ('hmcuong.kimono@gmail.com', '3f441a8edb8863fac0b030287953d9bcffb4b702c78f3042720a15ec7d846cca', '2016-07-22 11:10:21');
INSERT INTO `password_resets` VALUES ('nguyenminhtan0612@gmail.com', '974003a741df090c8defa89f9a65d19f20dbd25eb65f8132d45947eee28b3b44', '2016-08-30 17:59:32');
INSERT INTO `password_resets` VALUES ('nguyenhong1603@gmail.com', '8fb29d1a0455ec161be64021bcf000cfcf4dce25dd59dfcbd1c078bbfd6ecd26', '2016-07-28 01:51:10');
INSERT INTO `password_resets` VALUES ('timekul@gmail.com', 'f73b5cd58be2dfb85d86f5d02163231f6ebccdbf2f63dab34fb3bf79806ed1db', '2016-08-30 16:39:04');

-- ----------------------------
-- Table structure for period
-- ----------------------------
DROP TABLE IF EXISTS `period`;
CREATE TABLE `period` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of period
-- ----------------------------
INSERT INTO `period` VALUES ('1', 'Lá', null, null, null);
INSERT INTO `period` VALUES ('3', 'Thân', null, null, null);
INSERT INTO `period` VALUES ('4', 'Rễ', null, null, null);
INSERT INTO `period` VALUES ('5', 'Cành', null, null, null);
INSERT INTO `period` VALUES ('6', 'Nụ', null, null, null);
INSERT INTO `period` VALUES ('7', 'Hoa', null, null, null);
INSERT INTO `period` VALUES ('8', 'Quả', null, null, null);

-- ----------------------------
-- Table structure for permission_role
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of permission_role
-- ----------------------------
INSERT INTO `permission_role` VALUES ('3', '1');
INSERT INTO `permission_role` VALUES ('4', '1');
INSERT INTO `permission_role` VALUES ('5', '1');
INSERT INTO `permission_role` VALUES ('6', '1');
INSERT INTO `permission_role` VALUES ('9', '1');
INSERT INTO `permission_role` VALUES ('10', '1');
INSERT INTO `permission_role` VALUES ('11', '1');
INSERT INTO `permission_role` VALUES ('12', '1');
INSERT INTO `permission_role` VALUES ('13', '1');
INSERT INTO `permission_role` VALUES ('14', '1');
INSERT INTO `permission_role` VALUES ('15', '1');
INSERT INTO `permission_role` VALUES ('16', '1');
INSERT INTO `permission_role` VALUES ('17', '1');
INSERT INTO `permission_role` VALUES ('18', '1');
INSERT INTO `permission_role` VALUES ('19', '1');
INSERT INTO `permission_role` VALUES ('20', '1');
INSERT INTO `permission_role` VALUES ('21', '1');
INSERT INTO `permission_role` VALUES ('22', '1');
INSERT INTO `permission_role` VALUES ('23', '1');
INSERT INTO `permission_role` VALUES ('24', '1');
INSERT INTO `permission_role` VALUES ('25', '1');
INSERT INTO `permission_role` VALUES ('26', '1');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('3', 'object-manager', 'object-manager', 'object-manager', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('4', 'user-manager', 'user-manager', 'user-manager', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('5', 'config-manager', 'config-manager', 'config-manager', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('6', 'log-manager', 'log-manager', 'log-manager', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('9', 'role-manager', 'role-manager', 'role-manager', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('10', 'process-manager', 'process-manager', 'process-manager', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('11', 'provider-manager', 'provider-manager', 'provider-manager', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('12', 'area-manager', 'area-manager', 'area-manager', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('13', 'site-manager', 'site-manager', 'site-manager', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('14', 'service-manager', 'service-manager', 'service-manager', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('15', 'configentry-manager', 'configentry-manager', 'configentry-manager', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('16', 'entry-manager', 'entry-manager', 'entry-manager', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('17', 'device-manager', 'device-manager', 'device-manager', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('18', 'devicetype-manager', 'devicetype-manager', 'devicetype-manager', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('19', 'soiltype-manager', 'soiltype-manager', 'soiltype-manager', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('20', 'period-manager', 'period-manager', 'period-manager', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('21', 'control-manager', 'control-manager', 'control-manager', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('22', 'irrigationtype-manager', 'irrigationtype-manager', 'irrigationtype-manager', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('23', 'watertype-manager', 'watertype-manager', 'watertype-manager', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('24', 'company-manager', 'company-manager', 'company-manager', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('25', 'phase-manager', 'phase-manager', 'phase-manager', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('26', 'nutritionbox-manager', 'nutritionbox-manager', 'nutritionbox-manager', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('27', 'nutritionpump-manager', 'nutritionpump-manager', 'nutritionpump-manager', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for phase
-- ----------------------------
DROP TABLE IF EXISTS `phase`;
CREATE TABLE `phase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of phase
-- ----------------------------
INSERT INTO `phase` VALUES ('1', 'Giai đoạn phát triển lá', '', null, '2016-12-17 22:31:38');
INSERT INTO `phase` VALUES ('3', 'Thân', null, null, null);

-- ----------------------------
-- Table structure for price
-- ----------------------------
DROP TABLE IF EXISTS `price`;
CREATE TABLE `price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `key_length` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `token_price` decimal(10,2) DEFAULT NULL,
  `service_price` decimal(10,2) DEFAULT NULL,
  `promotion_month` int(11) DEFAULT NULL,
  `discount_price` decimal(10,2) DEFAULT NULL,
  `discount_token` decimal(10,0) DEFAULT NULL,
  `is_del` bit(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of price
-- ----------------------------
INSERT INTO `price` VALUES ('1', '1', '10', '2048', '1', '1', '500000.00', '500000.00', '10', '100000.00', '100000', '\0', '2016-09-21 18:51:26', '2016-09-21 18:51:26');

-- ----------------------------
-- Table structure for process
-- ----------------------------
DROP TABLE IF EXISTS `process`;
CREATE TABLE `process` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `object_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sow_date` datetime DEFAULT NULL,
  `plant_date` datetime DEFAULT NULL,
  `harvest_date` datetime DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of process
-- ----------------------------
INSERT INTO `process` VALUES ('2', 'Quy trình sản xuất cà chua', '1000', '1', '2016-11-15 07:12:05', '2016-12-02 22:34:53', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null);

-- ----------------------------
-- Table structure for provider
-- ----------------------------
DROP TABLE IF EXISTS `provider`;
CREATE TABLE `provider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(200) NOT NULL,
  `name` varchar(400) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `is_del` bit(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of provider
-- ----------------------------
INSERT INTO `provider` VALUES ('2', 'PROVIDER-0', 'PROVIDER-0', 'PROVIDER-0', 'PROVIDER-0', '5', '', '2016-09-21 14:58:35', '2016-09-21 15:02:53');

-- ----------------------------
-- Table structure for role_user
-- ----------------------------
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role_user
-- ----------------------------
INSERT INTO `role_user` VALUES ('5', '1');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'admin', 'admin', 'admin', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `roles` VALUES ('2', 'user', 'user', 'user', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `roles` VALUES ('3', 'company-admin', null, 'Admin Company', '2016-12-17 18:31:14', '2016-12-17 19:27:48');
INSERT INTO `roles` VALUES ('4', 'nhanvien', null, 'Nhân viên triển khai cài đặt cho khách hàng', '2016-12-17 19:27:14', '2016-12-17 19:27:14');

-- ----------------------------
-- Table structure for service
-- ----------------------------
DROP TABLE IF EXISTS `service`;
CREATE TABLE `service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `is_del` bit(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of service
-- ----------------------------
INSERT INTO `service` VALUES ('1', 'STATUS', '1', '\0', '2016-09-21 18:28:57', '2016-09-21 18:28:57');

-- ----------------------------
-- Table structure for site
-- ----------------------------
DROP TABLE IF EXISTS `site`;
CREATE TABLE `site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `acreage` varchar(255) DEFAULT NULL,
  `t0` varchar(255) DEFAULT NULL,
  `t1` varchar(255) DEFAULT NULL,
  `t2` varchar(255) DEFAULT NULL,
  `t3` varchar(255) DEFAULT NULL,
  `ha0` varchar(255) DEFAULT NULL,
  `ha1` varchar(255) DEFAULT NULL,
  `ha2` varchar(255) DEFAULT NULL,
  `ha3` varchar(255) DEFAULT NULL,
  `hg0` varchar(255) DEFAULT NULL,
  `hg1` varchar(255) DEFAULT NULL,
  `hg2` varchar(255) DEFAULT NULL,
  `hg3` varchar(255) DEFAULT NULL,
  `w0` varchar(255) DEFAULT NULL,
  `w1` varchar(255) DEFAULT NULL,
  `w2` varchar(255) DEFAULT NULL,
  `w3` varchar(255) DEFAULT NULL,
  `l0` varchar(255) DEFAULT NULL,
  `l1` varchar(255) DEFAULT NULL,
  `l2` varchar(255) DEFAULT NULL,
  `l3` varchar(255) DEFAULT NULL,
  `watertype_id` int(11) DEFAULT NULL,
  `water_distant` int(11) DEFAULT NULL,
  `water_description` text,
  `creator_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of site
-- ----------------------------
INSERT INTO `site` VALUES ('1', 'SITE-0', 'SITE-0', '2016-09-21 15:24:43', '2016-12-11 11:12:16', 'SITE-0', 'SITE-0', '500m2', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '100', '111', '5', '1');

-- ----------------------------
-- Table structure for social_accounts
-- ----------------------------
DROP TABLE IF EXISTS `social_accounts`;
CREATE TABLE `social_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider_user_id` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of social_accounts
-- ----------------------------

-- ----------------------------
-- Table structure for soil_type
-- ----------------------------
DROP TABLE IF EXISTS `soil_type`;
CREATE TABLE `soil_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `water_capacity` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of soil_type
-- ----------------------------
INSERT INTO `soil_type` VALUES ('1', 'Đất phù xa', null, null, null);
INSERT INTO `soil_type` VALUES ('2', 'Đất ruộng', null, null, null);

-- ----------------------------
-- Table structure for user_notification
-- ----------------------------
DROP TABLE IF EXISTS `user_notification`;
CREATE TABLE `user_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notification_id` int(11) NOT NULL,
  `is_read` tinyint(4) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_notification
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `transaction_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=338 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('5', '1', null, 'Top Admin', 'admin', '1687147845', 'timekul@gmail.com', '$2y$10$MnX15a9Ifr9RGMUsgb6wXOTLHzcPJw61.2IKCFv.KbffKfsH5DE26', '$2y$10$Fcs25w4Zcf.jvxK0lyuWqeIpMK.HM8UcJpaozUbPIJk67k22UoMdK', 'PW3QvgHOdhp0jA7F2We9c150s8sHgzYV1HxU3DXDZ4vvwMbHdzoCdwVikOaC', '2016-12-17 18:45:56', '2016-12-16 15:00:59');

-- ----------------------------
-- Table structure for water_type
-- ----------------------------
DROP TABLE IF EXISTS `water_type`;
CREATE TABLE `water_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of water_type
-- ----------------------------
INSERT INTO `water_type` VALUES ('1', 'Nước sông', 'PH_SENSOR', null, null);
INSERT INTO `water_type` VALUES ('2', 'Nước hồ', 'TMP_SENSOR', null, null);
INSERT INTO `water_type` VALUES ('3', 'Giếng khoan', null, null, null);
INSERT INTO `water_type` VALUES ('4', 'Nước máy', null, null, null);
INSERT INTO `water_type` VALUES ('5', 'Khác', null, null, null);
