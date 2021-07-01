/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : hmlwanblog

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2021-07-01 18:26:17
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
  `views` int(11) DEFAULT '0' COMMENT '阅读量',
  `loves` int(11) DEFAULT '0' COMMENT '点赞数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of zh_articles
-- ----------------------------
INSERT INTO `zh_articles` VALUES ('1', '3', '测试1', '1', 'hmlwan', '测试测试11:smile:\r\n```php\r\n  $info = Article::findOrFail($aid);\r\n  $data = compact(\'info\');\r\n  return view(\'home.article.read\',$data);\r\n```', '测试1', 'php', '/uploads/article/20210425/PkQV7QfSTWNgrLRO10DA54Y24zFqD5DHwf4kbH3H.png', '1', '1', '2021-04-25 12:39:47', '2021-04-25 12:39:47', '2', null);
INSERT INTO `zh_articles` VALUES ('2', '4', '测试2', '2', 'hmlwan', '测试测试22', '测试2', 'php', '/uploads/article/20210425/BFRd8W8ArKSRNlfR259o5C1bebpZ60CtgDoYgheK.png', '0', '1', null, null, '10', null);

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of zh_categories
-- ----------------------------
INSERT INTO `zh_categories` VALUES ('3', 'PHP', 'php是最好的语言', 'php', '1', '1', '2021-04-21 08:52:58', '2021-04-23 03:54:10');
INSERT INTO `zh_categories` VALUES ('4', 'Laravel', 'laravel', 'laravel', '2', '1', '2021-04-26 04:39:52', '2021-04-26 04:39:52');

-- ----------------------------
-- Table structure for `zh_chat_messages`
-- ----------------------------
DROP TABLE IF EXISTS `zh_chat_messages`;
CREATE TABLE `zh_chat_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `to_uid` int(10) DEFAULT NULL,
  `room_id` tinyint(3) unsigned NOT NULL COMMENT '房间id',
  `content` text COLLATE utf8_unicode_ci NOT NULL COMMENT '聊天内容',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of zh_chat_messages
-- ----------------------------
INSERT INTO `zh_chat_messages` VALUES ('1', '1', null, '4', '你好', '2021-05-22 10:19:26', '2021-05-22 10:19:26');
INSERT INTO `zh_chat_messages` VALUES ('2', '3', null, '3', '你好好丫丫', '2021-05-22 10:40:02', '2021-05-22 10:40:02');
INSERT INTO `zh_chat_messages` VALUES ('3', '1', null, '4', 'zh说的话呀', '2021-05-22 10:40:11', '2021-05-22 10:40:11');
INSERT INTO `zh_chat_messages` VALUES ('4', '1', null, '4', '是吗', '2021-05-22 10:40:17', '2021-05-22 10:40:17');
INSERT INTO `zh_chat_messages` VALUES ('5', '3', null, '3', '对呀', '2021-05-22 10:40:20', '2021-05-22 10:40:20');
INSERT INTO `zh_chat_messages` VALUES ('6', '1', null, '1', '你好', '2021-05-23 08:57:22', '2021-05-23 08:57:22');

-- ----------------------------
-- Table structure for `zh_comments`
-- ----------------------------
DROP TABLE IF EXISTS `zh_comments`;
CREATE TABLE `zh_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL COMMENT '用户id',
  `article_id` int(10) unsigned NOT NULL COMMENT '文章id',
  `content` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '评论内容',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of zh_comments
-- ----------------------------

-- ----------------------------
-- Table structure for `zh_configs`
-- ----------------------------
DROP TABLE IF EXISTS `zh_configs`;
CREATE TABLE `zh_configs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `key` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'key值',
  `value` mediumtext COLLATE utf8_unicode_ci COMMENT 'value值',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型 1:text输入框 2：文本框 3：单选 4：图片上传 5:select',
  `args` text COLLATE utf8_unicode_ci COMMENT '类型结构',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of zh_configs
-- ----------------------------
INSERT INTO `zh_configs` VALUES ('1', '网站名称', 'WEB_NAME', 'hmlwan博客', '1', null, '2021-04-26 12:41:43', '2021-04-26 12:41:43');
INSERT INTO `zh_configs` VALUES ('2', '文章保留版权提示', 'COPYRIGHT', null, '2', null, '2021-04-26 13:16:37', '2021-04-26 13:16:37');
INSERT INTO `zh_configs` VALUES ('3', '网站logo', 'WEB_LOGO', '/uploads/article/20210426/NNoRri55rIbD1738UXQjqbCCJo22CUESzpWeJQhH.png', '4', null, '2021-04-26 13:20:37', '2021-04-26 13:20:37');
INSERT INTO `zh_configs` VALUES ('4', '网站作者', 'WEB_AUTHOR', 'hmlwan', '1', null, '2021-04-29 09:33:12', '2021-04-29 09:33:12');
INSERT INTO `zh_configs` VALUES ('5', '网站首页标语', 'WEB_INDEX_SLOGAN', '剑气纵横三万里,一剑光寒十九洲', '2', null, '2021-04-29 09:34:01', '2021-04-29 09:34:01');
INSERT INTO `zh_configs` VALUES ('6', '作者个性描述', 'AUTHOR_CHARACTER_DESC', '爱好游戏，睡觉；总事一个人傻傻地发呆~', '2', null, '2021-04-29 12:42:40', '2021-04-29 12:42:40');
INSERT INTO `zh_configs` VALUES ('8', '热门文章标语', 'HOT_ARTICLE_SLOGAN', '很想给你写封信,告诉你这里的天气.\r\n                                <br>昨夜的那场电影,还有我的心情.', '2', null, '2021-04-29 12:45:08', '2021-04-29 12:45:08');
INSERT INTO `zh_configs` VALUES ('9', '作者个性化标题', 'AUTHOR_CHARACTER_title', 'an连美', '1', null, '2021-04-29 12:45:32', '2021-04-29 12:45:32');
INSERT INTO `zh_configs` VALUES ('10', '作者qq', 'AUTHOR_QQ', '824398038', '1', null, '2021-04-29 13:08:23', '2021-04-29 13:08:23');
INSERT INTO `zh_configs` VALUES ('11', '作者邮箱', 'AUTHOR_EMAIL', '824398038@qq.com', '1', null, '2021-04-29 13:08:53', '2021-04-29 13:08:53');
INSERT INTO `zh_configs` VALUES ('12', '作者地址', 'AUTHOR_ADDRESS', '广州省深圳市宝安区', '2', null, '2021-04-29 13:09:24', '2021-04-29 13:09:24');

-- ----------------------------
-- Table structure for `zh_diries`
-- ----------------------------
DROP TABLE IF EXISTS `zh_diries`;
CREATE TABLE `zh_diries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `desc` text COLLATE utf8_unicode_ci NOT NULL COMMENT '叙述',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of zh_diries
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of zh_friendshiplinks
-- ----------------------------
INSERT INTO `zh_friendshiplinks` VALUES ('1', '阿航博客', 'https://www.almostlover.top/', '1', '2021-04-25 13:45:41', '2021-04-25 13:45:41');

-- ----------------------------
-- Table structure for `zh_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `zh_migrations`;
CREATE TABLE `zh_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
INSERT INTO `zh_migrations` VALUES ('12', '2021_04_20_133715_create_configs_table', '7');
INSERT INTO `zh_migrations` VALUES ('10', '2021_04_19_133824_create_categories_table', '5');
INSERT INTO `zh_migrations` VALUES ('11', '2021_04_26_032121_create_comments_table', '6');
INSERT INTO `zh_migrations` VALUES ('13', '2021_05_06_091033_create_diries_table', '8');
INSERT INTO `zh_migrations` VALUES ('14', '2021_05_15_141144_create_table_chat_messages_table', '9');
INSERT INTO `zh_migrations` VALUES ('15', '2021_05_15_142210_create_chat_messages_table', '10');
INSERT INTO `zh_migrations` VALUES ('16', '2021_06_01_133055_create_redis_orders_table', '11');
INSERT INTO `zh_migrations` VALUES ('17', '2021_06_01_133411_create_redis_stores_table', '11');
INSERT INTO `zh_migrations` VALUES ('18', '2021_06_01_133417_create_redis_logs_table', '11');

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
-- Table structure for `zh_redis_logs`
-- ----------------------------
DROP TABLE IF EXISTS `zh_redis_logs`;
CREATE TABLE `zh_redis_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=801 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of zh_redis_logs
-- ----------------------------
INSERT INTO `zh_redis_logs` VALUES ('1', 'user_id：72抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('2', 'user_id：123抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('3', 'user_id：97抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('4', 'user_id：157抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('5', 'user_id：74抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('6', 'user_id：27抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('7', 'user_id：95抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('8', 'user_id：86抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('9', 'user_id：123抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('10', 'user_id：197抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('11', 'user_id：113抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('12', 'user_id：105抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('13', 'user_id：38抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('14', 'user_id：33抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('15', 'user_id：44抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('16', 'user_id：33抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('17', 'user_id：88抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('18', 'user_id：107抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('19', 'user_id：52抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('20', 'user_id：144抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('21', 'user_id：60抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('22', 'user_id：23抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('23', 'user_id：54抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('24', 'user_id：115抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('25', 'user_id：99抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('26', 'user_id：74抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('27', 'user_id：188抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('28', 'user_id：105抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('29', 'user_id：17抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('30', 'user_id：94抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('31', 'user_id：87抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('32', 'user_id：155抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('33', 'user_id：167抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('34', 'user_id：101抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('35', 'user_id：168抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('36', 'user_id：103抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('37', 'user_id：131抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('38', 'user_id：137抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('39', 'user_id：68抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('40', 'user_id：3抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('41', 'user_id：40抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('42', 'user_id：80抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('43', 'user_id：26抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('44', 'user_id：62抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('45', 'user_id：200抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('46', 'user_id：15抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('47', 'user_id：65抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('48', 'user_id：4抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('49', 'user_id：195抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('50', 'user_id：40抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('51', 'user_id：113抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('52', 'user_id：104抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('53', 'user_id：2抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('54', 'user_id：137抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('55', 'user_id：124抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('56', 'user_id：180抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('57', 'user_id：127抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('58', 'user_id：38抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('59', 'user_id：13抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('60', 'user_id：194抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('61', 'user_id：141抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('62', 'user_id：68抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('63', 'user_id：68抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('64', 'user_id：138抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('65', 'user_id：163抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('66', 'user_id：25抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('67', 'user_id：63抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('68', 'user_id：133抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('69', 'user_id：178抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('70', 'user_id：76抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('71', 'user_id：135抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('72', 'user_id：159抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('73', 'user_id：142抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('74', 'user_id：99抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('75', 'user_id：159抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('76', 'user_id：38抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('77', 'user_id：108抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('78', 'user_id：174抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('79', 'user_id：47抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('80', 'user_id：56抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('81', 'user_id：181抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('82', 'user_id：57抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('83', 'user_id：87抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('84', 'user_id：4抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('85', 'user_id：86抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('86', 'user_id：51抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('87', 'user_id：182抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('88', 'user_id：27抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('89', 'user_id：27抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('90', 'user_id：188抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('91', 'user_id：76抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('92', 'user_id：95抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('93', 'user_id：59抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('94', 'user_id：107抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('95', 'user_id：57抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('96', 'user_id：159抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('97', 'user_id：101抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('98', 'user_id：195抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('99', 'user_id：58抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('100', 'user_id：50抢购成功', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('101', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('102', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('103', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('104', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('105', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('106', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('107', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('108', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('109', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('110', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('111', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('112', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('113', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('114', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('115', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('116', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('117', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('118', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('119', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('120', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('121', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('122', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('123', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('124', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('125', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('126', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('127', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('128', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('129', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('130', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('131', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('132', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('133', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('134', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('135', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('136', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('137', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('138', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('139', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('140', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('141', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('142', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('143', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('144', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('145', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('146', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('147', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('148', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('149', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('150', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('151', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('152', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('153', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('154', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('155', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('156', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('157', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('158', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('159', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('160', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('161', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('162', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('163', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('164', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('165', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('166', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('167', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('168', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('169', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('170', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('171', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('172', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('173', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('174', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('175', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('176', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('177', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('178', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('179', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('180', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('181', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('182', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('183', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('184', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('185', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('186', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('187', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('188', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('189', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('190', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('191', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('192', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('193', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('194', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('195', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('196', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('197', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('198', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('199', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('200', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('201', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('202', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('203', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('204', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('205', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('206', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('207', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('208', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('209', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('210', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('211', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('212', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('213', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('214', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('215', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('216', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('217', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('218', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('219', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('220', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('221', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('222', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('223', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('224', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('225', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('226', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('227', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('228', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('229', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('230', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('231', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('232', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('233', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('234', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('235', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('236', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('237', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('238', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('239', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('240', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('241', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('242', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('243', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('244', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('245', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('246', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('247', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('248', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('249', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('250', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('251', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('252', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('253', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('254', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('255', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('256', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('257', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('258', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('259', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('260', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('261', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('262', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('263', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('264', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('265', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('266', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('267', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('268', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('269', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('270', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('271', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('272', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('273', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('274', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('275', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('276', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('277', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('278', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('279', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('280', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('281', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('282', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('283', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('284', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('285', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('286', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('287', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('288', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('289', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('290', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('291', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('292', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('293', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('294', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('295', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('296', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('297', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('298', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('299', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('300', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('301', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('302', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('303', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('304', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('305', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('306', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('307', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('308', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('309', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('310', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('311', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('312', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('313', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('314', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('315', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('316', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('317', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('318', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('319', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('320', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('321', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('322', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('323', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('324', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('325', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('326', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('327', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('328', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('329', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('330', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('331', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('332', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('333', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('334', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('335', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('336', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('337', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('338', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('339', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('340', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('341', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('342', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('343', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('344', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('345', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('346', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('347', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('348', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('349', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('350', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('351', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('352', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('353', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('354', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('355', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('356', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('357', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('358', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('359', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('360', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('361', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('362', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('363', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('364', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('365', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('366', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('367', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('368', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('369', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('370', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('371', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('372', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('373', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('374', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('375', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('376', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('377', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('378', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('379', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('380', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('381', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('382', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('383', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('384', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('385', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('386', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('387', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('388', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('389', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('390', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('391', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('392', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('393', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('394', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('395', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('396', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('397', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('398', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('399', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('400', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('401', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('402', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('403', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('404', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('405', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('406', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('407', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('408', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('409', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('410', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('411', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('412', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('413', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('414', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('415', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('416', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('417', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('418', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('419', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('420', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('421', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('422', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('423', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('424', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('425', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('426', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('427', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('428', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('429', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('430', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('431', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('432', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('433', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('434', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('435', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('436', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('437', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('438', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('439', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('440', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('441', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('442', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('443', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('444', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('445', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('446', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('447', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('448', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('449', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('450', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('451', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('452', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('453', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('454', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('455', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('456', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('457', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('458', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('459', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('460', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('461', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('462', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('463', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('464', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('465', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('466', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('467', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('468', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('469', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('470', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('471', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('472', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('473', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('474', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('475', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('476', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('477', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('478', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('479', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('480', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('481', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('482', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('483', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('484', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('485', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('486', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('487', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('488', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('489', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('490', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('491', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('492', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('493', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('494', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('495', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('496', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('497', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('498', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('499', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('500', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('501', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('502', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('503', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('504', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('505', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('506', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('507', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('508', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('509', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('510', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('511', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('512', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('513', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('514', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('515', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('516', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('517', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('518', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('519', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('520', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('521', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('522', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('523', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('524', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('525', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('526', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('527', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('528', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('529', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('530', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('531', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('532', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('533', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('534', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('535', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('536', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('537', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('538', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('539', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('540', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('541', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('542', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('543', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('544', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('545', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('546', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('547', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('548', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('549', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('550', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('551', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('552', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('553', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('554', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('555', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('556', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('557', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('558', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('559', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('560', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('561', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('562', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('563', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('564', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('565', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('566', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('567', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('568', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('569', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('570', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('571', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('572', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('573', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('574', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('575', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('576', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('577', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('578', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('579', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('580', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('581', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('582', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('583', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('584', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('585', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('586', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('587', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('588', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('589', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('590', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('591', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('592', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('593', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('594', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('595', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('596', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('597', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('598', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('599', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('600', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('601', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('602', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('603', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('604', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('605', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('606', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('607', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('608', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('609', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('610', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('611', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('612', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('613', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('614', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('615', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('616', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('617', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('618', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('619', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('620', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('621', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('622', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('623', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('624', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('625', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('626', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('627', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('628', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('629', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('630', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('631', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('632', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('633', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('634', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('635', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('636', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('637', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('638', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('639', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('640', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('641', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('642', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('643', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('644', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('645', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('646', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('647', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('648', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('649', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('650', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('651', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('652', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('653', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('654', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('655', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('656', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('657', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('658', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('659', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('660', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('661', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('662', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('663', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('664', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('665', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('666', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('667', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('668', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('669', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('670', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('671', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('672', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('673', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('674', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('675', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('676', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('677', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('678', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('679', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('680', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('681', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('682', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('683', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('684', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('685', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('686', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('687', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('688', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('689', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('690', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('691', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('692', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('693', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('694', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('695', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('696', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('697', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('698', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('699', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('700', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('701', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('702', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('703', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('704', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('705', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('706', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('707', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('708', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('709', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('710', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('711', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('712', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('713', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('714', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('715', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('716', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('717', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('718', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('719', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('720', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('721', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('722', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('723', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('724', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('725', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('726', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('727', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('728', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('729', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('730', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('731', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('732', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('733', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('734', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('735', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('736', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('737', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('738', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('739', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('740', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('741', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('742', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('743', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('744', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('745', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('746', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('747', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('748', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('749', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('750', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('751', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('752', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('753', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('754', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('755', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('756', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('757', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('758', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('759', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('760', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('761', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('762', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('763', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('764', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('765', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('766', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('767', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('768', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('769', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('770', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('771', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('772', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('773', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('774', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('775', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('776', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('777', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('778', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('779', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('780', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('781', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('782', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('783', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('784', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('785', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('786', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('787', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('788', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('789', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('790', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('791', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('792', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('793', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('794', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('795', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('796', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('797', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('798', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('799', 'error:no goods_number redis', '0', null, null);
INSERT INTO `zh_redis_logs` VALUES ('800', 'error:no goods_number redis', '0', null, null);

-- ----------------------------
-- Table structure for `zh_redis_orders`
-- ----------------------------
DROP TABLE IF EXISTS `zh_redis_orders`;
CREATE TABLE `zh_redis_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `goods_id` int(10) unsigned NOT NULL,
  `sku_id` int(10) unsigned NOT NULL,
  `number` int(10) unsigned NOT NULL,
  `price` int(10) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of zh_redis_orders
-- ----------------------------
INSERT INTO `zh_redis_orders` VALUES ('1', '21060210156565', '72', '1', '1', '1', '100', '0', '2021-06-02 04:21:02', null);
INSERT INTO `zh_redis_orders` VALUES ('2', '21060210251484', '123', '1', '1', '1', '100', '0', '2021-06-02 04:21:03', null);
INSERT INTO `zh_redis_orders` VALUES ('3', '21060210255535', '97', '1', '1', '1', '100', '0', '2021-06-02 04:21:03', null);
INSERT INTO `zh_redis_orders` VALUES ('4', '21060210255100', '157', '1', '1', '1', '100', '0', '2021-06-02 04:21:03', null);
INSERT INTO `zh_redis_orders` VALUES ('5', '21060210256102', '74', '1', '1', '1', '100', '0', '2021-06-02 04:21:03', null);
INSERT INTO `zh_redis_orders` VALUES ('6', '21060210257555', '27', '1', '1', '1', '100', '0', '2021-06-02 04:21:03', null);
INSERT INTO `zh_redis_orders` VALUES ('7', '21060210257575', '95', '1', '1', '1', '100', '0', '2021-06-02 04:21:03', null);
INSERT INTO `zh_redis_orders` VALUES ('8', '21060210297579', '86', '1', '1', '1', '100', '0', '2021-06-02 04:21:03', null);
INSERT INTO `zh_redis_orders` VALUES ('9', '21060210298100', '123', '1', '1', '1', '100', '0', '2021-06-02 04:21:03', null);
INSERT INTO `zh_redis_orders` VALUES ('10', '21060210299504', '197', '1', '1', '1', '100', '0', '2021-06-02 04:21:03', null);
INSERT INTO `zh_redis_orders` VALUES ('11', '21060210299535', '113', '1', '1', '1', '100', '0', '2021-06-02 04:21:03', null);
INSERT INTO `zh_redis_orders` VALUES ('12', '21060210299541', '105', '1', '1', '1', '100', '0', '2021-06-02 04:21:03', null);
INSERT INTO `zh_redis_orders` VALUES ('13', '21060210299999', '38', '1', '1', '1', '100', '0', '2021-06-02 04:21:03', null);
INSERT INTO `zh_redis_orders` VALUES ('14', '21060210210051', '33', '1', '1', '1', '100', '0', '2021-06-02 04:21:03', null);
INSERT INTO `zh_redis_orders` VALUES ('15', '21060210210053', '44', '1', '1', '1', '100', '0', '2021-06-02 04:21:03', null);
INSERT INTO `zh_redis_orders` VALUES ('16', '21060248485498', '33', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('17', '21060248485553', '88', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('18', '21060248485510', '107', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('19', '21060248495248', '52', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('20', '21060248505010', '144', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('21', '21060248505455', '60', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('22', '21060248515210', '23', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('23', '21060248545252', '54', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('24', '21060248545253', '115', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('25', '21060248985055', '99', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('26', '21060248985056', '74', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('27', '21060248985255', '105', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('28', '21060248985257', '188', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('29', '21060248985210', '17', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('30', '21060248985352', '87', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('31', '21060248985355', '94', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('32', '21060248985356', '167', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('33', '21060248985356', '155', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('34', '21060248985450', '101', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('35', '21060248985451', '168', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('36', '21060248985454', '103', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('37', '21060248985455', '131', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('38', '21060248985456', '137', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('39', '21060248985410', '80', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('40', '21060248985410', '68', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('41', '21060248985756', '3', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('42', '21060248985710', '40', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('43', '21060248985710', '26', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('44', '21060248989753', '62', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('45', '21060248989756', '200', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('46', '21060248989954', '2', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('47', '21060248981015', '15', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('48', '21060248981019', '195', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('49', '21060248981019', '4', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('50', '21060248981025', '65', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('51', '21060248995151', '40', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('52', '21060248995110', '113', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('53', '21060248995253', '104', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('54', '21060248995254', '137', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('55', '21060248995353', '124', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('56', '21060248995457', '180', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('57', '21060248999897', '127', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('58', '21060248999899', '13', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('59', '21060248100491', '38', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('60', '21060248100505', '194', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('61', '21060248100549', '141', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('62', '21060248101985', '68', '1', '1', '1', '100', '0', '2021-06-02 04:21:04', null);
INSERT INTO `zh_redis_orders` VALUES ('63', '21060249495048', '68', '1', '1', '1', '100', '0', '2021-06-02 04:21:05', null);
INSERT INTO `zh_redis_orders` VALUES ('64', '21060249495049', '138', '1', '1', '1', '100', '0', '2021-06-02 04:21:05', null);
INSERT INTO `zh_redis_orders` VALUES ('65', '21060249505349', '163', '1', '1', '1', '100', '0', '2021-06-02 04:21:05', null);
INSERT INTO `zh_redis_orders` VALUES ('66', '21060249525555', '25', '1', '1', '1', '100', '0', '2021-06-02 04:21:05', null);
INSERT INTO `zh_redis_orders` VALUES ('67', '21060249525556', '63', '1', '1', '1', '100', '0', '2021-06-02 04:21:05', null);
INSERT INTO `zh_redis_orders` VALUES ('68', '21060249545410', '133', '1', '1', '1', '100', '0', '2021-06-02 04:21:05', null);
INSERT INTO `zh_redis_orders` VALUES ('69', '21060249549857', '135', '1', '1', '1', '100', '0', '2021-06-02 04:21:05', null);
INSERT INTO `zh_redis_orders` VALUES ('70', '21060249555210', '178', '1', '1', '1', '100', '0', '2021-06-02 04:21:05', null);
INSERT INTO `zh_redis_orders` VALUES ('71', '21060249555457', '76', '1', '1', '1', '100', '0', '2021-06-02 04:21:05', null);
INSERT INTO `zh_redis_orders` VALUES ('72', '21060249551009', '159', '1', '1', '1', '100', '0', '2021-06-02 04:21:05', null);
INSERT INTO `zh_redis_orders` VALUES ('73', '21060249565199', '142', '1', '1', '1', '100', '0', '2021-06-02 04:21:05', null);
INSERT INTO `zh_redis_orders` VALUES ('74', '21060249575198', '99', '1', '1', '1', '100', '0', '2021-06-02 04:21:05', null);
INSERT INTO `zh_redis_orders` VALUES ('75', '21060249575798', '159', '1', '1', '1', '100', '0', '2021-06-02 04:21:05', null);
INSERT INTO `zh_redis_orders` VALUES ('76', '21060249579749', '38', '1', '1', '1', '100', '0', '2021-06-02 04:21:05', null);
INSERT INTO `zh_redis_orders` VALUES ('77', '21060249985399', '108', '1', '1', '1', '100', '0', '2021-06-02 04:21:05', null);
INSERT INTO `zh_redis_orders` VALUES ('78', '21060249989910', '174', '1', '1', '1', '100', '0', '2021-06-02 04:21:05', null);
INSERT INTO `zh_redis_orders` VALUES ('79', '21060249995352', '47', '1', '1', '1', '100', '0', '2021-06-02 04:21:05', null);
INSERT INTO `zh_redis_orders` VALUES ('80', '21060249102499', '56', '1', '1', '1', '100', '0', '2021-06-02 04:21:05', null);
INSERT INTO `zh_redis_orders` VALUES ('81', '21060250485310', '181', '1', '1', '1', '100', '0', '2021-06-02 04:21:06', null);
INSERT INTO `zh_redis_orders` VALUES ('82', '21060250485610', '27', '1', '1', '1', '100', '0', '2021-06-02 04:21:06', null);
INSERT INTO `zh_redis_orders` VALUES ('83', '21060250515156', '57', '1', '1', '1', '100', '0', '2021-06-02 04:21:06', null);
INSERT INTO `zh_redis_orders` VALUES ('84', '21060250555456', '87', '1', '1', '1', '100', '0', '2021-06-02 04:21:06', null);
INSERT INTO `zh_redis_orders` VALUES ('85', '21060250559750', '4', '1', '1', '1', '100', '0', '2021-06-02 04:21:06', null);
INSERT INTO `zh_redis_orders` VALUES ('86', '21060250559756', '86', '1', '1', '1', '100', '0', '2021-06-02 04:21:06', null);
INSERT INTO `zh_redis_orders` VALUES ('87', '21060250559799', '51', '1', '1', '1', '100', '0', '2021-06-02 04:21:06', null);
INSERT INTO `zh_redis_orders` VALUES ('88', '21060250559956', '182', '1', '1', '1', '100', '0', '2021-06-02 04:21:06', null);
INSERT INTO `zh_redis_orders` VALUES ('89', '21060250551014', '27', '1', '1', '1', '100', '0', '2021-06-02 04:21:06', null);
INSERT INTO `zh_redis_orders` VALUES ('90', '21060250551015', '188', '1', '1', '1', '100', '0', '2021-06-02 04:21:06', null);
INSERT INTO `zh_redis_orders` VALUES ('91', '21060250551015', '76', '1', '1', '1', '100', '0', '2021-06-02 04:21:06', null);
INSERT INTO `zh_redis_orders` VALUES ('92', '21060250565353', '95', '1', '1', '1', '100', '0', '2021-06-02 04:21:06', null);
INSERT INTO `zh_redis_orders` VALUES ('93', '21060250565656', '59', '1', '1', '1', '100', '0', '2021-06-02 04:21:06', null);
INSERT INTO `zh_redis_orders` VALUES ('94', '21060250575097', '107', '1', '1', '1', '100', '0', '2021-06-02 04:21:06', null);
INSERT INTO `zh_redis_orders` VALUES ('95', '21060250575351', '57', '1', '1', '1', '100', '0', '2021-06-02 04:21:06', null);
INSERT INTO `zh_redis_orders` VALUES ('96', '21060250575355', '159', '1', '1', '1', '100', '0', '2021-06-02 04:21:06', null);
INSERT INTO `zh_redis_orders` VALUES ('97', '21060250575497', '101', '1', '1', '1', '100', '0', '2021-06-02 04:21:06', null);
INSERT INTO `zh_redis_orders` VALUES ('98', '21060250575648', '195', '1', '1', '1', '100', '0', '2021-06-02 04:21:06', null);
INSERT INTO `zh_redis_orders` VALUES ('99', '21060250579810', '58', '1', '1', '1', '100', '0', '2021-06-02 04:21:06', null);
INSERT INTO `zh_redis_orders` VALUES ('100', '21060250579810', '50', '1', '1', '1', '100', '0', '2021-06-02 04:21:06', null);

-- ----------------------------
-- Table structure for `zh_redis_stores`
-- ----------------------------
DROP TABLE IF EXISTS `zh_redis_stores`;
CREATE TABLE `zh_redis_stores` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `sku_id` int(10) unsigned NOT NULL DEFAULT '0',
  `number` int(10) unsigned NOT NULL DEFAULT '0',
  `price` int(10) unsigned NOT NULL,
  `freez` decimal(16,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of zh_redis_stores
-- ----------------------------
INSERT INTO `zh_redis_stores` VALUES ('1', '1', '1', '0', '100', '100.00', '2016-10-22 07:35:12', '2016-10-22 07:35:12');

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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of zh_socialite_users
-- ----------------------------
INSERT INTO `zh_socialite_users` VALUES ('1', 'zh', '2021-05-15 13:21:04', '2021-05-15 13:21:04');
INSERT INTO `zh_socialite_users` VALUES ('3', 'hml', '2021-05-16 05:38:03', '2021-05-16 05:38:03');
INSERT INTO `zh_socialite_users` VALUES ('5', 'hm', '2021-05-22 07:19:20', '2021-05-22 07:19:20');

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
