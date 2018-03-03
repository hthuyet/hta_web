/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.6.16 : Database - smartagri_smallhome
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `authentication_code` */

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

/*Data for the table `authentication_code` */

/*Table structure for table `config` */

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
) ENGINE=MyISAM AUTO_INCREMENT=515 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `config` */

insert  into `config`(`id`,`created_at`,`updated_at`,`key`,`code`,`description`,`value`,`type`) values (511,'0000-00-00 00:00:00','2016-09-22 10:01:29','LOGO','LOGO','Logo','aae151246529270b5d33cee8d3ce3d8f.png',3),(491,'0000-00-00 00:00:00','2016-11-03 22:07:32','ANNOUNCEMENT','ANNOUNCEMENT','Notification for Dashboard','<p>\r\n	Information</p>\r\n',2),(513,'0000-00-00 00:00:00','0000-00-00 00:00:00','MQTTUSER','MQTTUSER','MQTTUSER','user',1),(514,'0000-00-00 00:00:00','0000-00-00 00:00:00','MQTTPASS','MQTTPASS','MQTTPASS','password',1);

/*Table structure for table `device` */

DROP TABLE IF EXISTS `device`;

CREATE TABLE `device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `assign_id` int(11) DEFAULT NULL,
  `devicetype_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `long` double DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `manufacture_date` datetime DEFAULT NULL,
  `warranty_date` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  `port_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

/*Data for the table `device` */

insert  into `device`(`id`,`name`,`code`,`assign_id`,`devicetype_id`,`user_id`,`created_at`,`updated_at`,`long`,`lat`,`manufacture_date`,`warranty_date`,`status`,`port_status`) values (44,'','123456',343,7,5,'2017-08-06 16:16:57','2017-10-06 14:54:00',NULL,NULL,'2017-08-01 23:11:22','2018-08-01 23:11:22',2,'[1,0,0,0]');

/*Table structure for table `device_specification` */

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

/*Data for the table `device_specification` */

insert  into `device_specification`(`id`,`devicetype_id`,`name`,`value`,`description`,`created_at`,`updated_at`) values (1,3,'1','1','1',NULL,NULL),(2,3,'2','2','2',NULL,NULL);

/*Table structure for table `device_type` */

DROP TABLE IF EXISTS `device_type`;

CREATE TABLE `device_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `device_type` */

insert  into `device_type`(`id`,`name`,`code`,`created_at`,`updated_at`) values (1,'eWi2','eWi2',NULL,'2017-07-31 20:03:12'),(7,'HTA1','HTA1','2017-07-31 20:03:02','2017-07-31 20:03:02');

/*Table structure for table `irrigation` */

DROP TABLE IF EXISTS `irrigation`;

CREATE TABLE `irrigation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  `from_date` datetime DEFAULT NULL,
  `to_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

/*Data for the table `irrigation` */

insert  into `irrigation`(`id`,`area_name`,`code`,`user_id`,`created_at`,`updated_at`,`status`,`from_date`,`to_date`) values (59,'IRR01-Khu vực 3/16 cây chè hoa vàng','IRR03',5,'2017-08-13 22:05:59','2017-10-29 14:03:23',1,'2017-08-01 14:03:23','2017-10-31 14:03:23');

/*Table structure for table `irrigation_detail` */

DROP TABLE IF EXISTS `irrigation_detail`;

CREATE TABLE `irrigation_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `irrigation_id` int(11) DEFAULT NULL,
  `device_id` int(11) DEFAULT NULL,
  `step` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `condition` int(11) DEFAULT NULL,
  `is_start` tinyint(4) DEFAULT '0',
  `count` int(11) DEFAULT '0',
  `topic` varchar(128) DEFAULT NULL,
  `serial` varchar(128) DEFAULT NULL,
  `command` varchar(1024) DEFAULT NULL,
  `command_off` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

/*Data for the table `irrigation_detail` */

/*Table structure for table `log` */

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `log` */

/*Table structure for table `notification` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `notification` */

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `permission_role` */

DROP TABLE IF EXISTS `permission_role`;

CREATE TABLE `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `permission_role` */

insert  into `permission_role`(`permission_id`,`role_id`) values (4,1),(5,1),(6,1),(9,1),(17,1),(18,1),(21,1),(28,1),(21,2),(28,2);

/*Table structure for table `permissions` */

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `permissions` */

insert  into `permissions`(`id`,`name`,`display_name`,`description`,`created_at`,`updated_at`) values (4,'user-manager','user-manager','user-manager','0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,'config-manager','config-manager','config-manager','0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,'log-manager','log-manager','log-manager','0000-00-00 00:00:00','0000-00-00 00:00:00'),(9,'role-manager','role-manager','role-manager','0000-00-00 00:00:00','0000-00-00 00:00:00'),(17,'device-manager','device-manager','device-manager','0000-00-00 00:00:00','0000-00-00 00:00:00'),(18,'devicetype-manager','devicetype-manager','devicetype-manager','0000-00-00 00:00:00','0000-00-00 00:00:00'),(21,'control-manager','control-manager','control-manager','0000-00-00 00:00:00','0000-00-00 00:00:00'),(28,'irrigation-manager','irrigation-manager','irrigation-manager','0000-00-00 00:00:00','0000-00-00 00:00:00');

/*Table structure for table `role_user` */

DROP TABLE IF EXISTS `role_user`;

CREATE TABLE `role_user` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `role_user` */

insert  into `role_user`(`user_id`,`role_id`) values (5,1),(338,2),(339,2),(340,2),(341,2),(343,2),(344,2),(345,2),(346,2);

/*Table structure for table `roles` */

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`name`,`display_name`,`description`,`created_at`,`updated_at`) values (1,'admin','admin','admin','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'user','user','user','0000-00-00 00:00:00','0000-00-00 00:00:00');

/*Table structure for table `schedule` */

DROP TABLE IF EXISTS `schedule`;

CREATE TABLE `schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `device_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '0: moi tao, 1: running, 2: done, 3: stop',
  `count` int(11) DEFAULT NULL,
  `command` varchar(500) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `is_start` tinyint(4) DEFAULT '0',
  `start_time` timestamp NULL DEFAULT NULL,
  `topic` varchar(128) DEFAULT NULL,
  `serial` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

/*Data for the table `schedule` */

/*Table structure for table `social_accounts` */

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

/*Data for the table `social_accounts` */

/*Table structure for table `user_notification` */

DROP TABLE IF EXISTS `user_notification`;

CREATE TABLE `user_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notification_id` int(11) NOT NULL,
  `is_read` tinyint(4) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_notification` */

/*Table structure for table `users` */

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
) ENGINE=MyISAM AUTO_INCREMENT=347 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`company_id`,`creator_id`,`name`,`username`,`phone`,`email`,`password`,`transaction_password`,`remember_token`,`created_at`,`updated_at`) values (5,1,NULL,'Top Admin','admin','1687147845','admin@gmail.com','$2y$10$kBi5rSgV484IdP6ylAKneeMzkHoB5.OXvHDmpFUS9OSWrIDn3gTHa','$2y$10$Fcs25w4Zcf.jvxK0lyuWqeIpMK.HM8UcJpaozUbPIJk67k22UoMdK','YBNfvm9XmK5riTPJVOpJroNKuhdvqL1bBYSX7YKeOAVsjBxIwECZyzeYyCvk','2017-10-18 15:29:36','2017-10-18 15:29:36'),(344,1,NULL,'Hoang Hai Hung','hunghh','0979591854','hunghh@investonline.vn','$2y$10$VL/j3npx/jb/5DNjNhf7W.CNFIRvisdIFkIKDSG9Cq6X6mTuZ3AzG','','5TrSfZ4CxlSgbe8hg8eRI0shefuIjuVst33mG4ju9bNHoc9IrYXMTq9Y26Ev','2017-08-22 15:36:09','2017-08-22 15:36:09'),(345,1,NULL,'Nguyễn Đăng Tuấn','tuan','0963686869','ndtuan1123@gmail.com','$2y$10$9JyYw/mMUzHmcNsOTBRbQ.pFln9XrC/DydBVqFsUokh5dM4X/eYra','','QMViocwCdXh5OQf3jIS5a469id8ENBKZ95nSCy4Baa4dlZTm0k5kgvEOpDWi','2017-10-18 10:32:26','2017-10-18 10:32:26'),(343,1,NULL,'tannm','tannm','0912669066','nguyenminhtan0612@gmail.com','$2y$10$x49/dHlGOyay4mkkY4MxZ.a3EgmB53ALfSeGKIeJe5SGJqk1mzUEW','','mbsMI1RZ7YQjcPyqoEaoKwBDS95zvDsZGpyntfeic9lX5J0BcuL50JbwlWFC','2017-08-12 23:31:06','2017-08-13 10:31:06'),(346,1,NULL,'Nguyen Tien Dung','dungnt','09726226622','ntd1795@gmai.com','$2y$10$aimD9U.It7sT/QWnKrQo0ODTM.UxpnhJWlPD9/2LH/KluvaYsuhQe','','2hsm5YlfmxiBnjYuglci1I5BStoesbtN0oZwY2efw0gjBrXkliakbVEsNjqM','2017-07-15 18:03:19','2017-07-16 05:03:19');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
