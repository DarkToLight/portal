/*
Navicat MySQL Data Transfer

Source Server         : portal
Source Server Version : 50718
Source Host           : 10.20.1.92:3306
Source Database       : wifi_ap

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-11-29 15:02:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `fy_ad`
-- ----------------------------
DROP TABLE IF EXISTS `fy_ad`;
CREATE TABLE `fy_ad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL COMMENT '广告名称',
  `area_id` varchar(512) DEFAULT NULL COMMENT 'ad投放区域字符串',
  `start_time` date NOT NULL COMMENT '广告开始时间',
  `exposure_time` varchar(521) DEFAULT NULL COMMENT '投放时段json格式存储',
  `over_time` date NOT NULL COMMENT '广告结束时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `description` varchar(512) DEFAULT NULL COMMENT '广告描述',
  `business_id` int(10) unsigned NOT NULL COMMENT '广告商id',
  `ad_position_id` int(11) NOT NULL COMMENT 'ad投放位置id',
  `weight` int(11) NOT NULL DEFAULT '1' COMMENT '投放权重',
  `resource` varchar(512) NOT NULL COMMENT '广告资源',
  `ad_type_id` int(11) DEFAULT NULL COMMENT 'ad的类型',
  `delivery_to_channel` enum('wap','web','all') NOT NULL DEFAULT 'web' COMMENT '投放渠道',
  `delivery_to_device` enum('ios','android','all') NOT NULL DEFAULT 'all' COMMENT '投放到什么设备',
  `is_default` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否作为默认广告',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='广告表';

-- ----------------------------
-- Records of fy_ad
-- ----------------------------

-- ----------------------------
-- Table structure for `fy_ad_position`
-- ----------------------------
DROP TABLE IF EXISTS `fy_ad_position`;
CREATE TABLE `fy_ad_position` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL COMMENT 'ad广告位名称',
  `identifier` varchar(32) DEFAULT NULL COMMENT '标识符',
  `is_del` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告投放位置表';

-- ----------------------------
-- Records of fy_ad_position
-- ----------------------------
INSERT INTO `fy_ad_position` VALUES ('1', '认证页', 'REN_ZHENG', '0');
INSERT INTO `fy_ad_position` VALUES ('2', '完成页', 'WAN_CHENG', '0');
INSERT INTO `fy_ad_position` VALUES ('3', '登录页', 'DENG_LU', '0');

-- ----------------------------
-- Table structure for `fy_ad_type`
-- ----------------------------
DROP TABLE IF EXISTS `fy_ad_type`;
CREATE TABLE `fy_ad_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT 'ad的类型',
  `identifier` varchar(32) DEFAULT NULL,
  `is_del` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='广告类型表';

-- ----------------------------
-- Records of fy_ad_type
-- ----------------------------
INSERT INTO `fy_ad_type` VALUES ('1', '图片', null, '0');
INSERT INTO `fy_ad_type` VALUES ('2', '视频', null, '0');
INSERT INTO `fy_ad_type` VALUES ('3', 'H5', null, '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='ap信息表';

-- ----------------------------
-- Records of fy_ap
-- ----------------------------
INSERT INTO `fy_ap` VALUES ('1', '观山湖公园', 'Tp-1', 'a:b:c:d', '1', '1234', '456', '0', '133', '0');
INSERT INTO `fy_ap` VALUES ('2', '八匹马北', 'TP-Link256', 'e:f:g:H', '1', '0', '0', null, '104', '1');
INSERT INTO `fy_ap` VALUES ('3', '关山湖区', 'edfdf', 'aa:bb:cc:df', '1', null, null, '0', '1', '1');
INSERT INTO `fy_ap` VALUES ('4', '第三方', 'Tp', '12:20', '1', null, null, null, '0', '1');
INSERT INTO `fy_ap` VALUES ('5', '是的asdssf', 'TP4', '撒地方', '-2', '0', '0', null, '1', '1');
INSERT INTO `fy_ap` VALUES ('6', '撒地方', 'TP2', 'dsfds', '-1', '0', '0', null, '1', '1');
INSERT INTO `fy_ap` VALUES ('7', '的说法都是', 'TP3', '第三方地方', '1', '0', '0', null, '1', '1');
INSERT INTO `fy_ap` VALUES ('8', '热dsfdf', '儿童', '4564df', '1', '0', '0', null, '1', '1');
INSERT INTO `fy_ap` VALUES ('9', '', 'dfg', 'dcsfds', '1', '0', '0', null, '1', '1');
INSERT INTO `fy_ap` VALUES ('10', '', 'dfdsaf', 'sdfds', '1', '0', '0', null, '110', '1');
INSERT INTO `fy_ap` VALUES ('11', '', 'TP-2', 'a:f:c:d', '-2', '125252', '313', null, '131', '0');
INSERT INTO `fy_ap` VALUES ('12', '', 'TP-3', 'f:d:c:e', '-2', '1102', '13221', null, '132', '0');
INSERT INTO `fy_ap` VALUES ('13', '', 'TP-4', 'f:e:f:e', '-1', '123456', '1233', null, '132', '0');
INSERT INTO `fy_ap` VALUES ('14', '', 'TP-5', 'f:d:h:e', '-1', '100', '251', null, '125', '0');
INSERT INTO `fy_ap` VALUES ('15', '任天野', '让他一人', '让他', '1', '突然', '让他', null, '131', '1');
INSERT INTO `fy_ap` VALUES ('16', '', 'TP-6', 'f:e:d:c', '1', '5645654', '1222', null, '131', '0');
INSERT INTO `fy_ap` VALUES ('17', '', 'TP-7', 'f:e:g:h', '1', '1555', '5654654', null, '132', '0');
INSERT INTO `fy_ap` VALUES ('18', '', 'Tp-8', 'ee:cc:ff:ed', '1', '123', '123', null, '132', '0');
INSERT INTO `fy_ap` VALUES ('19', '', 'TP-9', 'f:e:d:c', '1', '0', '0', null, '133', '0');
INSERT INTO `fy_ap` VALUES ('20', '', 'TP-10', 'f:e:d:c', '1', '0', '0', null, '1', '0');
INSERT INTO `fy_ap` VALUES ('21', '', 'TP-11', 'bb:df:ec:ad', '1', '0', '0', null, '1', '0');

-- ----------------------------
-- Table structure for `fy_area`
-- ----------------------------
DROP TABLE IF EXISTS `fy_area`;
CREATE TABLE `fy_area` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '区域名称',
  `parent_id` int(10) unsigned DEFAULT '0' COMMENT '父类ID',
  `is_del` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 COMMENT='区域表';

-- ----------------------------
-- Records of fy_area
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8 COMMENT='AD投放区域表';

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
