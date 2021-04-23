/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : hmlwanblog

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2021-04-23 21:04:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `zh_articles`
-- ----------------------------
DROP TABLE IF EXISTS `zh_articles`;
CREATE TABLE `zh_articles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '分类',
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `tags` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '标签',
  `author` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '作者',
  `markdown` mediumtext COLLATE utf8_unicode_ci NOT NULL COMMENT '作者',
  `description` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '描述',
  `keywords` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '关键字',
  `cover` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '封面',
  `is_top` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶0:否 1:是',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态 0：下架 1：发布 ',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `views` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of zh_articles
-- ----------------------------

-- ----------------------------
-- Table structure for `zh_categories`
-- ----------------------------
DROP TABLE IF EXISTS `zh_categories`;
CREATE TABLE `zh_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `desc` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '描述',
  `keywords` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '关键词',
  `sort` tinyint(4) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of zh_categories
-- ----------------------------
INSERT INTO `zh_categories` VALUES ('3', 'PHP', 'php是最好的语言', 'php', '1', '1', '2021-04-21 08:52:58', '2021-04-23 03:54:10');

-- ----------------------------
-- Table structure for `zh_configs`
-- ----------------------------
DROP TABLE IF EXISTS `zh_configs`;
CREATE TABLE `zh_configs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `key` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'key值',
  `value` mediumtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'value值',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of zh_configs
-- ----------------------------

-- ----------------------------
-- Table structure for `zh_failed_jobs`
-- ----------------------------
DROP TABLE IF EXISTS `zh_failed_jobs`;
CREATE TABLE `zh_failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of zh_failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for `zh_friendshiplinks`
-- ----------------------------
DROP TABLE IF EXISTS `zh_friendshiplinks`;
CREATE TABLE `zh_friendshiplinks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `url` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '链接',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of zh_friendshiplinks
-- ----------------------------

-- ----------------------------
-- Table structure for `zh_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `zh_migrations`;
CREATE TABLE `zh_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of zh_migrations
-- ----------------------------
INSERT INTO `zh_migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `zh_migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `zh_migrations` VALUES ('3', '2019_08_19_000000_create_failed_jobs_table', '1');
INSERT INTO `zh_migrations` VALUES ('4', '2021_04_06_143359_create_socialite_users_table', '1');
INSERT INTO `zh_migrations` VALUES ('5', '2021_04_19_133824_create_categorys_table', '2');
INSERT INTO `zh_migrations` VALUES ('6', '2021_04_20_131750_create_articles_table', '3');
INSERT INTO `zh_migrations` VALUES ('7', '2021_04_20_132859_create_tags_table', '3');
INSERT INTO `zh_migrations` VALUES ('8', '2021_04_20_133259_create_friendship_links_table', '3');
INSERT INTO `zh_migrations` VALUES ('9', '2021_04_20_133715_create_configs_table', '4');
INSERT INTO `zh_migrations` VALUES ('10', '2021_04_19_133824_create_categories_table', '5');

-- ----------------------------
-- Table structure for `zh_password_resets`
-- ----------------------------
DROP TABLE IF EXISTS `zh_password_resets`;
CREATE TABLE `zh_password_resets` (
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `zh_password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of zh_password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for `zh_socialite_users`
-- ----------------------------
DROP TABLE IF EXISTS `zh_socialite_users`;
CREATE TABLE `zh_socialite_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(125) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of zh_socialite_users
-- ----------------------------

-- ----------------------------
-- Table structure for `zh_tags`
-- ----------------------------
DROP TABLE IF EXISTS `zh_tags`;
CREATE TABLE `zh_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态 0：下架 1：发布 ',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of zh_tags
-- ----------------------------
INSERT INTO `zh_tags` VALUES ('1', 'PHP', '1', '2021-04-23 12:22:01', '2021-04-23 12:23:39');
INSERT INTO `zh_tags` VALUES ('2', 'Laravel', '1', '2021-04-23 12:24:08', '2021-04-23 12:24:08');

-- ----------------------------
-- Table structure for `zh_users`
-- ----------------------------
DROP TABLE IF EXISTS `zh_users`;
CREATE TABLE `zh_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `zh_users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of zh_users
-- ----------------------------
INSERT INTO `zh_users` VALUES ('1', 'admin', '1mzm0P2nzR@gmail.com', null, '$2y$10$C0LDS1rLFCxc/ggix4.FF.LFPVtwa0NVaZLRy6u8ZGxZBr/yFi/5C', null, '2016-10-22 07:35:12', '2016-10-22 07:35:12');
INSERT INTO `zh_users` VALUES ('2', 'test', 'yUMh1KUZgf@gmail.com', null, '$2y$10$2q5sik4hHANGIdQCsRFnfugqAaowQ8SD4oFqSlmPFX7qMIOU6/SAO', null, '2019-01-04 15:35:12', '2016-01-04 15:35:12');
