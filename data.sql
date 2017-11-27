/*
Navicat MySQL Data Transfer

Source Server         : portal
Source Server Version : 50718
Source Host           : 10.20.1.92:3306
Source Database       : wifi_ap

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-11-24 18:09:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `fy_ad`
-- ----------------------------
DROP TABLE IF EXISTS `fy_ad`;
CREATE TABLE `fy_ad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL COMMENT '广告名称',
  `start_time` date NOT NULL COMMENT '广告开始时间',
  `over_time` date NOT NULL COMMENT '广告结束时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `description` varchar(512) DEFAULT NULL COMMENT '广告描述',
  `business_id` int(10) unsigned NOT NULL COMMENT '广告商id',
  `ad_position_id` int(11) NOT NULL COMMENT 'ad投放位置id',
  `weight` int(11) NOT NULL DEFAULT '1' COMMENT '投放权重',
  `resource` varchar(512) NOT NULL COMMENT '广告资源',
  `ad_type_id` int(11) DEFAULT NULL COMMENT 'ad的类型',
  `delivery_to_channel` enum('wap','web','all') NOT NULL DEFAULT 'web' COMMENT '投放渠道',
  `delivery_to_device` enum('iphone','andriod','all') NOT NULL DEFAULT 'all' COMMENT '投放到什么设备',
  `is_default` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否作为默认广告',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='广告表';

-- ----------------------------
-- Records of fy_ad
-- ----------------------------
INSERT INTO `fy_ad` VALUES ('1', '华夏招商-登录页', '2017-11-10', '2017-11-30', '2017-10-31 10:14:14', '喜迎11.11', '2', '1', '4', 'http://pic.35pic.com/normal/09/22/55/11111390_140655003000_2.jpg', '1', 'all', 'all', '1', '0');
INSERT INTO `fy_ad` VALUES ('2', '华夏招商-验证页', '2017-11-10', '2017-11-20', '2017-11-22 10:14:18', '喜迎12.12', '2', '1', '7', 'http://pic.qiantucdn.com/58pic/19/16/78/56823528896f2_1024.jpg', '1', 'all', 'all', '1', '0');

-- ----------------------------
-- Table structure for `fy_ad_exposure_time`
-- ----------------------------
DROP TABLE IF EXISTS `fy_ad_exposure_time`;
CREATE TABLE `fy_ad_exposure_time` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `start_time` time NOT NULL COMMENT '开始时间',
  `over_time` time NOT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告曝光时间表';

-- ----------------------------
-- Records of fy_ad_exposure_time
-- ----------------------------

-- ----------------------------
-- Table structure for `fy_ad_position`
-- ----------------------------
DROP TABLE IF EXISTS `fy_ad_position`;
CREATE TABLE `fy_ad_position` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL COMMENT 'ad广告位名称',
  `identifier` varchar(32) DEFAULT NULL COMMENT '标识符',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告投放位置表';

-- ----------------------------
-- Records of fy_ad_position
-- ----------------------------
INSERT INTO `fy_ad_position` VALUES ('1', '认证页', null);
INSERT INTO `fy_ad_position` VALUES ('2', '完成页', null);
INSERT INTO `fy_ad_position` VALUES ('3', '登录页', null);

-- ----------------------------
-- Table structure for `fy_ad_type`
-- ----------------------------
DROP TABLE IF EXISTS `fy_ad_type`;
CREATE TABLE `fy_ad_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT 'ad的类型',
  `identifier` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='广告类型表';

-- ----------------------------
-- Records of fy_ad_type
-- ----------------------------
INSERT INTO `fy_ad_type` VALUES ('1', '图片', null);
INSERT INTO `fy_ad_type` VALUES ('2', '视频', null);
INSERT INTO `fy_ad_type` VALUES ('3', 'H5', null);

-- ----------------------------
-- Table structure for `fy_ap`
-- ----------------------------
DROP TABLE IF EXISTS `fy_ap`;
CREATE TABLE `fy_ap` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `address` varchar(128) NOT NULL COMMENT 'ap地址',
  `name` varchar(64) NOT NULL COMMENT '设备名称',
  `mac` varchar(64) NOT NULL COMMENT 'mac地址',
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `longitude` varchar(128) DEFAULT NULL COMMENT '经度',
  `latitude` varchar(128) DEFAULT NULL COMMENT '纬度',
  `ad_num` int(10) unsigned DEFAULT NULL COMMENT '广告投放数量',
  `ap_area_id` int(10) unsigned NOT NULL COMMENT 'ap的区域id',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='ap信息表';

-- ----------------------------
-- Records of fy_ap
-- ----------------------------
INSERT INTO `fy_ap` VALUES ('1', '观山湖公园', 'Tp-link250', 'a:b:c:d', '1', '123', '456', '0', '1', '0');
INSERT INTO `fy_ap` VALUES ('2', '八匹马北', 'TP-Link256', 'e:f:g:H', '1', '0', '0', null, '104', '1');
INSERT INTO `fy_ap` VALUES ('3', '关山湖区', 'edfdf', 'aa:bb:cc:df', '1', null, null, '0', '1', '1');
INSERT INTO `fy_ap` VALUES ('4', '第三方', 'Tp', '12:20', '1', null, null, null, '0', '1');
INSERT INTO `fy_ap` VALUES ('5', '是的asdssf', 'TP4', '撒地方', '-2', '0', '0', null, '1', '1');
INSERT INTO `fy_ap` VALUES ('6', '撒地方', 'TP2', 'dsfds', '-1', '0', '0', null, '1', '1');
INSERT INTO `fy_ap` VALUES ('7', '的说法都是', 'TP3', '第三方地方', '1', '0', '0', null, '1', '1');
INSERT INTO `fy_ap` VALUES ('8', '热dsfdf', '儿童', '4564df', '1', '0', '0', null, '1', '1');
INSERT INTO `fy_ap` VALUES ('9', '', 'dfg', 'dcsfds', '1', '0', '0', null, '1', '1');
INSERT INTO `fy_ap` VALUES ('10', '', 'dfdsaf', 'sdfds', '1', '0', '0', null, '110', '1');
INSERT INTO `fy_ap` VALUES ('11', '第三方', '撒地方', '撒地方', '1', '12', '313', null, '120', '0');
INSERT INTO `fy_ap` VALUES ('12', '撒地方', '鼎折覆餗', '神鼎飞丹砂', '1', '11', '13221', null, '121', '0');
INSERT INTO `fy_ap` VALUES ('13', '第三方1', '第三方第三方', '神鼎飞丹砂', '-2', '312135', '1313', null, '1', '0');
INSERT INTO `fy_ap` VALUES ('14', 'fggfhfg', 'dfhgdf', 'gfhgfh', '1', 'fghgf', 'fghfg', null, '124', '0');

-- ----------------------------
-- Table structure for `fy_area`
-- ----------------------------
DROP TABLE IF EXISTS `fy_area`;
CREATE TABLE `fy_area` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '区域名称',
  `parent_id` int(10) unsigned DEFAULT '0' COMMENT '父类ID',
  `is_del` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8 COMMENT='区域表';

-- ----------------------------
-- Records of fy_area
-- ----------------------------
INSERT INTO `fy_area` VALUES ('1', '贵阳市', '0', '0');
INSERT INTO `fy_area` VALUES ('15', '观山湖区地方', '1', '1');
INSERT INTO `fy_area` VALUES ('74', '云岩区', '1', '1');
INSERT INTO `fy_area` VALUES ('75', '蔡家关', '74', '1');
INSERT INTO `fy_area` VALUES ('76', '球馆', '75', '1');
INSERT INTO `fy_area` VALUES ('77', '小十字', '74', '1');
INSERT INTO `fy_area` VALUES ('78', '测试', '77', '1');
INSERT INTO `fy_area` VALUES ('100', '八匹马', '15', '1');
INSERT INTO `fy_area` VALUES ('101', '大十字', '77', '1');
INSERT INTO `fy_area` VALUES ('102', '大哥你好', '77', '1');
INSERT INTO `fy_area` VALUES ('103', '第三方', '76', '1');
INSERT INTO `fy_area` VALUES ('104', '球馆', '76', '1');
INSERT INTO `fy_area` VALUES ('105', '社区服务', '75', '1');
INSERT INTO `fy_area` VALUES ('106', 'ooo', '1', '1');
INSERT INTO `fy_area` VALUES ('107', '难民区', '1', '1');
INSERT INTO `fy_area` VALUES ('108', '佛挡杀佛5', '107', '1');
INSERT INTO `fy_area` VALUES ('109', '0001', '1', '1');
INSERT INTO `fy_area` VALUES ('110', '换个号dsfsaf', '108', '1');
INSERT INTO `fy_area` VALUES ('111', '是的范德萨防守打法', '1', '1');
INSERT INTO `fy_area` VALUES ('112', 'dsf', '0', '1');
INSERT INTO `fy_area` VALUES ('113', 'sdfsf', '0', '1');
INSERT INTO `fy_area` VALUES ('114', 'dssa', '0', '1');
INSERT INTO `fy_area` VALUES ('115', 'dsfds', '0', '1');
INSERT INTO `fy_area` VALUES ('116', 'dfsfds', '0', '1');
INSERT INTO `fy_area` VALUES ('117', 'sdfsdfdssdf', '1', '1');
INSERT INTO `fy_area` VALUES ('118', 'xcdsf', '1', '1');
INSERT INTO `fy_area` VALUES ('119', 'fsadfdsaf', '118', '1');
INSERT INTO `fy_area` VALUES ('120', '云岩区', '1', '0');
INSERT INTO `fy_area` VALUES ('121', '南明区', '1', '0');
INSERT INTO `fy_area` VALUES ('122', '乌当区', '1', '0');
INSERT INTO `fy_area` VALUES ('123', '花溪区', '1', '0');
INSERT INTO `fy_area` VALUES ('124', '观山湖区', '1', '0');
INSERT INTO `fy_area` VALUES ('125', '八匹马', '124', '0');
INSERT INTO `fy_area` VALUES ('126', '小河', '123', '1');
INSERT INTO `fy_area` VALUES ('127', '测试', '1', '1');
INSERT INTO `fy_area` VALUES ('128', '0000', '1', '1');
INSERT INTO `fy_area` VALUES ('129', '测试', '125', '0');
INSERT INTO `fy_area` VALUES ('130', '0101', '125', '0');

-- ----------------------------
-- Table structure for `fy_area_ad`
-- ----------------------------
DROP TABLE IF EXISTS `fy_area_ad`;
CREATE TABLE `fy_area_ad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ad_id` int(10) unsigned NOT NULL COMMENT '广告id，关联ad表',
  `area_id` int(10) unsigned NOT NULL COMMENT '区域id,关联区域',
  `is_del` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='AD投放区域表';

-- ----------------------------
-- Records of fy_area_ad
-- ----------------------------

-- ----------------------------
-- Table structure for `fy_business`
-- ----------------------------
DROP TABLE IF EXISTS `fy_business`;
CREATE TABLE `fy_business` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(512) DEFAULT NULL COMMENT '广告商描述',
  `name` varchar(64) NOT NULL COMMENT '广告商名称',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='广告商表';

-- ----------------------------
-- Records of fy_business
-- ----------------------------
INSERT INTO `fy_business` VALUES ('1', '这是一个大的广告商', '建行', '2017-11-11 11:52:04', '0');
INSERT INTO `fy_business` VALUES ('2', '这是什么问题？AA', '农行', '2017-11-24 09:17:36', '0');
INSERT INTO `fy_business` VALUES ('3', '这是一个广告商说明', '华夏招商', '2017-11-24 09:37:11', '0');
INSERT INTO `fy_business` VALUES ('4', '吃大闸蟹啦的', '蟹都汇', '2017-11-24 09:37:29', '0');
INSERT INTO `fy_business` VALUES ('5', '工商银行', '工商银行', '2017-11-24 09:39:29', '0');

-- ----------------------------
-- Table structure for `fy_user`
-- ----------------------------
DROP TABLE IF EXISTS `fy_user`;
CREATE TABLE `fy_user` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `level` int(2) DEFAULT NULL,
  `store` varchar(255) DEFAULT NULL,
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_del` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fy_user
-- ----------------------------
INSERT INTO `fy_user` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', '0', '', '2017-10-10 13:34:37', '0');
INSERT INTO `fy_user` VALUES ('2', 'guoliang', '123456', null, null, '2017-11-24 09:58:44', '0');
INSERT INTO `fy_user` VALUES ('3', '大波', 'e10adc3949ba59abbe56e057f20f883e', null, null, '2017-11-23 17:36:40', '1');
INSERT INTO `fy_user` VALUES ('4', 'dabo', '44fdb916a558ef6739cfa6378de4995a', null, null, '2017-11-24 09:58:54', '0');
INSERT INTO `fy_user` VALUES ('5', 'gg', 'e10adc3949ba59abbe56e057f20f883e', null, null, '2017-11-24 09:59:04', '0');
INSERT INTO `fy_user` VALUES ('6', 'guest', '084e0343a0486ff05530df6c705c8bb4', null, null, '2017-11-24 09:59:15', '0');
