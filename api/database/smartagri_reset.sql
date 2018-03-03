/*
Navicat MySQL Data Transfer

Source Server         : localhost - 156
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : smartagri

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2017-01-27 02:15:13
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of area
-- ----------------------------
INSERT INTO `area` VALUES ('1', 'Nhà kính cà chua', 'DA.012.000189', '2016-12-29 10:36:46', '2016-12-29 10:36:46', null, null, '1', '6,600', '1', '5');

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
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
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
INSERT INTO `company_user` VALUES ('1', '1', '5');

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

-- ----------------------------
-- Table structure for device
-- ----------------------------
DROP TABLE IF EXISTS `device`;
CREATE TABLE `device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `site_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `assign_id` int(11) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `devicetype_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `long` double DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `manufacture_date` datetime DEFAULT NULL,
  `warranty_date` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `assign_date` datetime DEFAULT NULL,
  `pin` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device
-- ----------------------------
INSERT INTO `device` VALUES ('1', 'GATEWAY1', 'EH201610270001', '1', '1', '5', null, '1', null, null, '2016-12-15 15:54:19', '-123.9113187789917', '45.98885184990983', '2016-12-11 11:38:18', '2016-12-11 11:38:25', null, '2016-12-11 11:38:37', null);
INSERT INTO `device` VALUES ('4', 'CONTROLLER1', 'EH201610270002', '1', '1', '5', null, '3', null, '2016-12-24 19:38:06', '2016-12-24 19:38:06', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `device` VALUES ('5', 'SENSOR1', 'EH201610270003', '1', '1', '1', null, '2', null, '2016-12-24 19:46:36', '2017-01-27 00:08:31', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', null, null);
INSERT INTO `device` VALUES ('13', 'PUMP1', 'EH201610270004', '1', '1', '5', '102', '4', null, '2016-12-29 09:48:21', '2017-01-27 00:08:25', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `device` VALUES ('14', 'VALUE1', 'EH201610270005', '1', '1', '5', '101', '5', null, '2016-12-29 09:48:44', '2017-01-27 00:08:23', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', null, null);

-- ----------------------------
-- Table structure for device_specification
-- ----------------------------
DROP TABLE IF EXISTS `device_specification`;
CREATE TABLE `device_specification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `devicetype_id` int(11) NOT NULL,
  `name` text NOT NULL,
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
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device_type
-- ----------------------------
INSERT INTO `device_type` VALUES ('1', 'Gateway', '', null, null);
INSERT INTO `device_type` VALUES ('2', 'Sensor', '', null, null);
INSERT INTO `device_type` VALUES ('3', 'Controller', '', null, null);
INSERT INTO `device_type` VALUES ('4', 'Bơm', '', null, null);
INSERT INTO `device_type` VALUES ('5', 'Van điện từ', '', null, null);

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
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of irrigation_type
-- ----------------------------
INSERT INTO `irrigation_type` VALUES ('3', 'Sprinkler', '', null, null);
INSERT INTO `irrigation_type` VALUES ('4', 'In-line drip', '', null, null);
INSERT INTO `irrigation_type` VALUES ('5', 'On-line drip', '', null, null);
INSERT INTO `irrigation_type` VALUES ('6', 'Spray Minisprinkler', '', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('1', 'admin', null, 'UPDATE_USER', '2017-01-27 02:04:26', '192.168.0.150', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36');
INSERT INTO `log` VALUES ('2', 'admin', null, 'CREATE_USER', '2017-01-27 02:11:10', '192.168.0.150', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36');
INSERT INTO `log` VALUES ('3', 'admin', null, 'CREATE_USER', '2017-01-27 02:11:34', '192.168.0.150', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36');
INSERT INTO `log` VALUES ('4', 'admin', null, 'CREATE_USER', '2017-01-27 02:11:51', '192.168.0.150', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36');

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
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
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
  `device_id` int(11) NOT NULL,
  `flowrate_lit_hour` int(11) DEFAULT NULL,
  `pressure_kg_cm2` int(11) DEFAULT NULL,
  `delay_pipe_second` int(255) DEFAULT NULL,
  `transaction_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nutrition_pump
-- ----------------------------
INSERT INTO `nutrition_pump` VALUES ('1', '13', '1', '1', '1', '0000-00-00 00:00:00', '2016-12-29 10:07:05', '2016-12-29 10:07:05');

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
INSERT INTO `object` VALUES ('1', 'CACHUA', 'CACHUA', '10', '\0', '2016-09-21 14:44:29', '2016-11-10 12:50:38', 'tomatoes.jpg', 'CACHUA');

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

-- ----------------------------
-- Table structure for period
-- ----------------------------
DROP TABLE IF EXISTS `period`;
CREATE TABLE `period` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of period
-- ----------------------------
INSERT INTO `period` VALUES ('1', 'Lá', '', null, null);
INSERT INTO `period` VALUES ('3', 'Thân', '', null, null);
INSERT INTO `period` VALUES ('4', 'Rễ', '', null, null);
INSERT INTO `period` VALUES ('5', 'Cành', '', null, null);
INSERT INTO `period` VALUES ('6', 'Nụ', '', null, null);
INSERT INTO `period` VALUES ('7', 'Hoa', '', null, null);
INSERT INTO `period` VALUES ('8', 'Quả', '', null, null);

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
INSERT INTO `permission_role` VALUES ('27', '1');
INSERT INTO `permission_role` VALUES ('3', '3');
INSERT INTO `permission_role` VALUES ('4', '3');
INSERT INTO `permission_role` VALUES ('5', '3');
INSERT INTO `permission_role` VALUES ('6', '3');
INSERT INTO `permission_role` VALUES ('9', '3');
INSERT INTO `permission_role` VALUES ('10', '3');
INSERT INTO `permission_role` VALUES ('11', '3');
INSERT INTO `permission_role` VALUES ('12', '3');
INSERT INTO `permission_role` VALUES ('13', '3');
INSERT INTO `permission_role` VALUES ('14', '3');
INSERT INTO `permission_role` VALUES ('15', '3');
INSERT INTO `permission_role` VALUES ('16', '3');
INSERT INTO `permission_role` VALUES ('17', '3');
INSERT INTO `permission_role` VALUES ('18', '3');
INSERT INTO `permission_role` VALUES ('19', '3');
INSERT INTO `permission_role` VALUES ('20', '3');
INSERT INTO `permission_role` VALUES ('21', '3');
INSERT INTO `permission_role` VALUES ('22', '3');
INSERT INTO `permission_role` VALUES ('23', '3');
INSERT INTO `permission_role` VALUES ('24', '3');
INSERT INTO `permission_role` VALUES ('25', '3');
INSERT INTO `permission_role` VALUES ('26', '3');
INSERT INTO `permission_role` VALUES ('27', '3');
INSERT INTO `permission_role` VALUES ('3', '5');
INSERT INTO `permission_role` VALUES ('5', '5');
INSERT INTO `permission_role` VALUES ('9', '5');
INSERT INTO `permission_role` VALUES ('10', '5');
INSERT INTO `permission_role` VALUES ('11', '5');
INSERT INTO `permission_role` VALUES ('12', '5');
INSERT INTO `permission_role` VALUES ('13', '5');
INSERT INTO `permission_role` VALUES ('14', '5');
INSERT INTO `permission_role` VALUES ('15', '5');
INSERT INTO `permission_role` VALUES ('16', '5');
INSERT INTO `permission_role` VALUES ('17', '5');
INSERT INTO `permission_role` VALUES ('18', '5');
INSERT INTO `permission_role` VALUES ('19', '5');
INSERT INTO `permission_role` VALUES ('20', '5');
INSERT INTO `permission_role` VALUES ('21', '5');
INSERT INTO `permission_role` VALUES ('22', '5');
INSERT INTO `permission_role` VALUES ('23', '5');
INSERT INTO `permission_role` VALUES ('24', '5');
INSERT INTO `permission_role` VALUES ('25', '5');
INSERT INTO `permission_role` VALUES ('26', '5');
INSERT INTO `permission_role` VALUES ('27', '5');
INSERT INTO `permission_role` VALUES ('3', '6');
INSERT INTO `permission_role` VALUES ('10', '6');
INSERT INTO `permission_role` VALUES ('17', '6');
INSERT INTO `permission_role` VALUES ('21', '6');
INSERT INTO `permission_role` VALUES ('25', '6');
INSERT INTO `permission_role` VALUES ('27', '6');

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
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of phase
-- ----------------------------
INSERT INTO `phase` VALUES ('1', 'Giai đoạn phát triển lá', '', null, '2016-12-17 22:31:38');

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
  `name` varchar(255) NOT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `object_id` int(11) DEFAULT NULL,
  `sow_date` datetime DEFAULT NULL,
  `plant_date` datetime DEFAULT NULL,
  `harvest_date` datetime DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of process
-- ----------------------------
INSERT INTO `process` VALUES ('2', 'Quy trình sản xuất cà chua', '1000', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', '1', '1', '1', '2016-11-15 07:12:05', '2016-12-29 22:58:13');

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
INSERT INTO `role_user` VALUES ('338', '2');
INSERT INTO `role_user` VALUES ('339', '2');
INSERT INTO `role_user` VALUES ('340', '2');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'admin', 'admin', 'admin', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `roles` VALUES ('2', 'user', 'user', 'user', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `roles` VALUES ('3', 'admin-company', 'admin-company', 'Admin Company', '2016-12-17 18:31:14', '2017-01-27 01:58:54');
INSERT INTO `roles` VALUES ('4', 'nhanvien', 'nhanvien', 'Nhân viên triển khai cài đặt cho khách hàng', '2016-12-17 19:27:14', '2016-12-17 19:27:14');
INSERT INTO `roles` VALUES ('5', 'admin-company-site', 'admin-company-site', 'admin-company-site', '0000-00-00 00:00:00', '2017-01-27 02:13:45');
INSERT INTO `roles` VALUES ('6', 'admin-company-area', 'admin-company-area', 'admin-company-area', '0000-00-00 00:00:00', '2017-01-27 02:15:10');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of site
-- ----------------------------
INSERT INTO `site` VALUES ('1', 'Lâm đồng 1', 'SIT2016.12.14.001', '2016-12-28 14:40:16', '2017-01-22 11:33:01', 'Test', '134 Nam Kỳ Khởi Nghĩa, TP. Buôn Ma Thuật, tỉnh Lâm Đồng, Việt Nam						', ' 225,000', '28	', '34	', '23	', '18	', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '500', 'Khu vực trồng sát bên cạnh bờ sông', '5', '1');

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
  `name` varchar(255) NOT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=341 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('5', '1', null, 'Top Admin', 'admin', '1687147845', 'admin@gmail.com', '', '$2y$10$Fcs25w4Zcf.jvxK0lyuWqeIpMK.HM8UcJpaozUbPIJk67k22UoMdK', 'MBbbDsqZVeBNqyxLyXHRkBPqTxcZGoqyADhBdUidVg00S5KsEKazNT9kC1Xc', '2017-01-27 02:04:26', '2017-01-27 02:04:26');
INSERT INTO `users` VALUES ('338', '1', null, 'admin-company', 'admin-company', '1', 'admin-company@gmail.com', '$2y$10$6gDG2ruvmsfHtt60DNDJxeRxhLeQz0mrb0diyKsRbu8w8qbgA2Nmm', '', '', '2017-01-27 02:11:10', '2017-01-27 02:11:10');
INSERT INTO `users` VALUES ('339', '1', null, 'admin-company-area', 'admin-company-area', '1', 'admin-company-area@gmail.com', '$2y$10$sxFGZUKYsbWD.i9bAwMu.e.zrUU.p7jc.8cwWXmqEW1iDeCVYJKyy', '', '', '2017-01-27 02:11:34', '2017-01-27 02:11:34');
INSERT INTO `users` VALUES ('340', '1', null, 'admin-company-site', 'admin-company-site', '1', 'admin-company-site@gmail.com', '$2y$10$1vNN3yr8MZMgHthnDkU/u.R0vRG07lSmLa2YB0hsnD8RsKyvK3cQu', '', '', '2017-01-27 02:11:51', '2017-01-27 02:11:51');

-- ----------------------------
-- Table structure for water_type
-- ----------------------------
DROP TABLE IF EXISTS `water_type`;
CREATE TABLE `water_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of water_type
-- ----------------------------
INSERT INTO `water_type` VALUES ('1', 'Nước sông', 'PH_SENSOR', null, null);
INSERT INTO `water_type` VALUES ('2', 'Nước hồ', 'TMP_SENSOR', null, null);
INSERT INTO `water_type` VALUES ('3', 'Giếng khoan', '', null, null);
INSERT INTO `water_type` VALUES ('4', 'Nước máy', '', null, null);
INSERT INTO `water_type` VALUES ('5', 'Khác', '', null, null);
