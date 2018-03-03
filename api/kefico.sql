/*
Navicat MySQL Data Transfer

Source Server         : 113.160.131.251
Source Server Version : 50505
Source Host           : 113.160.131.251:3306
Source Database       : kefico

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-04-16 04:42:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `config`
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=489 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('488', '0000-00-00 00:00:00', '2016-04-09 04:24:33', 'IS_TEST_MODE', 'IS_TEST_MODE', 'Chế độ test(chuyển giữa 2 giá trị \"true\" và \"false\")', 'false');

-- ----------------------------
-- Table structure for `log`
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
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('1', 'admin', null, 'UPDATE_USER', '2015-10-18 07:19:21', '42.113.157.162', null);
INSERT INTO `log` VALUES ('2', 'admin', null, 'UPDATE_USER', '2015-10-18 07:24:01', '42.113.157.162', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36');
INSERT INTO `log` VALUES ('3', 'admin', null, 'REMOVE_USER', '2015-10-18 07:48:39', '42.113.157.162', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36');
INSERT INTO `log` VALUES ('4', 'admin', null, 'UPDATE_USER', '2015-10-18 10:09:08', '42.113.157.162', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36');
INSERT INTO `log` VALUES ('5', 'admin', null, 'UPDATE_USER', '2015-10-18 10:09:17', '42.113.157.162', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36');
INSERT INTO `log` VALUES ('6', 'admin', null, 'CREATE_USER', '2015-10-19 00:53:34', '203.162.92.139', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36');
INSERT INTO `log` VALUES ('7', 'admin', null, 'CREATE_USER', '2016-03-30 04:11:34', '14.162.148.57', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36');
INSERT INTO `log` VALUES ('8', 'admin', null, 'ASSIGN_DEVICE', '2016-03-30 04:13:52', '14.162.148.57', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36');
INSERT INTO `log` VALUES ('9', 'admin', null, 'REMOVE_DEVICE', '2016-03-30 04:21:47', '14.162.148.57', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36');
INSERT INTO `log` VALUES ('10', 'admin', null, 'ASSIGN_DEVICE', '2016-03-30 04:42:28', '14.162.148.57', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36');
INSERT INTO `log` VALUES ('11', 'admin', null, 'REMOVE_DEVICE', '2016-03-30 04:44:19', '14.162.148.57', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36');
INSERT INTO `log` VALUES ('12', 'admin', null, 'ASSIGN_DEVICE', '2016-03-30 04:44:38', '14.162.148.57', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36');
INSERT INTO `log` VALUES ('13', 'admin', null, 'REMOVE_DEVICE', '2016-03-31 03:51:00', '14.162.148.57', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36');
INSERT INTO `log` VALUES ('14', 'admin', null, 'ASSIGN_DEVICE', '2016-03-31 03:51:22', '14.162.148.57', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36');
INSERT INTO `log` VALUES ('15', 'admin', null, 'REMOVE_DEVICE', '2016-03-31 03:51:32', '14.162.148.57', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36');
INSERT INTO `log` VALUES ('16', 'admin', null, 'REMOVE_USER', '2016-03-31 04:24:38', '14.162.148.57', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36');
INSERT INTO `log` VALUES ('17', 'admin', null, 'UPDATE_USER', '2016-04-01 01:48:48', '14.162.148.57', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36');
INSERT INTO `log` VALUES ('18', 'admin', null, 'ASSIGN_DEVICE', '2016-04-01 01:49:37', '14.162.148.57', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36');
INSERT INTO `log` VALUES ('19', 'admin', null, 'UPDATE_USER', '2016-04-01 01:58:09', '14.162.148.57', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36');
INSERT INTO `log` VALUES ('20', 'admin', null, 'REMOVE_DEVICE', '2016-04-01 01:59:37', '14.162.148.57', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36');
INSERT INTO `log` VALUES ('21', 'admin', null, 'ASSIGN_DEVICE', '2016-04-01 01:59:45', '14.162.148.57', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36');
INSERT INTO `log` VALUES ('22', 'admin', null, 'REMOVE_DEVICE', '2016-04-01 02:31:22', '14.162.148.57', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36');
INSERT INTO `log` VALUES ('23', 'admin', null, 'ASSIGN_DEVICE', '2016-04-01 02:33:22', '14.162.148.57', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36');
INSERT INTO `log` VALUES ('24', 'admin', null, 'ASSIGN_DEVICE', '2016-04-01 03:51:57', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('25', 'admin', null, 'ASSIGN_DEVICE', '2016-04-01 03:52:13', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('26', 'admin', null, 'ASSIGN_DEVICE', '2016-04-01 03:52:28', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('27', 'admin', null, 'ASSIGN_DEVICE', '2016-04-01 03:59:42', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('28', 'admin', null, 'ASSIGN_DEVICE', '2016-04-01 04:00:07', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('29', 'admin', null, 'REMOVE_DEVICE', '2016-04-01 04:08:01', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('30', 'admin', null, 'REMOVE_DEVICE', '2016-04-01 04:08:09', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('31', 'admin', null, 'REMOVE_DEVICE', '2016-04-01 04:08:19', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('32', 'admin', null, 'REMOVE_DEVICE', '2016-04-01 04:08:26', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('33', 'admin', null, 'REMOVE_DEVICE', '2016-04-01 04:08:34', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('34', 'admin', null, 'ASSIGN_DEVICE', '2016-04-01 05:05:51', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('35', 'admin', null, 'ASSIGN_DEVICE', '2016-04-01 05:06:06', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('36', 'admin', null, 'ASSIGN_DEVICE', '2016-04-01 06:39:36', '14.162.148.57', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36');
INSERT INTO `log` VALUES ('37', 'admin', null, 'REMOVE_DEVICE', '2016-04-01 06:45:44', '14.162.148.57', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36');
INSERT INTO `log` VALUES ('38', 'admin', null, 'REMOVE_DEVICE', '2016-04-01 08:04:55', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('39', 'admin', null, 'REMOVE_DEVICE', '2016-04-01 08:05:03', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('40', 'admin', null, 'ASSIGN_DEVICE', '2016-04-01 08:18:12', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('41', 'admin', null, 'ASSIGN_DEVICE', '2016-04-01 08:18:31', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('42', 'admin', null, 'ASSIGN_DEVICE', '2016-04-01 08:18:58', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('43', 'admin', null, 'ASSIGN_DEVICE', '2016-04-01 08:19:19', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('44', 'admin', null, 'REMOVE_DEVICE', '2016-04-01 08:19:53', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('45', 'admin', null, 'ASSIGN_DEVICE', '2016-04-01 08:20:13', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('46', 'admin', null, 'ASSIGN_DEVICE', '2016-04-01 08:22:13', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('47', 'admin', null, 'ASSIGN_DEVICE', '2016-04-01 08:30:25', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('48', 'admin', null, 'REMOVE_DEVICE', '2016-04-01 08:33:57', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('49', 'admin', null, 'REMOVE_DEVICE', '2016-04-01 08:34:00', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('50', 'admin', null, 'REMOVE_DEVICE', '2016-04-01 08:34:03', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('51', 'admin', null, 'REMOVE_DEVICE', '2016-04-01 08:34:05', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('52', 'admin', null, 'REMOVE_DEVICE', '2016-04-01 08:34:08', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('53', 'admin', null, 'REMOVE_DEVICE', '2016-04-01 08:34:11', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('54', 'admin', null, 'ASSIGN_DEVICE', '2016-04-02 02:50:40', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('55', 'admin', null, 'ASSIGN_DEVICE', '2016-04-02 02:51:04', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('56', 'admin', null, 'ASSIGN_DEVICE', '2016-04-02 02:51:20', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('57', 'admin', null, 'ASSIGN_DEVICE', '2016-04-02 02:51:35', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('58', 'admin', null, 'ASSIGN_DEVICE', '2016-04-02 02:51:49', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('59', 'admin', null, 'ASSIGN_DEVICE', '2016-04-02 02:52:05', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('60', 'admin', null, 'ASSIGN_DEVICE', '2016-04-02 02:52:23', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('61', 'admin', null, 'ASSIGN_DEVICE', '2016-04-02 02:52:44', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('62', 'admin', null, 'ASSIGN_DEVICE', '2016-04-02 02:53:05', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('63', 'admin', null, 'ASSIGN_DEVICE', '2016-04-02 02:53:27', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('64', 'admin', null, 'ASSIGN_DEVICE', '2016-04-02 02:53:49', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('65', 'admin', null, 'ASSIGN_DEVICE', '2016-04-02 02:54:03', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('66', 'admin', null, 'ASSIGN_DEVICE', '2016-04-02 02:54:23', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('67', 'admin', null, 'ASSIGN_DEVICE', '2016-04-02 02:54:47', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('68', 'admin', null, 'ASSIGN_DEVICE', '2016-04-02 02:55:08', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('69', 'admin', null, 'ASSIGN_DEVICE', '2016-04-02 02:55:26', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('70', 'admin', null, 'ASSIGN_DEVICE', '2016-04-02 02:55:49', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('71', 'admin', null, 'ASSIGN_DEVICE', '2016-04-02 02:56:02', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('72', 'admin', null, 'ASSIGN_DEVICE', '2016-04-02 02:56:19', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('73', 'admin', null, 'ASSIGN_DEVICE', '2016-04-02 02:56:31', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('74', 'admin', null, 'ASSIGN_DEVICE', '2016-04-02 02:57:05', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('75', 'admin', null, 'ASSIGN_DEVICE', '2016-04-02 02:57:36', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('76', 'admin', null, 'ASSIGN_DEVICE', '2016-04-02 02:57:48', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('77', 'admin', null, 'ASSIGN_DEVICE', '2016-04-02 02:58:07', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('78', 'admin', null, 'ASSIGN_DEVICE', '2016-04-02 02:58:25', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('79', 'admin', null, 'ASSIGN_DEVICE', '2016-04-02 02:58:34', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('80', 'admin', null, 'ASSIGN_DEVICE', '2016-04-02 02:59:34', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('81', 'admin', null, 'ASSIGN_DEVICE', '2016-04-02 02:59:50', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('82', 'admin', null, 'ASSIGN_DEVICE', '2016-04-02 03:00:04', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('83', 'admin', null, 'ASSIGN_DEVICE', '2016-04-02 03:00:22', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('84', 'admin', null, 'ASSIGN_DEVICE', '2016-04-02 03:00:42', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('85', 'admin', null, 'ASSIGN_DEVICE', '2016-04-02 03:01:09', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('86', 'admin', null, 'ASSIGN_DEVICE', '2016-04-02 03:01:45', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('87', 'admin', null, 'ASSIGN_DEVICE', '2016-04-02 03:02:24', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('88', 'admin', null, 'REMOVE_DEVICE', '2016-04-02 03:03:39', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('89', 'admin', null, 'REMOVE_DEVICE', '2016-04-03 05:13:20', '42.114.38.253', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.110 Safari/537.36');
INSERT INTO `log` VALUES ('90', 'admin', null, 'ASSIGN_DEVICE', '2016-04-03 05:13:26', '42.114.38.253', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.110 Safari/537.36');
INSERT INTO `log` VALUES ('91', 'admin', null, 'REMOVE_DEVICE', '2016-04-03 05:15:06', '42.114.38.253', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.110 Safari/537.36');
INSERT INTO `log` VALUES ('92', 'admin', null, 'ASSIGN_DEVICE', '2016-04-03 05:15:30', '42.114.38.253', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.110 Safari/537.36');
INSERT INTO `log` VALUES ('93', 'admin', null, 'ASSIGN_DEVICE', '2016-04-03 05:16:26', '42.114.38.253', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.110 Safari/537.36');
INSERT INTO `log` VALUES ('94', 'admin', null, 'REMOVE_DEVICE', '2016-04-03 05:17:06', '42.114.38.253', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.110 Safari/537.36');
INSERT INTO `log` VALUES ('95', 'admin', null, 'ASSIGN_DEVICE', '2016-04-03 05:18:19', '42.114.38.253', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.110 Safari/537.36');
INSERT INTO `log` VALUES ('96', 'admin', null, 'REMOVE_DEVICE', '2016-04-03 05:20:03', '42.114.38.253', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.110 Safari/537.36');
INSERT INTO `log` VALUES ('97', 'admin', null, 'ASSIGN_DEVICE', '2016-04-03 05:20:13', '42.114.38.253', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.110 Safari/537.36');
INSERT INTO `log` VALUES ('98', 'admin', null, 'REMOVE_DEVICE', '2016-04-06 03:04:42', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('99', 'admin', null, 'REMOVE_DEVICE', '2016-04-06 03:04:53', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('100', 'admin', null, 'REMOVE_DEVICE', '2016-04-06 03:04:58', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('101', 'admin', null, 'REMOVE_DEVICE', '2016-04-06 03:05:03', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('102', 'admin', null, 'REMOVE_DEVICE', '2016-04-06 03:05:08', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('103', 'admin', null, 'REMOVE_DEVICE', '2016-04-06 03:05:13', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('104', 'admin', null, 'REMOVE_DEVICE', '2016-04-06 03:05:50', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('105', 'admin', null, 'REMOVE_DEVICE', '2016-04-06 03:06:11', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('106', 'admin', null, 'REMOVE_DEVICE', '2016-04-06 03:06:15', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('107', 'admin', null, 'REMOVE_DEVICE', '2016-04-06 03:06:19', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('108', 'admin', null, 'REMOVE_DEVICE', '2016-04-06 03:06:23', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('109', 'admin', null, 'REMOVE_DEVICE', '2016-04-06 03:06:26', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('110', 'admin', null, 'REMOVE_DEVICE', '2016-04-06 03:06:31', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('111', 'admin', null, 'REMOVE_DEVICE', '2016-04-06 03:06:34', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('112', 'admin', null, 'REMOVE_DEVICE', '2016-04-06 03:06:39', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('113', 'admin', null, 'REMOVE_DEVICE', '2016-04-06 03:06:42', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('114', 'admin', null, 'REMOVE_DEVICE', '2016-04-06 03:06:45', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('115', 'admin', null, 'REMOVE_DEVICE', '2016-04-06 03:07:03', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('116', 'admin', null, 'REMOVE_DEVICE', '2016-04-06 03:07:06', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('117', 'admin', null, 'REMOVE_DEVICE', '2016-04-06 03:07:08', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('118', 'admin', null, 'REMOVE_DEVICE', '2016-04-06 03:07:11', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('119', 'admin', null, 'REMOVE_DEVICE', '2016-04-06 03:07:13', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('120', 'admin', null, 'REMOVE_DEVICE', '2016-04-06 03:07:19', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('121', 'admin', null, 'REMOVE_DEVICE', '2016-04-06 03:07:23', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('122', 'admin', null, 'REMOVE_DEVICE', '2016-04-06 03:07:26', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('123', 'admin', null, 'REMOVE_DEVICE', '2016-04-06 03:07:29', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('124', 'admin', null, 'REMOVE_DEVICE', '2016-04-06 03:07:32', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('125', 'admin', null, 'REMOVE_DEVICE', '2016-04-06 03:07:34', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('126', 'admin', null, 'REMOVE_DEVICE', '2016-04-06 03:07:37', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('127', 'admin', null, 'REMOVE_DEVICE', '2016-04-06 03:07:41', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('128', 'admin', null, 'REMOVE_DEVICE', '2016-04-06 03:07:44', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('129', 'admin', null, 'UPDATE_DEVICE', '2016-04-06 03:49:26', '203.162.92.139', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.110 Safari/537.36');
INSERT INTO `log` VALUES ('130', 'admin', null, 'UPDATE_DEVICE', '2016-04-06 03:53:56', '203.162.92.139', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.110 Safari/537.36');
INSERT INTO `log` VALUES ('131', 'admin', null, 'UPDATE_DEVICE', '2016-04-06 03:54:49', '203.162.92.139', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.110 Safari/537.36');
INSERT INTO `log` VALUES ('132', 'admin', null, 'UPDATE_DEVICE', '2016-04-06 03:55:16', '203.162.92.139', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.110 Safari/537.36');
INSERT INTO `log` VALUES ('133', 'admin', null, 'UPDATE_DEVICE', '2016-04-06 03:55:22', '203.162.92.139', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.110 Safari/537.36');
INSERT INTO `log` VALUES ('134', 'admin', null, 'UPDATE_DEVICE', '2016-04-06 06:00:04', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('135', 'admin', null, 'UPDATE_DEVICE', '2016-04-06 06:00:14', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('136', 'admin', null, 'UPDATE_DEVICE', '2016-04-06 06:00:22', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('137', 'admin', null, 'UPDATE_DEVICE', '2016-04-06 06:00:57', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('138', 'admin', null, 'UPDATE_DEVICE', '2016-04-06 06:02:47', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('139', 'admin', null, 'ASSIGN_DEVICE', '2016-04-09 04:00:54', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('140', 'admin', null, 'ASSIGN_DEVICE', '2016-04-09 04:01:22', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('141', 'admin', null, 'ASSIGN_DEVICE', '2016-04-09 04:01:39', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('142', 'admin', null, 'ASSIGN_DEVICE', '2016-04-09 04:01:56', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('143', 'admin', null, 'ASSIGN_DEVICE', '2016-04-09 04:02:21', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('144', 'admin', null, 'ASSIGN_DEVICE', '2016-04-09 04:02:45', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('145', 'admin', null, 'ASSIGN_DEVICE', '2016-04-09 04:03:35', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('146', 'admin', null, 'ASSIGN_DEVICE', '2016-04-09 04:03:52', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('147', 'admin', null, 'ASSIGN_DEVICE', '2016-04-09 04:04:06', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('148', 'admin', null, 'ASSIGN_DEVICE', '2016-04-09 04:04:26', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('149', 'admin', null, 'ASSIGN_DEVICE', '2016-04-09 04:04:50', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('150', 'admin', null, 'ASSIGN_DEVICE', '2016-04-09 04:05:05', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('151', 'admin', null, 'ASSIGN_DEVICE', '2016-04-09 04:05:27', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('152', 'admin', null, 'ASSIGN_DEVICE', '2016-04-09 04:05:52', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('153', 'admin', null, 'ASSIGN_DEVICE', '2016-04-09 04:06:06', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('154', 'admin', null, 'ASSIGN_DEVICE', '2016-04-09 04:06:20', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('155', 'admin', null, 'ASSIGN_DEVICE', '2016-04-09 04:06:32', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('156', 'admin', null, 'ASSIGN_DEVICE', '2016-04-09 04:07:11', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('157', 'admin', null, 'ASSIGN_DEVICE', '2016-04-09 04:07:31', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('158', 'admin', null, 'ASSIGN_DEVICE', '2016-04-09 04:08:04', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('159', 'admin', null, 'ASSIGN_DEVICE', '2016-04-09 04:08:16', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('160', 'admin', null, 'ASSIGN_DEVICE', '2016-04-09 04:08:34', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('161', 'admin', null, 'ASSIGN_DEVICE', '2016-04-09 04:08:54', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('162', 'admin', null, 'ASSIGN_DEVICE', '2016-04-09 04:09:10', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('163', 'admin', null, 'ASSIGN_DEVICE', '2016-04-09 04:09:21', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('164', 'admin', null, 'ASSIGN_DEVICE', '2016-04-09 04:09:56', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('165', 'admin', null, 'ASSIGN_DEVICE', '2016-04-09 04:10:09', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('166', 'admin', null, 'ASSIGN_DEVICE', '2016-04-09 04:10:27', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('167', 'admin', null, 'ASSIGN_DEVICE', '2016-04-09 04:10:44', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('168', 'admin', null, 'ASSIGN_DEVICE', '2016-04-09 04:11:36', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('169', 'admin', null, 'ASSIGN_DEVICE', '2016-04-09 04:11:59', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');
INSERT INTO `log` VALUES ('170', 'admin', null, 'ASSIGN_DEVICE', '2016-04-13 08:16:05', '10.126.125.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko');

-- ----------------------------
-- Table structure for `migrations`
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
-- Table structure for `mobile`
-- ----------------------------
DROP TABLE IF EXISTS `mobile`;
CREATE TABLE `mobile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(15) NOT NULL,
  `test` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mobile
-- ----------------------------
INSERT INTO `mobile` VALUES ('8', '84945965696', '1');
INSERT INTO `mobile` VALUES ('30', '84973836738', '1');
INSERT INTO `mobile` VALUES ('42', '84982776527', '1');
INSERT INTO `mobile` VALUES ('62', '84912669066', '1');
INSERT INTO `mobile` VALUES ('63', '84902227888', '0');
INSERT INTO `mobile` VALUES ('64', '84942369968', '0');
INSERT INTO `mobile` VALUES ('65', '841629182533', '0');
INSERT INTO `mobile` VALUES ('66', '84979363727', '0');
INSERT INTO `mobile` VALUES ('67', '84977787626', '0');
INSERT INTO `mobile` VALUES ('68', '84975707189', '0');
INSERT INTO `mobile` VALUES ('69', '84977238839', '0');
INSERT INTO `mobile` VALUES ('70', '84947793224', '0');
INSERT INTO `mobile` VALUES ('71', '841674666567', '0');
INSERT INTO `mobile` VALUES ('72', '841668949689', '0');
INSERT INTO `mobile` VALUES ('73', '84936559363', '0');
INSERT INTO `mobile` VALUES ('74', '841689953184', '0');
INSERT INTO `mobile` VALUES ('75', '84915100256', '0');
INSERT INTO `mobile` VALUES ('76', '84935336599', '0');
INSERT INTO `mobile` VALUES ('77', '84988978686', '0');
INSERT INTO `mobile` VALUES ('78', '84982606296', '0');
INSERT INTO `mobile` VALUES ('79', '84919075916', '0');
INSERT INTO `mobile` VALUES ('80', '84986838736', '0');
INSERT INTO `mobile` VALUES ('81', '8416577953317', '0');
INSERT INTO `mobile` VALUES ('82', '84917546168', '1');
INSERT INTO `mobile` VALUES ('83', '84969914888', '0');
INSERT INTO `mobile` VALUES ('84', '84947076299', '0');
INSERT INTO `mobile` VALUES ('85', '84978995177', '0');
INSERT INTO `mobile` VALUES ('86', '84976565126', '0');
INSERT INTO `mobile` VALUES ('87', '84938004127', '0');
INSERT INTO `mobile` VALUES ('88', '841682890999', '0');
INSERT INTO `mobile` VALUES ('89', '841627566566', '0');
INSERT INTO `mobile` VALUES ('90', '841683133433', '0');
INSERT INTO `mobile` VALUES ('91', '841627366366', '0');
INSERT INTO `mobile` VALUES ('92', '84936219398', '0');
INSERT INTO `mobile` VALUES ('93', '84983993140', '0');
INSERT INTO `mobile` VALUES ('94', '84912669066', '1');

-- ----------------------------
-- Table structure for `password_resets`
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
-- Table structure for `permissions`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `permission_role`
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of permission_role
-- ----------------------------

-- ----------------------------
-- Table structure for `roles`
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'admin', 'admin', 'admin', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `role_user`
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
-- Table structure for `sms_mt`
-- ----------------------------
DROP TABLE IF EXISTS `sms_mt`;
CREATE TABLE `sms_mt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` text NOT NULL,
  `content` text NOT NULL,
  `create_date` datetime NOT NULL,
  `status` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sms_mt
-- ----------------------------
INSERT INTO `sms_mt` VALUES ('1', '84912669066', 'Content can gui\r\n', '2016-03-30 11:40:56', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('2', '84912669066', 'Content can gui\r\n', '2016-03-30 11:41:33', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('4', '84912669066,84888166636', 'Content can gui\r\n', '2016-03-30 11:44:43', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('5', '84912669066,84888166636', 'Content can gui\r\n', '2016-03-30 21:19:43', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('6', '84912669066,84888166636', 'Content can gui\r\n', '2016-03-31 10:50:04', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('7', '84918099966', 'Content can gui\r\n', '2016-03-31 10:51:37', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('8', '84918099966,84945965696', 'Content can gui\r\n', '2016-04-01 08:49:58', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('9', '84912669066,84945965696', 'Content can gui\r\n', '2016-04-01 10:43:56', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('10', '84912669066,84945965696', 'alarm message to send', '2016-04-01 10:46:21', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('11', '84912669066,84945965696', 'alarm message to send', '2016-04-01 10:47:08', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('12', '84912669066,84945965696,0982776527,0973836738,0982606296', 'alarm message to send', '2016-04-01 10:52:54', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('13', '84912669066,84945965696,0982776527,0973836738,0982606296', 'alarm message to send', '2016-04-01 10:53:21', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('14', '84912669066,84945965696,84982776527,84973836738,84982606296', 'Content can gui\r\n', '2016-04-01 10:53:42', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('15', '84912669066,84945965696,84982776527,84973836738,84982606296', 'Content can gui\r\n', '2016-04-01 10:57:23', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('16', '84912669066,84945965696,84982776527,84973836738,84982606296,841627366366,841655208888', 'alarm message to send', '2016-04-01 11:02:44', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('17', '84912669066,84945965696,84982776527,84973836738,84982606296,841627366366,841655208888', 'alarm message to send', '2016-04-01 11:03:14', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('18', '84912669066,84945965696,84982776527,84973836738,84982606296,841627366366,841655208888', 'alarm message to send', '2016-04-01 11:04:12', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('19', '84912669066,84945965696', 'alarm message to send', '2016-04-01 11:10:14', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('20', '84912669066,84945965696', 'alarm message to send', '2016-04-01 11:10:15', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('21', '84912669066,84945965696', 'alarm message to send', '2016-04-01 11:10:18', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('22', '84912669066,84945965696', 'alarm message to send', '2016-04-01 11:10:30', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('23', '84912669066,84945965696', 'alarm message to send', '2016-04-01 11:10:43', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('24', '84912669066,84945965696', 'alarm message to send', '2016-04-01 11:14:10', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('25', '84912669066,84945965696', '[EV6 SafetyAlarm!] SolventRoom :Air flow sensor [EV6 SafetyAlarm!] N-HeptaneRoom :Air flow sensor :Temperature 27C :Spark detect (01/04/2016 11:15:11)', '2016-04-01 11:15:11', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('26', '84912669066,84945965696', '[EV6 SafetyAlarm!] N-HeptaneRoom :Temperature 27C :Spark detect (01/04/2016 11:15:11)', '2016-04-01 11:16:15', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('27', '84912669066,84945965696', 'alarm message to send', '2016-04-01 11:19:09', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('28', '84912669066,84945965696', '[EV6 SafetyAlarm!] N-HeptaneRoom :Air flow sensor (01/04/2016 11:18:37)', '2016-04-01 11:19:31', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('29', '84912669066,84945965696', '[EV6 SafetyAlarm!] N-HeptaneRoom :Gas leak 20% :Gas leak 25% (01/04/2016 11:19:32)', '2016-04-01 11:21:08', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('30', '84912669066,84945965696', '[EV6 SafetyAlarm!] N-HeptaneRoom :Temperature 27C :Spark detect (01/04/2016 11:21:08)', '2016-04-01 11:22:49', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('31', '84912669066,84945965696', '[EV6 SafetyAlarm!] N-HeptaneRoom :Temperature 40C :Control OFF (01/04/2016 11:22:49)', '2016-04-01 11:23:48', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('32', '84912669066,84945965696', '[EV6 SafetyAlarm!] SolventRoom :Gas leak 20% :Gas leak 25% :Thermographic (01/04/2016 11:32:35)', '2016-04-01 11:36:17', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('33', '84912669066,84945965696', 'alarm message to send', '2016-04-01 11:37:07', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('34', '84912669066,84945965696', '[EV6 SafetyAlarm!] SolventRoom :Gas leak 25% :Thermographic (01/04/2016 11:40:13)', '2016-04-01 11:42:21', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('35', '84912669066,84945965696', '[EV6 SafetyAlarm!] SolventRoom :Gas leak 20% :Gas leak 25% (01/04/2016 11:42:22)', '2016-04-01 11:42:46', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('36', '84912669066,84945965696', '[EV6 SafetyAlarm!] SolventRoom :Gas leak 20% :Gas leak 25% (01/04/2016 11:42:47)', '2016-04-01 11:43:27', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('37', '84912669066,84945965696', '[EV6 SafetyAlarm!] SolventRoom :Gas leak 20% :Gas leak 25% (01/04/2016 11:43:27)', '2016-04-01 11:43:56', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('38', '84912669066,84945965696', '[EV6 SafetyAlarm!] SolventRoom :Gas leak 20% :Gas leak 25% (01/04/2016 11:44:21)', '2016-04-01 11:44:28', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('39', '84912669066,84945965696', '[EV6 SafetyAlarm!] SolventRoom :Gas leak 20% :Gas leak 25% [EV6 SafetyAlarm!] N-HeptaneRoom :Emergency (01/04/2016 11:45:47)', '2016-04-01 11:46:25', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('40', '84912669066,84945965696', '[EV6 SafetyAlarm!] SolventRoom :Gas leak 20% :Gas leak 25% (01/04/2016 11:47:31)', '2016-04-01 11:47:47', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('41', '84912669066,84945965696,84942369968,84915100256', 'alarm message to send', '2016-04-01 12:06:32', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('42', '84912669066,84945965696,84942369968,84915100256', 'Content can gui\r\n', '2016-04-01 13:44:59', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('43', '84988631138', 'Content can gui\r\n', '2016-04-01 13:45:02', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('44', '84912669066,84945965696', '[EV6 SafetyAlarm!] SolventRoom :Air flow sensor :Gas leak 25% (01/04/2016 12:03:24)', '2016-04-01 15:11:45', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('45', '84912669066,84945965696', '[EV6 SafetyAlarm!] SolventRoom :Gas leak 25% (01/04/2016 15:11:46)', '2016-04-01 15:14:00', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('46', '84912669066,84945965696', '[EV6 SafetyAlarm!] SolventRoom :Gas leak 25% (01/04/2016 15:16:24)', '2016-04-01 15:17:31', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('47', '84912669066,84945965696', '[EV6 SafetyAlarm!] SolventRoom :Gas leak 25% (01/04/2016 15:17:31)', '2016-04-01 15:18:05', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('48', '84912669066,84945965696,84915100256,84917546168', '[EV6 SafetyAlarm!] SolventRoom :Gas leak 25%', '2016-04-01 15:31:02', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('49', '841627366366,84988978686,841655208888,84973836738', '[EV6 SafetyAlarm!] SolventRoom :Gas leak 25%', '2016-04-01 15:31:02', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('50', '84912669066,84945965696,84942369968,84947793224,84915100256,84919075916,84917546168,84947076299', 'This is an message for testing the EV6 Safety system on today, You just ignore it, Thanks!', '2016-04-02 10:08:49', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('51', '84902227888,84936559363,84935336599,84936219398', 'This is an message for testing the EV6 Safety system on today, You just ignore it, Thanks!', '2016-04-02 10:08:49', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('52', '841682890999,841627566566,841683133433,841627366366,84973836738,841629182533,84979363727,84977787626,84975707189,84977238389,841674666567,841668949689,841689953184,84982776527,84988978686,84982606296,84986838736,841657795317,84969914888,84978995177,84976565126,84983004127,84983993140', 'This is an message for testing the EV6 Safety system on today, You just ignore it, Thanks!', '2016-04-02 10:08:49', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('53', '84912669066,84945965696,84942369968,84947793224,84915100256,84919075916,84917546168,84947076299', '[EV6 SafetyAlarm!] SolventRoom :Air flow sensor (01/04/2016 15:39:08)', '2016-04-02 12:42:35', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('54', '84902227888,84936559363,84935336599,84936219398', '[EV6 SafetyAlarm!] SolventRoom :Air flow sensor (01/04/2016 15:39:08)', '2016-04-02 12:42:35', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('55', '841682890999,841627566566,841683133433,841627366366,84973836738,841629182533,84979363727,84977787626,84975707189,84977238389,841674666567,841668949689,841689953184,84982776527,84988978686,84982606296,84986838736,841657795317,84969914888,84978995177,84976565126,84983004127,84983993140', '[EV6 SafetyAlarm!] SolventRoom :Air flow sensor (01/04/2016 15:39:08)', '2016-04-02 12:42:35', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('56', '84912669066', 'Content can gui\r\n', '2016-04-03 12:48:04', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('57', '84912669066', 'Content can gui\r\n', '2016-04-03 12:50:24', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('58', '84912669066', 'Content can gui\r\n', '2016-04-03 12:53:29', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('59', '84912669066', 'Content can gui\r\n', '2016-04-03 12:54:18', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('60', '84912669066', '[EV6 SafetyAlarm!] SolventRoom :Air flow sensor (02/04/2016 12:42:36)', '2016-04-03 12:54:23', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('61', '84945965696,84942369968,84947793224,84915100256,84919075916,84917546168,84947076299,84912669066', 'Content can gui\r\n', '2016-04-03 13:07:25', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('62', '84902227888,84936559363,84935336599,84936219398', 'Content can gui\r\n', '2016-04-03 13:07:26', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('63', '841682890999,841627566566,841683133433,841627366366,84973836738,841629182533,84979363727,84977787626,84975707189,84977238389,841674666567,841668949689,841689953184,84982776527,84988978686,84982606296,84986838736,841657795317,84969914888,84978995177,84976565126,84983004127,84983993140', 'Content can gui\r\n', '2016-04-03 13:07:26', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('64', '84945965696,84942369968,84947793224,84915100256,84919075916,84917546168,84947076299,84912669066', 'Today is finally for testing the EV6 Safety system, might you will be received some alarm messages , Please ignore it, Thanks! ^^', '2016-04-04 10:09:55', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('65', '84902227888,84936559363,84935336599,84936219398', 'Today is finally for testing the EV6 Safety system, might you will be received some alarm messages , Please ignore it, Thanks! ^^', '2016-04-04 10:09:55', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('66', '841682890999,841627566566,841683133433,841627366366,84973836738,841629182533,84979363727,84977787626,84975707189,84977238389,841674666567,841668949689,841689953184,84982776527,84988978686,84982606296,84986838736,841657795317,84969914888,84978995177,84976565126,84983004127,84983993140', 'Today is finally for testing the EV6 Safety system, might you will be received some alarm messages , Please ignore it, Thanks! ^^', '2016-04-04 10:09:55', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('67', '84945965696,84942369968,84947793224,84915100256,84919075916,84917546168,84947076299,84912669066', '[EV6 SafetyAlarm!] N-HeptaneRoom :Temperature 27C :Spark detect (03/04/2016 12:54:25)', '2016-04-04 10:16:42', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('68', '84902227888,84936559363,84935336599,84936219398', '[EV6 SafetyAlarm!] N-HeptaneRoom :Temperature 27C :Spark detect (03/04/2016 12:54:25)', '2016-04-04 10:16:42', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('69', '841682890999,841627566566,841683133433,841627366366,84973836738,841629182533,84979363727,84977787626,84975707189,84977238389,841674666567,841668949689,841689953184,84982776527,84988978686,84982606296,84986838736,841657795317,84969914888,84978995177,84976565126,84983004127,84983993140', '[EV6 SafetyAlarm!] N-HeptaneRoom :Temperature 27C :Spark detect (03/04/2016 12:54:25)', '2016-04-04 10:16:42', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('70', '84945965696,84942369968,84947793224,84915100256,84919075916,84917546168,84947076299,84912669066', 'Content can gui\r\n', '2016-04-04 11:17:53', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('71', '84902227888,84936559363,84935336599,84936219398', 'Content can gui\r\n', '2016-04-04 11:17:56', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('72', '841682890999,841627566566,841683133433,841627366366,84973836738,841629182533,84979363727,84977787626,84975707189,84977238389,841674666567,841668949689,841689953184,84982776527,84988978686,84982606296,84986838736,841657795317,84969914888,84978995177,84976565126,84983004127,84983993140', 'Content can gui\r\n', '2016-04-04 11:17:56', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('73', '84945965696,84942369968,84947793224,84915100256,84919075916,84917546168,84947076299,84912669066', '[EV6 SafetyAlarm!] SolventRoom :Gas leak 25% (04/04/2016 11:20:15)', '2016-04-04 11:24:12', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('74', '84902227888,84936559363,84935336599,84936219398', '[EV6 SafetyAlarm!] SolventRoom :Gas leak 25% (04/04/2016 11:20:15)', '2016-04-04 11:24:12', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('75', '841682890999,841627566566,841683133433,841627366366,84973836738,841629182533,84979363727,84977787626,84975707189,84977238389,841674666567,841668949689,841689953184,84982776527,84988978686,84982606296,84986838736,841657795317,84969914888,84978995177,84976565126,84983004127,84983993140', '[EV6 SafetyAlarm!] SolventRoom :Gas leak 25% (04/04/2016 11:20:15)', '2016-04-04 11:24:12', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('76', '84945965696,84942369968,84947793224,84915100256,84919075916,84917546168,84947076299,84912669066', '[EV6 SafetyAlarm!] SolventRoom :Spark detection (04/04/2016 11:24:13)', '2016-04-04 11:32:28', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('77', '84902227888,84936559363,84935336599,84936219398', '[EV6 SafetyAlarm!] SolventRoom :Spark detection (04/04/2016 11:24:13)', '2016-04-04 11:32:28', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('78', '841682890999,841627566566,841683133433,841627366366,84973836738,841629182533,84979363727,84977787626,84975707189,84977238389,841674666567,841668949689,841689953184,84982776527,84988978686,84982606296,84986838736,841657795317,84969914888,84978995177,84976565126,84983004127,84983993140', '[EV6 SafetyAlarm!] SolventRoom :Spark detection (04/04/2016 11:24:13)', '2016-04-04 11:32:28', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('79', '84945965696,84942369968,84947793224,84915100256,84919075916,84917546168,84947076299,84912669066', '[EV6 SafetyAlarm!] SolventRoom :Spark detection (04/04/2016 11:32:29)', '2016-04-04 11:36:46', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('80', '84902227888,84936559363,84935336599,84936219398', '[EV6 SafetyAlarm!] SolventRoom :Spark detection (04/04/2016 11:32:29)', '2016-04-04 11:36:46', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('81', '841682890999,841627566566,841683133433,841627366366,84973836738,841629182533,84979363727,84977787626,84975707189,84977238389,841674666567,841668949689,841689953184,84982776527,84988978686,84982606296,84986838736,841657795317,84969914888,84978995177,84976565126,84983004127,84983993140', '[EV6 SafetyAlarm!] SolventRoom :Spark detection (04/04/2016 11:32:29)', '2016-04-04 11:36:46', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('82', '84945965696,84942369968,84947793224,84915100256,84919075916,84917546168,84947076299,84912669066', '[EV6 SafetyAlarm!] SolventRoom :Gas leak 20% :Gas leak 25% (04/04/2016 11:36:46)', '2016-04-04 11:39:17', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('83', '84902227888,84936559363,84935336599,84936219398', '[EV6 SafetyAlarm!] SolventRoom :Gas leak 20% :Gas leak 25% (04/04/2016 11:36:46)', '2016-04-04 11:39:17', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('84', '841682890999,841627566566,841683133433,841627366366,84973836738,841629182533,84979363727,84977787626,84975707189,84977238389,841674666567,841668949689,841689953184,84982776527,84988978686,84982606296,84986838736,841657795317,84969914888,84978995177,84976565126,84983004127,84983993140', '[EV6 SafetyAlarm!] SolventRoom :Gas leak 20% :Gas leak 25% (04/04/2016 11:36:46)', '2016-04-04 11:39:17', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('85', '84945965696,84942369968,84947793224,84915100256,84919075916,84917546168,84947076299,84912669066', '[EV6 SafetyAlarm!] SolventRoom :Gas leak 20% :Gas leak 25% (04/04/2016 11:39:17)', '2016-04-04 11:39:29', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('86', '84902227888,84936559363,84935336599,84936219398', '[EV6 SafetyAlarm!] SolventRoom :Gas leak 20% :Gas leak 25% (04/04/2016 11:39:17)', '2016-04-04 11:39:29', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('87', '841682890999,841627566566,841683133433,841627366366,84973836738,841629182533,84979363727,84977787626,84975707189,84977238389,841674666567,841668949689,841689953184,84982776527,84988978686,84982606296,84986838736,841657795317,84969914888,84978995177,84976565126,84983004127,84983993140', '[EV6 SafetyAlarm!] SolventRoom :Gas leak 20% :Gas leak 25% (04/04/2016 11:39:17)', '2016-04-04 11:39:30', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('88', '84945965696,84942369968,84947793224,84915100256,84919075916,84917546168,84947076299,84912669066', '[EV6 SafetyAlarm!] SolventRoom :Gas leak 20% :Gas leak 25% (04/04/2016 11:39:30)', '2016-04-04 11:39:58', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('89', '84902227888,84936559363,84935336599,84936219398', '[EV6 SafetyAlarm!] SolventRoom :Gas leak 20% :Gas leak 25% (04/04/2016 11:39:30)', '2016-04-04 11:39:58', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('90', '841682890999,841627566566,841683133433,841627366366,84973836738,841629182533,84979363727,84977787626,84975707189,84977238389,841674666567,841668949689,841689953184,84982776527,84988978686,84982606296,84986838736,841657795317,84969914888,84978995177,84976565126,84983004127,84983993140', '[EV6 SafetyAlarm!] SolventRoom :Gas leak 20% :Gas leak 25% (04/04/2016 11:39:30)', '2016-04-04 11:39:58', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('91', '84945965696,84942369968,84947793224,84915100256,84919075916,84917546168,84947076299,84912669066', '[EV6 SafetyAlarm!] SolventRoom :Gas leak 20% :Gas leak 25% (04/04/2016 11:39:59)', '2016-04-04 11:41:01', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('92', '84902227888,84936559363,84935336599,84936219398', '[EV6 SafetyAlarm!] SolventRoom :Gas leak 20% :Gas leak 25% (04/04/2016 11:39:59)', '2016-04-04 11:41:01', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('93', '841682890999,841627566566,841683133433,841627366366,84973836738,841629182533,84979363727,84977787626,84975707189,84977238389,841674666567,841668949689,841689953184,84982776527,84988978686,84982606296,84986838736,841657795317,84969914888,84978995177,84976565126,84983004127,84983993140', '[EV6 SafetyAlarm!] SolventRoom :Gas leak 20% :Gas leak 25% (04/04/2016 11:39:59)', '2016-04-04 11:41:01', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('94', '84945965696,84942369968,84947793224,84915100256,84919075916,84917546168,84947076299,84912669066', '[EV6 SafetyAlarm!] SolventRoom :Air flow sensor (04/04/2016 13:06:11)', '2016-04-05 13:18:07', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('95', '84902227888,84936559363,84935336599,84936219398', '[EV6 SafetyAlarm!] SolventRoom :Air flow sensor (04/04/2016 13:06:11)', '2016-04-05 13:18:07', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('96', '841682890999,841627566566,841683133433,841627366366,84973836738,841629182533,84979363727,84977787626,84975707189,84977238389,841674666567,841668949689,841689953184,84982776527,84988978686,84982606296,84986838736,841657795317,84969914888,84978995177,84976565126,84983004127,84983993140', '[EV6 SafetyAlarm!] SolventRoom :Air flow sensor (04/04/2016 13:06:11)', '2016-04-05 13:18:07', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('97', '84945965696,84912669066', 'alarm message to send', '2016-04-06 13:03:17', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('98', '84973836738,84982776527', 'alarm message to send', '2016-04-06 13:03:17', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('99', '84945965696,84912669066', '[EV6 SafetyAlarm!] SolventRoom :Air flow sensor (05/04/2016 16:25:23)', '2016-04-06 13:29:54', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('100', '84973836738,84982776527', '[EV6 SafetyAlarm!] SolventRoom :Air flow sensor (05/04/2016 16:25:23)', '2016-04-06 13:29:54', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('101', '84945965696,84912669066', 'alarm message to send', '2016-04-06 15:03:41', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('102', '84973836738,84982776527', 'alarm message to send', '2016-04-06 15:03:41', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('103', '84945965696,84912669066', '[EV6 SafetyAlarm!] N-HeptaneRoom :Air flow sensor (06/04/2016 15:04:34)', '2016-04-06 15:07:19', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('104', '84973836738,84982776527', '[EV6 SafetyAlarm!] N-HeptaneRoom :Air flow sensor (06/04/2016 15:04:34)', '2016-04-06 15:07:19', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('105', '84945965696,84912669066', '[EV6 SafetyAlarm!] N-HeptaneRoom :Gas leak 20% :Gas leak 25% (06/04/2016 15:07:19)', '2016-04-06 15:12:39', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('106', '84973836738,84982776527', '[EV6 SafetyAlarm!] N-HeptaneRoom :Gas leak 20% :Gas leak 25% (06/04/2016 15:07:19)', '2016-04-06 15:12:39', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('107', '84945965696,84912669066', '[EV6 SafetyAlarm!] N-HeptaneRoom :Gas leak 20% :Gas leak 25% :Temperature 27C :Spark detect (06/04/2016 15:17:30)', '2016-04-06 15:24:50', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('108', '84973836738,84982776527', '[EV6 SafetyAlarm!] N-HeptaneRoom :Gas leak 20% :Gas leak 25% :Temperature 27C :Spark detect (06/04/2016 15:17:30)', '2016-04-06 15:24:50', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('109', '84945965696,84912669066', '[EV6 SafetyAlarm!] N-HeptaneRoom :Temperature 40C :Control OFF (06/04/2016 15:28:04)', '2016-04-06 15:28:04', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('110', '84973836738,84982776527', '[EV6 SafetyAlarm!] N-HeptaneRoom :Temperature 40C :Control OFF (06/04/2016 15:28:04)', '2016-04-06 15:28:05', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('111', '84945965696,84912669066', '[EV6 SafetyAlarm!] N-HeptaneRoom :Emergency (06/04/2016 15:28:05)', '2016-04-06 15:33:35', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('112', '84973836738,84982776527', '[EV6 SafetyAlarm!] N-HeptaneRoom :Emergency (06/04/2016 15:28:05)', '2016-04-06 15:33:35', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('113', '84945965696,84912669066', '[EV6 SafetyAlarm!] N-HeptaneRoom :Emergency (06/04/2016 15:33:35)', '2016-04-06 15:34:19', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('114', '84973836738,84982776527', '[EV6 SafetyAlarm!] N-HeptaneRoom :Emergency (06/04/2016 15:33:35)', '2016-04-06 15:34:19', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('115', '84945965696,84912669066', '[EV6 SafetyAlarm!] N-HeptaneRoom :Air flow sensor (06/04/2016 15:36:08)', '2016-04-06 15:36:09', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('116', '84973836738,84982776527', '[EV6 SafetyAlarm!] N-HeptaneRoom :Air flow sensor (06/04/2016 15:36:08)', '2016-04-06 15:36:10', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('117', '84945965696,84912669066', '[EV6 SafetyAlarm!] N-HeptaneRoom :Air flow sensor (06/04/2016 15:38:05)', '2016-04-06 15:38:06', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('118', '84973836738,84982776527', '[EV6 SafetyAlarm!] N-HeptaneRoom :Air flow sensor (06/04/2016 15:38:05)', '2016-04-06 15:38:06', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('119', '84945965696,84912669066', '[EV6 SafetyAlarm!] N-HeptaneRoom :Heat detect (06/04/2016 15:39:52)', '2016-04-06 15:41:53', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('120', '84973836738,84982776527', '[EV6 SafetyAlarm!] N-HeptaneRoom :Heat detect (06/04/2016 15:39:52)', '2016-04-06 15:41:53', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('121', '84945965696,84912669066', '[EV6 SafetyAlarm!] SolventRoom :Thermographic [EV6 SafetyAlarm!] N-HeptaneRoom :Air flow sensor :Heat detect (06/04/2016 15:41:53)', '2016-04-06 15:44:47', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('122', '84973836738,84982776527', '[EV6 SafetyAlarm!] SolventRoom :Thermographic [EV6 SafetyAlarm!] N-HeptaneRoom :Air flow sensor :Heat detect (06/04/2016 15:41:53)', '2016-04-06 15:44:48', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('123', '84945965696,84912669066', '[EV6 SafetyAlarm!] SolventRoom :Air flow sensor :Thermographic (06/04/2016 15:44:48)', '2016-04-06 15:49:05', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('124', '84973836738,84982776527', '[EV6 SafetyAlarm!] SolventRoom :Air flow sensor :Thermographic (06/04/2016 15:44:48)', '2016-04-06 15:49:07', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('125', '84945965696,84912669066', '[EV6 SafetyAlarm!] SolventRoom :Gas leak 25% (06/04/2016 15:49:06)', '2016-04-06 15:52:25', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('126', '84973836738,84982776527', '[EV6 SafetyAlarm!] SolventRoom :Gas leak 25% (06/04/2016 15:49:06)', '2016-04-06 15:52:26', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('127', '84945965696,84912669066', '[EV6 SafetyAlarm!] SolventRoom :Gas leak 20% :Emergency (06/04/2016 15:52:26)', '2016-04-06 15:57:47', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('128', '84973836738,84982776527', '[EV6 SafetyAlarm!] SolventRoom :Gas leak 20% :Emergency (06/04/2016 15:52:26)', '2016-04-06 15:57:47', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('129', '84945965696,84912669066', '[EV6 SafetyAlarm!] SolventRoom :Spark detection (06/04/2016 15:57:47)', '2016-04-06 16:00:32', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('130', '84973836738,84982776527', '[EV6 SafetyAlarm!] SolventRoom :Spark detection (06/04/2016 15:57:47)', '2016-04-06 16:00:33', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('131', '8416577953317', '[EV6 SafetyAlarm!] SolventRoom :Air flow sensor (13/04/2016 09:14:47)', '2016-04-13 14:53:04', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('132', '84945965696,84912669066,84942369968,84947793224,84915100256,84919075916,84917546168,84947076299', '[EV6 SafetyAlarm!] SolventRoom :Air flow sensor (13/04/2016 09:14:47)', '2016-04-13 14:53:05', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('133', '84902227888,84936559363,84935336599,84938004127,84936219398', '[EV6 SafetyAlarm!] SolventRoom :Air flow sensor (13/04/2016 09:14:47)', '2016-04-13 14:53:06', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('134', '84973836738,84982776527,841629182533,84979363727,84977787626,84975707189,84977238839,841674666567,841668949689,841689953184,84988978686,84982606296,84986838736,84969914888,84978995177,84976565126,841682890999,841627566566,841683133433,841627366366,84983993140', '[EV6 SafetyAlarm!] SolventRoom :Air flow sensor (13/04/2016 09:14:47)', '2016-04-13 14:53:06', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('135', '8416577953317', '[EV6 SafetyAlarm!] N-HeptaneRoom :Temperature 27C :Spark detect (13/04/2016 14:53:07)', '2016-04-13 15:51:06', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('136', '84945965696,84912669066,84942369968,84947793224,84915100256,84919075916,84917546168,84947076299,84912669066', '[EV6 SafetyAlarm!] N-HeptaneRoom :Temperature 27C :Spark detect (13/04/2016 14:53:07)', '2016-04-13 15:51:08', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('137', '84902227888,84936559363,84935336599,84938004127,84936219398', '[EV6 SafetyAlarm!] N-HeptaneRoom :Temperature 27C :Spark detect (13/04/2016 14:53:07)', '2016-04-13 15:51:09', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('138', '84973836738,84982776527,841629182533,84979363727,84977787626,84975707189,84977238839,841674666567,841668949689,841689953184,84988978686,84982606296,84986838736,84969914888,84978995177,84976565126,841682890999,841627566566,841683133433,841627366366,84983993140', '[EV6 SafetyAlarm!] N-HeptaneRoom :Temperature 27C :Spark detect (13/04/2016 14:53:07)', '2016-04-13 15:51:09', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('139', '8416577953317', '[EV6 SafetyAlarm!] SolventRoom :Air flow sensor (14/04/2016 10:53:18)', '2016-04-14 15:04:52', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('140', '8416577953317', 'Content can gui\r\n', '2016-04-14 15:49:09', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('141', '84945965696,84912669066,84942369968,84947793224,84915100256,84919075916,84917546168,84947076299,84912669066', 'Content can gui\r\n', '2016-04-14 15:49:14', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('142', '84902227888,84936559363,84935336599,84938004127,84936219398', 'Content can gui\r\n', '2016-04-14 15:49:14', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('143', '84973836738,84982776527,841629182533,84979363727,84977787626,84975707189,84977238839,841674666567,841668949689,841689953184,84988978686,84982606296,84986838736,84969914888,84978995177,84976565126,841682890999,841627566566,841683133433,841627366366,84983993140', 'Content can gui\r\n', '2016-04-14 15:49:14', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('144', '8416577953317', 'Content can gui\r\n', '2016-04-14 15:57:42', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('145', '84945965696,84912669066,84942369968,84947793224,84915100256,84919075916,84917546168,84947076299,84912669066', 'Content can gui\r\n', '2016-04-14 15:57:42', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('146', '84902227888,84936559363,84935336599,84938004127,84936219398', 'Content can gui\r\n', '2016-04-14 15:57:42', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('147', '84973836738,84982776527,841629182533,84979363727,84977787626,84975707189,84977238839,841674666567,841668949689,841689953184,84988978686,84982606296,84986838736,84969914888,84978995177,84976565126,841682890999,841627566566,841683133433,841627366366,84983993140', 'Content can gui\r\n', '2016-04-14 15:57:43', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('148', '8416577953317', 'Content can gui\r\n', '2016-04-16 04:29:21', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('149', '84945965696,84912669066,84942369968,84947793224,84915100256,84919075916,84917546168,84947076299,84912669066', 'Content can gui\r\n', '2016-04-16 04:29:24', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('150', '84902227888,84936559363,84935336599,84938004127,84936219398', 'Content can gui\r\n', '2016-04-16 04:29:24', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('151', '84973836738,84982776527,841629182533,84979363727,84977787626,84975707189,84977238839,841674666567,841668949689,841689953184,84988978686,84982606296,84986838736,84969914888,84978995177,84976565126,841682890999,841627566566,841683133433,841627366366,84983993140', 'Content can gui\r\n', '2016-04-16 04:29:24', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('152', '84912669066', 'Content can gui\r\n', '2016-04-16 04:35:09', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');
INSERT INTO `sms_mt` VALUES ('153', '84912669066', 'Content can gui\r\n', '2016-04-16 04:37:11', '<RPLY name=\'send_sms_list\'><ERROR>0</ERROR><ERROR_DESC>success</ERROR_DESC></RPLY>');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('5', 'admin', 'admin', 'admin@gmail.com', '$2y$10$rWCoNVQ.TrFFLBLrOSA3f.GEeXaXiu9by.t7AjEChVji8BjvYmlKC', 'LgM5CneKEoOgBu5VcHU1LkXBP0ZlDd1smfh28ZMlpwCSls5UTwygF1nf4dYR', '2015-09-21 16:06:07', '2016-04-09 04:24:49', '0912669066');
