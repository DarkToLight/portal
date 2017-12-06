/*
Navicat MySQL Data Transfer

Source Server         : portal
Source Server Version : 50718
Source Host           : 10.20.1.92:3306
Source Database       : wifi_ap

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-12-06 14:27:50
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='广告表';

-- ----------------------------
-- Records of fy_ad
-- ----------------------------
INSERT INTO `fy_ad` VALUES ('24', '默认登录页', ',138,158,154', '2017-11-30', '[{\"start_time\":\"12:00:15\",\"over_time\":\"22:15:00\"}]', '2017-12-29', '2017-11-30 14:48:50', null, '1', '1', '1', '/Uploads/2017-11-30/5a1fa9d03cff3.jpg', '1', 'all', 'all', '0', '0');
INSERT INTO `fy_ad` VALUES ('25', '招商认证页', ',146,159', '2017-12-01', 'null', '2017-12-05', '2017-12-01 10:48:07', null, '9', '1', '1', '/Uploads/2017-12-01/5a20c2c73c1f9.jpg', '1', 'all', 'all', '0', '0');
INSERT INTO `fy_ad` VALUES ('26', '招商2', ',146,159', '2017-12-01', 'null', '2017-12-05', '2017-12-01 10:49:52', null, '9', '2', '1', '/Uploads/2017-12-01/5a20c34e79a34.jpg', '1', 'all', 'all', '0', '0');
INSERT INTO `fy_ad` VALUES ('27', '招商完成页', ',146,159', '2017-12-01', 'null', '2017-12-05', '2017-12-01 10:50:59', null, '9', '3', '1', '/Uploads/2017-12-01/5a20c383b4f18.jpg', '1', 'all', 'all', '0', '0');

-- ----------------------------
-- Table structure for `fy_ad_position`
-- ----------------------------
DROP TABLE IF EXISTS `fy_ad_position`;
CREATE TABLE `fy_ad_position` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT 'ad广告位名称',
  `identifier` varchar(32) DEFAULT NULL COMMENT '标识符',
  `is_del` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='广告投放位置表';

-- ----------------------------
-- Records of fy_ad_position
-- ----------------------------
INSERT INTO `fy_ad_position` VALUES ('1', '认证页', 'REN_ZHENG', '0');
INSERT INTO `fy_ad_position` VALUES ('2', '登录页', 'DENG_LU', '0');
INSERT INTO `fy_ad_position` VALUES ('3', '完成页', 'WAN_CHENG', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='广告类型表';

-- ----------------------------
-- Records of fy_ad_type
-- ----------------------------
INSERT INTO `fy_ad_type` VALUES ('1', '图片', 'IMG', '0');
INSERT INTO `fy_ad_type` VALUES ('2', '视频', 'VEDIO', '0');
INSERT INTO `fy_ad_type` VALUES ('3', 'H5', 'H5', '0');
INSERT INTO `fy_ad_type` VALUES ('4', 'H6', null, '1');

-- ----------------------------
-- Table structure for `fy_ap`
-- ----------------------------
DROP TABLE IF EXISTS `fy_ap`;
CREATE TABLE `fy_ap` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `address` varchar(128) NOT NULL COMMENT 'ap具体位置',
  `model` varchar(64) DEFAULT NULL COMMENT '型号',
  `producer` varchar(32) DEFAULT NULL COMMENT '生产商',
  `name` varchar(64) NOT NULL COMMENT '设备名称',
  `mac` varchar(64) NOT NULL COMMENT 'mac地址',
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `longitude` varchar(128) DEFAULT NULL COMMENT '经度',
  `latitude` varchar(128) DEFAULT NULL COMMENT '纬度',
  `ad_num` int(10) unsigned DEFAULT NULL COMMENT '广告投放数量',
  `ap_area_id` int(10) unsigned NOT NULL COMMENT 'ap的区域id',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2247 DEFAULT CHARSET=utf8 COMMENT='ap信息表';

-- ----------------------------
-- Records of fy_ap
-- ----------------------------
INSERT INTO `fy_ap` VALUES ('1', '(云峰大道)白云单项19', null, null, 'BY00009', '58696C598E0A', '1', '106.630551', '26.682706', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('2', '无(云峰大道金峰大厦门口)白云单项110', null, null, 'BY00010', '58696C598FB2', '1', '106.628451 ', '26.682054 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('3', '无(中环路与云峰大道交叉口)白云单项111', null, null, 'BY00011', '58696C598D92', '1', '106.625152 ', '26.679094 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('4', '(白云区法院门口)白云单项112', null, null, 'BY00012', '58696C591F1D', '1', '106.623156 ', '26.680504 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('5', '无(白云区法院旁边)白云单项113', null, null, 'BY00013', '58696C598D86', '1', '106.622556 ', '26.679650 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('6', '(白云区安监局旁边)白云单项114', null, null, 'BY00014', '58696C60F58C', '1', '106.621757 ', '26.677914 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('7', '(中环路与育才路交叉口)白云单项115', null, null, 'BY00015', '58696C598DD6', '1', '106.621557 ', '26.677112 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('8', '(云峰大道)白云单项135', null, null, 'BY00036', '58696C5989CA', '1', '106.624452 ', '26.674370 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('9', '(金阳大道与东林寺路交叉口)白云单项137', null, null, 'BY00038', '58696C591CAC', '1', '106.624852 ', '26.677312 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('10', '(金阳大道与东林寺路交叉口)白云单项138', null, null, 'BY00039', '58696C598DA6', '1', '106.625552 ', '26.678466 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('11', '(云峰大道与金园路交叉口左)白云单项139', null, null, 'BY00040', '58696C591BB7', '1', '106.623454 ', '26.677585 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('12', '(华颐蓝天门口右)白云单项143', null, null, 'BY00044', '58696C598D22', '1', '106.624154 ', '26.666919 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('13', '(南湖路与云峰大道交叉口)白云单项144', null, null, 'BY00045', '58696C591B1C', '1', '106.624253 ', '26.667540 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('14', '(南湖路与云峰大道交叉口)白云单项145', null, null, 'BY00046', '58696C598E76', '1', '106.624153 ', '26.668779 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('15', '(云峰大道)白云单项146', null, null, 'BY00047', '58696C5990AA', '1', '106.624053 ', '26.669398 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('16', '(白云区政府旁)白云单项148', null, null, 'BY00049', '58696C598A46', '1', '106.623953 ', '26.672068 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('17', '(金阳大道与东林寺路交叉口)白云单项149', null, null, 'BY00050', '58696C598DFE', '1', '106.623953 ', '26.673308 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('18', '(白云二手车市场路口)白云单项152', null, null, 'BY00053', '58696C598FB6', '1', '106.624253 ', '26.676969 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('19', '无(白云二手车市场路口)白云单项153', null, null, 'BY00054', '58696C5994C6', '1', '106.625052 ', '26.678743 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('20', '(云峰大道顺捷二手车旁)白云单项154', null, null, 'BY00055', '58696C59897E', '1', '106.624354 ', '26.665030 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('21', '(云峰大道与龙井路交叉口)白云单项155', null, null, 'BY00056', '58696C591C89', '1', '106.640259 ', '26.675462 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('22', '(云峰大道蓝天驾校门口)白云单项156', null, null, 'BY00057', '58696C59891A', '1', '106.632751 ', '26.680763 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('23', '(华颐春天门口)白云单项158', null, null, 'BY00059', '58696C598A62', '1', '106.641662 ', '26.673930 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('24', '(南湖路与云峰大道交叉口)白云单项159', null, null, 'BY00060', '58696C591F4A', '1', '106.634051 ', '26.679419 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('25', '(云峰大道南湖宫小区门口)白云单项160', null, null, 'BY00061', '58696C59924A', '1', '106.632451 ', '26.680403 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('26', '(云峰大道南湖宫小区门口)白云单项161', null, null, 'BY00062', '58696C598DBA', '1', '106.632051 ', '26.680834 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('27', '(中环路与云峰大道交叉口)白云单项162', null, null, 'BY00063', '58696C5995B6', '1', '106.631851 ', '26.681504 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('28', '(白云05光交旁)新建白云单项162', null, null, 'BY00064', '58696C599072', '1', '106.629451 ', '26.681405 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('29', '(白云区国税局旁)白云单项163', null, null, 'BY00065', '58696C598CDA', '1', '106.631451 ', '26.682325 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('30', '(白云区法院旁边)白云单项113', null, null, 'BY00071', '58696C598A66', '1', '106.622556 ', '26.679650 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('31', '(中环路与育才路交叉口)白云单项115', null, null, 'BY00072', '58696C598A7E', '1', '106.621557 ', '26.677112 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('32', '(云峰大道顺捷二手车旁)白云单项154', null, null, 'BY00073', '58696C5989CE', '1', '106.624354 ', '26.665030 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('33', '(白云二手车市场路口)白云单项153', null, null, 'BY00074', '58696C5993D6', '1', '106.625052 ', '26.678743 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('34', 'BY001(尖山路幼儿园门口)', null, null, 'BY00075', '58696C599432', '1', '106.624933 ', '26.678793 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('35', 'BY002(尖山路口)', null, null, 'BY00076', '58696C598DEE', '1', '106.622386 ', '26.678068 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('36', 'BY003(尖山路与建设北路交叉口)', null, null, 'BY00077', '58696C5989C6', '1', '106.623104 ', '26.676453 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('37', 'BY004(建设北路与建设路交叉口)', null, null, 'BY00078', '58696C598BF6', '1', '106.623864 ', '26.679988 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('38', 'BY005(建设北路与建设路交叉口)', null, null, 'BY00079', '58696C598DBE', '1', '106.626116 ', '26.687289 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('39', 'BY006(建设北路步行街路口)', null, null, 'BY00080', '58696C597A4E', '1', '106.624734 ', '26.681932 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('40', 'BY007(建设北路步行街路口)', null, null, 'BY00081', '58696C598EE6', '1', '106.625382 ', '26.676505 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('41', 'BY008(建设北路步行街路口)', null, null, 'BY00082', '58696C598F0E', '1', '106.625542 ', '26.678276 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('42', 'BY009(建设南路白云七中旁)', null, null, 'BY00083', '58696C599152', '1', '106.625833 ', '26.681197 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('43', 'BY010(建设南路白云七中旁)', null, null, 'BY00084', '58696C598956', '1', '106.621377 ', '26.675731 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('44', 'BY014(同心西路大众通讯门口)', null, null, 'BY00089', '58696C598E12', '1', '106.624594 ', '26.682422 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('45', 'BY015(同心西路玉祥装饰门口)', null, null, 'BY00090', '58696C598A1A', '1', '106.625221 ', '26.674494 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('46', 'BY016(同心西路有一招酸辣烫门口)', null, null, 'BY00091', '58696C598E62', '1', '106.625622 ', '26.678316 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('47', 'BY017(同心西路诚缘电脑门口)', null, null, 'BY00092', '58696C59948E', '1', '106.624836 ', '26.684923 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('48', 'BY018(同心西路福星小超市门口)', null, null, 'BY00093', '58696C5995AA', '1', '106.623384 ', '26.675495 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('49', 'BY019(同心西路与铝建路交叉口)', null, null, 'BY00094', '58696C59881A', '1', '106.622708 ', '26.683241 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('50', 'BY020(同心西路与铝建路交叉口)', null, null, 'BY00095', '58696C599166', '1', '106.624147 ', '26.685320 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('51', 'BY021(同心西路广州龙树门业门口)', null, null, 'BY00096', '58696C59896A', '1', '106.625082 ', '26.676193 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('52', 'BY021(同心西路广州龙树门业门口)', null, null, 'BY00097', '58696C59888E', '1', '106.625082 ', '26.676193 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('53', 'BY023(同心西路华美欢欢幼儿园旁)', null, null, 'BY00099', '58696C5994A2', '1', '106.625323 ', '26.679935 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('54', 'BY024(同心西路建设银行门口)', null, null, 'BY00100', '58696C5987C6', '1', '106.624903 ', '26.678803 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('55', 'BY025(同心西路同心囍酒店门口)', null, null, 'BY00101', '58696C5988FE', '1', '106.624723 ', '26.678632 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('56', 'BY025(同心西路同心囍酒店门口)', null, null, 'BY00102', '58696C5989E6', '1', '106.624723 ', '26.678632 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('57', '(观山大道与长岭北路交叉口)长岭北路02', null, null, 'GSH00002', '58696C599016', '1', '106.648006 ', '26.636354 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('58', '(长岭北路与林城东路交叉口)长岭北路09', null, null, 'GSH00009', '58696C599552', '1', '106.650305 ', '26.645629 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('59', '(长岭北路与林城东路交叉口)长岭北路10', null, null, 'GSH00010', '58696C59934E', '1', '106.650104 ', '26.646152 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('60', '(金朱东路与长岭北路交叉口)长岭北路11', null, null, 'GSH00011', '58696C598C26', '1', '106.650299 ', '26.651458 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('61', '(观山大道与长岭北路交叉口)长岭北路13', null, null, 'GSH00013', '58696C5988B6', '1', '106.646403 ', '26.634835 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('62', '(观山大道与长岭北路交叉口)长岭北路14', null, null, 'GSH00014', '58696C598F7E', '1', '106.647105 ', '26.634886 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('63', '(观山大道与长岭北路交叉口)长岭北路15', null, null, 'GSH00015', '58696C599496', '1', '106.647907 ', '26.635235 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('64', '(金阳会展城旁)长岭北路24', null, null, 'GSH00024', '58696C5994AA', '1', '106.649404 ', '26.643183 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('65', '(长岭北路与林城东路交叉口)长岭北路25', null, null, 'GSH00025', '58696C591CD4', '1', '106.649502 ', '26.645551 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('66', '(长岭北路与林城东路交叉口)长岭北路26', null, null, 'GSH00026', '58696C59937E', '1', '106.649201 ', '26.646135 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('67', '(金朱东路与长岭北路交叉口)长岭北路28', null, null, 'GSH00028', '58696C59959A', '1', '106.649897 ', '26.652193 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('68', '(金阳大酒店门口)金阳行政中心03', null, null, 'GSH00032', '58696C60F2C6', '1', '106.624667 ', '26.647185 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('69', '(金阳大道与林城东路交叉口)金阳行政中心04', null, null, 'GSH00033', '58696C598F46', '1', '106.623571 ', '26.644850 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('70', '(金阳大道与林城东路交叉口)金阳行政中心05', null, null, 'GSH00034', '58696C598942', '1', '106.623172 ', '26.644608 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('71', '(金阳大道与林城东路交叉口)金阳行政中心06', null, null, 'GSH00035', '58696C598A42', '1', '106.622472 ', '26.645363 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('72', '(金阳大道与林城东路交叉口)金阳行政中心07', null, null, 'GSH00036', '58696C598C0E', '1', '106.622571 ', '26.645723 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('73', '(金阳大道与林城东路交叉口)金阳行政中心08', null, null, 'GSH00037', '58696C598FCE', '1', '106.623170 ', '26.646467 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('74', '(金阳大酒店公交站旁)金阳行政中心09', null, null, 'GSH00038', '58696C598C8A', '1', '106.6317106388', '26.6465294693 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('75', '(金阳大道与林城东路交叉口)金阳行政中心10', null, null, 'GSH00039', '58696C5989AA', '1', '106.623569 ', '26.646409 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('76', '(金阳国际会议中心旁)金阳行政中心11', null, null, 'GSH00040', '58696C60F870', '1', '106.615986 ', '26.645803 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('77', '(林城东路与清润路交叉口)金阳行政中心12', null, null, 'GSH00041', '58696C598986', '1', '106.625767 ', '26.645810 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('78', '(行政中心广场门口)金阳行政中心14', null, null, 'GSH00043', '58696C598C8E', '1', '106.627066 ', '26.645795 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('79', '(市政府门口)金阳行政中心15', null, null, 'GSH00044', '58696C598F7A', '1', '106.628066 ', '26.645767 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('80', '(黔云路与林城东路交叉口)金阳行政中心17', null, null, 'GSH00046', '58696C59928A', '1', '106.630565 ', '26.645809 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('81', '(市政府门口)金阳行政中心18', null, null, 'GSH00047', '58696C598F5E', '1', '106.631565 ', '26.645748 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('82', '(市政府门口)金阳行政中心19', null, null, 'GSH00048', '58696C59940E', '1', '106.632065 ', '26.645758 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('83', '(金阳大酒店旁)金阳行政中心23', null, null, 'GSH00051', '58696C60F41A', '1', '106.623867 ', '26.648381 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('84', '(贵阳信访局旁)金阳行政中心22', null, null, 'GSH00052', '58696C598882', '1', '106.623876 ', '26.639093 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('85', '(金阳大道与林城东路交叉口)金阳行政中心25', null, null, 'GSH00054', '58696C5995B2', '1', '106.624169 ', '26.645453 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('86', '(万丽酒店旁)金阳行政中心26', null, null, 'GSH00055', '58696C598DFA', '1', '106.625368 ', '26.645359 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('87', '(观山湖公园旁)金阳行政中心27', null, null, 'GSH00056', '58696C59910A', '1', '106.626067 ', '26.645351 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('88', '(观山湖公园大门口)金阳行政中心31', null, null, 'GSH00060', '58696C599172', '1', '106.631366 ', '26.645379 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('89', '(观山湖公园大门口)金阳行政中心32', null, null, 'GSH00061', '58696C5989A6', '1', '106.632066 ', '26.645378 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('90', '(观山大道与长岭北路交叉口)长岭北路03', null, null, 'GSH00064', '58696C59927E', '1', '106.648308 ', '26.635730 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('91', '(大唐财富广场旁)长岭北路04', null, null, 'GSH00065', '58696C599066', '1', '106.648708 ', '26.637404 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('92', '(长岭北路与林城东路交叉口)长岭北路09', null, null, 'GSH00067', '58696C598D72', '1', '106.650305 ', '26.645629 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('93', '(长岭北路与林城东路交叉口)长岭北路10', null, null, 'GSH00068', '58696C598C4A', '1', '106.650104 ', '26.646152 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('94', '(金朱东路与长岭北路交叉口)长岭北路12', null, null, 'GSH00069', '58696C5992B2', '1', '106.650394 ', '26.651916 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('95', '(观山大道与长岭北路交叉口)长岭北路13', null, null, 'GSH00070', '58696C59948A', '1', '106.646403 ', '26.634835 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('96', '(金阳会展城旁)长岭北路24', null, null, 'GSH00072', '58696C598E96', '1', '106.649404 ', '26.643183 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('97', '(大唐财富广场旁)长岭北路04', null, null, 'GSH00004', '58696C59887A', '1', '106.648708 ', '26.637404 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('98', '(美的公寓门口)长岭北路06', null, null, 'GSH00006', '58696C59936A', '1', '106.649709 ', '26.639989 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('99', '(美的林城时代旁)长岭北路07', null, null, 'GSH00007', '58696C599372', '1', '106.649909 ', '26.640736 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('100', '(美的林城时代旁)长岭北路08', null, null, 'GSH00008', '58696C5988A2', '1', '106.650007 ', '26.642854 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('101', '(舒普马药店门口)长岭北路16', null, null, 'GSH00016', '58696C591D1F', '1', '106.647905 ', '26.637095 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('102', '(会展城4号路与长岭北路交叉口)长岭北路19', null, null, 'GSH00019', '58696C599566', '1', '106.648206 ', '26.637701 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('103', '(中信银行门口)长岭北路21', null, null, 'GSH00021', '58696C599346', '1', '106.649207 ', '26.640206 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('104', '(金阳国际会议中心门口)金阳行政中心01', null, null, 'GSH00030', '58696C598962', '1', '106.624768 ', '26.646456 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('105', '(金阳大酒店门口)金阳行政中心02', null, null, 'GSH00031', '58696C599506', '1', '106.624367 ', '26.647893 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('106', '(观山湖公园停车场)金阳行政中心29', null, null, 'GSH00058', '58696C5991CE', '1', '106.627766 ', '26.645346 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('107', '(观山湖公园大门口)金阳行政中心30', null, null, 'GSH00059', '58696C598EB6', '1', '106.628766 ', '26.645338 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('108', '(观山湖公园大门口)金阳行政中心33', null, null, 'GSH00062', '58696C598A12', '1', '106.633166 ', '26.645376 ', null, '146', '0');
INSERT INTO `fy_ap` VALUES ('109', '白云单项117', null, null, 'BY00017', '58696C598EA2', '1', '106.643567 ', '26.673001 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('110', '花溪党校', null, null, 'fyxtw1', '58696C2FF02E', '1', '106.677278 ', '26.384492 ', null, '1', '0');
INSERT INTO `fy_ap` VALUES ('111', '花溪党校', null, null, 'fyxtw2', '58696C2FEFA2', '1', '106.677278 ', '26.384492 ', null, '1', '0');
INSERT INTO `fy_ap` VALUES ('112', '花溪党校', null, null, 'fyxtw3', '58696C2FEF66', '1', '106.677278 ', '26.384492 ', null, '1', '0');
INSERT INTO `fy_ap` VALUES ('113', '花溪党校', null, null, 'EG2000XEFY', '14144B69DA0B', '1', '106.677278 ', '26.384492 ', null, '1', '0');
INSERT INTO `fy_ap` VALUES ('114', '花溪党校', null, null, 'Ruijie_Ac_6c4e67', '58696C6C4E67', '1', '106.677278 ', '26.384492 ', null, '1', '0');
INSERT INTO `fy_ap` VALUES ('115', '瑞金南路舒普玛门口', null, null, 'nm00001', '3897D6A19900', '1', '106.704834 ', '26.573242 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('116', '瑞金南路珂卡夫门口', null, null, 'nm00002', '3897D6A1C080', '1', '106.704607 ', '26.572515 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('117', '瑞金南路中国建设银行门口', null, null, 'nm00003', '3897D6986880', '1', '106.704476 ', '26.571742 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('118', '瑞金南路向日葵滨河酒店正对面', null, null, 'nm00004', '3897D6A192E0', '1', '106.704454 ', '26.571010 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('119', '瑞金南路百益食府正对面', null, null, 'nm00005', '3897D6A1D9E0', '1', '106.704684 ', '26.570585 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('120', '瑞金南路西部耕耘广场对面', null, null, 'nm00006', '3897D6A1B220', '1', '106.704800 ', '26.570183 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('121', '瑞金南路钟幺爷开心剧场对面', null, null, 'nm00007', '3897D6A1E100', '1', '106.705136 ', '26.570238 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('122', '瑞金南路百益咖啡门口', null, null, 'nm00008', '3897D6A1B580', '1', '106.704801 ', '26.570748 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('123', '瑞金南路韩衣阁门口', null, null, 'nm00009', '3897D6987C20', '1', '106.704762 ', '26.571474 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('124', '瑞金南路贵阳银行门口', null, null, 'nm00010', '3897D6987E20', '1', '106.704797 ', '26.571802 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('125', '瑞金南路歌迷量贩KTV门口', null, null, 'nm00011', '3897D6986600', '1', '106.704874 ', '26.572235 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('126', '瑞金中路能辉酒店门口', null, null, 'nm00013', '3897D6986140', '1', '106.705772 ', '26.573971 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('127', '瑞金中路红谷门口', null, null, 'nm00014', '3897D6A1B4C0', '1', '106.706117 ', '26.574668 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('128', '瑞金中路毛发健康馆门口', null, null, 'nm00015', '3897D6986480', '1', '106.706383 ', '26.575448 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('129', '瑞金中路公厕门口', null, null, 'nm00016', '3897D6A199C0', '1', '106.706166 ', '26.576311 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('130', '瑞金中路天娇靓妈咪门口', null, null, 'nm00019', '3897D6A1DBC0', '1', '106.705982 ', '26.575815 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('131', '瑞金中路有诚内衣秀正对面', null, null, 'nm00020', '3897D6985400', '1', '106.705906 ', '26.575156 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('132', '瑞金中路今童孕婴门口', null, null, 'nm00021', '3897D6987EA0', '1', '106.705575 ', '26.574481 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('133', '瑞金中路BaLaBaLa门口', null, null, 'nm00022', '3897D6986520', '1', '106.705197 ', '26.573920 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('134', '中山西路又一间红茶坊门口', null, null, 'nm00023', '3897D6A18480', '1', '106.706060 ', '26.576667 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('135', '贵惠路河滨公园正对面', null, null, 'nm00024', '3897D6A1E820', '1', '106.704753 ', '26.569524 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('136', '贵惠路西部耕耘广场石雕像旁边', null, null, 'nm00025', '3897D6A1D980', '1', '106.704867 ', '26.569835 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('137', '贵惠路卡.莱曼菲正对面', null, null, 'nm00026', '3897D6A1EB40', '1', '106.704140 ', '26.569368 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('138', '瑞金南路黔五福正对面', null, null, 'nm00027', '3897D6988100', '1', '106.705344 ', '26.569546 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('139', '瑞金南路圣地亚酒店正对面', null, null, 'nm00028', '3897D6986FA0', '1', '106.706237 ', '26.569143 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('140', '瑞金南路家园婚介正对面', null, null, 'nm00029', '3897D6986820', '1', '106.706925 ', '26.568968 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('141', '瑞金南路河滨公园东门轨道交通工地活动板房后面', null, null, 'nm00030', '3897D6986760', '1', '106.707606 ', '26.568810 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('142', '瑞金南路金钻豪庭门口', null, null, 'nm00031', '3897D69863A0', '1', '106.708771 ', '26.568434 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('143', '瑞金南路贵视农庄门口', null, null, 'nm00032', '3897D6988960', '1', '106.710398 ', '26.567722 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('144', '瑞金南路金钻豪庭斜对面', null, null, 'nm00033', '3897D6987CC0', '1', '106.708733 ', '26.568735 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('145', '瑞金南路河滨公园东门正对面', null, null, 'nm00034', '3897D6A1DA60', '1', '106.708060 ', '26.568986 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('146', '瑞金南路ABC皮带店门口', null, null, 'nm00035', '3897D6A13720', '1', '106.707070 ', '26.569251 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('147', '瑞金南路圣地亚酒店旁边', null, null, 'nm00036', '3897D6A1EC80', '1', '106.706631 ', '26.569326 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('148', '瑞金南路沁元蛋糕店门口', null, null, 'nm00037', '3897D6A1B620', '1', '106.706032 ', '26.569531 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('149', '瑞金南路与文化路钟幺爷开心剧场门口', null, null, 'nm00038', '3897D6A17E00', '1', '106.705420 ', '26.569997 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('150', '瑞金南路金钻豪庭正对面', null, null, 'nm00039', '3897D69863C0', '1', '106.708744 ', '26.568765 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('151', '贵惠路养身煨汤门口', null, null, 'nm00040', '3897D6A15DC0', '1', '106.702281 ', '26.567672 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('152', '贵惠路好家宾馆旁边', null, null, 'nm00041', '3897D6A13280', '1', '106.701799 ', '26.567112 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('153', '贵惠路格日勒对面', null, null, 'nm00042', '3897D6A19520', '1', '106.699403 ', '26.566729 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('154', '贵惠路顺心足道门口', null, null, 'nm00043', '3897D6A178C0', '1', '106.700074 ', '26.566800 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('155', '贵惠路贵惠图文广告门口', null, null, 'nm00044', '3897D6A15720', '1', '106.701208 ', '26.567219 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('156', '贵惠路平价海鲜直销店门口', null, null, 'nm00045', '3897D69887C0', '1', '106.703452 ', '26.568458 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('157', '贵惠路方正印捷数码印刷连锁', null, null, 'nm00046', '3897D6A17340', '1', '106.703746 ', '26.568972 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('158', '瑞金南路与遵义路路口往滨河公园方向右侧桥头', null, null, 'nm00051', '3897D6A16020', '1', '106.709731 ', '26.568331 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('159', '瑞金南路与遵义路路口往滨河公园方向右侧路口', null, null, 'nm00052', '3897D6A14F40', '1', '106.710606 ', '26.567950 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('160', '遵义路人民广场中央金色雕像右侧', null, null, 'nm00053', '3897D6A12E20', '1', '106.710253 ', '26.569168 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('161', '遵义路人民广场中央金色雕像左侧', null, null, 'nm00054', '3897D6A14DA0', '1', '106.711028 ', '26.570100 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('162', '遵义路朝阳桥桥头', null, null, 'nm00055', '3897D6A13020', '1', '106.712257 ', '26.569809 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('163', '西湖路老友记门口', null, null, 'nm00063', '3897D6A15D20', '1', '106.719170 ', '26.572316 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('164', '西湖路中国建设银行对面（大杆）', null, null, 'nm00064', '3897D6A15380', '1', '106.719768 ', '26.572080 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('165', '文昌南路中国建设银行与贵州电网公司中间', null, null, 'nm00066', '3897D6A127C0', '1', '106.717879 ', '26.572054 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('166', '文昌南路星力购物广场正对面', null, null, 'nm00067', '3897D6A15AC0', '1', '106.717230 ', '26.571671 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('167', '新华路钻石广场对面', null, null, 'nm00068', '3897D6A14A20', '1', '106.716536 ', '26.570601 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('168', '新华路贵州国际商城正对面', null, null, 'nm00069', '3897D6A1DA00', '1', '106.716944 ', '26.570915 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('169', '新华路与箭道街路口', null, null, 'nm00070', '3897D6A141E0', '1', '106.717025 ', '26.569797 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('170', '阳明路富茂眼镜店门口', null, null, 'nm00071', '3897D6A12BE0', '1', '106.714288 ', '26.569577 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('171', '阳明路黔明古寺门口右侧', null, null, 'nm00072', '3897D6A149A0', '1', '106.714868 ', '26.569670 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('172', '中华南路与新华路兴业银行门口', null, null, 'nm00073', '3897D6A143A0', '1', '106.704094 ', '26.556736 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('173', '富水路沙县小吃门口', null, null, 'nm00074', '3897D6A14D40', '1', '106.715721 ', '26.572809 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('174', '富水路一品药业电力箱旁对面（改位置）', null, null, 'nm00075', '3897D6A14360', '1', '106.715940 ', '26.572256 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('175', '曹状元街美奇丝造型门口', null, null, 'nm00076', '3897D6A18160', '1', '106.715489 ', '26.572898 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('176', '富水南路同程旅游门口', null, null, 'nm00077', '3897D6A12780', '1', '106.716012 ', '26.573027 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('177', '富水南路全林步行街门口', null, null, 'nm00081', '3897D6A15A40', '1', '106.715387 ', '26.573769 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('178', '文昌南路 一均电器门口', null, null, 'nm00082', '3897D6A17EE0', '1', '106.718295 ', '26.572912 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('179', '文昌南路天和大药房门口', null, null, 'nm00084', '3897D6986500', '1', '106.718576 ', '26.573720 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('180', '文昌南路黔源大厦正对面', null, null, 'nm00085', '3897D6A17220', '1', '106.718963 ', '26.574543 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('181', '文昌南路屈臣氏门口', null, null, 'nm00086', '3897D6A1A500', '1', '106.719180 ', '26.575748 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('182', '文昌南路横店电影城门口', null, null, 'nm00087', '3897D6A1A5C0', '1', '106.719365 ', '26.576610 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('183', '文昌北路文昌阁广场对面', null, null, 'nm00089', '3897D6A15340', '1', '106.719733 ', '26.577972 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('184', '文昌南路水木游戏嘉年华门口', null, null, 'nm00090', '3897D6A1D320', '1', '106.719276 ', '26.577775 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('185', '文昌南路元祖食品店门口', null, null, 'nm00091', '3897D6A17660', '1', '106.719179 ', '26.576960 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('186', '文昌南路工商银行门口', null, null, 'nm00092', '3897D6A17DC0', '1', '106.719035 ', '26.576198 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('187', '文昌南路黔源大厦门口', null, null, 'nm00093', '3897D6A1DEA0', '1', '106.718883 ', '26.575422 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('188', '文昌南路幸福树不动产', null, null, 'nm00094', '3897D6A19DC0', '1', '106.718764 ', '26.574138 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('189', '瑞金南路穗金向日葵百姓厨房门口', null, null, 'nm00101', '3897D6A14B00', '1', '106.713165 ', '26.567017 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('190', '箭道街贵阳第十一幼儿园门口', null, null, 'nm00102', '3897D6A1B2A0', '1', '106.713591 ', '26.567808 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('191', '箭道街贵阳市南明区人民政府门口', null, null, 'nm00103', '3897D6A14EE0', '1', '106.714328 ', '26.568376 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('192', '箭道南巷南明区人民政府右拐小巷遵义豆花面门口', null, null, 'nm00104', '3897D6A12D00', '1', '106.714791 ', '26.567953 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('193', '箭道南巷南明区人民政府右拐小巷南明区绿化委员会门口左侧', null, null, 'nm00106', '3897D6A12A40', '1', '106.715851 ', '26.567811 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('194', '箭道街城基路鸡块面门口', null, null, 'nm00107', '3897D6A12C20', '1', '106.714750 ', '26.568533 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('195', '箭道街南明区地方税务局右侧', null, null, 'nm00108', '3897D6A13820', '1', '106.715380 ', '26.568852 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('196', '箭道街半山乌江鱼门口', null, null, 'nm00109', '3897D6A12D20', '1', '106.715901 ', '26.569153 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('197', '箭道街红发廊对面', null, null, 'nm00110', '3897D6A155C0', '1', '106.713069 ', '26.567455 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('198', '瑞金南路广播电视台正对面', null, null, 'nm00114', '3897D6A12B00', '1', '106.711461 ', '26.567892 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('199', '瑞金南路与箭道街路口（大杆）', null, null, 'nm00115', '3897D6A15D00', '1', '106.712791 ', '26.566988 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('200', '瑞金南路家有购物门口', null, null, 'nm00117', '3897D6A13D00', '1', '106.711871 ', '26.567109 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('201', '瑞金南路尚义北路口（箭道街路口公交站）', null, null, 'nm00118', '3897D6A14CE0', '1', '106.712544 ', '26.566972 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('202', '解放路牧田服务（大桥公交站旁）国鼎家电正对面', null, null, 'nm00122', '3897D6A13880', '1', '106.706357 ', '26.560233 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('203', '解放路钢绳轴承门口', null, null, 'nm00123', '3897D6A1D660', '1', '106.706933 ', '26.559892 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('204', '解放路得力工具门口', null, null, 'nm00124', '3897D6A12EA0', '1', '106.707540 ', '26.559718 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('205', '解放路春美防水门口', null, null, 'nm00125', '3897D6A12860', '1', '106.708360 ', '26.559326 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('206', '遵义路与二七路路口H＆M门口', null, null, 'nm00126', '3897D6A13220', '1', '106.708898 ', '26.559110 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('207', '二七路小吃街栖风渡鱼粉小吃店背后', null, null, 'nm00127', '3897D6A13240', '1', '106.708017 ', '26.557912 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('208', '二七路枫叶故事宾馆门口', null, null, 'nm00128', '3897D6A150C0', '1', '106.707504 ', '26.557301 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('209', '二七路中铁宾馆牌子下诚信榨油坊门口', null, null, 'nm00129', '3897D6A14FE0', '1', '106.706891 ', '26.556148 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('210', '解放路贵阳市第二十七中门口', null, null, 'nm00130', '3897D6A13080', '1', '106.708354 ', '26.559674 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('211', '解放路服务大楼酒店门口', null, null, 'nm00131', '3897D6A146C0', '1', '106.706913 ', '26.560258 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('212', '遵义路德克士垃圾房旁', null, null, 'nm00133', '3897D6A13400', '1', '106.705591 ', '26.560271 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('213', '遵义路浦发银行正对面', null, null, 'nm00134', '3897D6A14920', '1', '106.705320 ', '26.560458 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('214', '遵义路体育馆大门门口', null, null, 'nm00135', '3897D6A17280', '1', '106.704978 ', '26.559950 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('215', '火车站广场公交站旁美怡兴连锁超市门口', null, null, 'nm00136', '3897D6A17940', '1', '106.704651 ', '26.557322 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('216', '火车站出站口门口', null, null, 'nm00137', '3897D6A19600', '1', '106.704094 ', '26.556736 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('217', '遵义路火车站飞机坝棚改项目牌子右侧', null, null, 'nm00140', '3897D6A135A0', '1', '106.705029 ', '26.559305 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('218', '遵义路药之林大药房门口', null, null, 'nm00141', '3897D6A19A80', '1', '106.704809 ', '26.558812 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('219', '遵义路快宜客快餐店门口', null, null, 'nm00142', '3897D6A1D740', '1', '106.704668 ', '26.558362 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('220', '火车站广场公交站旁美怡兴连锁超市门口', null, null, 'nm00195', '3897D6A15260', '1', '106.714386 ', '26.560132 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('221', '火车站出站口门口', null, null, 'nm00196', '3897D6A147A0', '1', '106.714037 ', '26.559679 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('222', '解放路金狮防水门口', null, null, 'nm00148', '3897D6A12FC0', '1', '106.699316 ', '26.563965 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('223', '兴隆街贵阳银行门口', null, null, 'nm00197', '3897D6A13260', '1', '106.715026 ', '26.564167 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('224', '兴隆街贵阳银行门口', null, null, 'nm00121', '3897D6A1B640', '1', '106.715026 ', '26.564167 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('225', '兴隆街昆明铜锅洋芋饭门口', null, null, 'nm00120', '3897D6A12C00', '1', '106.715866 ', '26.567215 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('226', '兴隆街魅秀造型门口', null, null, 'nm00119', '3897D6A13FA0', '1', '106.716491 ', '26.568037 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('227', '观水路贵阳银行门口', null, null, 'nm00100', '3897D6A152E0', '1', '106.728293 ', '26.571322 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('228', '观水路第十八中学左侧', null, null, 'nm00099', '3897D6A153A0', '1', '106.726883 ', '26.571542 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('229', '观水路紫秀对面', null, null, 'nm00098', '3897D6A14560', '1', '106.725696 ', '26.571974 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('230', '观水路南明东路路口', null, null, 'nm00097', '3897D6A126C0', '1', '106.723708 ', '26.571617 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('231', '观水路中国银行门口', null, null, 'nm00096', '3897D6A15120', '1', '106.722014 ', '26.571251 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('232', '西湖路邂逅浓香门口', null, null, 'nm00095', '3897D6A14800', '1', '106.721236 ', '26.571327 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('233', '都司路中国建设银行右侧', null, null, 'nm00058', '3897D6A15520', '1', '106.707378 ', '26.573546 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('234', '文化路南明区市府社会卫生服务中心', null, null, 'nm00057', '3897D6A1B6C0', '1', '106.707582 ', '26.573166 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('235', '雪崖路与文化路丁字路口桥头龙大哥对面', null, null, 'nm00056', '3897D6A13500', '1', '106.711214 ', '26.571464 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('236', '雪崖路与文化路丁字路口桥头龙大哥对面', null, null, 'nm00185', '3897D6A15400', '1', '106.711214 ', '26.571464 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('237', '都司路贵阳银行门口', null, null, 'nm00059', '3897D6A12BC0', '1', '106.711346 ', '26.572983 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('238', '博爱路郑记灌汤汤包正对面', null, null, 'nm00061', '3897D6A13E00', '1', '106.711597 ', '26.572396 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('239', '博爱路朵语养发会所正对面', null, null, 'nm00062', '3897D6A1D7E0', '1', '106.712177 ', '26.570899 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('240', '遵义路筑城广场朝阳桥头北侧桥头', null, null, 'nm00060', '3897D6A1B3A0', '1', '106.712798 ', '26.570219 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('241', '南明单项118加点遵义路朝阳桥桥头', null, null, 'nm00186', '3897D6A14C20', '1', '106.712257 ', '26.569809 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('242', '119加点遵义路人民广场中央金色雕像左侧', null, null, 'nm00187', '3897D6A14F80', '1', '106.711028 ', '26.570100 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('243', '155加点遵义路人民广场中央金色雕像右侧', null, null, 'nm00188', '3897D6A13920', '1', '106.710253 ', '26.569168 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('244', '解放路贵阳农商银行门口', null, null, 'nm00132', '3897D6A12AC0', '1', '106.706466 ', '26.560711 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('245', '中山南路贵阳公交集团南明分公司第二大队对面', null, null, 'nm00150', '3897D6985420', '1', '106.684629 ', '26.565369 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('246', '中山南路御铺烤鸭对面', null, null, 'nm00151', '3897D6A163C0', '1', '106.685283 ', '26.565206 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('247', '中山南路中国工商银行门口', null, null, 'nm00152', '3897D6A1DE20', '1', '106.685164 ', '26.565838 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('248', '中山南路大掌柜对面天桥下', null, null, 'nm00153', '3897D69861E0', '1', '106.686909 ', '26.566596 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('249', '中山南路重庆辣王老火锅门口（天桥旁）', null, null, 'nm00154', '3897D6A143C0', '1', '106.686700 ', '26.567095 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('250', '中山南路金融大厦正对面', null, null, 'nm00155', '3897D6A151A0', '1', '106.6872110354 ', '26.5677039134', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('251', '中山南路金融街2号友爱1号药房门口', null, null, 'nm00156', '3897D6A149E0', '1', '106.688676 ', '26.568445 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('252', '中山南路与松花路路口威尔康健身牌子下面', null, null, 'nm00158', '3897D6A1D360', '1', '106.689604 ', '26.569653 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('253', '中山南路与松花路路口风车雕像旁', null, null, 'nm00159', '3897D6A15FA0', '1', '106.689828 ', '26.569313 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('254', '中山南路盱眙小龙虾门口', null, null, 'nm00161', '3897D6A17E20', '1', '106.696021 ', '26.567161 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('255', '花果园大街6幢B南区门口', null, null, 'nm00162', '3897D6A17B60', '1', '106.692186 ', '26.569093 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('256', '松花路花果园销售中心停车场入口门口', null, null, 'nm00164', '3897D6A164E0', '1', '106.691384 ', '26.569452 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('257', '松花路木风酒店门口', null, null, 'nm00165', '3897D6A1DB40', '1', '106.691693 ', '26.567727 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('258', '花果园大街周大生珠宝门口', null, null, 'nm00166', '3897D6A12DE0', '1', '106.692033 ', '26.567914 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('259', '花果园大街鸿福盛宴对面', null, null, 'nm00167', '3897D6A14AA0', '1', '106.691126 ', '26.567460 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('260', '花果园大街时尚酸汤火锅店门口', null, null, 'nm00168', '3897D6A1EE80', '1', '106.690466 ', '26.566685 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('261', '花果园大街国际金融街7号门口', null, null, 'nm00169', '3897D6A1E7C0', '1', '106.690417 ', '26.566615 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('262', '花果园大街博物馆正对面', null, null, 'nm00170', '3897D6A13BA0', '1', '106.689240 ', '26.565917 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('263', '花果园大街南明区花果园社区服务中心正对面', null, null, 'nm00171', '3897D6A14DC0', '1', '106.688350 ', '26.564203 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('264', '花果园大街老根山?东北饺子城门口', null, null, 'nm00172', '3897D6A14C00', '1', '106.688181 ', '26.564000 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('265', '惠隆路公交车站门口', null, null, 'nm00173', '3897D6A1DFE0', '1', '106.686963 ', '26.563211 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('266', '花果园大街星美国际影城路口', null, null, 'nm00174', '3897D6A12EC0', '1', '106.690080 ', '26.566525 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('267', '解放路面对面装饰集团门口', null, null, 'nm00143', '3897D6A15BC0', '1', '106.704464 ', '26.560994 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('268', '解放路大昌隆超市旁边芝林大药房门口', null, null, 'nm00144', '3897D6A12A00', '1', '106.703301 ', '26.561729 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('269', '解放路利家居陶瓷门口', null, null, 'nm00145', '3897D6A140E0', '1', '106.701626 ', '26.562496 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('270', '解放路贵阳南明盛奥机电物资有限公司', null, null, 'nm00146', '3897D6A15540', '1', '106.700735 ', '26.562989 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('271', '中山南路贵阳公交集团南明分公司第二大队对面', null, null, 'nm00175', '3897D6A13760', '1', '106.684629 ', '26.565369 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('272', '花果园大街星美国际影城路口', null, null, 'nm00176', '3897D6A12900', '1', '106.690080 ', '26.566525 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('273', '中山南路与松花路路口威尔康健身牌子下面', null, null, 'nm00177', '3897D6A154E0', '1', '106.689604 ', '26.569653 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('274', '中山南路盱眙小龙虾门口', null, null, 'nm00178', '3897D6A198C0', '1', '106.696021 ', '26.567161 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('275', '花果园大街老根山?东北饺子城门口', null, null, 'nm00179', '3897D6A195A0', '1', '106.688181 ', '26.564000 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('276', '惠隆路公交车站门口', null, null, 'nm00180', '3897D6A19E00', '1', '106.686963 ', '26.563211 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('277', '中华北路贵阳市第六中学门口左侧', null, null, 'yy00001', '3897D6A1BFE0', '1', '106.708633 ', '26.596780 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('278', '市北路贵阳市第六中学门口右侧', null, null, 'yy00002', '3897D6A1C040', '1', '106.708491 ', '26.597443 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('279', '市北路鬓┼发造型', null, null, 'yy00003', '3897D6A17320', '1', '106.708078 ', '26.597924 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('280', '中华北路贵州仁达饭店右侧', null, null, 'yy00004', '3897D6A1D860', '1', '106.708806 ', '26.596008 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('281', '中华北路贵阳银行门口左侧', null, null, 'yy00005', '3897D6A1B140', '1', '106.707708 ', '26.597485 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('282', '市北路茶知味饮品馆门口', null, null, 'yy00006', '3897D6A17EA0', '1', '106.708227 ', '26.598439 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('283', '市北路邮政包裹快递门口', null, null, 'yy00007', '3897D6A1EDC0', '1', '106.707829 ', '26.598842 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('284', '市北路纯羊肉杂粉馆', null, null, 'yy00008', '3897D6A19D00', '1', '106.708004 ', '26.599255 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('285', '盐务街哈哈人店门口', null, null, 'yy00009', '3897D6A128A0', '1', '106.707704 ', '26.600265 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('286', '盐务盐务街农贸市场门口', null, null, 'yy00011', '3897D6A1D300', '1', '106.708079 ', '26.600423 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('287', '盐务街花牌皮鞋店门口', null, null, 'yy00012', '3897D6A19580', '1', '106.709161 ', '26.600502 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('288', '盐务街卡妮娜服装店门口', null, null, 'yy00013', '3897D6A15800', '1', '106.709768 ', '26.600668 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('289', '盐务街和平快捷酒店门口', null, null, 'yy00014', '3897D6A19940', '1', '106.710941 ', '26.600643 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('290', '金仓街新吉奥游泳馆门口', null, null, 'yy00016', '3897D6A19CC0', '1', '106.711896 ', '26.601127 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('291', '金仓街富有衣橱门口', null, null, 'yy00017', '3897D6A14180', '1', '106.712978 ', '26.601401 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('292', '盐务街北京华联超市右侧', null, null, 'yy00020', '3897D6A19280', '1', '106.711374 ', '26.598900 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('293', '北京路章光101门口', null, null, 'yy00022', '3897D6A19420', '1', '106.712160 ', '26.595256 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('294', '北京路省政协大院2号门口（大灯杆）', null, null, 'yy00024', '3897D6A1A360', '1', '106.710141 ', '26.594996 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('295', '中华北路建设银行门口', null, null, 'yy00025', '3897D6A19DE0', '1', '106.709495 ', '26.595248 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('296', '中华北路实验小学右侧', null, null, 'yy00026', '3897D6A19440', '1', '106.709468 ', '26.595778 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('297', '盐务街与北京路T字路口国酒茅台路口', null, null, 'yy00027', '3897D6A1DB20', '1', '106.712495 ', '26.595834 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('298', '盐务街与北京路T字路口世才便利店门口', null, null, 'yy00028', '3897D6A19A00', '1', '106.712186 ', '26.596331 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('299', '盐务街中国农业银行对面田素粉门口', null, null, 'yy00029', '3897D6A1EBA0', '1', '106.712271 ', '26.596853 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('300', '北京路中国移动门口', null, null, 'yy00031', '3897D6A173E0', '1', '106.713201 ', '26.595628 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('301', '北京路贵州新华通信社门口', null, null, 'yy00032', '3897D6A19340', '1', '106.713709 ', '26.595821 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('302', '北京路千家福医疗器械连锁店门口', null, null, 'yy00033', '3897D6A17BA0', '1', '106.714872 ', '26.595993 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('303', '北京路网络一家人左侧', null, null, 'yy00034', '3897D6A1DB00', '1', '106.715392 ', '26.595949 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('304', '北京路贵阳银行门口左侧', null, null, 'yy00035', '3897D6A147E0', '1', '106.716580 ', '26.596004 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('305', '北京路西门子助听器门口', null, null, 'yy00036', '3897D6A17C00', '1', '106.711711 ', '26.597881 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('306', '北京路贵阳医科大学门口正对面', null, null, 'yy00037', '3897D6A1E320', '1', '106.714323 ', '26.595358 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('307', '北京路贵医附属医院右侧公共厕所门口', null, null, 'yy00038', '3897D6A17380', '1', '106.712840 ', '26.595042 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('308', '北京路贵医附属医院门诊部门口', null, null, 'yy00039', '3897D6A1BFC0', '1', '106.711795 ', '26.594842 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('309', '北京路省政协1号大门正对面', null, null, 'yy00040', '3897D6A1B6E0', '1', '106.710353 ', '26.594505 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('310', '友谊路金顶山夏家清水烫门口', null, null, 'yy00041', '3897D6A19CA0', '1', '106.714619 ', '26.591934 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('311', '新添大道南路贵阳云岩区消防大队右侧中医推拿门口', null, null, 'yy00045', '3897D6A1D540', '1', '106.718175 ', '26.596178 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('312', '北京路贵阳银行正对面', null, null, 'yy00046', '3897D6985D00', '1', '106.718088 ', '26.595723 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('313', '宝山南路邹邹记煨菜门口', null, null, 'yy00047', '3897D6A1D880', '1', '106.718352 ', '26.595335 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('314', '宝山北路中国农业银行门口', null, null, 'yy00048', '3897D6A19660', '1', '106.718617 ', '26.594660 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('315', '宝山北路酒店用品惠诚滋知门口', null, null, 'yy00049', '3897D6985DE0', '1', '106.718378 ', '26.594168 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('316', '宝山北路一树药业门口', null, null, 'yy00050', '3897D6987D40', '1', '106.718353 ', '26.593612 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('317', '宝山北路老北京布鞋门口', null, null, 'yy00051', '3897D6A19E60', '1', '106.718348 ', '26.592972 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('318', '宝山北路与北京东路路口贵州日报社门口', null, null, 'yy00052', '3897D6A17A40', '1', '106.718753 ', '26.595549 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('319', '宝山北路贵州日报业集团印务公司经营部门口', null, null, 'yy00053', '3897D6A149C0', '1', '106.718835 ', '26.595105 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('320', '宝山北路麦香小吃门口', null, null, 'yy00054', '3897D6987C80', '1', '106.718752 ', '26.594456 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('321', '宝山北路正宗金沙羊肉杂粉', null, null, 'yy00055', '3897D6A1B5E0', '1', '106.718741 ', '26.593877 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('322', '宝山北路施格名门门口', null, null, 'yy00056', '3897D6988160', '1', '106.718699 ', '26.593302 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('323', '宝山北路新联酒店正对面南方电力柜旁', null, null, 'yy00057', '3897D69864E0', '1', '106.718695 ', '26.592646 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('324', '宝山北路法式脆皮蛋糕店门口', null, null, 'yy00058', '3897D69865E0', '1', '106.718655 ', '26.592025 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('325', '宝山北路雨田印务左侧', null, null, 'yy00059', '3897D6A15780', '1', '106.718679 ', '26.591435 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('326', '宝山北路新联酒店门口', null, null, 'yy00060', '3897D69871E0', '1', '106.718317 ', '26.592352 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('327', '宝山北路与新印厂路口', null, null, 'yy00062', '3897D6985EA0', '1', '106.718350 ', '26.591331 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('328', '枣山路贵阳博爱医院门口', null, null, 'yy00063', '3897D6A137E0', '1', '106.697531 ', '26.585488 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('329', '枣山路中国农业银行门口', null, null, 'yy00064', '3897D6A14EC0', '1', '106.697620 ', '26.587407 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('330', '枣山路金莎国际门口', null, null, 'yy00065', '3897D6A15F20', '1', '106.697176 ', '26.587082 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('331', '枣山路天怡豪生大酒店门口', null, null, 'yy00066', '3897D6A1D820', '1', '106.697112 ', '26.586320 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('332', '威清路习水豆腐皮火锅店门口', null, null, 'yy00067', '3897D6A15740', '1', '106.698189 ', '26.584722 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('333', '威清路名艺形象设计门口', null, null, 'yy00068', '3897D6A1EC40', '1', '106.699055 ', '26.584822 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('334', '威清路中艺佳美广告门口', null, null, 'yy00069', '3897D6A15E80', '1', '106.699164 ', '26.584924 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('335', '威清路天下文摘门口', null, null, 'yy00070', '3897D6A15AA0', '1', '106.700250 ', '26.584798 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('336', '威清路贵州民间借贷服务中心', null, null, 'yy00071', '3897D6A15080', '1', '106.701918 ', '26.585305 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('337', '威清路大口九门口', null, null, 'yy00072', '3897D6A12CA0', '1', '106.702926 ', '26.585661 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('338', '威清路中国建设银行个人贷款门口', null, null, 'yy00073', '3897D6A1B260', '1', '106.704042 ', '26.585510 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('339', '黄金路沁园门口', null, null, 'yy00074', '3897D6A12960', '1', '106.696190 ', '26.583893 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('340', '黄金路贵阳社区平价生鲜直销店', null, null, 'yy00075', '3897D6A14F20', '1', '106.696237 ', '26.583774 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('341', '黄金路天庭瑶池门口', null, null, 'yy00076', '3897D6A14BA0', '1', '106.695148 ', '26.583399 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('342', '黄金路桃酥大王门口', null, null, 'yy00077', '3897D6A1E620', '1', '106.694986 ', '26.583334 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('343', '黄金路中国体育彩票门口', null, null, 'yy00078', '3897D6A13660', '1', '106.694426 ', '26.582682 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('344', '黄金路齿留香门口', null, null, 'yy00079', '3897D6A15CC0', '1', '106.694118 ', '26.582191 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('345', '威清路建设银行对面', null, null, 'yy00080', '3897D6A13C80', '1', '106.704095 ', '26.586108 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('346', '威清路云岩康顺大药房门口', null, null, 'yy00081', '3897D6A15FE0', '1', '106.702778 ', '26.586109 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('347', '枣山路与黄金路路口无极限正对面', null, null, 'yy00082', '3897D6A15940', '1', '106.697243 ', '26.584941 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('348', '枣山路汉庭连锁酒店酒店右侧', null, null, 'yy00083', '3897D6A15220', '1', '106.697364 ', '26.582990 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('349', '威清路36季门口', null, null, 'yy00084', '3897D6A15D40', '1', '106.701230 ', '26.585364 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('350', '威清路来威漆墙艺门口', null, null, 'yy00085', '3897D6A16400', '1', '106.700284 ', '26.585349 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('351', '黄金路路口银华广告对面', null, null, 'yy00087', '3897D6A12840', '1', '106.697195 ', '26.584014 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('352', '枣山路贵阳银行门口', null, null, 'yy00088', '3897D6A15280', '1', '106.697846 ', '26.582384 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('353', '枣山路贵阳华西妇科医院', null, null, 'yy00089', '3897D6A19AE0', '1', '106.697660 ', '26.582966 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('354', '枣山路与威清路路口中信银行门口', null, null, 'yy00090', '3897D6A14620', '1', '106.697650 ', '26.584235 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('355', '北京路贵阳市旅游产业发展委员会门口', null, null, 'yy00091', '3897D6A14580', '1', '106.698129 ', '26.587360 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('356', '枣山路贵阳大桦门诊门口', null, null, 'yy00095', '3897D6A14720', '1', '106.697416 ', '26.586746 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('357', '枣山路贵阳市中铁五局门口', null, null, 'yy00096', '3897D6A12F00', '1', '106.697234 ', '26.585304 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('358', '枣山路工商银行门口', null, null, 'yy00097', '3897D6A18180', '1', '106.697655 ', '26.583174 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('359', '瑞金北路贵阳市测绘局门口', null, null, 'yy00098', '3897D6986440', '1', '106.704482 ', '26.586492 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('360', '瑞金北路瑞金烟酒门口', null, null, 'yy00099', '3897D6A1B2E0', '1', '106.704662 ', '26.585717 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('361', '瑞金北路中国邮政门口', null, null, 'yy00100', '3897D6A13580', '1', '106.704756 ', '26.584984 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('362', '瑞金北路交通银行门口', null, null, 'yy00101', '3897D6A174A0', '1', '106.704953 ', '26.584296 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('363', '瑞金北路一品药业门口', null, null, 'yy00102', '3897D6A1DDA0', '1', '106.705140 ', '26.583529 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('364', '瑞金北路贵州蓝天企业门口', null, null, 'yy00103', '3897D6A17D00', '1', '106.705306 ', '26.582882 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('365', '瑞金北路雪亚蒙右侧', null, null, 'yy00104', '3897D6A12E00', '1', '106.705697 ', '26.582182 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('366', '瑞金北路现代女子医院门口', null, null, 'yy00106', '3897D6A1E1E0', '1', '106.705108 ', '26.582489 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('367', '瑞金北路新东方门口', null, null, 'yy00107', '3897D6A1B500', '1', '106.704905 ', '26.583136 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('368', '瑞金北路男士精品门口', null, null, 'yy00108', '3897D6A19C60', '1', '106.704715 ', '26.583875 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('369', '瑞金北路奥丝蓝黛门口', null, null, 'yy00109', '3897D6A1A0A0', '1', '106.704572 ', '26.584564 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('370', '瑞金北路中国工商银行门口', null, null, 'yy00110', '3897D69854A0', '1', '106.704442 ', '26.585294 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('371', '瑞金北路大家乐门口', null, null, 'yy00111', '3897D6A142C0', '1', '106.704226 ', '26.586094 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('372', '瑞金北路海兰云天温泉酒店门口', null, null, 'yy00112', '3897D6A153E0', '1', '106.704034 ', '26.587620 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('373', '瑞金北路瑞北路口中国银行右侧', null, null, 'yy00114', '3897D6A13F20', '1', '106.703674 ', '26.589069 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('374', '瑞金北路瑞北路豪丽酒楼门口', null, null, 'yy00115', '3897D6A14300', '1', '106.703340 ', '26.589544 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('375', '瑞金北路外贸服饰连锁与贵阳银行中间', null, null, 'yy00116', '3897D6A15240', '1', '106.702672 ', '26.590629 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('376', '瑞金北路迪堡保险柜门口', null, null, 'yy00117', '3897D6A18140', '1', '106.703882 ', '26.588400 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('377', '瑞金北路南方航空门口', null, null, 'yy00118', '3897D6A132A0', '1', '106.703819 ', '26.590015 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('378', '瑞金北路自有女人门口', null, null, 'yy00119', '3897D6A15680', '1', '106.704040 ', '26.589487 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('379', '瑞金北路中国农业银行门口', null, null, 'yy00120', '3897D6A14E60', '1', '106.704153 ', '26.588789 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('380', '瑞金北路如家酒店门口', null, null, 'yy00121', '3897D6A13AE0', '1', '106.704356 ', '26.587239 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('381', '瑞金北路民生银行门口', null, null, 'yy00122', '3897D6A14E40', '1', '106.704303 ', '26.588043 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('382', '中山西路亨得利眼镜门口', null, null, 'yy00138', '3897D6A12F40', '1', '106.709028 ', '26.577152 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('383', '中山西路与公园西路路口必胜客欢乐餐厅门口', null, null, 'yy00139', '3897D6A14240', '1', '106.708473 ', '26.577361 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('384', '中山西路国晨百货门口（大杆）', null, null, 'yy00140', '3897D6A13520', '1', '106.707900 ', '26.577213 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('385', '中山西路贵阳市群众艺术管门口', null, null, 'yy00141', '3897D6A15E40', '1', '106.706764 ', '26.577072 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('386', '瑞金中路星力购物广场门口食坊门口', null, null, 'yy00142', '3897D6A157E0', '1', '106.706188 ', '26.577178 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('387', '中山西路与瑞金中路星力购物广场高压电力柜旁', null, null, 'yy00143', '3897D6A138C0', '1', '106.705722 ', '26.577513 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('388', '瑞金中路与延安中路贵州发改委门口左侧', null, null, 'yy00144', '3897D6A156A0', '1', '106.705636 ', '26.581591 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('389', '瑞金中路预尚鞋廊门口', null, null, 'yy00145', '3897D6A15480', '1', '106.705331 ', '26.580524 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('390', '瑞金中路澳优奶粉店门口', null, null, 'yy00146', '3897D6A14FA0', '1', '106.705707 ', '26.579527 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('391', '瑞金中路龙子印门口', null, null, 'yy00147', '3897D6A142E0', '1', '106.705374 ', '26.579730 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('392', '瑞金中路大西门立体停车场右侧', null, null, 'yy00148', '3897D6A15A20', '1', '106.705791 ', '26.577313 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('393', '瑞金中路中国光大银行门口', null, null, 'yy00149', '3897D6A12800', '1', '106.705139 ', '26.581567 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('394', '瑞金中路三星苹果体验店门口', null, null, 'yy00150', '3897D6A13F80', '1', '106.705719 ', '26.581350 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('395', '瑞金中路名园肠旺面门口', null, null, 'yy00151', '3897D6A1E180', '1', '106.705727 ', '26.580904 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('396', '瑞金中路贵阳市环西小学门口', null, null, 'yy00152', '3897D6A15B60', '1', '106.705723 ', '26.580227 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('397', '瑞金中路贵阳第八中学门口', null, null, 'yy00153', '3897D6A14820', '1', '106.705341 ', '26.579129 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('398', '瑞金中路如家酒店门口', null, null, 'yy00154', '3897D6A13B20', '1', '106.705698 ', '26.578740 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('399', '瑞金中路乡村基门口', null, null, 'yy00155', '3897D6A15E20', '1', '106.705367 ', '26.578364 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('400', '富水南路中国邮政储蓄银行门口', null, null, 'yy00156', '3897D6A156C0', '1', '106.715116 ', '26.577540 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('401', '富水中路世纪新天地门口', null, null, 'yy00157', '3897D6A13300', '1', '106.714802 ', '26.577939 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('402', '富水中路丽人轩门口', null, null, 'yy00158', '3897D6A15560', '1', '106.714764 ', '26.578838 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('403', '富水中路贡茶门口', null, null, 'yy00159', '3897D6A1D0C0', '1', '106.714549 ', '26.578987 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('404', '富水中路KFT脚王门口', null, null, 'yy00160', '3897D6A12940', '1', '106.714577 ', '26.579467 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('405', '富水中路肖记香酥鸭门口', null, null, 'yy00161', '3897D6A15C20', '1', '106.714274 ', '26.579893 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('406', '富水中路她图门口', null, null, 'yy00162', '3897D6A150E0', '1', '106.714406 ', '26.580334 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('407', '富水中路童乐湾门口', null, null, 'yy00163', '3897D6A12DA0', '1', '106.714172 ', '26.581479 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('408', '富水中路追银族门口', null, null, 'yy00164', '3897D6A15E00', '1', '106.713998 ', '26.581137 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('409', '富水中路中国人寿保险大厦门口', null, null, 'yy00165', '3897D6A12F80', '1', '106.713863 ', '26.581886 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('410', '富水北路贵山大酒店门口（大杆）', null, null, 'yy00166', '3897D6A1EE60', '1', '106.714193 ', '26.582515 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('411', '富水北路中国建设银行门口', null, null, 'yy00167', '3897D6A14780', '1', '106.714233 ', '26.583103 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('412', '富水北路贵州省文化馆门口', null, null, 'yy00168', '3897D6A15B20', '1', '106.714373 ', '26.583422 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('413', '富水北路春歌时尚文化服饰店', null, null, 'yy00169', '3897D6A15660', '1', '106.714671 ', '26.583526 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('414', '富水北路香港深井烧鹅养身煨汤门口', null, null, 'yy00170', '3897D6A153C0', '1', '106.714758 ', '26.583995 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('415', '富水南路旺士多门口', null, null, 'yy00171', '3897D6A160E0', '1', '106.715323 ', '26.576179 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('416', '富水南路和平药房门口', null, null, 'yy00172', '3897D6A1D9C0', '1', '106.715238 ', '26.576508 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('417', '富水南路音乐酒吧门口', null, null, 'yy00173', '3897D6A15AE0', '1', '106.715208 ', '26.576871 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('418', '富水南路千色龙主题酒吧门口', null, null, 'yy00174', '3897D6A157C0', '1', '106.714885 ', '26.577633 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('419', '黔灵东路与陕西路十字路口建设银行旁', null, null, 'yy00175', '3897D6A15D80', '1', '106.714209 ', '26.586102 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('420', '陕西路伊布都服装店门口', null, null, 'yy00177', '3897D6A15160', '1', '106.714861 ', '26.584952 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('421', '延安东路国美电器门口', null, null, 'yy00178', '3897D6A1D3A0', '1', '106.713391 ', '26.584221 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('422', '延安东路中国移动通信4G手机大卖场门口', null, null, 'yy00179', '3897D6A17BC0', '1', '106.713813 ', '26.584520 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('423', '陕西路喜洋洋宾馆门口', null, null, 'yy00180', '3897D6A15200', '1', '106.714222 ', '26.585663 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('424', '陕西路鱼儿精品店门口', null, null, 'yy00181', '3897D6A14A00', '1', '106.713578 ', '26.587508 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('425', '陕西路省教育厅教研室门口', null, null, 'yy00182', '3897D6A17AA0', '1', '106.713427 ', '26.588527 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('426', '陕西路刘老四烤鸡门口', null, null, 'yy00183', '3897D6A1B320', '1', '106.713301 ', '26.589295 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('427', '普陀路苗家黑土猪鲜肉直营店门口', null, null, 'yy00185', '3897D6A17E40', '1', '106.713485 ', '26.590965 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('428', '普陀路土阿哥苗王全牛馆门口', null, null, 'yy00186', '3897D6A19960', '1', '106.713940 ', '26.591635 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('429', '普陀路稻草人店门口', null, null, 'yy00187', '3897D6A13680', '1', '106.714494 ', '26.591895 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('430', '普陀路老友记茶餐厅门口', null, null, 'yy00188', '3897D6A160A0', '1', '106.713827 ', '26.591174 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('431', '普陀路贵阳银行门口', null, null, 'yy00189', '3897D6A152C0', '1', '106.713506 ', '26.590520 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('432', '陕西路飘香火锅店门口', null, null, 'yy00190', '3897D6A19EC0', '1', '106.713466 ', '26.589685 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('433', '陕西路衣饰无忧服装店门口', null, null, 'yy00191', '3897D6A126E0', '1', '106.713554 ', '26.588983 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('434', '陕西路东方服装制作门口', null, null, 'yy00192', '3897D6A14260', '1', '106.713654 ', '26.588118 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('435', '陕西路哈哈人门口', null, null, 'yy00193', '3897D6A13060', '1', '106.713831 ', '26.587054 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('436', '陕西路中和会门口', null, null, 'yy00194', '3897D6A13A40', '1', '106.713903 ', '26.586783 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('437', '黔灵东路粉玺尔门口', null, null, 'yy00195', '3897D6A14E80', '1', '106.713985 ', '26.586635 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('438', '黔灵东路永福烟酒店门口', null, null, 'yy00196', '3897D6A15700', '1', '106.714951 ', '26.586818 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('439', '黔灵东路宝莉莱门口', null, null, 'yy00197', '3897D6A134E0', '1', '106.715866 ', '26.586921 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('440', '黔灵东路贵阳银行右侧门口', null, null, 'yy00198', '3897D6A13DE0', '1', '106.716710 ', '26.586970 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('441', '文昌北路中国邮政储蓄银行门口', null, null, 'yy00199', '3897D6A1A1C0', '1', '106.718118 ', '26.585111 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('442', '文昌北路OK女人服装店门口', null, null, 'yy00201', '3897D6A1E2C0', '1', '106.718409 ', '26.584253 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('443', '文昌北路昆明铜锅洋芋饭店门口', null, null, 'yy00202', '3897D6A17E60', '1', '106.717729 ', '26.585453 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('444', '友谊路华玉五金店对面（大杆子）', null, null, 'yy00203', '3897D6A1DC00', '1', '106.717156 ', '26.587236 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('445', '友谊路公共厕所门口', null, null, 'yy00204', '3897D6A17FC0', '1', '106.716804 ', '26.588148 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('446', '友谊路醺吧门口', null, null, 'yy00205', '3897D6A17460', '1', '106.716453 ', '26.589049 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('447', '友谊路清颜美容养生馆门口', null, null, 'yy00206', '3897D6A17B40', '1', '106.716155 ', '26.589921 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('448', '友谊路贵阳卷烟厂左侧', null, null, 'yy00207', '3897D6A19400', '1', '106.716087 ', '26.589445 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('449', '友谊路茂源中西药店门口', null, null, 'yy00208', '3897D6A19880', '1', '106.715757 ', '26.590429 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('450', '友谊路贵阳卷烟厂离退休第二活动中心右侧（大杆子）', null, null, 'yy00209', '3897D6A1D400', '1', '106.716363 ', '26.588612 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('451', '黔灵东路习水豆腐皮火锅店门口', null, null, 'yy00210', '3897D6A14860', '1', '106.716250 ', '26.587156 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('452', '黔灵东路一树药业门口', null, null, 'yy00211', '3897D6A15A00', '1', '106.715432 ', '26.586973 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('453', '黔灵东路中国农业银行门口', null, null, 'yy00212', '3897D6A13FE0', '1', '106.714449 ', '26.586902 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('454', '黔灵东路刘维兰老素粉店门口', null, null, 'yy00213', '3897D6A136C0', '1', '106.712759 ', '26.586497 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('455', '宝山北路雅珈舞蹈用品店方向师大公交站旁边', null, null, 'yy00214', '3897D6A15060', '1', '106.718080 ', '26.587165 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('456', '宝山北路广信轮胎汽车装潢门口', null, null, 'yy00215', '3897D6A15820', '1', '106.718158 ', '26.587800 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('457', '宝山北路彬之元减肥美容连锁门口', null, null, 'yy00216', '3897D6A14980', '1', '106.718162 ', '26.588475 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('458', '宝山北路贵州世纪天成广告门口', null, null, 'yy00217', '3897D6A13740', '1', '106.718208 ', '26.589147 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('459', '宝山北路文明特种艺术纸门口', null, null, 'yy00218', '3897D6A14760', '1', '106.718179 ', '26.589764 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('460', '宝山北路绿源电动车门口', null, null, 'yy00219', '3897D6A15DE0', '1', '106.718283 ', '26.590396 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('461', '宝山北路上海申连全自动麻将桌', null, null, 'yy00220', '3897D6A15420', '1', '106.718721 ', '26.590705 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('462', '宝山北路宣和全自动麻将机店门口', null, null, 'yy00223', '3897D6A15B00', '1', '106.718579 ', '26.588737 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('463', '宝山北路中有全自动麻将机店门口', null, null, 'yy00224', '3897D6A154C0', '1', '106.718508 ', '26.588152 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('464', '宝山北路季季红烟酒店门口', null, null, 'yy00225', '3897D6A138E0', '1', '106.718537 ', '26.587522 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('465', '宝山北路师大鲜花市场门口（大杆子）', null, null, 'yy00226', '3897D6A1E140', '1', '106.718675 ', '26.587242 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('466', '友谊路大明恭池浴都门口', null, null, 'yy00227', '3897D6A1D140', '1', '106.717460 ', '26.586400 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('467', '延安东路和舍酒店门口', null, null, 'yy00228', '3897D6A146E0', '1', '106.718433 ', '26.586106 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('468', '宝山北路219广场门口', null, null, 'yy00229', '3897D6A161E0', '1', '106.718729 ', '26.586582 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('469', '宝山北路贵阳公交旅行社正对面（大杆子）', null, null, 'yy00230', '3897D6A146A0', '1', '106.719454 ', '26.586643 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('470', '宝山北路流行美门口', null, null, 'yy00232', '3897D6A14E00', '1', '106.721007 ', '26.586065 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('471', '宝山北路师大入口贵阳银行门口', null, null, 'yy00233', '3897D6A14BE0', '1', '106.721757 ', '26.585824 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('472', '宝山北路痣缘宫门口', null, null, 'yy00234', '3897D6A144A0', '1', '106.721933 ', '26.585298 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('473', '宝山北路衣.恋琳琅满屋门口', null, null, 'yy00235', '3897D6A12AA0', '1', '106.721228 ', '26.585568 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('474', '宝山北路COCO都可奶茶店门口', null, null, 'yy00236', '3897D6A13D20', '1', '106.720463 ', '26.585861 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('475', '宝山北路贞丰特色糯米饭门口', null, null, 'yy00237', '3897D6A158E0', '1', '106.719621 ', '26.586096 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('476', '延安东路中国邮政报刊零售店门店口', null, null, 'yy00238', '3897D6A132C0', '1', '106.719015 ', '26.585983 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('477', '延安东路鸿星尔克店门口', null, null, 'yy00239', '3897D6A152A0', '1', '106.718033 ', '26.585686 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('478', '延安东路雅黛丽门口', null, null, 'yy00240', '3897D6A13900', '1', '106.716949 ', '26.585366 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('479', '延安东路奥康皮鞋店门口', null, null, 'yy00241', '3897D6A13140', '1', '106.715914 ', '26.585009 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('480', '延安东路特步店门口', null, null, 'yy00242', '3897D6A14740', '1', '106.715325 ', '26.585118 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('481', '延安东路银器时代门口', null, null, 'yy00243', '3897D6A14AE0', '1', '106.716346 ', '26.585411 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('482', '友谊路创艺装饰门口', null, null, 'yy00244', '3897D6A15020', '1', '106.717439 ', '26.585676 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('483', '友谊路亨特上城地下停车场门口', null, null, 'yy00245', '3897D6A181A0', '1', '106.717089 ', '26.586762 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('484', '富水北路德克士门口', null, null, 'yy00246', '3897D6A1DCE0', '1', '106.715253 ', '26.577475 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('485', '富水北路拾花摄门口', null, null, 'yy00247', '3897D6A197A0', '1', '106.714778 ', '26.577162 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('486', '富水北路中国光大银行门口', null, null, 'yy00248', '3897D6A14C80', '1', '106.715500 ', '26.573493 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('487', '富水北路托米诺门口', null, null, 'yy00249', '3897D6A17480', '1', '106.714887 ', '26.584602 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('488', '富水北路沁园门口', null, null, 'yy00250', '3897D6A1A880', '1', '106.714611 ', '26.584468 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('489', '富水北路杜超一牛肉粉店', null, null, 'yy00251', '3897D6A1D5E0', '1', '106.714898 ', '26.578281 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('490', '东新路贵阳农商银行门口', null, null, 'yy00252', '3897D6986F20', '1', '106.719816 ', '26.579207 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('491', '文昌北路袁记牛肉粉店门口', null, null, 'yy00253', '3897D6A18420', '1', '106.719626 ', '26.580187 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('492', '文昌北路欢乐时光童装店门口', null, null, 'yy00254', '3897D6A1EB80', '1', '106.719566 ', '26.581004 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('493', '文昌北路公共厕所门口', null, null, 'yy00255', '3897D6A19AA0', '1', '106.719418 ', '26.582011 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('494', '文昌北路中国电信贵州分公司门口', null, null, 'yy00258', '3897D6A1DAA0', '1', '106.718658 ', '26.583688 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('495', '文昌北路富安娜服饰店门口', null, null, 'yy00259', '3897D6A19B40', '1', '106.719039 ', '26.582944 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('496', '文昌北路向日葵放心面点店门口', null, null, 'yy00260', '3897D6A17A00', '1', '106.719297 ', '26.581570 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('497', '文昌北路中国工商银行门口', null, null, 'yy00261', '3897D6A184A0', '1', '106.719528 ', '26.579701 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('498', '文昌北路建设银行门口', null, null, 'yy00262', '3897D6A1DB80', '1', '106.719584 ', '26.578842 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('499', '文昌北路歆艾服饰店门口', null, null, 'yy00263', '3897D6A1ED40', '1', '106.719404 ', '26.580599 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('500', '中山东路黔茶飘香九品大好广场对面', null, null, 'yy00264', '3897D6A1A400', '1', '106.719326 ', '26.578015 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('501', '中山东路米兰美容厅门口', null, null, 'yy00265', '3897D6A1D1C0', '1', '106.718188 ', '26.578011 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('502', '中山东路天桥下中国银行门口', null, null, 'yy00266', '3897D6A1B280', '1', '106.717019 ', '26.578066 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('503', '中山东路贵阳日报社大厦世纪星光电影城门口', null, null, 'yy00267', '3897D6A1D2A0', '1', '106.715963 ', '26.577705 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('504', '中山东路银座商场门口', null, null, 'yy00268', '3897D6A17AE0', '1', '106.715459 ', '26.577448 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('505', '中山东路中国农业银行右侧宝威廉门口', null, null, 'yy00269', '3897D6A15A60', '1', '106.716536 ', '26.577773 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('506', '中山东路豪客来门口', null, null, 'yy00270', '3897D6A1D340', '1', '106.717598 ', '26.577918 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('507', '中山东路岭南国际会所楼下', null, null, 'yy00271', '3897D6A1D680', '1', '106.718758 ', '26.577940 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('508', '中山东路朗文斯汀', null, null, 'yy00272', '3897D6A1B100', '1', '106.719897 ', '26.577844 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('509', '中山东路贵州人民医院门诊部左侧', null, null, 'yy00273', '3897D6A13F00', '1', '106.721066 ', '26.577862 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('510', '中山东路贵州人民医院门口', null, null, 'yy00274', '3897D69869A0', '1', '106.722184 ', '26.577802 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('511', '宝山南路省医儿科楼旁', null, null, 'yy00275', '3897D6A1B660', '1', '106.723961 ', '26.577800 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('512', '中山东路儿科急诊门口', null, null, 'yy00276', '3897D6A1D900', '1', '106.723311 ', '26.577858 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('513', '中山东路玉茄子门口', null, null, 'yy00277', '3897D6A15BA0', '1', '106.722735 ', '26.577996 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('514', '中山东路千家福医疗连锁店门口', null, null, 'yy00278', '3897D6A1A460', '1', '106.721624 ', '26.577944 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('515', '中山东路中国工商银行门口', null, null, 'yy00279', '3897D6A147C0', '1', '106.720503 ', '26.577952 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('516', '文昌北路新乐理发店门口', null, null, 'yy00280', '3897D6A1D220', '1', '106.720994 ', '26.584069 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('517', '东新路东新文体门口', null, null, 'yy00281', '3897D6A17EC0', '1', '106.722806 ', '26.581757 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('518', '宝山北路黔香园大姨妈清水烫鹅馆门口', null, null, 'yy00282', '3897D6A1E200', '1', '106.723313 ', '26.581356 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('519', '宝山北路中医院停车场门口', null, null, 'yy00283', '3897D6986D20', '1', '106.723376 ', '26.580473 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('520', '中山东路东风中山宾馆右侧家用医疗器械门口', null, null, 'yy00284', '3897D6986420', '1', '106.723816 ', '26.578167 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('521', '宝山北路黔五福门口', null, null, 'yy00285', '3897D6A1D6E0', '1', '106.723722 ', '26.578941 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('522', '宝山北路中信银行门口', null, null, 'yy00286', '3897D6A17C80', '1', '106.723583 ', '26.579702 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('523', '宝山北路中国工商银行门口', null, null, 'yy00287', '3897D6988940', '1', '106.724163 ', '26.578589 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('524', '宝山北路中信银行正对面', null, null, 'yy00288', '3897D6986E60', '1', '106.724043 ', '26.579388 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('525', '宝山北路贵州省交通医院牌子下面', null, null, 'yy00289', '3897D6A18820', '1', '106.723875 ', '26.580180 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('526', '宝山北路警苑社区左边下坡石凳', null, null, 'yy00290', '3897D6A1B740', '1', '106.723693 ', '26.580938 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('527', '东山路警苑社区门口', null, null, 'yy00291', '3897D6A19E80', '1', '106.723570 ', '26.581835 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('528', '宝山北路出入境办证大厅旁', null, null, 'yy00292', '3897D6A1D0E0', '1', '106.723610 ', '26.582362 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('529', '宝山北路虎王保险柜旁', null, null, 'yy00294', '3897D6987D00', '1', '106.723197 ', '26.583565 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('530', '宝山北路86号2单元门口', null, null, 'yy00295', '3897D6A17DE0', '1', '106.723011 ', '26.584432 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('531', '宝山北路加油站门口', null, null, 'yy00296', '3897D6A17CA0', '1', '106.722529 ', '26.585228 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('532', '宝山北路武警贵州总队医院口腔中心门口', null, null, 'yy00312', '3897D6A19700', '1', '106.722507 ', '26.584708 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('533', '宝山北路贵阳市中心实验幼儿园门口', null, null, 'yy00315', '3897D6988040', '1', '106.723005 ', '26.582368 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('534', '北京路西门子助听器门口', null, null, 'yy00316', '3897D6986D80', '1', '106.711711 ', '26.597881 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('535', '盐务街与北京路T字路口国酒茅台路口', null, null, 'yy00317', '3897D6A1D920', '1', '106.712495 ', '26.595834 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('536', '北京路贵州新华通信社门口', null, null, 'yy00318', '3897D6A15D60', '1', '106.713709 ', '26.595821 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('537', '北京路千家福医疗器械连锁店门口', null, null, 'yy00319', '3897D69880E0', '1', '106.714872 ', '26.595993 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('538', '北京路网络一家人左侧', null, null, 'yy00320', '3897D6A1D500', '1', '106.715392 ', '26.595949 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('539', '北京路章光101门口', null, null, 'yy00321', '3897D6A1EAC0', '1', '106.712160 ', '26.595256 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('540', '北京路省政协大院2号门口（大灯杆）', null, null, 'yy00322', '3897D6987CE0', '1', '106.710141 ', '26.594996 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('541', '中华北路实验小学右侧', null, null, 'yy00323', '3897D6A1D640', '1', '106.709468 ', '26.595778 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('542', '北京路贵医附属医院右侧公共厕所门口', null, null, 'yy00324', '3897D6A1DBE0', '1', '106.712840 ', '26.595042 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('543', '盐务街中国农业银行对面田素粉门口', null, null, 'yy00325', '3897D6A193C0', '1', '106.712271 ', '26.596853 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('544', '盐务街与北京路T字路口世才便利店门口', null, null, 'yy00326', '3897D6985EE0', '1', '106.712186 ', '26.596331 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('545', '北京路中国移动门口', null, null, 'yy00327', '3897D6A1D120', '1', '106.713201 ', '26.595628 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('546', '北京路贵阳医科大学门口正对面', null, null, 'yy00328', '3897D6A17680', '1', '106.714323 ', '26.595358 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('547', '中华北路建设银行门口', null, null, 'yy00329', '3897D6A19800', '1', '106.709495 ', '26.595248 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('548', '瑞金北路现代女子医院门口', null, null, 'yy00330', '3897D6986960', '1', '106.705108 ', '26.582489 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('549', '瑞金北路新东方门口', null, null, 'yy00331', '3897D6A13000', '1', '106.704905 ', '26.583136 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('550', '瑞金北路男士精品门口', null, null, 'yy00332', '3897D69867A0', '1', '106.704715 ', '26.583875 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('551', '瑞金北路中国邮政门口', null, null, 'yy00333', '3897D6987B80', '1', '106.704756 ', '26.584984 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('552', '瑞金北路大家乐门口', null, null, 'yy00334', '3897D6A15180', '1', '106.704226 ', '26.586094 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('553', '瑞金北路贵阳市测绘局门口', null, null, 'yy00335', '3897D69853E0', '1', '106.704482 ', '26.586492 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('554', '瑞金北路海兰云天温泉酒店门口', null, null, 'yy00336', '3897D6986EE0', '1', '106.704034 ', '26.587620 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('555', '瑞金北路瑞北路口中国银行右侧', null, null, 'yy00337', '3897D6A1EDA0', '1', '106.703674 ', '26.589069 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('556', '瑞金北路瑞北路豪丽酒楼门口', null, null, 'yy00338', '3897D6A1DF80', '1', '106.703340 ', '26.589544 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('557', '瑞金北路外贸服饰连锁与贵阳银行中间', null, null, 'yy00339', '3897D6A1D9A0', '1', '106.702672 ', '26.590629 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('558', '瑞金北路雪亚蒙右侧', null, null, 'yy00340', '3897D6A19560', '1', '106.705697 ', '26.582182 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('559', '瑞金北路贵州蓝天企业门口', null, null, 'yy00341', '3897D6A129E0', '1', '106.705306 ', '26.582882 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('560', '瑞金北路一品药业门口', null, null, 'yy00342', '3897D6986DC0', '1', '106.705140 ', '26.583529 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('561', '瑞金北路交通银行门口', null, null, 'yy00343', '3897D6A1C020', '1', '106.704953 ', '26.584296 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('562', '瑞金北路中国工商银行门口', null, null, 'yy00344', '3897D69864A0', '1', '106.704442 ', '26.585294 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('563', '瑞金北路瑞金烟酒门口', null, null, 'yy00345', '3897D6987E80', '1', '106.704662 ', '26.585717 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('564', '瑞金北路如家酒店门口', null, null, 'yy00346', '3897D6A1E840', '1', '106.704356 ', '26.587239 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('565', '瑞金北路中国农业银行门口', null, null, 'yy00347', '3897D6A1D960', '1', '106.704153 ', '26.588789 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('566', '瑞金北路自有女人门口', null, null, 'yy00348', '3897D6988980', '1', '106.704040 ', '26.589487 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('567', '瑞金北路南方航空门口', null, null, 'yy00349', '3897D6A145A0', '1', '106.703819 ', '26.590015 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('568', '瑞金北路奥丝蓝黛门口', null, null, 'yy00350', '3897D6A1DCC0', '1', '106.704572 ', '26.584564 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('569', '瑞金北路民生银行门口', null, null, 'yy00351', '3897D6A17CE0', '1', '106.704303 ', '26.588043 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('570', '瑞金北路迪堡保险柜门口', null, null, 'yy00352', '3897D6A198E0', '1', '106.703882 ', '26.588400 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('571', '新添大道南路贵阳云岩区消防大队右侧中医推拿门口', null, null, 'yy00353', '3897D6A17300', '1', '106.718175 ', '26.596178 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('572', '北京路贵阳银行正对面', null, null, 'yy00354', '3897D6A19A40', '1', '106.718088 ', '26.595723 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('573', '宝山北路与北京东路路口贵阳日报社门口', null, null, 'yy00355', '3897D6986120', '1', '106.718753 ', '26.595549 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('574', '宝山南路邹邹记煨菜门口', null, null, 'yy00356', '3897D6A1DA20', '1', '106.718352 ', '26.595335 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('575', '宝山北路贵阳日报社集团印务公司经营部门口', null, null, 'yy00357', '3897D6987DC0', '1', '106.718835 ', '26.595105 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('576', '宝山北路麦香小吃门口', null, null, 'yy00358', '3897D6988760', '1', '106.718752 ', '26.594456 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('577', '宝山北路酒店用品惠诚滋知门口', null, null, 'yy00359', '3897D6A17B80', '1', '106.718378 ', '26.594168 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('578', '宝山北路正宗金沙羊肉杂粉', null, null, 'yy00360', '3897D6A183E0', '1', '106.718741 ', '26.593877 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('579', '宝山北路一树药业门口', null, null, 'yy00361', '3897D6A1B560', '1', '106.718353 ', '26.593612 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('580', '宝山北路施格名门门口', null, null, 'yy00362', '3897D6A1D3E0', '1', '106.718699 ', '26.593302 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('581', '宝山北路老北京布鞋门口', null, null, 'yy00363', '3897D6A1D180', '1', '106.718348 ', '26.592972 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('582', '宝山北路新联酒店正对面南方电力柜旁', null, null, 'yy00364', '3897D6A199A0', '1', '106.718695 ', '26.592646 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('583', '宝山北路新联酒店门口', null, null, 'yy00365', '3897D6986580', '1', '106.718317 ', '26.592352 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('584', '宝山北路法式脆皮蛋糕店门口', null, null, 'yy00366', '3897D6A194C0', '1', '106.718655 ', '26.592025 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('585', '宝山北路雨田印务左侧', null, null, 'yy00367', '3897D6A1D100', '1', '106.718679 ', '26.591435 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('586', '宝山北路中国农业银行门口', null, null, 'yy00368', '3897D6A1D5C0', '1', '106.718617 ', '26.594660 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('587', '宝山北路与新印厂路口', null, null, 'yy00369', '3897D6A1DBA0', '1', '106.718350 ', '26.591331 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('588', '宝山北路百灵.尚品一号宝山公交站旁（大杆）', null, null, 'yy00221', '3897D6A150A0', '1', '106.728702 ', '26.594770 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('589', '花溪党校', null, null, 'hx11001', '3891D5C283C0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('590', '中山南路金融大厦正对面', null, null, 'nm00190', '3897D6A12980', '1', '106.6872110354', '26.5677039134', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('591', '花果园大街博物馆正对面', null, null, 'nm00191', '3897D6A1DA80', '1', '106.689240 ', '26.565917 ', null, '150', '0');
INSERT INTO `fy_ap` VALUES ('592', '普陀路毕节砂锅羊肉粉店门口', null, null, 'yy00184', '3897D6A15360', '1', '106.713212 ', '26.590138 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('593', '文昌北路大家乐超市门口', null, null, 'yy00257', '3897D6A17360', '1', '106.719052 ', '26.583421 ', null, '154', '0');
INSERT INTO `fy_ap` VALUES ('594', '花溪党校', null, null, 'SWJFH3CAC_1', '3891D521E920', '1', '106.677278 ', '26.384492 ', null, '1', '0');
INSERT INTO `fy_ap` VALUES ('649', '花溪党校', null, null, 'hx11002', '3891D5C28060', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('650', '花溪党校', null, null, 'hx11003', '3891D5C28540', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('651', '花溪党校', null, null, 'hx11005', '3891D5C28D60', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('652', '花溪党校', null, null, 'hx11006', '3891D5C29480', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('653', '花溪党校', null, null, 'hx11007', '3891D5C28A40', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('654', '花溪党校', null, null, 'hx11008', '3891D5C28E20', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('655', '花溪党校', null, null, 'hx11017', '3891D5C28B60', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('656', '花溪党校', null, null, 'hx11018', '3891D5C28820', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('657', '花溪党校', null, null, 'hx11019', '3891D5C28900', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('658', '花溪党校', null, null, 'hx11020', '3891D5C29B60', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('659', '花溪党校', null, null, 'hx11023', '3891D5C28AE0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('660', '花溪党校', null, null, 'hx11024', '3891D5C288A0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('661', '花溪党校', null, null, 'hx11025', '3891D5C28840', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('662', '花溪党校', null, null, 'hx11026', '3891D5C28780', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('663', '花溪党校', null, null, 'hx11027', '3891D5C289A0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('664', '花溪党校', null, null, 'hx11030', '3891D5C28B00', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('665', '花溪党校', null, null, 'hx11031', '3891D5C28EC0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('666', '花溪党校', null, null, 'hx11032', '3891D5C28DE0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('667', '花溪党校', null, null, 'hx11033', '3891D5C28F20', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('668', '花溪党校', null, null, 'hx11034', '3891D5C28920', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('669', '花溪党校', null, null, 'hx11035', '3891D5C29060', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('670', '花溪党校', null, null, 'hx11036', '3891D5C28D20', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('671', '花溪党校', null, null, 'hx11037', '3891D5C289C0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('672', '花溪党校', null, null, 'hx11038', '3891D5C28D40', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('673', '花溪党校', null, null, 'hx11039', '3891D5C28E40', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('674', '花溪党校', null, null, 'hx11044', '3891D5C27D40', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('675', '花溪党校', null, null, 'hx11045', '3891D5C27C40', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('676', '花溪党校', null, null, 'hx11051', '3891D5C27BC0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('677', '花溪党校', null, null, 'hx11052', '3891D5C27E00', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('678', '花溪党校', null, null, 'hx11053', '3891D5C27BA0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('679', '花溪党校', null, null, 'hx11054', '3891D5C27CA0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('680', '花溪党校', null, null, 'hx11055', '3891D5C27C60', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('681', '花溪党校', null, null, 'hx11056', '3891D5C27DC0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('682', '花溪党校', null, null, 'hx11057', '3891D5C27D20', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('683', '花溪党校', null, null, 'hx11058', '3891D5C27D60', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('684', '花溪党校', null, null, 'hx11059', '3891D5C27C20', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('685', '花溪党校', null, null, 'hx11060', '3891D5C27C00', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('686', '花溪党校', null, null, 'hx11061', '3891D5C27E40', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('687', '花溪党校', null, null, 'hx11062', '3891D5C27B60', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('688', '花溪党校', null, null, 'hx11063', '3891D5C27FE0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('689', '花溪党校', null, null, 'hx11064', '3891D5C280E0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('690', '花溪党校', null, null, 'hx11065', '3891D5C27BE0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('691', '花溪党校', null, null, 'hx11066', '3891D5C27F60', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('692', '花溪党校', null, null, 'hx11067', '3891D5C29760', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('693', '花溪党校', null, null, 'hx11068', '3891D5C28C80', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('694', '花溪党校', null, null, 'hx11069', '3891D5C28480', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('695', '花溪党校', null, null, 'hx11070', '3891D5C28BC0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('696', '花溪党校', null, null, 'hx11071', '3891D5C28FA0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('697', '花溪党校', null, null, 'hx11072', '3891D5C28FE0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('698', '花溪党校', null, null, 'hx11073', '3891D5C29B80', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('699', '花溪党校', null, null, 'hx11074', '3891D5C28F40', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('700', '花溪党校', null, null, 'hx11075', '3891D5C27F40', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('701', '花溪党校', null, null, 'hx11077', '3891D5C29D60', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('702', '花溪党校', null, null, 'hx11078', '3891D5C27E20', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('703', '花溪党校', null, null, 'hx11079', '3891D5C28620', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('704', '花溪党校', null, null, 'hx11080', '3891D5C27EC0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('705', '花溪党校', null, null, 'hx11081', '3891D5C27FA0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('706', '花溪党校', null, null, 'hx11082', '3891D5C27F00', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('708', '花溪党校', null, null, 'hx11084', '3891D5B6D5E0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('709', '花溪党校', null, null, 'hx11085', '3891D5B6D6E0', '1', '106.675417 ', '26.379488 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('710', '花溪党校', null, null, 'hx12004', '3897D618F180', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('711', '花溪党校', null, null, 'hx12005', '3897D618F600', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('712', '花溪党校', null, null, 'hx12006', '3897D618F640', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('713', '花溪党校', null, null, 'hx12007', '3897D618F480', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('714', '花溪党校', null, null, 'hx12008', '3897D618FA20', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('715', '花溪党校', null, null, 'hx12009', '3897D618F220', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('716', '花溪党校', null, null, 'hx12010', '3897D618F280', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('717', '花溪党校', null, null, 'hx12011', '3897D618F900', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('718', '花溪党校', null, null, 'hx12012', '3897D618F500', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('719', '花溪党校', null, null, 'hx12013', '3897D618F800', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('720', '花溪党校', null, null, 'hx12014', '3897D618F3C0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('721', '花溪党校', null, null, 'hx12018', '3897D61A1D80', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('722', '花溪党校', null, null, 'hx12031', '3897D61976E0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('723', '花溪党校', null, null, 'hx12032', '3897D61A1E80', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('724', '花溪党校', null, null, 'hx12034', '3897D61A2AE0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('725', '花溪党校', null, null, 'hx12035', '3897D61A2BA0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('726', '花溪党校', null, null, 'hx12036', '3897D61A3780', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('727', '花溪党校', null, null, 'hx12037', '3897D61A2920', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('728', '花溪党校', null, null, 'hx12038', '3897D61A2780', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('729', '花溪党校', null, null, 'hx12039', '3897D61A04C0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('730', '花溪党校', null, null, 'hx12041', '3897D61A1CA0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('731', '花溪党校', null, null, 'hx12042', '3897D61A2980', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('732', '花溪党校', null, null, 'hx12044', '3897D61A02C0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('733', '花溪党校', null, null, 'hx12045', '3897D61A1D40', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('734', '花溪党校', null, null, 'hx12046', '3897D61A0220', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('735', '花溪党校', null, null, 'hx12047', '3897D61A34A0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('736', '花溪党校', null, null, 'hx12048', '3897D61A3E80', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('737', '花溪党校', null, null, 'hx12049', '3897D61A3400', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('738', '花溪党校', null, null, 'hx12050', '3897D61A41E0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('739', '花溪党校', null, null, 'hx12051', '3897D61A3A60', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('740', '花溪党校', null, null, 'hx12052', '3897D61C2960', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('741', '花溪党校', null, null, 'hx12053', '3897D61C1EA0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('742', '花溪党校', null, null, 'hx12054', '3897D61C1DE0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('743', '花溪党校', null, null, 'hx12055', '3897D61C24C0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('744', '花溪党校', null, null, 'hx12057', '3897D61C1CC0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('745', '花溪党校', null, null, 'hx12058', '3897D61A3D80', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('746', '花溪党校', null, null, 'hx12059', '3897D61C3AE0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('747', '花溪党校', null, null, 'hx12060', '3897D61C3BE0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('748', '花溪党校', null, null, 'hx12061', '3897D61C4300', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('749', '花溪党校', null, null, 'hx12062', '3897D61C1D80', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('750', '花溪党校', null, null, 'hx12063', '3897D618F380', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('751', '花溪党校', null, null, 'hx12064', '3897D618FD00', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('752', '花溪党校', null, null, 'hx12065', '3897D6190860', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('753', '花溪党校', null, null, 'hx12066', '3897D618F4A0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('754', '花溪党校', null, null, 'hx12067', '3897D6190960', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('755', '花溪党校', null, null, 'hx12068', '3897D618F5E0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('756', '花溪党校', null, null, 'hx12070', '3897D618FB00', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('757', '花溪党校', null, null, 'hx12071', '3897D618F940', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('758', '花溪党校', null, null, 'hx12072', '3897D618F5C0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('759', '花溪党校', null, null, 'hx12073', '3897D618FB40', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('760', '花溪党校', null, null, 'hx12074', '3897D618F860', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('761', '花溪党校', null, null, 'hx12075', '3897D618F580', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('762', '花溪党校', null, null, 'hx12076', '3897D618FE00', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('763', '花溪党校', null, null, 'hx12078', '3897D618FC60', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('764', '花溪党校', null, null, 'hx12079', '3897D61C1E00', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('765', '花溪党校', null, null, 'hx12080', '3897D61C2920', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('766', '花溪党校', null, null, 'hx12081', '3897D61C3B00', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('767', '花溪党校', null, null, 'hx12082', '3897D61C2940', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('768', '花溪党校', null, null, 'hx12083', '3897D61C2980', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('769', '花溪党校', null, null, 'hx12085', '3897D61C2CC0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('770', '花溪党校', null, null, 'hx12086', '3897D61C29E0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('771', '花溪党校', null, null, 'hx12087', '3897D61C3AA0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('772', '花溪党校', null, null, 'hx12088', '3897D61C2A20', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('773', '花溪党校', null, null, 'hx12089', '3897D618F160', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('774', '花溪党校', null, null, 'hx12090', '3897D618FB80', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('775', '花溪党校', null, null, 'hx12091', '3897D618FAA0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('776', '花溪党校', null, null, 'hx12092', '3897D618F6C0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('777', '花溪党校', null, null, 'hx12093', '3897D61A32A0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('778', '花溪党校', null, null, 'hx12094', '3897D61A3200', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('779', '花溪党校', null, null, 'hx12095', '3897D61A3480', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('780', '花溪党校', null, null, 'hx12096', '3897D61A3300', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('781', '花溪党校', null, null, 'hx12097', '3897D61A31A0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('782', '花溪党校', null, null, 'hx12098', '3897D61A33A0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('783', '花溪党校', null, null, 'hx12099', '3897D61A3AE0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('784', '花溪党校', null, null, 'hx12100', '3897D61A31C0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('785', '花溪党校', null, null, 'hx12101', '3897D61A3460', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('786', '花溪党校', null, null, 'hx12102', '3897D61A3280', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('787', '花溪党校', null, null, 'hx12103', '3897D61A30C0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('788', '花溪党校', null, null, 'hx12104', '3897D61A3E60', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('789', '花溪党校', null, null, 'hx12105', '3897D61A34E0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('790', '花溪党校', null, null, 'hx12106', '3897D61A2A20', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('791', '花溪党校', null, null, 'hx12107', '3897D61A18A0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('792', '花溪党校', null, null, 'hx12108', '3897D61A5E00', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('793', '花溪党校', null, null, 'hx12109', '3897D6193140', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('794', '花溪党校', null, null, 'hx12110', '3897D6190FE0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('795', '花溪党校', null, null, 'hx12111', '3897D61911A0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('796', '花溪党校', null, null, 'hx12112', '3897D6192B80', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('797', '花溪党校', null, null, 'hx12113', '3897D61987E0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('798', '花溪党校', null, null, 'hx12114', '3897D6195680', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('799', '花溪党校', null, null, 'hx12115', '3897D6197D60', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('800', '花溪党校', null, null, 'hx12116', '3897D61A5720', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('801', '花溪党校', null, null, 'hx12117', '3897D61A53E0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('802', '花溪党校', null, null, 'hx12118', '3897D6193D60', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('803', '花溪党校', null, null, 'hx12119', '3897D6195020', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('804', '花溪党校', null, null, 'hx12120', '3897D61A1760', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('805', '花溪党校', null, null, 'hx12121', '3897D6192780', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('806', '花溪党校', null, null, 'hx12122', '3897D61929C0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('807', '花溪党校', null, null, 'hx12123', '3897D61A59E0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('808', '花溪党校', null, null, 'hx12124', '3897D61A5DA0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('809', '花溪党校', null, null, 'hx12126', '3897D61991C0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('810', '花溪党校', null, null, 'hx12128', '3897D61A01E0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('811', '花溪党校', null, null, 'hx12129', '3897D61A0EC0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('812', '花溪党校', null, null, 'hx12130', '3897D619F500', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('813', '花溪党校', null, null, 'hx12131', '3897D619FB60', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('814', '花溪党校', null, null, 'hx12132', '3897D619FBA0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('815', '花溪党校', null, null, 'hx12133', '3897D61A3C00', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('816', '花溪党校', null, null, 'hx12134', '3897D61A0660', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('817', '花溪党校', null, null, 'hx12135', '3897D61A0520', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('818', '花溪党校', null, null, 'hx12136', '3897D61A04A0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('819', '花溪党校', null, null, 'hx12137', '3897D61A1DE0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('820', '花溪党校', null, null, 'hx12138', '3897D619FDC0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('821', '花溪党校', null, null, 'hx12139', '3897D61A0000', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('822', '花溪党校', null, null, 'hx12140', '3897D61A2DA0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('823', '花溪党校', null, null, 'hx12141', '3897D619FC40', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('824', '花溪党校', null, null, 'hx12142', '3897D618FF00', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('825', '花溪党校', null, null, 'hx12143', '3897D619FD20', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('826', '花溪党校', null, null, 'hx12144', '3897D618FFC0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('827', '花溪党校', null, null, 'hx12145', '3897D618FD40', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('828', '花溪党校', null, null, 'hx12146', '3897D618FEE0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('829', '花溪党校', null, null, 'hx12147', '3897D6190000', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('830', '花溪党校', null, null, 'hx12148', '3897D618EE20', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('831', '花溪党校', null, null, 'hx12149', '3897D618FDA0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('832', '花溪党校', null, null, 'hx12151', '3897D61917A0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('833', '花溪党校', null, null, 'hx12152', '3897D619A3A0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('834', '花溪党校', null, null, 'hx12153', '3897D618FFA0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('835', '花溪党校', null, null, 'hx12154', '3897D6191240', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('836', '花溪党校', null, null, 'hx12155', '3897D618FE80', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('837', '花溪党校', null, null, 'hx12157', '3897D6190040', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('838', '花溪党校', null, null, 'hx12158', '3897D61ECAE0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('839', '花溪党校', null, null, 'hx12159', '3897D61A57C0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('840', '花溪党校', null, null, 'hx12160', '3897D61A2FE0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('841', '花溪党校', null, null, 'hx12161', '3897D61A2EA0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('842', '花溪党校', null, null, 'hx12162', '3897D61A3A00', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('843', '花溪党校', null, null, 'hx12163', '3897D61A2FC0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('844', '花溪党校', null, null, 'hx12164', '3897D61A5700', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('845', '花溪党校', null, null, 'hx12165', '3897D6192720', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('846', '花溪党校', null, null, 'hx12166', '3897D61A4060', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('847', '花溪党校', null, null, 'hx12167', '3897D6192E80', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('848', '花溪党校', null, null, 'hx12168', '3897D61A3560', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('849', '花溪党校', null, null, 'hx12169', '3897D61925C0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('850', '花溪党校', null, null, 'hx12170', '3897D61A6280', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('851', '花溪党校', null, null, 'hx12171', '3897D6192EE0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('852', '花溪党校', null, null, 'hx12172', '3897D61A5BE0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('853', '花溪党校', null, null, 'hx12173', '3897D61A3C40', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('854', '花溪党校', null, null, 'hx12174', '3897D6192A00', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('855', '花溪党校', null, null, 'hx12175', '3897D61926C0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('856', '花溪党校', null, null, 'hx12176', '3897D61A5820', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('857', '花溪党校', null, null, 'hx12177', '3897D61A5A20', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('858', '花溪党校', null, null, 'hx12178', '3897D6192D40', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('859', '花溪党校', null, null, 'hx12179', '3897D61EC8C0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('860', '花溪党校', null, null, 'hx12180', '3897D61A05E0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('861', '花溪党校', null, null, 'hx12181', '3897D6199A40', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('862', '花溪党校', null, null, 'hx12182', '3897D6196BE0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('863', '花溪党校', null, null, 'hx12183', '3897D61EC680', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('864', '花溪党校', null, null, 'hx12184', '3897D61EC900', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('865', '花溪党校', null, null, 'hx12185', '3897D61EC980', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('866', '花溪党校', null, null, 'hx12187', '3897D61EDD20', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('867', '花溪党校', null, null, 'hx12188', '3897D61EDE80', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('868', '花溪党校', null, null, 'hx12189', '3897D61EC8E0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('869', '花溪党校', null, null, 'hx12190', '3897D61ED960', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('870', '花溪党校', null, null, 'hx12191', '3897D61EC840', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('871', '花溪党校', null, null, 'hx12192', '3897D61EC740', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('872', '花溪党校', null, null, 'hx12193', '3897D61ED880', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('873', '花溪党校', null, null, 'hx12194', '3897D61EC820', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('874', '花溪党校', null, null, 'hx12195', '3897D61EC880', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('875', '花溪党校', null, null, 'hx12196', '3897D61EDC60', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('876', '花溪党校', null, null, 'hx12198', '3897D61EDD80', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('877', '花溪党校', null, null, 'hx12199', '3897D61EDB20', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('878', '花溪党校', null, null, 'hx12201', '3897D61A1A60', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('879', '花溪党校', null, null, 'hx12202', '3897D61A0980', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('880', '花溪党校', null, null, 'hx12203', '3897D61A05A0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('881', '花溪党校', null, null, 'hx12204', '3897D61A0820', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('882', '花溪党校', null, null, 'hx12205', '3897D61A3CC0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('883', '花溪党校', null, null, 'hx12207', '3897D61A0B20', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('884', '花溪党校', null, null, 'hx12208', '3897D61A0380', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('885', '花溪党校', null, null, 'hx12209', '3897D61A07A0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('886', '花溪党校', null, null, 'hx12210', '3897D61A07C0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('887', '花溪党校', null, null, 'hx12211', '3897D61A34C0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('888', '花溪党校', null, null, 'hx12212', '3897D619F360', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('889', '花溪党校', null, null, 'hx12213', '3897D61A0EA0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('890', '花溪党校', null, null, 'hx12214', '3897D61A0400', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('891', '花溪党校', null, null, 'hx12215', '3897D61A0060', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('892', '花溪党校', null, null, 'hx12216', '3897D619FE00', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('893', '花溪党校', null, null, 'hx12217', '3897D61A0600', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('894', '花溪党校', null, null, 'hx12219', '3897D61A0500', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('895', '花溪党校', null, null, 'hx12220', '3897D61A07E0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('896', '花溪党校', null, null, 'hx12221', '3897D61A4260', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('897', '花溪党校', null, null, 'hx12222', '3897D61A0420', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('898', '花溪党校', null, null, 'hx12225', '3897D619FDE0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('899', '花溪党校', null, null, 'hx12226', '3897D61A33E0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('900', '花溪党校', null, null, 'hx12227', '3897D61A03E0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('901', '花溪党校', null, null, 'hx12228', '3897D61A2F20', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('902', '花溪党校', null, null, 'hx12229', '3897D619FE60', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('903', '花溪党校', null, null, 'hx12230', '3897D61A5740', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('904', '花溪党校', null, null, 'hx12231', '3897D61A00C0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('905', '花溪党校', null, null, 'hx12232', '3897D61A0A00', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('906', '花溪党校', null, null, 'hx12233', '3897D619F480', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('907', '花溪党校', null, null, 'hx12234', '3897D61A44C0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('908', '花溪党校', null, null, 'hx12235', '3897D61A3440', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('909', '花溪党校', null, null, 'hx12236', '3897D61A16C0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('910', '花溪党校', null, null, 'hx12238', '3897D61A5D80', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('911', '花溪党校', null, null, 'hx12239', '3897D6198820', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('912', '花溪党校', null, null, 'hx12240', '3897D61942C0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('913', '花溪党校', null, null, 'hx12241', '3897D619F520', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('914', '花溪党校', null, null, 'hx12243', '3897D619FF40', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('915', '花溪党校', null, null, 'hx12244', '3897D6192DA0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('916', '花溪党校', null, null, 'hx12245', '3897D61A5680', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('917', '花溪党校', null, null, 'hx12246', '3897D619B820', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('918', '花溪党校', null, null, 'hx12247', '3897D619B760', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('919', '花溪党校', null, null, 'hx12248', '3897D61A1140', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('920', '花溪党校', null, null, 'hx12249', '3897D61A4CE0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('921', '花溪党校', null, null, 'hx12250', '3897D619ADA0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('922', '花溪党校', null, null, 'hx12251', '3897D619B060', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('923', '花溪党校', null, null, 'hx12252', '3897D619AC80', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('924', '花溪党校', null, null, 'hx12253', '3897D61A12E0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('925', '花溪党校', null, null, 'hx12254', '3897D61A4C20', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('926', '花溪党校', null, null, 'hx12255', '3897D619ACE0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('927', '花溪党校', null, null, 'hx12256', '3897D61A5100', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('928', '花溪党校', null, null, 'hx12257', '3897D619B0C0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('929', '花溪党校', null, null, 'hx12258', '3897D6198AE0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('930', '花溪党校', null, null, 'hx12259', '3897D61913C0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('931', '花溪党校', null, null, 'hx12260', '3897D6197FE0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('932', '花溪党校', null, null, 'hx12261', '3897D61910E0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('933', '花溪党校', null, null, 'hx12262', '3897D6199B00', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('934', '花溪党校', null, null, 'hx12263', '3897D61935E0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('935', '花溪党校', null, null, 'hx12264', '3897D618FA00', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('936', '花溪党校', null, null, 'hx12265', '3897D6195E40', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('937', '花溪党校', null, null, 'hx12267', '3897D618EF60', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('938', '花溪党校', null, null, 'hx12268', '3897D619A260', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('939', '花溪党校', null, null, 'hx12269', '3897D618F980', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('940', '花溪党校', null, null, 'hx12270', '3897D61A09A0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('941', '花溪党校', null, null, 'hx12271', '3897D61A00A0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('942', '花溪党校', null, null, 'hx12272', '3897D6192120', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('943', '花溪党校', null, null, 'hx12273', '3897D618F360', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('944', '花溪党校', null, null, 'hx12274', '3897D61A0780', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('945', '花溪党校', null, null, 'hx12275', '3897D61A09C0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('946', '花溪党校', null, null, 'hx12276', '3897D61A03A0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('947', '花溪党校', null, null, 'hx12277', '3897D61A0A80', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('948', '花溪党校', null, null, 'hx12278', '3897D61A37E0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('949', '花溪党校', null, null, 'hx12279', '3897D61A29C0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('950', '花溪党校', null, null, 'hx12280', '3897D61A41A0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('951', '花溪党校', null, null, 'hx12281', '3897D6192A80', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('952', '花溪党校', null, null, 'hx12282', '3897D61A0260', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('953', '花溪党校', null, null, 'hx12283', '3897D61A1C80', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('954', '花溪党校', null, null, 'hx12284', '3897D61930A0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('955', '花溪党校', null, null, 'hx12285', '3897D61928E0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('956', '花溪党校', null, null, 'hx12286', '3897D61A5F80', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('957', '花溪党校', null, null, 'hx12287', '3897D61A6060', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('958', '花溪党校', null, null, 'hx12288', '3897D61A5420', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('959', '花溪党校', null, null, 'hx12289', '3897D61A1A40', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('960', '花溪党校', null, null, 'hx12290', '3897D61A62A0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('961', '花溪党校', null, null, 'hx12291', '3897D61922C0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('962', '花溪党校', null, null, 'hx12292', '3897D6192D60', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('963', '花溪党校', null, null, 'hx12293', '3897D6193020', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('964', '花溪党校', null, null, 'hx12318', '3897D61A3AC0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('965', '花溪党校', null, null, 'hx12319', '3897D61A56A0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('966', '花溪党校', null, null, 'hx12320', '3897D61A3A80', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('967', '花溪党校', null, null, 'hx12321', '3897D61A6160', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('968', '花溪党校', null, null, 'hx12322', '3897D61A40E0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('969', '花溪党校', null, null, 'hx12323', '3897D61A6000', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('970', '花溪党校', null, null, 'hx12324', '3897D61A3B20', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('971', '花溪党校', null, null, 'hx12325', '3897D61A3020', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('972', '花溪党校', null, null, 'hx12326', '3897D61A3620', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('973', '花溪党校', null, null, 'hx12327', '3897D61A5800', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('974', '花溪党校', null, null, 'hx12328', '3897D61A35A0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('975', '花溪党校', null, null, 'hx12329', '3897D61A5840', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('976', '花溪党校', null, null, 'hx12330', '3897D61A35E0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('977', '花溪党校', null, null, 'hx12332', '3897D61A3BA0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('978', '花溪党校', null, null, 'hx12333', '3897D61A3640', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('979', '花溪党校', null, null, 'hx12334', '3897D61A56E0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('980', '花溪党校', null, null, 'hx12335', '3897D61A3100', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('981', '花溪党校', null, null, 'hx12336', '3897D6192600', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('982', '花溪党校', null, null, 'hx12337', '3897D6192E60', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('983', '花溪党校', null, null, 'hx12338', '3897D618F400', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('984', '花溪党校', null, null, 'hx12339', '3897D618FFE0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('985', '花溪党校', null, null, 'hx12340', '3897D618F540', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('986', '花溪党校', null, null, 'hx12341', '3897D619AEA0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('987', '花溪党校', null, null, 'hx12342', '3897D61A09E0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('988', '花溪党校', null, null, 'hx12343', '3897D61A0620', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('989', '花溪党校', null, null, 'hx12344', '3897D619F280', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('990', '花溪党校', null, null, 'hx12345', '3897D61A0340', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('991', '花溪党校', null, null, 'hx12346', '3897D61A0560', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('992', '花溪党校', null, null, 'hx12347', '3897D61A0740', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('993', '花溪党校', null, null, 'hx12348', '3897D61A03C0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('994', '花溪党校', null, null, 'hx12349', '3897D61A0B60', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('995', '花溪党校', null, null, 'hx12350', '3897D61A3880', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('996', '花溪党校', null, null, 'hx12351', '3897D618F4C0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('997', '花溪党校', null, null, 'hx12352', '3897D61A2940', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('998', '花溪党校', null, null, 'hx12353', '3897D61A1720', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('999', '花溪党校', null, null, 'hx12354', '3897D61A29E0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1000', '花溪党校', null, null, 'hx12355', '3897D61A54E0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1001', '花溪党校', null, null, 'hx12356', '3897D61A29A0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1002', '花溪党校', null, null, 'hx12357', '3897D61A2380', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1003', '花溪党校', null, null, 'hx12358', '3897D61A0100', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1004', '花溪党校', null, null, 'hx12359', '3897D61A3060', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1005', '花溪党校', null, null, 'hx12360', '3897D61A1DC0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1006', '花溪党校', null, null, 'hx12361', '3897D61A1CE0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1007', '花溪党校', null, null, 'hx12362', '3897D61932C0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1008', '花溪党校', null, null, 'hx12363', '3897D61A2E40', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1009', '花溪党校', null, null, 'hx12364', '3897D61A0EE0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1010', '花溪党校', null, null, 'hx12365', '3897D619FBE0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1011', '花溪党校', null, null, 'hx12366', '3897D61A2340', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1012', '花溪党校', null, null, 'hx12367', '3897D61AC440', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1013', '花溪党校', null, null, 'hx12368', '3897D6190500', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1014', '花溪党校', null, null, 'hx12369', '3897D618FD20', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1015', '花溪党校', null, null, 'hx12371', '3897D61AC400', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1016', '花溪党校', null, null, 'hx12372', '3897D61A22A0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1017', '花溪党校', null, null, 'hx12373', '3897D618F9A0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1018', '花溪党校', null, null, 'hx12374', '3897D618FBA0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1019', '花溪党校', null, null, 'hx12375', '3897D619A1A0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1020', '花溪党校', null, null, 'hx12377', '3897D61A0040', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1021', '花溪党校', null, null, 'hx12378', '3897D619FD40', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1022', '花溪党校', null, null, 'hx12379', '3897D61A2320', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1023', '花溪党校', null, null, 'hx12380', '3897D61A0B00', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1024', '花溪党校', null, null, 'hx12381', '3897D61A2D60', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1025', '花溪党校', null, null, 'hx12382', '3897D61A3980', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1026', '花溪党校', null, null, 'hx12383', '3897D61940A0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1027', '花溪党校', null, null, 'hx12384', '3897D6193E80', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1028', '花溪党校', null, null, 'hx12385', '3897D6194100', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1029', '花溪党校', null, null, 'hx12386', '3897D618F700', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1030', '花溪党校', null, null, 'hx12388', '3897D61A2F60', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1031', '花溪党校', null, null, 'hx12389', '3897D61ACF80', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1032', '花溪党校', null, null, 'hx12390', '3897D61EDA60', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1033', '花溪党校', null, null, 'hx12391', '3897D61A2CE0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1034', '花溪党校', null, null, 'hx12392', '3897D61A0A20', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1035', '花溪党校', null, null, 'hx12393', '3897D61A2D40', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1036', '花溪党校', null, null, 'hx12394', '3897D61A0180', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1037', '花溪党校', null, null, 'hx12395', '3897D61A6080', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1038', '花溪党校', null, null, 'hx12396', '3897D6192C80', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1039', '花溪党校', null, null, 'hx12398', '3897D61A0200', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1040', '花溪党校', null, null, 'hx12399', '3897D6196DC0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1041', '花溪党校', null, null, 'hx12400', '3897D6190CC0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1042', '花溪党校', null, null, 'hx12401', '3897D619FF80', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1043', '花溪党校', null, null, 'hx12402', '3897D61A2E20', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1044', '花溪党校', null, null, 'hx12404', '3897D6191B60', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1045', '花溪党校', null, null, 'hx12405', '3897D6199600', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1046', '花溪党校', null, null, 'hx12406', '3897D6191AE0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1047', '花溪党校', null, null, 'hx12407', '3897D619FF20', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1048', '花溪党校', null, null, 'hx12408', '3897D619FC20', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1049', '花溪党校', null, null, 'hx12409', '3897D618F240', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1050', '花溪党校', null, null, 'hx12410', '3897D61A02A0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1051', '花溪党校', null, null, 'hx12411', '3897D61A01C0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1052', '花溪党校', null, null, 'hx12412', '3897D61A0280', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1053', '花溪党校', null, null, 'hx12413', '3897D6199900', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1054', '花溪党校', null, null, 'hx12414', '3897D618FDE0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1055', '花溪党校', null, null, 'hx12416', '3897D61A0700', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1056', '花溪党校', null, null, 'hx12417', '3897D619FFE0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1057', '花溪党校', null, null, 'hx12418', '3897D61901E0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1058', '花溪党校', null, null, 'hx12419', '3897D619F3A0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1059', '花溪党校', null, null, 'hx12420', '3897D6196720', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1060', '花溪党校', null, null, 'hx12421', '3897D61A0320', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1061', '花溪党校', null, null, 'hx12422', '3897D619FB80', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1062', '花溪党校', null, null, 'hx12423', '3897D61985C0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1063', '花溪党校', null, null, 'hx12424', '3897D61A0240', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1064', '花溪党校', null, null, 'hx12425', '3897D61A00E0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1065', '花溪党校', null, null, 'hx12426', '3897D61A06E0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1066', '花溪党校', null, null, 'hx12427', '3897D619FEC0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1067', '花溪党校', null, null, 'hx12428', '3897D6DE4760', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1068', '花溪党校', null, null, 'hx12429', '3897D6DE4980', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1069', '花溪党校', null, null, 'hx12430', '3897D6DE4BC0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1070', '花溪党校', null, null, 'hx12431', '3897D6DE44E0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1071', '花溪党校', null, null, 'hx12432', '3897D6DE4DC0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1072', '花溪党校', null, null, 'hx12434', '3897D6DE4C40', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1073', '花溪党校', null, null, 'hx12435', '3897D6DE4540', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1074', '花溪党校', null, null, 'hx12436', '3897D6DE4880', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1075', '花溪党校', null, null, 'hx12437', '3897D6D26E20', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1076', '花溪党校', null, null, 'hx12438', '3897D6DE46E0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1077', '花溪党校', null, null, 'hx12439', '3897D6DE5060', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1078', '花溪党校', null, null, 'hx12440', '3897D6DE4D60', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1079', '花溪党校', null, null, 'hx12441', '3897D6DE4BA0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1080', '花溪党校', null, null, 'hx12447', '3897D6DE5340', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1081', '花溪党校', null, null, 'hx12448', '3897D6DE5560', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1082', '花溪党校', null, null, 'hx12449', '3897D6DE4AE0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1083', '花溪党校', null, null, 'hx12450', '3897D6DE5C40', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1084', '花溪党校', null, null, 'hx12451', '3897D6DE46A0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1085', '花溪党校', null, null, 'hx12452', '3897D6DE4900', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1086', '花溪党校', null, null, 'hx12453', '3897D6DE44C0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1087', '花溪党校', null, null, 'hx12454', '3897D6DE4480', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1088', '花溪党校', null, null, 'hx12455', '3897D6DEB960', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1089', '花溪党校', null, null, 'hx12456', '3897D6DE45C0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1090', '花溪党校', null, null, 'hx12457', '3897D6DE45E0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1091', '花溪党校', null, null, 'hx12459', '3897D6D287C0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1092', '花溪党校', null, null, 'hx12460', '3897D6DEA440', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1093', '花溪党校', null, null, 'hx12461', '3897D6D2C980', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1094', '花溪党校', null, null, 'hx12462', '3897D6DEC1A0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1095', '花溪党校', null, null, 'hx12464', '3897D6D2DA60', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1096', '花溪党校', null, null, 'hx12465', '3897D6D24780', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1097', '花溪党校', null, null, 'hx12466', '3897D6DE9BA0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1098', '花溪党校', null, null, 'hx12468', '3897D6DE4CE0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1099', '花溪党校', null, null, 'hx12469', '3897D6DE47A0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1100', '花溪党校', null, null, 'hx12470', '3897D6D227A0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1101', '花溪党校', null, null, 'hx12471', '3897D6DE45A0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1102', '花溪党校', null, null, 'hx12472', '3897D6DE4B60', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1103', '花溪党校', null, null, 'hx12473', '3897D6DE5A40', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1104', '花溪党校', null, null, 'hx12475', '3897D6DE4920', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1105', '花溪党校', null, null, 'hx12476', '3897D6D26360', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1106', '花溪党校', null, null, 'hx12477', '3891D59F7200', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1107', '花溪党校', null, null, 'hx12478', '3897D6DE4E40', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1108', '花溪党校', null, null, 'hx12480', '3897D6DE4780', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1109', '花溪党校', null, null, 'hx12481', '3897D6DE4AA0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1110', '花溪党校', null, null, 'hx12482', '3897D6DE50A0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1111', '花溪党校', null, null, 'hx12483', '3897D6DE4560', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1112', '花溪党校', null, null, 'hx12484', '3897D6DE56C0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1113', '花溪党校', null, null, 'hx12485', '3897D6DE4DE0', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1114', '花溪党校', null, null, 'hx12486', '3897D6DE4E00', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1115', '花溪党校', null, null, 'hx12487', '3897D6DE4C00', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1116', '花溪党校', null, null, 'hx12489', '3897D6DE5080', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1117', '花溪党校', null, null, 'hx12490', '3897D6DE4520', '1', '106.677278 ', '26.384492 ', null, '156', '0');
INSERT INTO `fy_ap` VALUES ('1120', '贵阳市政府政务大厅', null, null, 'zhengwudating4', '60da83389400', '1', '106.631928 ', '26.646230 ', null, '1', '0');
INSERT INTO `fy_ap` VALUES ('1121', '贵阳市政府政务大厅', null, null, 'zhengwudating3', '60da8338ce80', '1', '106.632288 ', '26.646043 ', null, '1', '0');
INSERT INTO `fy_ap` VALUES ('1122', '贵阳市政府政务大厅', null, null, 'zhengwudating1', '60da83389970', '1', '106.631950 ', '26.646014 ', null, '1', '0');
INSERT INTO `fy_ap` VALUES ('1123', '贵阳市政府政务大厅', null, null, 'zhengwudating2', '60da8338c3a0', '1', '106.632111 ', '26.646072 ', null, '1', '0');
INSERT INTO `fy_ap` VALUES ('1613', '泉湖禅谷秘境', null, null, 'BY70001', '58696CBE4E45', '1', '106.622107 ', '26.670626 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1614', '泉湖禅谷秘境', null, null, 'BY70002', '58696CBE49E0', '1', '106.622837 ', '26.670977 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1615', '泉湖禅谷秘境', null, null, 'BY70003', '58696CBB3076', '1', '106.622905 ', '26.671416 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1616', '泉湖禅谷秘境', null, null, 'BY70004', '58696CBB3139', '1', '106.622070 ', '26.671267 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1617', '泉湖禅谷秘境', null, null, 'BY70005', '58696CBE48B9', '1', '106.622524 ', '26.671928 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1618', '泉湖禅谷秘境', null, null, 'BY70006', '58696CBE49AE', '1', '106.621880 ', '26.671857 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1619', '泉湖禅谷秘境', null, null, 'BY70007', '58696CBE49A9', '1', '106.621722 ', '26.672113 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1620', '泉湖禅谷秘境', null, null, 'BY70008', '58696CBE47EC', '1', '106.621827 ', '26.672416 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1621', '泉湖禅谷秘境', null, null, 'BY70009', '58696CBE49D6', '1', '106.621437 ', '26.672434 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1622', '泉湖夜郎西畔', null, null, 'BY70011', '58696CBB312A', '1', '106.620715 ', '26.673179 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1623', '泉湖夜郎西畔', null, null, 'BY70012', '58696CBE4DFA', '1', '106.620765 ', '26.673786 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1624', '泉湖夜郎西畔', null, null, 'BY70013', '58696CBB2D06', '1', '106.620017 ', '26.673845 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1625', '泉湖夜郎西畔', null, null, 'BY70014', '58696CBB3157', '1', '106.619430 ', '26.673892 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1626', '泉湖温澜对雪', null, null, 'BY70015', '58696CBE4E09', '1', '106.620527 ', '26.672822 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1627', '泉湖温澜对雪', null, null, 'BY70016', '58696CBE4878', '1', '106.619643 ', '26.672585 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1628', '泉湖温澜对雪', null, null, 'BY70017', '58696CBB2D15', '1', '106.618714 ', '26.672559 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1629', '泉湖温澜对雪', null, null, 'BY70018', '58696CBB2EEB', '1', '106.618358 ', '26.672511 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1630', '泉湖百戏云阶', null, null, 'BY70019', '58696CBB3107', '1', '106.617712 ', '26.672294 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1631', '泉湖百戏云阶', null, null, 'BY70020', '58696C59886E', '1', '106.616710 ', '26.671971 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1632', '泉湖水玉长桥', null, null, 'BY70021', '58696CBE49DB', '1', '106.615605 ', '26.671661 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1633', '泉湖百戏云阶', null, null, 'BY70022', '58696CBB2CF2', '1', '106.616711 ', '26.671610 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1634', '泉湖百戏云阶', null, null, 'BY70023', '58696CBE4909', '1', '106.617948 ', '26.672180 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1635', '泉湖百戏云阶', null, null, 'BY70024', '58696CBE4A80', '1', '106.618187 ', '26.671906 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1636', '泉湖百戏云阶', null, null, 'BY70025', '58696CBE49E5', '1', '106.618445 ', '26.671500 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1637', '泉湖百戏云阶', null, null, 'BY70026', '58696CBB2E5A', '1', '106.617909 ', '26.671632 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1638', '泉湖百戏云阶', null, null, 'BY70027', '58696CBE4E31', '1', '106.617353 ', '26.671066 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1639', '泉湖百戏云阶', null, null, 'BY70028', '58696CBE4DC3', '1', '106.616138 ', '26.670583 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1640', '泉湖云楼禅影', null, null, 'BY70029', '58696CBE498B', '1', '106.616956 ', '26.670475 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1641', '泉湖云楼禅影', null, null, 'BY70030', '58696CBE4E4A', '1', '106.617456 ', '26.670477 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1642', '泉湖云楼禅影', null, null, 'BY70031', '58696CBE476A', '1', '106.617902 ', '26.670457 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1643', '泉湖云楼禅影', null, null, 'BY70032', '58696CBB2F2C', '1', '106.618268 ', '26.670511 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1644', '泉湖云楼禅影', null, null, 'BY70033', '58696CBB3062', '1', '106.616526 ', '26.670174 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1645', '泉湖云楼禅影', null, null, 'BY70034', '58696CBE4DA5', '1', '106.616366 ', '26.669606 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1646', '泉湖云楼禅影', null, null, 'BY70035', '58696CBE4A2B', '1', '106.616784 ', '26.669685 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1647', '泉湖云楼禅影', null, null, 'BY70036', '58696CBB30DA', '1', '106.617369 ', '26.669690 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1648', '泉湖云楼禅影', null, null, 'BY70037', '58696C598D26', '1', '106.618037 ', '26.670053 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1649', '泉湖云楼禅影', null, null, 'BY70038', '58696CBE4E59', '1', '106.618013 ', '26.669290 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1650', '泉湖块数据中心', null, null, 'BY70039', '58696CBB2AB3', '1', '106.620278 ', '26.669235 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1651', '泉湖块数据中心', null, null, 'BY70040', '58696CBE49F4', '1', '106.619522 ', '26.669720 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1652', '泉湖块数据中心', null, null, 'BY70041', '58696CBE4A44', '1', '106.618987 ', '26.670184 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1653', '泉湖块数据中心', null, null, 'BY70042', '58696CBE47B0', '1', '106.619165 ', '26.670672 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1654', '泉湖空山止水', null, null, 'BY70043', '58696C598E22', '1', '106.618951 ', '26.670988 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1655', '泉湖空山止水', null, null, 'BY70044', '58696CBE4E1D', '1', '106.618997 ', '26.671300 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1656', '泉湖空山止水', null, null, 'BY70045', '58696CBE4A17', '1', '106.619678 ', '26.670906 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1657', '泉湖空山止水', null, null, 'BY70046', '58696CACB87A', '1', '106.619237 ', '26.671262 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1658', '泉湖空山止水', null, null, 'BY70047', '58696CBE4E72', '1', '106.619809 ', '26.671365 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1659', '泉湖空山止水', null, null, 'BY70048', '58696CBB3134', '1', '106.619500 ', '26.671666 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1660', '泉湖空山止水', null, null, 'BY70049', '58696CBE4A03', '1', '106.619806 ', '26.671874 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1661', '泉湖空山止水', null, null, 'BY70050', '58696CBE4E77', '1', '106.620107 ', '26.671828 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1662', '泉湖空山止水', null, null, 'BY70051', '58696CBE4954', '1', '106.620624 ', '26.671619 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1663', '泉湖空山止水', null, null, 'BY70052', '58696CBE4E22', '1', '106.620462 ', '26.672249 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1664', '泉湖空山止水', null, null, 'BY70053', '58696C59940A', '1', '106.620294 ', '26.672451 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1665', '泉湖普陀夕照', null, null, 'BY70054', '58696CBE4931', '1', '106.621400 ', '26.671645 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1666', '泉湖普陀夕照', null, null, 'BY70055', '58696CBE48DC', '1', '106.621547 ', '26.671325 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1667', '泉湖普陀夕照', null, null, 'BY70056', '58696CBB30BC', '1', '106.620830 ', '26.670630 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1668', '泉湖普陀夕照', null, null, 'BY70057', '58696CBB30D5', '1', '106.621300 ', '26.670826 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1669', '泉湖普陀夕照', null, null, 'BY70058', '58696C591A81', '1', '106.620953 ', '26.670136 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1670', '泉湖普陀夕照', null, null, 'BY70059', '58696CBE4936', '1', '106.621456 ', '26.670241 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1671', '泉湖普陀夕照', null, null, 'BY70060', '58696CBE4E36', '1', '106.621627 ', '26.669562 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1672', '泉湖普陀夕照', null, null, 'BY70061', '58696CBB309E', '1', '106.621107 ', '26.669487 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('1673', '泉湖禅谷秘境', null, null, 'BY70010', '58696CBE4A49', '1', '106.621058 ', '26.672749 ', null, '138', '0');
INSERT INTO `fy_ap` VALUES ('2090', '科技大厦左墙上AP', null, null, 'gxq00001', '3891D5B40220', '1', '106.647364 ', '26.613525 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2091', '长岭南路与铜仁路交叉口东AP', null, null, 'gxq00002', '3891D5B3FBC0', '1', '106.651642 ', '26.614013 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2092', '科技大厦中AP', null, null, 'gxq00003', '3891D5B3EE60', '1', '106.652554 ', '26.616549 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2093', '科技大厦右AP', null, null, 'gxq00004', '3891D5B400C0', '1', '106.652435 ', '26.615487 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2094', '大数据广场中心左AP', null, null, 'gxq00005', '3891D5B6C7A0', '1', '106.649958 ', '26.613505 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2095', '大数据广场中心右AP', null, null, 'gxq00006', '3897D69870E0', '1', '106.647116 ', '26.614549 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2096', '人才城左AP', null, null, 'gxq00007', '3891D5B6DFC0', '1', '106.655524 ', '26.616865 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2097', '人才城右AP', null, null, 'gxq00008', '3891D5B6DA00', '1', '106.654679 ', '26.613983 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2098', '湖滨路与都匀路交叉口东AP', null, null, 'gxq00009', '3891D5B3EC20', '1', '106.654163 ', '26.613615 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2099', '标准厂房AP', null, null, 'gxq00010', '3891D5B40540', '1', '106.654737 ', '26.613269 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2100', '铜仁路与湖滨路交叉口AP', null, null, 'gxq00011', '3891D5B3D940', '1', '106.655288 ', '26.612022 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2101', '都匀路与下坝山路交叉口AP', null, null, 'gxq00012', '3891D5B3D8A0', '1', '106.652536 ', '26.611468 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2102', '下坝山路与铜仁路交叉口北AP', null, null, 'gxq00013', '3891D5B3D920', '1', '106.649622 ', '26.611475 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2103', '下坝山路与铜仁路交叉口西AP', null, null, 'gxq00014', '3891D5B3ED80', '1', '106.652016 ', '26.611030 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2104', '下坝山路与铜仁路交叉口南AP', null, null, 'gxq00015', '3891D5B3D8E0', '1', '106.658480 ', '26.612378 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2105', '黔灵山路与下坝山路交叉口AP', null, null, 'gxq00016', '3891D5B40860', '1', '106.646988 ', '26.611965 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2106', '黔灵山路与白云大道交叉口AP', null, null, 'gxq00017', '3891D5B40960', '1', '106.647294 ', '26.611296 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2107', '长岭南路与黔灵山路交叉口东北角AP', null, null, 'gxq00018', '3891D5B3D960', '1', '106.641985 ', '26.614046 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2108', '长岭南路与黔灵山路交叉口东南角AP', null, null, 'gxq00019', '3891D5B3E9C0', '1', '106.642096 ', '26.613887 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2109', '黔灵山路与兴义路交叉口东AP', null, null, 'gxq00020', '3891D5B407A0', '1', '106.645066 ', '26.611968 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2110', '黔灵山路与兴义路交叉口西AP', null, null, 'gxq00021', '3891D5B40780', '1', '106.643206 ', '26.612485 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2111', '黔灵山路财富中心AP', null, null, 'gxq00022', '_', '1', '106.646233 ', '26.611365 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2112', '长岭南路与铜仁路交叉口西AP', null, null, 'gxq00023', '3891D5B3F6C0', '1', '106.643388 ', '26.615414 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2113', '高峰石油机械AP', null, null, 'gxq00024', '3891D5B3D900', '1', '106.646234 ', '26.615249 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2114', '远大美城AP', null, null, 'gxq00025', '3891D5B3F9E0', '1', '106.645864 ', '26.613768 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2115', '长岭南路AP', null, null, 'gxq00026', '3891D5B407E0', '1', '106.646960 ', '26.623193 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2116', '长岭南路与阳关大道交叉口西北角AP', null, null, 'gxq00027', '3891D5B3C400', '1', '106.646671 ', '26.623432 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2117', '消防队AP', null, null, 'gxq00028', '3891D5B40660', '1', '106.646082 ', '26.623256 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2118', '湖滨路能源交易所AP', null, null, 'gxq00029', '3891D5B3F560', '1', '106.646126 ', '26.624459 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2119', '百挑路联合广场AP', null, null, 'gxq00030', '3891D5B3F3A0', '1', '106.646099 ', '26.626395 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2120', '毕节路AP', null, null, 'gxq00031', '3891D5B401C0', '1', '106.646094 ', '26.629333 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2121', '长岭南路与都匀路交叉口AP', null, null, 'gxq00032', '3891D5B3F9C0', '1', '106.648096 ', '26.623314 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2122', '湖滨路与都匀路交叉口北AP', null, null, 'gxq00034', '3891D5B406C0', '1', '106.649912 ', '26.625791 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2123', '金利大厦（贵州天控侧门）', null, null, 'gxq00035', '3891D5B40640', '1', '106.651952 ', '26.622483 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2124', '兴义路与毕节路交叉口AP', null, null, 'gxq00036', '3891D5B40710', '1', '106.650670 ', '26.620676 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2125', '长岭南路与毕节路交叉口AP', null, null, 'gxq00037', '3891D5B3FA00', '1', '106.649639 ', '26.619905 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2126', '中关村AP', null, null, 'gxq00038', '3891D5B3DA20', '1', '106.646903 ', '26.622714 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2127', '电建集团AP', null, null, 'gxq00040', '3891D5B3F5C0', '1', '106.648076 ', '26.621550 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2128', '人才城AP', null, null, 'gxq00041', '3891D5B3CC80', '1', '106.647096 ', '26.620779 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2129', '兴黔路AP', null, null, 'gxq00042', '3891D5B3FA60', '1', '106.646839 ', '26.618275 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2130', '长岭南路与上坝山路交叉口AP', null, null, 'gxq00044', '3891D5B3F4E0', '1', '106.649018 ', '26.616952 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2131', '阳关小区西门AP', null, null, 'gxq00045', '3891D5B40560', '1', '106.650935 ', '26.616987 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2132', '长岭南路与阳关大道交叉口东北角下AP', null, null, 'gxq00046', '3891D5B3E980', '1', '106.652691 ', '26.617368 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2133', '长岭南路与阳关大道交叉口东北角上AP ', null, null, 'gxq00047', '3891D5B406A0', '1', '106.652411 ', '26.618816 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2134', '八音路AP', null, null, 'gxq00048', '3891D5B40700', '1', '106.651942 ', '26.619842 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2135', '长岭南路与阳光大道交叉口东南角上AP', null, null, 'gxq00049', '3891D5B3E940', '1', '106.658290 ', '26.617305 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2136', '长岭南路与阳光大道交叉口东南角下AP', null, null, 'gxq00050', '3891D5B403C0', '1', '106.645073 ', '26.622741 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2137', '黔灵山路与湖滨路交叉口AP', null, null, 'gxq00051', '3891D5B401A0', '1', '106.651789 ', '26.611821 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2138', '湖滨路与都匀路交叉口东AP', null, null, 'gxq00052', '3891D5B3E5A0', '1', '106.654163 ', '26.613615 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2139', '下坝山路与铜仁路交叉口南AP', null, null, 'gxq00053', '3891D5B3F420', '1', '106.658480 ', '26.612378 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2140', '铜仁路与湖滨路交叉口AP', null, null, 'gxq00054', '3891D5B3E920', '1', '106.655288 ', '26.612022 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2141', '远大美城AP', null, null, 'gxq00056', '3891D5B3EC60', '1', '106.645864 ', '26.613768 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2142', '金利大厦（贵州天控侧门）', null, null, 'gxq00057', '3891D5B3E960', '1', '106.651952 ', '26.622483 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2143', '兴黔路AP', null, null, 'gxq00058', '3891D5B3EDA0', '1', '106.646839 ', '26.618275 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2144', '八音路AP', null, null, 'gxq00060', '3891D5B408C0', '1', '106.651942 ', '26.619842 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2145', '阳关小区南门AP1', null, null, 'gxq00061', '3897D6A1D200', '1', '106.652237 ', '26.619572 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2146', '阳关小区南门AP2', null, null, 'gxq00062', '3897D6A15140', '1', '106.652237 ', '26.619572 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2147', '黔灵山路与白云大道交叉口AP', null, null, 'gxq00070', '_', '1', '106.647294 ', '26.611296 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2148', '黔灵山路与湖滨路交叉口AP', null, null, 'gxq00071', '3891D5B3D820', '1', '106.651789 ', '26.611821 ', null, '145', '0');
INSERT INTO `fy_ap` VALUES ('2150', '3号馆右1', '8130', '华为', 'GSH10001', '58605F75D740-5F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2151', '3号馆右2', '8130', '华为', 'GSH10002', '58605F75D860-7F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2152', '3号馆右3', '8130', '华为', 'GSH10003', '58605F75DC80-9F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2153', '3号馆右4', '8130', '华为', 'GSH10004', '58605F75DC60-7F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2154', '3号馆右5', '8130', '华为', 'GSH10005', '58605F75DE40-5F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2155', '3号馆右6', '8130', '华为', 'GSH10006', '58605F75D7A0-BF(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2156', '3号馆室外左1', '8030', '华为', 'GSH10007', 'D0D04BAA9340-5F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2157', '3号馆室外左2', '8030', '华为', 'GSH10008', 'D0D04B64A060-7F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2158', '登录大厅右1', '8130', '华为', 'GSH10009', '58605F75DDA0-BF(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2159', '登录大厅右2', '8130', '华为', 'GSH10010', '58605F75D5E0-FF(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2160', '登录大厅右3', '8130', '华为', 'GSH10011', '58605F75D760-7F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2161', '登录大厅右4', '8130', '华为', 'GSH10012', '58605F75DC40-5F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2162', '登录大厅右5', '8130', '华为', 'GSH10013', '58605F75DCA0-BF(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2163', '登录大厅右6', '8130', '华为', 'GSH10014', '58605F75D460-7F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2164', '登录大厅右7', '8130', '华为', 'GSH10015', '90032516BE00-1F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2165', '登录大厅右8', '8130', '华为', 'GSH10016', '58605F75DE20-3F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2166', '登录大厅右9', '8130', '华为', 'GSH10017', '58605F75D5C0-DF(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2167', '登录大厅右10', '8130', '华为', 'GSH10018', '58605F75DF40-5F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2168', '登录大厅右11', '8130', '华为', 'GSH10019', '58605F75D6E0-FF(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2169', '登录大厅右12', '8130', '华为', 'GSH10020', '58605F75DAA0-BF(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2170', '1号馆左1', '8130', '华为', 'GSH10021', '58605F75D8C0-DF(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2171', '1号馆左2', '8130', '华为', 'GSH10022', '58605F75D640-5F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2172', '1号馆左3', '8130', '华为', 'GSH10023', '58605F75D680-9F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2173', '1号馆左4', '8130', '华为', 'GSH10024', '58605F75DDC0-DF(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2174', '1号馆左5', '8130', '华为', 'GSH10025', '58605F75DBA0-BF(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2175', '1号馆左6', '8130', '华为', 'GSH10026', '58605F75DE80-9F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2176', '1号馆左7', '8130', '华为', 'GSH10027', '58605F75D880-9F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2177', '1号馆左8', '8130', '华为', 'GSH10028', '58605F75DBC0-DF(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2178', '1号馆左9', '8130', '华为', 'GSH10029', '58605F75D560-7F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2179', '1号馆左10', '8130', '华为', 'GSH10030', '58605F75D480-9F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2180', '1号馆左11', '8130', '华为', 'GSH10031', '58605F75DB80-9F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2181', '1号馆左12', '8130', '华为', 'GSH10032', '58605F75D940-5F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2182', '1号馆室外左1', '8030', '华为', 'GSH10033', 'D0D04B4184A0-BF(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2183', '1号馆室外左2', '8030', '华为', 'GSH10034', 'D0D04B4B8C20-3F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2184', '1号馆室外左3', '8030', '华为', 'GSH10035', 'D0D04B64AAE0-FF(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2185', '1号馆左13', '8130', '华为', 'GSH10036', '58605F75DFA0-BF(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2186', '1号馆左14', '8130', '华为', 'GSH10037', '58605F75DD40-5F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2187', '1号馆左15', '8130', '华为', 'GSH10038', '58605F75DB40-5F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2188', '1号馆左16', '8130', '华为', 'GSH10039', '58605F75D660-7F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2189', '1号馆左17', '8130', '华为', 'GSH10040', '58605F75D620-3F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2190', '1号馆左18', '8130', '华为', 'GSH10041', '58605F75DDE0-FF(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2191', '1号馆左19', '8130', '华为', 'GSH10042', '58605F75DD00-1F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2192', '1号馆左20', '8130', '华为', 'GSH10043', '58605F75DF80-9F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2193', '1号馆左21', '8130', '华为', 'GSH10044', '58605F75DAC0-DF(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2194', '1号馆左22', '8130', '华为', 'GSH10045', '58605F75D900-1F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2195', '1号馆左23', '8130', '华为', 'GSH10046', '58605F75DA00-1F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2196', '1号馆左24', '8130', '华为', 'GSH10047', '58605F75DEA0-BF(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2197', '2号馆左1', '8130', '华为', 'GSH10048', '58605F75DD60-7F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2198', '2号馆左2', '8130', '华为', 'GSH10049', '58605F75DE00-1F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2199', '2号馆左3', '8130', '华为', 'GSH10050', '58605F75D6A0-BF(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2200', '2号馆左4', '8130', '华为', 'GSH10051', '58605F75D720-3F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2201', '2号馆左5', '8130', '华为', 'GSH10052', '58605F75D980-9F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2202', '2号馆左6', '8130', '华为', 'GSH10053', '58605F75D7E0-FF(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2203', '2号馆左7', '8130', '华为', 'GSH10054', '58605F75D4E0-FF(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2204', '2号馆左8', '8130', '华为', 'GSH10055', '58605F75D700-1F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2205', '2号馆左9', '8130', '华为', 'GSH10056', '58605F75D600-1F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2206', '2号馆左10', '8130', '华为', 'GSH10057', '58605F75D9E0-FF(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2207', '2号馆左11', '8130', '华为', 'GSH10058', '58605F75D820-3F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2208', '2号馆左12', '8130', '华为', 'GSH10059', '58605F75D520-3F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2209', '2号馆左13', '8130', '华为', 'GSH10060', '58605F75D540-5F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2210', '2号馆左14', '8130', '华为', 'GSH10061', '58605F75D8E0-FF(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2211', '2号馆室外左1', '8030', '华为', 'GSH10062', 'D0D04B4B8C80-9F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2212', '2号馆室外左2', '8030', '华为', 'GSH10063', 'D0D04B649FC0-DF(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2213', '2号馆左15', '8130', '华为', 'GSH10064', '58605F75D500-1F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2214', '2号馆左16', '8130', '华为', 'GSH10065', '58605F75DBE0-FF(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2215', '2号馆左17', '8130', '华为', 'GSH10066', '58605F75D440-5F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2216', '2号馆左18', '8130', '华为', 'GSH10067', '58605F75D9A0-BF(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2217', '2号馆左19', '8130', '华为', 'GSH10068', '58605F75D580-9F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2218', '2号馆左20', '8130', '华为', 'GSH10069', '58605F75DA80-9F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2219', '2号馆左21', '8130', '华为', 'GSH10070', '58605F75DE60-7F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2220', '2号馆左22', '8130', '华为', 'GSH10071', '58605F75DF60-7F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2221', '2号馆左23', '8130', '华为', 'GSH10072', '58605F75D8A0-BF(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2222', '2号馆左24', '8130', '华为', 'GSH10073', '58605F75DD80-9F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2223', '2号馆左25', '8130', '华为', 'GSH10074', '58605F75D3A0-BF(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2224', '2号馆左26', '8130', '华为', 'GSH10075', '58605F75DCE0-FF(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2225', '2号馆左27', '8130', '华为', 'GSH10076', '58605F75DEE0-FF(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2226', '2号馆左28', '8130', '华为', 'GSH10077', '58605F75D400-1F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2227', '4号馆左1', '8130', '华为', 'GSH10078', '58605F75D380-9F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2228', '4号馆左2', '8130', '华为', 'GSH10079', '58605F75D4A0-BF(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2229', '4号馆左3', '8130', '华为', 'GSH10080', '58605F75DAE0-FF(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2230', '4号馆左4', '8130', '华为', 'GSH10081', '58605F75DB20-3F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2231', '4号馆左5', '8130', '华为', 'GSH10082', '58605F75DB60-7F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2232', '4号馆左6', '8130', '华为', 'GSH10083', '58605F75D960-7F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2233', '4号馆室外左1', '8030', '华为', 'GSH10084', 'D0D04B4B8EE0-FF(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2234', '4号馆室外左2', '8030', '华为', 'GSH10085', 'D0D04BAA9320-3F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2235', '5号馆左1', '8130', '华为', 'GSH10086', '58605F75D5A0-BF(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2236', '5号馆左2', '8130', '华为', 'GSH10087', '58605F75DD20-3F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2237', '5号馆左3', '8130', '华为', 'GSH10088', '58605F75D3E0-FF(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2238', '5号馆左4', '8130', '华为', 'GSH10089', '58605F75D800-1F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2239', '5号馆左5', '8130', '华为', 'GSH10090', '58605F75DCC0-DF(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2240', '5号馆左6', '8130', '华为', 'GSH10091', '58605F75D9C0-DF(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2241', '6号馆左1', '8130', '华为', 'GSH10092', '58605F75D780-9F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2242', '6号馆左2', '8130', '华为', 'GSH10093', '58605F75DA40-5F(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2243', '6号馆左3', '8130', '华为', 'GSH10094', '58605F75D4C0-DF(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2244', '6号馆左4', '8130', '华为', 'GSH10095', '58605F75D3C0-DF(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2245', '6号馆左5', '8130', '华为', 'GSH10096', '58605F75D6C0-DF(32)', '1', '**************', '**************', null, '159', '0');
INSERT INTO `fy_ap` VALUES ('2246', '6号馆左6', '8130', '华为', 'GSH10097', '58605F75DEC0-DF(32)', '1', '**************', '**************', null, '159', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8 COMMENT='区域表';

-- ----------------------------
-- Records of fy_area
-- ----------------------------
INSERT INTO `fy_area` VALUES ('1', '贵阳市', '0', '0');
INSERT INTO `fy_area` VALUES ('138', '白云区', '1', '0');
INSERT INTO `fy_area` VALUES ('145', '高新区', '1', '0');
INSERT INTO `fy_area` VALUES ('146', '观山湖', '1', '0');
INSERT INTO `fy_area` VALUES ('149', '花溪区', '1', '0');
INSERT INTO `fy_area` VALUES ('150', '南明区', '1', '0');
INSERT INTO `fy_area` VALUES ('152', '乌当区', '1', '0');
INSERT INTO `fy_area` VALUES ('153', '小河区', '1', '0');
INSERT INTO `fy_area` VALUES ('154', '云岩区', '1', '0');
INSERT INTO `fy_area` VALUES ('156', '花溪党校', '149', '0');
INSERT INTO `fy_area` VALUES ('157', '中华路', '150', '0');
INSERT INTO `fy_area` VALUES ('158', '泉胡公园', '138', '0');
INSERT INTO `fy_area` VALUES ('159', '会展城', '146', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8 COMMENT='AD投放区域表';

-- ----------------------------
-- Records of fy_area_ad
-- ----------------------------
INSERT INTO `fy_area_ad` VALUES ('212', '25', '146', '0');
INSERT INTO `fy_area_ad` VALUES ('213', '25', '159', '0');
INSERT INTO `fy_area_ad` VALUES ('227', '24', '138', '0');
INSERT INTO `fy_area_ad` VALUES ('228', '24', '158', '0');
INSERT INTO `fy_area_ad` VALUES ('229', '24', '154', '0');
INSERT INTO `fy_area_ad` VALUES ('230', '26', '146', '0');
INSERT INTO `fy_area_ad` VALUES ('231', '26', '159', '0');
INSERT INTO `fy_area_ad` VALUES ('232', '27', '146', '0');
INSERT INTO `fy_area_ad` VALUES ('233', '27', '159', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='广告商表';

-- ----------------------------
-- Records of fy_business
-- ----------------------------
INSERT INTO `fy_business` VALUES ('1', '专门卖黄金的！00', '老庙黄金', '2017-11-23 16:07:40', '0');
INSERT INTO `fy_business` VALUES ('6', '000', '0000', '2017-12-01 09:43:00', '1');
INSERT INTO `fy_business` VALUES ('7', '电饭锅', '的风格大方', '2017-12-01 09:51:27', '1');
INSERT INTO `fy_business` VALUES ('8', '测试', '测试', '2017-12-01 09:51:34', '1');
INSERT INTO `fy_business` VALUES ('9', '', '招商广告', '2017-12-01 10:33:40', '0');

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
INSERT INTO `fy_user` VALUES ('2', 'guoliang', '123456', null, null, '2017-12-01 10:16:11', '1');
INSERT INTO `fy_user` VALUES ('3', '大波', 'e10adc3949ba59abbe56e057f20f883e', null, null, '2017-11-23 17:36:40', '1');
INSERT INTO `fy_user` VALUES ('4', 'dabo', '44fdb916a558ef6739cfa6378de4995a', null, null, '2017-12-01 10:16:07', '1');
INSERT INTO `fy_user` VALUES ('5', 'gg', 'e10adc3949ba59abbe56e057f20f883e', null, null, '2017-12-01 10:16:04', '1');
INSERT INTO `fy_user` VALUES ('6', 'guest', '084e0343a0486ff05530df6c705c8bb4', null, null, '2017-11-24 09:59:15', '0');
