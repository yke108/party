/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50553
Source Host           : 127.0.0.1:3306
Source Database       : huiyi-party

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-02-06 10:19:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for hy_admin
-- ----------------------------
DROP TABLE IF EXISTS `hy_admin`;
CREATE TABLE `hy_admin` (
  `admin_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `admin_name` varchar(60) NOT NULL DEFAULT '' COMMENT '管理员名称',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '超管帐号',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `password` char(40) NOT NULL DEFAULT '' COMMENT '登录密码',
  `error_count` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '密码连续错误次数',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '管理员头像',
  `salt` smallint(10) unsigned DEFAULT '0' COMMENT '密码盐值',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `role_ids` varchar(255) DEFAULT NULL COMMENT '角色ID, 多个用逗号分隔',
  `region_code` bigint(255) NOT NULL DEFAULT '0' COMMENT '所在地区',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `is_admin` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否超级管理员',
  `delete_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `branch_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '组织编号',
  `last_login` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_ip` varchar(15) NOT NULL COMMENT '最后登录IP',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `remark` varchar(100) NOT NULL COMMENT '备注',
  PRIMARY KEY (`admin_id`),
  KEY `user_name` (`admin_name`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='党部管理人员';

-- ----------------------------
-- Records of hy_admin
-- ----------------------------
INSERT INTO `hy_admin` VALUES ('8', '管理员1', '13800138000', '13800138000', '2f4c57e1ff4a002af72ea180fe06747f', '0', 'avatar/201510/561ca35779ac0.png', '7314', '1513048172', '0', '440000', '1', '1', '0', '0', '1516008541', '115.29.189.124', '0', '');
INSERT INTO `hy_admin` VALUES ('9', '管理员2', '13800138001', '13800138001', '9bc4f4e7daae383bd675d79d6348ad38', '0', 'avatar/201510/561ca35779ac0.png', '1201', '1513048172', '0', '130303', '1', '1', '0', '1', '1514527858', '115.29.189.124', '0', '');
INSERT INTO `hy_admin` VALUES ('10', '管理员3', '13800138002', '13800138002', '394fd95318bb5fc09e74074df34a5615', '0', 'avatar/201510/561ca35779ac0.png', '9945', '1513048172', '0', '130303', '1', '1', '0', '1', '1513583350', '115.29.189.124', '0', '');
INSERT INTO `hy_admin` VALUES ('11', '超级管理员', '17688868899', '17688868899', '683023a7d3f3dbf56b6136cb04897997', '0', '', '2346', '1513048172', '0', '110101', '1', '1', '0', '2', '1514502640', '115.29.189.124', '0', '');
INSERT INTO `hy_admin` VALUES ('12', 'admin_test', '13719148993', '13719148993', '123123', '0', '', '4796', '1513317398', '1,2', '130303', '1', '0', '0', '1', '0', '', '0', '');
INSERT INTO `hy_admin` VALUES ('13', '谢文俊', '13450413090', '13450413090', '64297450cfd4e16f605583e60e398cb1', '0', '', '9665', '1513560981', '1,2,3', '130303', '1', '0', '0', '1', '1514253029', '115.29.189.124', '1', '');
INSERT INTO `hy_admin` VALUES ('14', '高翠明', '13330192433', '13330192433', '31cc6e07af7f55a1ec32cb35c3fba256', '0', '', '2410', '1513576636', '0', '130303', '1', '1', '0', '1', '1516066610', '115.29.189.124', '0', '');
INSERT INTO `hy_admin` VALUES ('15', 'Marko', '15521099542', '15521099542', '2423ebae2d3a44081e68b6f591fc84af', '0', '', '6283', '1513583111', '0,1,2,3', '130303', '1', '1', '0', '1', '1514946000', '115.29.189.124', '0', '');
INSERT INTO `hy_admin` VALUES ('16', 'a', '11111111111', '11111111111', 'e326a369ffa634380840a07802fd5d7a', '0', '', '8415', '1513820748', '0,1', '130303', '1', '0', '0', '1', '1513824981', '115.29.189.124', '1', '1');
INSERT INTO `hy_admin` VALUES ('17', '123', '11111111113', '11111111111', 'c969d93cde5ccaa32fc7db6164b08332', '0', '', '5654', '1513825015', '2,3,1', '130303', '1', '0', '0', '1', '1515398141', '115.29.189.124', '0', '');
INSERT INTO `hy_admin` VALUES ('18', '11', '13450413091', '13450413091', 'cfcfe1c2b0622ba091827751f5c80dd8', '0', '', '1889', '1514253106', '2,3,1', '130303', '1', '0', '0', '1', '0', '', '0', '');
INSERT INTO `hy_admin` VALUES ('19', 'jjj', '13266666666', '13266666666', '2aa52a9cb78eb41896a4468fcb7279d6', '0', '', '8320', '1514274635', '1,2,3', '440000', '1', '1', '0', '0', '1516015017', '115.29.189.124', '0', '');
INSERT INTO `hy_admin` VALUES ('20', '柯琼远小程序', '13800138111', '13800138111', '1f6ec7a9efc15792d670e89c8fdea14b', '0', '', '3236', '1514355828', null, '130304', '1', '1', '0', '3', '1516758969', '127.0.0.1', '0', '');
INSERT INTO `hy_admin` VALUES ('21', '小高', '13330194400', '13330194400', '4db0b54a7bddaa19847a0d5e2c326260', '0', '', '4563', '1514376624', null, '110101', '1', '1', '0', '4', '1516094114', '115.29.189.124', '0', '');
INSERT INTO `hy_admin` VALUES ('22', '超级管理员', '13800138222', '13800138222', '75576f14fad256fe14f3c0f4341a5cc4', '0', '', '9206', '1514423917', null, '120102', '1', '1', '0', '5', '1514449088', '115.29.189.124', '0', '');
INSERT INTO `hy_admin` VALUES ('23', '黄玉权', 'huangyuquan', '', 'a86614f12c036976c8056d10a836416a', '0', '', '5139', '1514454409', null, '130303', '1', '1', '0', '6', '1516091244', '115.29.189.124', '0', '');
INSERT INTO `hy_admin` VALUES ('25', '梁水明', 'hoh', '', '6bb385cdd7a501a9157cd20cc2c48269', '0', '', '3740', '1514515976', null, '440106', '1', '1', '0', '8', '1514516286', '115.29.189.124', '0', '');
INSERT INTO `hy_admin` VALUES ('26', '黄总', '13266668888', '13266668888', '5d4085fc326acf441b918101cd286fc5', '0', '', '5457', '1515491229', '1,2,3,4', '130303', '1', '0', '0', '6', '1515491356', '115.29.189.124', '0', '');
INSERT INTO `hy_admin` VALUES ('30', '王三', 'wushan001', '13330196688', '8a708fa136a9ad57ab2c186607634dd1', '5', '', '7162', '1515824605', null, '440103', '2', '0', '0', '14', '0', '', '0', 'dddddd');
INSERT INTO `hy_admin` VALUES ('31', '柯琼远系统', '13450223260', '', '66e8a173565cc82f37701545b87a5633', '0', '', '2252', '1515824605', null, '130300', '1', '1', '0', '0', '1516238399', '127.0.0.1', '0', '');
INSERT INTO `hy_admin` VALUES ('32', '柯琼远', '123456789', '13450223260', '9c33d059fb6d7233be4352b580da3b02', '0', '', '7264', '1516160993', null, '130303', '1', '1', '0', '4294967295', '0', '', '0', '');

-- ----------------------------
-- Table structure for hy_admin_action_log
-- ----------------------------
DROP TABLE IF EXISTS `hy_admin_action_log`;
CREATE TABLE `hy_admin_action_log` (
  `log_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作人',
  `admin_name` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人姓名',
  `branch_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '支部ID',
  `app_id` varchar(255) NOT NULL DEFAULT '' COMMENT '小程序的APPID',
  `app_name` varchar(255) NOT NULL DEFAULT '' COMMENT '小程序名称',
  `template_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '发布模版ID',
  `action_type` varchar(50) NOT NULL DEFAULT '' COMMENT '事件类型',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8 COMMENT='操作日志';

-- ----------------------------
-- Records of hy_admin_action_log
-- ----------------------------
INSERT INTO `hy_admin_action_log` VALUES ('1', '20', '超级管理员', '3', 'wxe08d26e8d835064c', '测试支部', '1', 'commit_code', '1514449500');
INSERT INTO `hy_admin_action_log` VALUES ('2', '8', '管理员1', '1', 'wx5295a70f8dbc6bb7', '党宣小支部', '0', 'commit_code', '1514449586');
INSERT INTO `hy_admin_action_log` VALUES ('3', '8', '管理员1', '1', 'wx5295a70f8dbc6bb7', '党宣小支部', '1', 'commit_code', '1514449587');
INSERT INTO `hy_admin_action_log` VALUES ('4', '8', '管理员1', '1', 'wx5295a70f8dbc6bb7', '党宣小支部', '1', 'commit_code', '1514449687');
INSERT INTO `hy_admin_action_log` VALUES ('5', '8', '管理员1', '1', 'wx5295a70f8dbc6bb7', '党宣小支部', '0', 'commit_code', '1514450135');
INSERT INTO `hy_admin_action_log` VALUES ('6', '8', '管理员1', '1', 'wx5295a70f8dbc6bb7', '党宣小支部', '1', 'commit_code', '1514450188');
INSERT INTO `hy_admin_action_log` VALUES ('7', '8', '管理员1', '1', 'wx5295a70f8dbc6bb7', '党宣小支部', '1', 'pause_commit', '1514452799');
INSERT INTO `hy_admin_action_log` VALUES ('8', '8', '管理员1', '1', 'wx5295a70f8dbc6bb7', '党宣小支部', '1', 'commit_code', '1514452839');
INSERT INTO `hy_admin_action_log` VALUES ('9', '8', '管理员1', '1', 'wx5295a70f8dbc6bb7', '党宣小支部', '1', 'pause_commit', '1514452848');
INSERT INTO `hy_admin_action_log` VALUES ('10', '8', '管理员1', '1', 'wx5295a70f8dbc6bb7', '党宣小支部', '1', 'commit_code', '1514452852');
INSERT INTO `hy_admin_action_log` VALUES ('11', '8', '管理员1', '1', 'wx5295a70f8dbc6bb7', '党宣小支部', '1', 'commit_code', '1514452870');
INSERT INTO `hy_admin_action_log` VALUES ('12', '8', '管理员1', '1', 'wx5295a70f8dbc6bb7', '党宣小支部', '1', 'pause_commit', '1514452872');
INSERT INTO `hy_admin_action_log` VALUES ('13', '8', '管理员1', '1', 'wx5295a70f8dbc6bb7', '党宣小支部', '1', 'commit_code', '1514452881');
INSERT INTO `hy_admin_action_log` VALUES ('14', '8', '管理员1', '1', 'wx5295a70f8dbc6bb7', '党宣小支部', '1', 'pause_commit', '1514452987');
INSERT INTO `hy_admin_action_log` VALUES ('15', '8', '管理员1', '1', 'wx5295a70f8dbc6bb7', '党宣小支部', '1', 'commit_code', '1514452996');
INSERT INTO `hy_admin_action_log` VALUES ('16', '20', '柯琼远', '3', 'wxe08d26e8d835064c', '测试支部', '0', 'commit_code', '1514454123');
INSERT INTO `hy_admin_action_log` VALUES ('17', '20', '柯琼远', '3', 'wxe08d26e8d835064c', '测试支部', '1', 'commit_code', '1514454149');
INSERT INTO `hy_admin_action_log` VALUES ('18', '20', '柯琼远', '3', 'wxe08d26e8d835064c', '测试支部', '1', 'commit_code', '1514454186');
INSERT INTO `hy_admin_action_log` VALUES ('19', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'commit_code', '1514455239');
INSERT INTO `hy_admin_action_log` VALUES ('20', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'pause_commit', '1514455631');
INSERT INTO `hy_admin_action_log` VALUES ('21', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'commit_code', '1514455645');
INSERT INTO `hy_admin_action_log` VALUES ('22', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'pause_commit', '1514508226');
INSERT INTO `hy_admin_action_log` VALUES ('23', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '0', 'commit_code', '1514509403');
INSERT INTO `hy_admin_action_log` VALUES ('24', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '0', 'pause_commit', '1514509478');
INSERT INTO `hy_admin_action_log` VALUES ('25', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '0', 'commit_code', '1514509482');
INSERT INTO `hy_admin_action_log` VALUES ('26', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '0', 'pause_commit', '1514509732');
INSERT INTO `hy_admin_action_log` VALUES ('27', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '0', 'commit_code', '1514509863');
INSERT INTO `hy_admin_action_log` VALUES ('28', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '0', 'pause_commit', '1514509927');
INSERT INTO `hy_admin_action_log` VALUES ('29', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '0', 'commit_code', '1514510009');
INSERT INTO `hy_admin_action_log` VALUES ('30', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '0', 'pause_commit', '1514510015');
INSERT INTO `hy_admin_action_log` VALUES ('31', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '0', 'commit_code', '1514510052');
INSERT INTO `hy_admin_action_log` VALUES ('32', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '0', 'pause_commit', '1514510523');
INSERT INTO `hy_admin_action_log` VALUES ('33', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'commit_code', '1514510597');
INSERT INTO `hy_admin_action_log` VALUES ('34', '20', '柯琼远', '3', 'wxe08d26e8d835064c', '测试支部', '0', 'pause_commit', '1514511652');
INSERT INTO `hy_admin_action_log` VALUES ('35', '20', '柯琼远', '3', 'wxe08d26e8d835064c', '测试支部', '1', 'commit_code', '1514511659');
INSERT INTO `hy_admin_action_log` VALUES ('36', '24', '彭涛', '7', 'wx5295a70f8dbc6bb7', '党建天地', '1', 'commit_code', '1514513523');
INSERT INTO `hy_admin_action_log` VALUES ('37', '20', '柯琼远', '3', 'wxe08d26e8d835064c', '测试支部', '1', 'pause_commit', '1514516464');
INSERT INTO `hy_admin_action_log` VALUES ('38', '20', '柯琼远', '3', 'wxe08d26e8d835064c', '测试支部', '1', 'commit_code', '1514516475');
INSERT INTO `hy_admin_action_log` VALUES ('39', '24', '彭涛', '7', 'wx5295a70f8dbc6bb7', '党建天地', '1', 'pause_commit', '1514516584');
INSERT INTO `hy_admin_action_log` VALUES ('40', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'pause_commit', '1514516846');
INSERT INTO `hy_admin_action_log` VALUES ('41', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'commit_code', '1514516857');
INSERT INTO `hy_admin_action_log` VALUES ('42', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'commit_code', '1514517082');
INSERT INTO `hy_admin_action_log` VALUES ('43', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'pause_commit', '1514517213');
INSERT INTO `hy_admin_action_log` VALUES ('44', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'commit_code', '1514517216');
INSERT INTO `hy_admin_action_log` VALUES ('45', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'commit_code', '1514517295');
INSERT INTO `hy_admin_action_log` VALUES ('46', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'commit_code', '1514517376');
INSERT INTO `hy_admin_action_log` VALUES ('47', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'commit_code', '1514517767');
INSERT INTO `hy_admin_action_log` VALUES ('48', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'commit_code', '1514518128');
INSERT INTO `hy_admin_action_log` VALUES ('49', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'commit_code', '1514518398');
INSERT INTO `hy_admin_action_log` VALUES ('50', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'pause_commit', '1514518416');
INSERT INTO `hy_admin_action_log` VALUES ('51', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'commit_code', '1514518419');
INSERT INTO `hy_admin_action_log` VALUES ('52', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'commit_code', '1514518531');
INSERT INTO `hy_admin_action_log` VALUES ('53', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'pause_commit', '1514518535');
INSERT INTO `hy_admin_action_log` VALUES ('54', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'commit_code', '1514518537');
INSERT INTO `hy_admin_action_log` VALUES ('55', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'pause_commit', '1514518543');
INSERT INTO `hy_admin_action_log` VALUES ('56', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'commit_code', '1514518545');
INSERT INTO `hy_admin_action_log` VALUES ('57', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'pause_commit', '1514523053');
INSERT INTO `hy_admin_action_log` VALUES ('58', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'commit_code', '1514523425');
INSERT INTO `hy_admin_action_log` VALUES ('59', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'pause_commit', '1514523456');
INSERT INTO `hy_admin_action_log` VALUES ('60', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'commit_code', '1514523536');
INSERT INTO `hy_admin_action_log` VALUES ('61', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'pause_commit', '1514523546');
INSERT INTO `hy_admin_action_log` VALUES ('62', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'commit_code', '1514523550');
INSERT INTO `hy_admin_action_log` VALUES ('63', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'pause_commit', '1514523561');
INSERT INTO `hy_admin_action_log` VALUES ('64', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'commit_code', '1514523566');
INSERT INTO `hy_admin_action_log` VALUES ('65', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'pause_commit', '1514523593');
INSERT INTO `hy_admin_action_log` VALUES ('66', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'commit_code', '1514523604');
INSERT INTO `hy_admin_action_log` VALUES ('67', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'pause_commit', '1514523765');
INSERT INTO `hy_admin_action_log` VALUES ('68', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'commit_code', '1514523775');
INSERT INTO `hy_admin_action_log` VALUES ('69', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'pause_commit', '1514523782');
INSERT INTO `hy_admin_action_log` VALUES ('70', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'commit_code', '1514523893');
INSERT INTO `hy_admin_action_log` VALUES ('71', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'commit_code', '1514523896');
INSERT INTO `hy_admin_action_log` VALUES ('72', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'pause_commit', '1514523899');
INSERT INTO `hy_admin_action_log` VALUES ('73', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'commit_code', '1514523900');
INSERT INTO `hy_admin_action_log` VALUES ('74', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'pause_commit', '1514523909');
INSERT INTO `hy_admin_action_log` VALUES ('75', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'commit_code', '1514523910');
INSERT INTO `hy_admin_action_log` VALUES ('76', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'pause_commit', '1514525794');
INSERT INTO `hy_admin_action_log` VALUES ('77', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'commit_code', '1514525801');
INSERT INTO `hy_admin_action_log` VALUES ('78', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'commit_code', '1514525808');
INSERT INTO `hy_admin_action_log` VALUES ('79', '8', '管理员1', '1', 'wx5295a70f8dbc6bb7', '党宣小支部', '1', 'pause_commit', '1514526576');
INSERT INTO `hy_admin_action_log` VALUES ('80', '17', '123', '1', 'wx1f5e392e8ba64560', '党宣小支部', '1', 'pause_commit', '1514530333');
INSERT INTO `hy_admin_action_log` VALUES ('81', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'commit_code', '1514533884');
INSERT INTO `hy_admin_action_log` VALUES ('82', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'commit_code', '1514533967');
INSERT INTO `hy_admin_action_log` VALUES ('83', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'commit_code', '1514533980');
INSERT INTO `hy_admin_action_log` VALUES ('84', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'commit_code', '1514534007');
INSERT INTO `hy_admin_action_log` VALUES ('85', '21', '小高', '4', 'wxe08d26e8d835064c', '测试', '1', 'commit_code', '1514534178');
INSERT INTO `hy_admin_action_log` VALUES ('86', '21', '小高', '4', 'wxc280cb0a75a05cb0', '测试', '1', 'commit_code', '1514534374');
INSERT INTO `hy_admin_action_log` VALUES ('87', '21', '小高', '4', 'wxc280cb0a75a05cb0', '测试', '1', 'commit_code', '1514534408');
INSERT INTO `hy_admin_action_log` VALUES ('88', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'commit_code', '1514535048');
INSERT INTO `hy_admin_action_log` VALUES ('89', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'pause_commit', '1514535075');
INSERT INTO `hy_admin_action_log` VALUES ('90', '20', '柯琼远', '3', 'wxe08d26e8d835064c', '测试支部', '1', 'commit_code', '1514535570');
INSERT INTO `hy_admin_action_log` VALUES ('91', '20', '柯琼远', '3', 'wxe08d26e8d835064c', '测试支部', '1', 'pause_commit', '1514535713');
INSERT INTO `hy_admin_action_log` VALUES ('92', '20', '柯琼远', '3', 'wxe08d26e8d835064c', '测试支部', '1', 'commit_code', '1514535735');
INSERT INTO `hy_admin_action_log` VALUES ('93', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'commit_code', '1514535972');
INSERT INTO `hy_admin_action_log` VALUES ('94', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'pause_commit', '1514535977');
INSERT INTO `hy_admin_action_log` VALUES ('95', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'commit_code', '1514535979');
INSERT INTO `hy_admin_action_log` VALUES ('96', '20', '柯琼远', '3', 'wxe08d26e8d835064c', '测试支部', '1', 'pause_commit', '1514537230');
INSERT INTO `hy_admin_action_log` VALUES ('97', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '1', 'pause_commit', '1514537232');
INSERT INTO `hy_admin_action_log` VALUES ('98', '20', '柯琼远', '3', 'wxe08d26e8d835064c', '测试支部', '2', 'commit_code', '1514537232');
INSERT INTO `hy_admin_action_log` VALUES ('99', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '2', 'commit_code', '1514537237');
INSERT INTO `hy_admin_action_log` VALUES ('100', '20', '柯琼远', '3', 'wxe08d26e8d835064c', '测试支部', '2', 'pause_commit', '1514537333');
INSERT INTO `hy_admin_action_log` VALUES ('101', '20', '柯琼远', '3', 'wxe08d26e8d835064c', '测试支部', '2', 'commit_code', '1514537335');
INSERT INTO `hy_admin_action_log` VALUES ('102', '20', '柯琼远', '3', 'wxe08d26e8d835064c', '测试支部', '2', 'pause_commit', '1514537530');
INSERT INTO `hy_admin_action_log` VALUES ('103', '20', '柯琼远', '3', 'wxe08d26e8d835064c', '测试支部', '3', 'commit_code', '1514537531');
INSERT INTO `hy_admin_action_log` VALUES ('104', '21', '小高', '4', 'wxc280cb0a75a05cb0', '测试', '3', 'commit_code', '1514538110');
INSERT INTO `hy_admin_action_log` VALUES ('105', '20', '柯琼远', '3', 'wxe08d26e8d835064c', '测试支部', '3', 'pause_commit', '1514538208');
INSERT INTO `hy_admin_action_log` VALUES ('106', '21', '小高', '4', 'wxc280cb0a75a05cb0', '测试', '3', 'pause_commit', '1514538223');
INSERT INTO `hy_admin_action_log` VALUES ('107', '21', '小高', '4', 'wxc280cb0a75a05cb0', '测试', '4', 'commit_code', '1514538225');
INSERT INTO `hy_admin_action_log` VALUES ('108', '20', '柯琼远', '3', 'wxe08d26e8d835064c', '测试支部', '4', 'commit_code', '1514538251');
INSERT INTO `hy_admin_action_log` VALUES ('109', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '2', 'pause_commit', '1514538398');
INSERT INTO `hy_admin_action_log` VALUES ('110', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '4', 'commit_code', '1514538399');
INSERT INTO `hy_admin_action_log` VALUES ('111', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '4', 'pause_commit', '1514538849');
INSERT INTO `hy_admin_action_log` VALUES ('112', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '5', 'commit_code', '1514538850');
INSERT INTO `hy_admin_action_log` VALUES ('113', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '5', 'pause_commit', '1514541632');
INSERT INTO `hy_admin_action_log` VALUES ('114', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '6', 'commit_code', '1514541636');
INSERT INTO `hy_admin_action_log` VALUES ('115', '21', '小高', '4', 'wxc280cb0a75a05cb0', '测试', '4', 'pause_commit', '1514541681');
INSERT INTO `hy_admin_action_log` VALUES ('116', '21', '小高', '4', 'wxc280cb0a75a05cb0', '测试', '6', 'commit_code', '1514541683');
INSERT INTO `hy_admin_action_log` VALUES ('117', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '6', 'pause_commit', '1514542349');
INSERT INTO `hy_admin_action_log` VALUES ('118', '21', '小高', '4', 'wxc280cb0a75a05cb0', '测试', '6', 'pause_commit', '1514854835');
INSERT INTO `hy_admin_action_log` VALUES ('119', '21', '小高', '4', 'wxc280cb0a75a05cb0', '测试', '6', 'commit_code', '1514854837');
INSERT INTO `hy_admin_action_log` VALUES ('120', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '6', 'commit_code', '1514855421');
INSERT INTO `hy_admin_action_log` VALUES ('121', '20', '柯琼远', '3', 'wxe08d26e8d835064c', '测试支部', '4', 'pause_commit', '1514857199');
INSERT INTO `hy_admin_action_log` VALUES ('122', '20', '柯琼远', '3', 'wxe08d26e8d835064c', '测试支部', '6', 'commit_code', '1514857201');
INSERT INTO `hy_admin_action_log` VALUES ('123', '21', '小高', '4', 'wxc280cb0a75a05cb0', '测试', '6', 'pause_commit', '1514857504');
INSERT INTO `hy_admin_action_log` VALUES ('124', '21', '小高', '4', 'wxc280cb0a75a05cb0', '测试', '6', 'commit_code', '1514857506');
INSERT INTO `hy_admin_action_log` VALUES ('125', '20', '柯琼远', '3', 'wxe08d26e8d835064c', '测试支部', '6', 'commit_code', '1514857614');
INSERT INTO `hy_admin_action_log` VALUES ('126', '21', '小高', '4', 'wx7bc849bcfe8a7f80', '测试', '6', 'pause_commit', '1514862712');
INSERT INTO `hy_admin_action_log` VALUES ('127', '21', '小高', '4', 'wx7bc849bcfe8a7f80', '测试', '6', 'commit_code', '1514862725');
INSERT INTO `hy_admin_action_log` VALUES ('128', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '6', 'pause_commit', '1514959159');
INSERT INTO `hy_admin_action_log` VALUES ('129', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '6', 'commit_code', '1514959164');
INSERT INTO `hy_admin_action_log` VALUES ('130', '21', '小高', '4', 'wxc280cb0a75a05cb0', '测试', '6', 'pause_commit', '1515117878');
INSERT INTO `hy_admin_action_log` VALUES ('131', '21', '小高', '4', 'wxc280cb0a75a05cb0', '测试', '7', 'commit_code', '1515117886');
INSERT INTO `hy_admin_action_log` VALUES ('132', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '6', 'pause_commit', '1515117987');
INSERT INTO `hy_admin_action_log` VALUES ('133', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '7', 'commit_code', '1515117988');
INSERT INTO `hy_admin_action_log` VALUES ('134', '24', '彭涛', '7', 'wx6b773b8ee8c63de3', '党建天地', '7', 'commit_code', '1515118344');
INSERT INTO `hy_admin_action_log` VALUES ('135', '24', '彭涛', '7', 'wx6b773b8ee8c63de3', '党建天地', '7', 'pause_commit', '1515118385');
INSERT INTO `hy_admin_action_log` VALUES ('136', '24', '彭涛', '7', 'wx6b773b8ee8c63de3', '党建天地', '7', 'commit_code', '1515118386');
INSERT INTO `hy_admin_action_log` VALUES ('137', '24', '彭涛', '7', 'wx6b773b8ee8c63de3', '党建天地', '7', 'pause_commit', '1515124034');
INSERT INTO `hy_admin_action_log` VALUES ('138', '24', '彭涛', '7', 'wx6b773b8ee8c63de3', '党建天地', '8', 'commit_code', '1515124038');
INSERT INTO `hy_admin_action_log` VALUES ('139', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '7', 'pause_commit', '1515130653');
INSERT INTO `hy_admin_action_log` VALUES ('140', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '11', 'commit_code', '1515130654');
INSERT INTO `hy_admin_action_log` VALUES ('141', '21', '小高', '4', 'wxc280cb0a75a05cb0', '测试', '7', 'pause_commit', '1515130759');
INSERT INTO `hy_admin_action_log` VALUES ('142', '21', '小高', '4', 'wxc280cb0a75a05cb0', '测试', '11', 'commit_code', '1515130760');
INSERT INTO `hy_admin_action_log` VALUES ('143', '24', '彭涛', '7', 'wx6b773b8ee8c63de3', '党建天地', '8', 'pause_commit', '1515130799');
INSERT INTO `hy_admin_action_log` VALUES ('144', '24', '彭涛', '7', 'wx6b773b8ee8c63de3', '党建天地', '11', 'commit_code', '1515130801');
INSERT INTO `hy_admin_action_log` VALUES ('145', '24', '彭涛', '7', 'wx6b773b8ee8c63de3', '党建天地', '11', 'pause_commit', '1515144382');
INSERT INTO `hy_admin_action_log` VALUES ('146', '24', '彭涛', '7', 'wx6b773b8ee8c63de3', '党建天地', '11', 'commit_code', '1515144384');
INSERT INTO `hy_admin_action_log` VALUES ('147', '24', '彭涛', '7', 'wx6b773b8ee8c63de3', '党建天地', '11', 'pause_commit', '1515144873');
INSERT INTO `hy_admin_action_log` VALUES ('148', '24', '彭涛', '7', 'wx6b773b8ee8c63de3', '党建天地', '11', 'commit_code', '1515145055');
INSERT INTO `hy_admin_action_log` VALUES ('149', '21', '小高', '4', 'wxc280cb0a75a05cb0', '测试', '11', 'pause_commit', '1515470465');
INSERT INTO `hy_admin_action_log` VALUES ('150', '21', '小高', '4', 'wxc280cb0a75a05cb0', '测试', '11', 'commit_code', '1515470467');
INSERT INTO `hy_admin_action_log` VALUES ('151', '20', '柯琼远', '3', 'wxe08d26e8d835064c', '测试支部', '11', 'commit_code', '1515476665');
INSERT INTO `hy_admin_action_log` VALUES ('152', '20', '柯琼远', '3', 'wxe08d26e8d835064c', '测试支部', '11', 'commit_code', '1515476674');
INSERT INTO `hy_admin_action_log` VALUES ('153', '24', '彭涛', '7', 'wx6b773b8ee8c63de3', '党建天地', '11', 'pause_commit', '1515491677');
INSERT INTO `hy_admin_action_log` VALUES ('154', '24', '彭涛', '7', 'wx6b773b8ee8c63de3', '党建天地', '12', 'commit_code', '1515491678');
INSERT INTO `hy_admin_action_log` VALUES ('155', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '11', 'pause_commit', '1515551481');
INSERT INTO `hy_admin_action_log` VALUES ('156', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '12', 'commit_code', '1515551483');
INSERT INTO `hy_admin_action_log` VALUES ('157', '20', '柯琼远', '3', 'wxe08d26e8d835064c', '测试支部', '11', 'pause_commit', '1515826388');
INSERT INTO `hy_admin_action_log` VALUES ('158', '20', '柯琼远', '3', 'wxe08d26e8d835064c', '测试支部', '12', 'commit_code', '1515826392');
INSERT INTO `hy_admin_action_log` VALUES ('159', '24', '彭涛', '7', 'wx6b773b8ee8c63de3', '党建天地', '12', 'pause_commit', '1515840967');
INSERT INTO `hy_admin_action_log` VALUES ('160', '24', '彭涛', '7', 'wx6b773b8ee8c63de3', '党建天地', '12', 'commit_code', '1515841116');
INSERT INTO `hy_admin_action_log` VALUES ('161', '24', '彭涛', '7', 'wx6b773b8ee8c63de3', '党建天地', '12', 'pause_commit', '1515841542');
INSERT INTO `hy_admin_action_log` VALUES ('162', '24', '彭涛', '7', 'wx6b773b8ee8c63de3', '党建天地', '13', 'commit_code', '1515841544');
INSERT INTO `hy_admin_action_log` VALUES ('163', '24', '彭涛', '7', 'wx6b773b8ee8c63de3', '党建天地', '13', 'pause_commit', '1515842473');
INSERT INTO `hy_admin_action_log` VALUES ('164', '24', '彭涛', '7', 'wx6b773b8ee8c63de3', '党建天地', '16', 'commit_code', '1515842474');
INSERT INTO `hy_admin_action_log` VALUES ('165', '24', '彭涛', '7', 'wx6b773b8ee8c63de3', '党建天地', '16', 'pause_commit', '1515842928');
INSERT INTO `hy_admin_action_log` VALUES ('166', '24', '彭涛', '7', 'wx6b773b8ee8c63de3', '党建天地', '17', 'commit_code', '1515842930');
INSERT INTO `hy_admin_action_log` VALUES ('167', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '12', 'pause_commit', '1515981676');
INSERT INTO `hy_admin_action_log` VALUES ('168', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '17', 'commit_code', '1515981787');
INSERT INTO `hy_admin_action_log` VALUES ('169', '20', '柯琼远', '3', 'wxe08d26e8d835064c', '测试支部', '17', 'commit_code', '1515992169');
INSERT INTO `hy_admin_action_log` VALUES ('170', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '17', 'pause_commit', '1516006773');
INSERT INTO `hy_admin_action_log` VALUES ('171', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '18', 'commit_code', '1516006774');
INSERT INTO `hy_admin_action_log` VALUES ('172', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '18', 'pause_commit', '1516008041');
INSERT INTO `hy_admin_action_log` VALUES ('173', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '19', 'commit_code', '1516008043');
INSERT INTO `hy_admin_action_log` VALUES ('174', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '19', 'pause_commit', '1516008478');
INSERT INTO `hy_admin_action_log` VALUES ('175', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '20', 'commit_code', '1516008479');
INSERT INTO `hy_admin_action_log` VALUES ('176', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '20', 'pause_commit', '1516010544');
INSERT INTO `hy_admin_action_log` VALUES ('177', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '21', 'commit_code', '1516010545');
INSERT INTO `hy_admin_action_log` VALUES ('178', '21', '小高', '4', 'wxc280cb0a75a05cb0', '测试', '11', 'pause_commit', '1516010594');
INSERT INTO `hy_admin_action_log` VALUES ('179', '21', '小高', '4', 'wxc280cb0a75a05cb0', '测试', '21', 'commit_code', '1516010918');
INSERT INTO `hy_admin_action_log` VALUES ('180', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '21', 'pause_commit', '1516017720');
INSERT INTO `hy_admin_action_log` VALUES ('181', '23', '黄玉权', '6', 'wx16d8a1bd6bcb615a', '测试3', '22', 'commit_code', '1516017721');
INSERT INTO `hy_admin_action_log` VALUES ('182', '24', '彭涛', '7', 'wx6b773b8ee8c63de3', '党建天地', '17', 'pause_commit', '1516067222');
INSERT INTO `hy_admin_action_log` VALUES ('183', '24', '彭涛', '7', 'wx6b773b8ee8c63de3', '党建天地', '22', 'commit_code', '1516067223');
INSERT INTO `hy_admin_action_log` VALUES ('184', '21', '小高', '4', 'wxc280cb0a75a05cb0', '测试', '21', 'pause_commit', '1516094818');
INSERT INTO `hy_admin_action_log` VALUES ('185', '21', '小高', '4', 'wxc280cb0a75a05cb0', '测试', '22', 'commit_code', '1516094820');

-- ----------------------------
-- Table structure for hy_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `hy_admin_log`;
CREATE TABLE `hy_admin_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_time` int(10) unsigned NOT NULL DEFAULT '0',
  `admin_id` smallint(3) unsigned NOT NULL DEFAULT '0',
  `admin_name` varchar(50) NOT NULL DEFAULT '',
  `log_action` varchar(50) NOT NULL DEFAULT '',
  `log_info` varchar(255) NOT NULL DEFAULT '',
  `ref_id` int(11) unsigned NOT NULL DEFAULT '0',
  `ip_address` varchar(15) NOT NULL DEFAULT '',
  `sys_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `org_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`),
  KEY `log_time` (`log_time`),
  KEY `user_id` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=753 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hy_admin_log
-- ----------------------------
INSERT INTO `hy_admin_log` VALUES ('16', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('17', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('18', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('19', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('20', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('21', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('22', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('23', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('24', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('25', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('26', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('27', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('28', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('29', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('30', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('31', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('32', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('33', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('34', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('35', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('36', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('37', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('38', '0', '9', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('39', '0', '9', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('40', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('41', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('42', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('43', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('44', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('45', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('46', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('47', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('48', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('49', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('50', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('51', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('52', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('53', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('54', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('55', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('56', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('57', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('58', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('59', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('60', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('61', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('62', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('63', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('64', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('65', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('66', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('67', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('68', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('69', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('70', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('71', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('72', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('73', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('74', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('75', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('76', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('77', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('78', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('79', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('80', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('81', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('82', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('83', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('84', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('85', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('86', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('87', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('88', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('89', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('90', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('91', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('92', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('93', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('94', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('95', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('96', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('97', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('98', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('99', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('100', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('101', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('102', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('103', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('104', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('105', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('106', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('107', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('108', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('109', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('110', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('111', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('112', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('113', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('114', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('115', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('116', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('117', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('118', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('119', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('120', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('121', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('122', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('123', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('124', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('125', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('126', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('127', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('128', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('129', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('130', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('131', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('132', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('133', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('134', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('135', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('136', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('137', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('138', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('139', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('140', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('141', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('142', '0', '8', '管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('143', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('144', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('145', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('146', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('147', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('148', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('149', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('150', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('151', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('152', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('153', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('154', '0', '9', '管理员2', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('155', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('156', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('157', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('158', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('159', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('160', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('161', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('162', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('163', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('164', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('165', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('166', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('167', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('168', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('169', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('170', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('171', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('172', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('173', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('174', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('175', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('176', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('177', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('178', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('179', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('180', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('181', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('182', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('183', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('184', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('185', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('186', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('187', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('188', '0', '15', 'Marko', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('189', '0', '10', '管理员3', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('190', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('191', '0', '15', 'Marko', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('192', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('193', '0', '15', 'Marko', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('194', '0', '15', 'Marko', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('195', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('196', '0', '15', 'Marko', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('197', '0', '15', 'Marko', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('198', '0', '15', 'Marko', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('199', '0', '15', 'Marko', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('200', '0', '15', 'Marko', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('201', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('202', '0', '15', 'Marko', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('203', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('204', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('205', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('206', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('207', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('208', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('209', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('210', '0', '15', 'Marko', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('211', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('212', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('213', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('214', '0', '15', 'Marko', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('215', '0', '16', 'a', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('216', '0', '15', 'Marko', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('217', '0', '16', 'a', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('218', '0', '16', 'a', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('219', '0', '16', 'a', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('220', '0', '16', 'a', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('221', '0', '16', 'a', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('222', '0', '16', 'a', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('223', '0', '16', 'a', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('224', '0', '16', 'a', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('225', '0', '16', 'a', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('226', '0', '16', 'a', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('227', '0', '16', 'a', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('228', '0', '16', 'a', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('229', '0', '16', 'a', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('230', '0', '16', 'a', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('231', '0', '16', 'a', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('232', '0', '16', 'a', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('233', '0', '16', 'a', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('234', '0', '16', 'a', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('235', '0', '16', 'a', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('236', '0', '16', 'a', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('237', '0', '16', 'a', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('238', '0', '16', 'a', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('239', '0', '16', 'a', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('240', '0', '16', 'a', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('241', '0', '16', 'a', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('242', '0', '16', 'a', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('243', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('244', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('245', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('246', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('247', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('248', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('249', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('250', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('251', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('252', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('253', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('254', '0', '15', 'Marko', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('255', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('256', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('257', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('258', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('259', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('260', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('261', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('262', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('263', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('264', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('265', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('266', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('267', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('268', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('269', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('270', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('271', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('272', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('273', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('274', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('275', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('276', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('277', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('278', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('279', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('280', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('281', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('282', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('283', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('284', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('285', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('286', '0', '9', '管理员2', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('287', '0', '13', '谢文俊', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('288', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('289', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('290', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('291', '0', '9', '管理员2', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('292', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('293', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('294', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('295', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('296', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('297', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('298', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('299', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('300', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('301', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('302', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('303', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('304', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('305', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('306', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('307', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('308', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('309', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('310', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('311', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('312', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('313', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('314', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('315', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('316', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('317', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('318', '0', '20', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('319', '0', '20', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('320', '0', '20', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('321', '0', '20', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('322', '0', '20', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('323', '0', '9', '管理员2', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('324', '0', '20', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('325', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('326', '0', '20', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('327', '0', '20', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('328', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('329', '0', '20', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('330', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('331', '0', '20', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('332', '0', '20', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('333', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('334', '0', '20', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('335', '0', '20', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('336', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('337', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('338', '0', '20', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('339', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('340', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('341', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('342', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('343', '0', '11', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('344', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('345', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('346', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('347', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('348', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('349', '0', '11', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('350', '0', '20', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('351', '0', '11', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('352', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('353', '0', '21', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('354', '0', '21', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('355', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('356', '0', '20', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('357', '0', '21', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('358', '0', '21', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('359', '0', '21', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('360', '0', '21', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('361', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('362', '0', '21', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('363', '0', '20', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('364', '0', '20', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('365', '0', '20', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('366', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('367', '0', '11', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('368', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('369', '0', '20', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('370', '0', '20', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('371', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('372', '0', '21', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('373', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('374', '0', '22', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('375', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('376', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('377', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('378', '0', '20', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('379', '0', '21', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('380', '0', '20', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('381', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('382', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('383', '0', '20', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('384', '0', '22', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('385', '0', '21', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('386', '0', '20', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('387', '0', '20', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('388', '0', '22', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('389', '0', '21', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('390', '0', '20', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('391', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('392', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('393', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('394', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('395', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('396', '0', '11', '超级管理员', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('397', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('398', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('399', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('400', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('401', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('402', '0', '24', '彭涛', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('403', '0', '24', '彭涛', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('404', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('405', '0', '24', '彭涛', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('406', '0', '24', '彭涛', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('407', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('408', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('409', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('410', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('411', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('412', '0', '25', '梁水明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('413', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('414', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('415', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('416', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('417', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('418', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('419', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('420', '0', '24', '彭涛', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('421', '0', '24', '彭涛', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('422', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('423', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('424', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('425', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('426', '0', '24', '彭涛', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('427', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('428', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('429', '0', '9', '管理员2', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('430', '0', '24', '彭涛', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('431', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('432', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('433', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('434', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('435', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('436', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('437', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('438', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('439', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('440', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('441', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('442', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('443', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('444', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('445', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('446', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('447', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('448', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('449', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('450', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('451', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('452', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('453', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('454', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('455', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('456', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('457', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('458', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('459', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('460', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('461', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('462', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('463', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('464', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('465', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('466', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('467', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('468', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('469', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('470', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('471', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('472', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('473', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('474', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('475', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('476', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('477', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('478', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('479', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('480', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('481', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('482', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('483', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('484', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('485', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('486', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('487', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('488', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('489', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('490', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('491', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('492', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('493', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('494', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('495', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('496', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('497', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('498', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('499', '0', '24', '彭涛', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('500', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('501', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('502', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('503', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('504', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('505', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('506', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('507', '0', '15', 'Marko', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('508', '0', '15', 'Marko', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('509', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('510', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('511', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('512', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('513', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('514', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('515', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('516', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('517', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('518', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('519', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('520', '0', '24', '彭涛', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('521', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('522', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('523', '0', '24', '彭涛', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('524', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('525', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('526', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('527', '0', '24', '彭涛', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('528', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('529', '0', '24', '彭涛', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('530', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('531', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('532', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('533', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('534', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('535', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('536', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('537', '0', '17', '123', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('538', '0', '24', '彭涛', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('539', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('540', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('541', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('542', '0', '24', '彭涛', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('543', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('544', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('545', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('546', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('547', '0', '24', '彭涛', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('548', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('549', '0', '26', '黄总', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('550', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('551', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('552', '0', '24', '彭涛', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('553', '0', '24', '彭涛', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('554', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('555', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('556', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('557', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('558', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('559', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('560', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('561', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('562', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('563', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('564', '0', '24', '彭涛', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('565', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('566', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('567', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('568', '0', '24', '彭涛', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('569', '0', '24', '彭涛', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('570', '0', '24', '彭涛', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('571', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('572', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('573', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('574', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('575', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('576', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('577', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('578', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('579', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('580', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('581', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('582', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('583', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('584', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('585', '0', '24', '彭涛', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('586', '0', '24', '彭涛', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('587', '0', '24', '彭涛', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('588', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('589', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('590', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('591', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('592', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('593', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('594', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('595', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('596', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('597', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('598', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('599', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('600', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('601', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('602', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('603', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('604', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('605', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('606', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('607', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('608', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('609', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('610', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('611', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('612', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('613', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('614', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('615', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('616', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('617', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('618', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('619', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('620', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('621', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('622', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('623', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('624', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('625', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('626', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('627', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('628', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('629', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('630', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('631', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('632', '0', '24', '彭涛', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('633', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('634', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('635', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('636', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('637', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('638', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('639', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('640', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('641', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('642', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('643', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('644', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('645', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('646', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('647', '0', '24', '彭涛', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('648', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('649', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('650', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('651', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('652', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('653', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('654', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('655', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('656', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('657', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('658', '0', '8', '管理员1', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('659', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('660', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('661', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('662', '0', '19', 'jjj', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('663', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('664', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('665', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('666', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('667', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('668', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('669', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('670', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('671', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('672', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('673', '0', '14', '高翠明', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('674', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('675', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('676', '0', '24', '彭涛', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('677', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('678', '0', '24', '彭涛', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('679', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('680', '0', '24', '彭涛', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('681', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('682', '0', '23', '黄玉权', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('683', '0', '24', '彭涛', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('684', '0', '21', '小高', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('685', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('686', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('687', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('688', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('689', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('690', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('691', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('692', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('693', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('694', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('695', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('696', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('697', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('698', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('699', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('700', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('701', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('702', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('703', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('704', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('705', '0', '20', '柯琼远', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('706', '0', '31', '柯琼远系统', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('707', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('708', '0', '31', '柯琼远系统', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('709', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('710', '0', '31', '柯琼远系统', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('711', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('712', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('713', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('714', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('715', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('716', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('717', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('718', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('719', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('720', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('721', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('722', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('723', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('724', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('725', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('726', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('727', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('728', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('729', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('730', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('731', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('732', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('733', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('734', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('735', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('736', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('737', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('738', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('739', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('740', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('741', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('742', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('743', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('744', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('745', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('746', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('747', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('748', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('749', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('750', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('751', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');
INSERT INTO `hy_admin_log` VALUES ('752', '0', '20', '柯琼远小程序', '', '管理员登录', '0', '', '0', '0');

-- ----------------------------
-- Table structure for hy_admin_session
-- ----------------------------
DROP TABLE IF EXISTS `hy_admin_session`;
CREATE TABLE `hy_admin_session` (
  `sesskey` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `is_admin` int(1) NOT NULL COMMENT '判断是否是超级管理员',
  `region_code` bigint(20) NOT NULL COMMENT '地址Code',
  `expiry` int(11) unsigned NOT NULL DEFAULT '0',
  `admin_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `branch_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '党部ID',
  `action_list` text NOT NULL COMMENT '权限列表',
  UNIQUE KEY `sesskey` (`sesskey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of hy_admin_session
-- ----------------------------
INSERT INTO `hy_admin_session` VALUES ('240025a5ff63ff14e973796824646324', '1', '130300', '1516843199', '31', '0', ',category/special,category/category,category/del,category/create_or_modify,category/switchstatus,article/category,article/wh,article/del,article/switchhot,article/create_or_modify,article/switchstatus,article/index,category/create_or_modify_special,special/category,special/wh,special/del,special/switchhot,special/create_or_modify,special/switchstatus,special/index,notice/notice_change,notice/notice_list,notice/notice_del,notice/notice_save,even/even_del,even/even_change,even/even_list,even/even_user,even/even_save,user/index,admin/index,admin/del,admin/create_or_modify,index/list,mien/mien_list,mien/mien_change,rank/main,rank/item,ad/ad_list,point/rule,point/log,point/rulelist,point/loglist,category/article,ue/index,point/editrule,admin/createormodify,ad/ad_save,ad/location,ad/ad_change,ad/ad_del,xcx/publish,xcx/getauthorizeurl,xcx/commitcode,xcx/getqrcode,xcx/gettemplatelist,xcx/pause,admin/log,admin/loglist,wx/wxsoft,wx/region,wx/create_or_modify,category/study,video/video_list,group/group,user/switch_status,user/options,video/category,category/editstudy,ebook/ebook_list,');
INSERT INTO `hy_admin_session` VALUES ('908815a67e7b9d727588402827549041', '1', '130304', '1517363769', '20', '3', ',category/special,category/category,category/del,category/create_or_modify,category/switchstatus,article/category,article/wh,article/del,article/switchhot,article/create_or_modify,article/switchstatus,article/index,category/create_or_modify_special,special/category,special/wh,special/del,special/switchhot,special/create_or_modify,special/switchstatus,special/index,notice/notice_change,notice/notice_list,notice/notice_del,notice/notice_save,even/even_del,even/even_change,even/even_list,even/even_user,even/even_save,user/index,admin/index,admin/del,admin/create_or_modify,index/list,mien/mien_list,mien/mien_change,rank/main,rank/item,ad/ad_list,point/rule,point/log,point/rulelist,point/loglist,category/article,ue/index,point/editrule,admin/createormodify,ad/ad_save,ad/location,ad/ad_change,ad/ad_del,xcx/publish,xcx/getauthorizeurl,xcx/commitcode,xcx/getqrcode,xcx/gettemplatelist,xcx/pause,admin/log,admin/loglist,wx/region,category/study,video/video_list,group/group,group/create_or_modify,video/create_or_modify,category/create_or_modify_video,user/create,user/switch_status,user/options,video/category,ue/createuploadvideo,ue/getplayinfo,video/wh,video/switchstatus,category/editstudy,ebook/ebook_list,ebook/wh,ebook/category,ebook/create_or_modify,ebook/switchstatus,ebook/del,ebook/tree_node,ebook/node_info,ebook/add_node,ebook/edit_node,ebook/del_node,question/question_list,question/wh,question/category,question/create_or_modify,question/switchstatus,question/del,question/item_list,question/create_or_modify_item,question/del_item,');

-- ----------------------------
-- Table structure for hy_ad_info
-- ----------------------------
DROP TABLE IF EXISTS `hy_ad_info`;
CREATE TABLE `hy_ad_info` (
  `ad_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `position_code` varchar(20) NOT NULL DEFAULT '',
  `ad_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ad_title` varchar(255) NOT NULL DEFAULT '',
  `ad_value` varchar(255) NOT NULL DEFAULT '',
  `ad_picture` varchar(255) NOT NULL DEFAULT '',
  `start_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(11) NOT NULL DEFAULT '0',
  `sort_order` smallint(11) unsigned NOT NULL DEFAULT '0',
  `click_count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`ad_id`),
  KEY `position_id` (`position_code`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=328 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hy_ad_info
-- ----------------------------
INSERT INTO `hy_ad_info` VALUES ('324', 'home', '101', '1', 'null', 'https://ymapp.yourmoon.com/upload/editor/201712/5a228951cb43f.jpg', '1514776172', '1517331372', '1', '0', '1');
INSERT INTO `hy_ad_info` VALUES ('325', 'home', '102', '3', '1', 'https://ymapp.yourmoon.com/upload/editor/201712/5a228951cb43f.jpg', '1514430572', '1517244972', '3', '0', '2');
INSERT INTO `hy_ad_info` VALUES ('326', 'home', '2', 'Test', '8', 'https://xiaocx.huiyi.t.weixinren.cn/upload//UE/5a39b94d3bb97.jpg', '1514305380', '1517328000', '1', '0', '1');
INSERT INTO `hy_ad_info` VALUES ('327', 'home', '2', '123', '11', 'http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/editor/4/fe1b720a6d0a1ff3c3dcbd32273fab6c.jpg', '1514822400', '1517328000', '20', '0', '1');

-- ----------------------------
-- Table structure for hy_album
-- ----------------------------
DROP TABLE IF EXISTS `hy_album`;
CREATE TABLE `hy_album` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `desc` varchar(500) NOT NULL DEFAULT '' COMMENT '简介',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '分类',
  `detail` text NOT NULL COMMENT '详细',
  `images` text NOT NULL COMMENT '相册系列图，多张用“,”分开',
  `sort` int(11) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `image` varchar(200) NOT NULL DEFAULT '' COMMENT '图片',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态：1-显示，2-隐藏',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `ref_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '关联官方文章ID',
  `read_num` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '阅读次数',
  `collect_num` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `forward_num` mediumint(8) NOT NULL DEFAULT '0' COMMENT '收藏数量',
  `branch_id` int(11) NOT NULL COMMENT '支部ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='相册';

-- ----------------------------
-- Records of hy_album
-- ----------------------------
INSERT INTO `hy_album` VALUES ('6', '自定义1', '123', '125', '&lt;p&gt;123&lt;/p&gt;', 'http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/editord6cda9e2ca69d891455cd16c22e29155.jpg,http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/editor28603d716e03578c335b14f2ccfb4fd3.jpg', '10', 'http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/editord6cda9e2ca69d891455cd16c22e29155.jpg', '1', '0', '1516191917', '0', '0', '0', '0', '87');
INSERT INTO `hy_album` VALUES ('7', '123', '66666', '126', '&lt;p&gt;哈哈哈哈&lt;/p&gt;', 'http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/editor/98d8d5ad1045b5c92b990d566126a2ac.jpg,http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/editor/7e83fbf93c51eea8f625c315d4a72026.jpg', '100', 'http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/editor/38a6727755d95e1f1af3e302d9946221.jpg', '1', '0', '1516191924', '1', '9', '0', '0', '87');
INSERT INTO `hy_album` VALUES ('8', '123', '66666', '126', '&lt;p&gt;哈哈哈哈&lt;/p&gt;', 'http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/editor/38a6727755d95e1f1af3e302d9946221.jpg', '2', 'http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/editor/38a6727755d95e1f1af3e302d9946221.jpg', '1', '0', '1516191967', '1', '2', '0', '0', '87');
INSERT INTO `hy_album` VALUES ('9', '2123', '213', '125', '&lt;p&gt;54156&lt;/p&gt;', 'http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/editora24367afd5d74dc93ff9faa7b29c96fc.jpg', '321', 'http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/editora24367afd5d74dc93ff9faa7b29c96fc.jpg', '1', '0', '1516240809', '0', '0', '0', '0', '87');
INSERT INTO `hy_album` VALUES ('10', '123', '66666', '124', '&lt;p&gt;哈哈哈哈&lt;/p&gt;', 'http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/editor/98d8d5ad1045b5c92b990d566126a2ac.jpg,http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/editor/7e83fbf93c51eea8f625c315d4a72026.jpg', '100', 'http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/editor/38a6727755d95e1f1af3e302d9946221.jpg', '1', '0', '1516269632', '1', '0', '0', '0', '4');

-- ----------------------------
-- Table structure for hy_audio
-- ----------------------------
DROP TABLE IF EXISTS `hy_audio`;
CREATE TABLE `hy_audio` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `desc` varchar(500) NOT NULL DEFAULT '' COMMENT '简介',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '分类',
  `detail` text NOT NULL COMMENT '详细',
  `audio_url` varchar(200) NOT NULL DEFAULT '' COMMENT '视频点播ID',
  `sort` int(11) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `image` varchar(200) NOT NULL DEFAULT '' COMMENT '图片',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态：1-显示，2-隐藏',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `ref_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '关联官方文章ID',
  `read_num` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '阅读次数',
  `collect_num` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `forward_num` mediumint(8) NOT NULL DEFAULT '0' COMMENT '收藏数量',
  `branch_id` int(11) NOT NULL COMMENT '支部ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='音频';

-- ----------------------------
-- Records of hy_audio
-- ----------------------------
INSERT INTO `hy_audio` VALUES ('11', '123', '123', '105', '&lt;p&gt;123&lt;/p&gt;', '', '3', '', '1', '0', '1516183036', '0', '0', '0', '0', '87');
INSERT INTO `hy_audio` VALUES ('12', '123', '123', '105', '&lt;p&gt;123&lt;br/&gt;&lt;/p&gt;', 'http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/radiodb965d8870e870e79f9437cc1811c9df.mp3', '2', 'http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/editor/948cc4ad57d4a4d89a3a8282c9fc999c.jpg', '2', '0', '1516183063', '1', '0', '0', '0', '87');
INSERT INTO `hy_audio` VALUES ('13', '123', '123', '121', '&lt;p&gt;123&lt;br/&gt;&lt;/p&gt;', 'http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/audio/557582f4b943d9832d59e4346ac17873.mp3', '100', 'http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/editor/948cc4ad57d4a4d89a3a8282c9fc999c.jpg', '1', '0', '1516189267', '1', '0', '0', '0', '4');

-- ----------------------------
-- Table structure for hy_branch
-- ----------------------------
DROP TABLE IF EXISTS `hy_branch`;
CREATE TABLE `hy_branch` (
  `branch_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` varchar(200) NOT NULL DEFAULT '' COMMENT '小程序AppID',
  `app_secret` varchar(255) NOT NULL DEFAULT '' COMMENT '小程序AppSecret',
  `app_type` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '1使用AppSecret，2使用第三方平台',
  `app_name` varchar(200) NOT NULL DEFAULT '' COMMENT '小程序名称',
  `branch_name` varchar(50) NOT NULL DEFAULT '' COMMENT '支部名称',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '超级管理员帐号',
  `branch_secret` varchar(100) NOT NULL DEFAULT '' COMMENT '小程序调用密钥',
  `user` varchar(50) NOT NULL DEFAULT '' COMMENT '负责人姓名',
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '负责人手机号',
  `region_code` bigint(11) NOT NULL DEFAULT '0' COMMENT '所在地区',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址详细',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0-待审核，1-审核通过，2-审核不通过，3-已冻结',
  `remark` text NOT NULL COMMENT '备注',
  `template_id` mediumint(8) NOT NULL DEFAULT '-1' COMMENT '发布模版ID',
  `is_close` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '小程序是否关闭',
  `is_auth` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否授权',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `expire_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '过期时间',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='支部表';

-- ----------------------------
-- Records of hy_branch
-- ----------------------------
INSERT INTO `hy_branch` VALUES ('1', 'wx1f5e392e8ba64560', '32bcf92d39beab4903467666b770b123', '1', '党宣小支部', '党宣小支部', '', '3f691556b21b53b66bb675c69fd6b22b', '小开', '13658955654', '130303', '关区小园地上街2263号', '1', '', '1', '1', '1', '0', '1543593600', '1512954701');
INSERT INTO `hy_branch` VALUES ('2', '', '', '2', '汇移党支部', '汇移党支部', '', '9a6c6520eeddff230b8c1da0b2390adc', '黄总', '17688868899', '110101', '广州天河北路', '1', 'eeee', '-1', '0', '0', '0', '1514044800', '1513048172');
INSERT INTO `hy_branch` VALUES ('3', 'wxe08d26e8d835064c', '', '2', '柯测试支部', '柯测试支部', '', 'd4f0137b471b061035cd931ce7158cc3', '测试', '13800138111', '130304', '', '1', '', '28', '0', '1', '0', '1517068800', '1514355828');
INSERT INTO `hy_branch` VALUES ('4', 'wxc280cb0a75a05cb0', '', '2', '测试', '测试', '', '37546e06aaacd8c2c87e51d4279501ec', '小高', '13330194400', '110101', '上海滩', '1', '备注', '28', '0', '1', '0', '1517068800', '1514376624');
INSERT INTO `hy_branch` VALUES ('5', '', '', '1', '测试2', '测试2', '', 'c4667e89bb0ee62202f41209eba83cff', '测试2', '13800138222', '120102', '地', '1', '', '-1', '0', '0', '0', '1516464000', '1514423917');
INSERT INTO `hy_branch` VALUES ('6', 'wx16d8a1bd6bcb615a', '', '2', '测试3', '测试3', 'huangyuquan', '3ee7c2550e98f1e3cf8356b6600fc6d3', '黄玉权', '13266668888', '130303', '', '1', '', '22', '0', '1', '0', '1519488000', '1514454409');
INSERT INTO `hy_branch` VALUES ('7', 'wx6b773b8ee8c63de3', '', '2', '党建天地', '汇移支部', '18588853515', '8ab5e73ace8a8bbeec7e470cbd43dcee', '彭涛', '18588853515', '140302', '', '1', '', '28', '0', '1', '0', '1520092800', '1514511188');
INSERT INTO `hy_branch` VALUES ('8', '', '', '2', '红慧', '红慧', 'hoh', '2661e47ea0ff56507549978f3fdf1ae6', '梁水明', '13826113909', '440106', '天河北', '1', '', '-1', '0', '0', '0', '1548432000', '1514515976');
INSERT INTO `hy_branch` VALUES ('9', '', '', '2', '党建专题', '', '小马', '', '小马', '15521099542', '110228', '广东省广州市白云区', '1', '无备注', '-1', '0', '0', '0', '1517328000', '1515813827');
INSERT INTO `hy_branch` VALUES ('10', '', '', '2', 'help', '', 'Mk', '', 'Marko', '15521099542', '110229', '哈哈哈', '1', '无', '-1', '0', '0', '0', '1517328000', '1515814012');
INSERT INTO `hy_branch` VALUES ('13', '', '', '2', '123', '', '666666666', '', '123', '15521099542', '110102', '123', '1', '123', '-1', '0', '0', '0', '1516118400', '1515814059');
INSERT INTO `hy_branch` VALUES ('14', '', '', '2', '天河五山支部', '', 'wushan001', '', '王三', '13330196688', '440103', '天科五路', '1', 'dddddd', '-1', '0', '0', '0', '1548864000', '1515824606');

-- ----------------------------
-- Table structure for hy_category
-- ----------------------------
DROP TABLE IF EXISTS `hy_category`;
CREATE TABLE `hy_category` (
  `cat_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '支部ID',
  `region_code` bigint(11) unsigned NOT NULL DEFAULT '0',
  `ref_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '关联总部的分类ID',
  `cat_name` varchar(50) NOT NULL DEFAULT '' COMMENT '分类名称',
  `desc` varchar(100) NOT NULL DEFAULT '' COMMENT '简介',
  `icon` varchar(100) NOT NULL DEFAULT '' COMMENT 'ICON图',
  `cat_key` varchar(50) NOT NULL DEFAULT '' COMMENT 'KEY',
  `cat_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '分类类型：1-两学一做，2-党建专题，3-视频，4-音频，5-电子书，6-读书，7-题库，8-相册',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态：1-启动，2-停用',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '时间',
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of hy_category
-- ----------------------------
INSERT INTO `hy_category` VALUES ('7', '3', '130304', '0', 'aaa', '', '', '', '1', '0', '1', '1', '1513068816');
INSERT INTO `hy_category` VALUES ('12', '1', '130303', '0', '天河新闻2', '天河新闻简介35666', '', '', '1', '1', '2', '1', '1513071663');
INSERT INTO `hy_category` VALUES ('13', '1', '130303', '0', '天河新闻', '天河新闻简介', '/UE/5a30b2244956e.jpg', '', '1', '1', '1', '0', '1513074061');
INSERT INTO `hy_category` VALUES ('15', '1', '130303', '1', '', '', '', '', '1', '100', '1', '0', '1513079349');
INSERT INTO `hy_category` VALUES ('16', '1', '130303', '0', '党会议1', '12', '/UE/5a309c095566a.jpg', '', '1', '12', '1', '0', '1513129191');
INSERT INTO `hy_category` VALUES ('17', '1', '130303', '0', '党会议自定', '9999', 'http://dangjian.huiyi.t.weixinren.cn/upload//editor/201712/5a2ddc4bd90c5.png', '', '1', '21', '2', '0', '1513130303');
INSERT INTO `hy_category` VALUES ('18', '1', '130303', '0', 'abc', '', '', '', '1', '0', '1', '1', '1513137943');
INSERT INTO `hy_category` VALUES ('19', '1', '130303', '0', 'abcd', '', '', '', '1', '0', '1', '1', '1513143529');
INSERT INTO `hy_category` VALUES ('20', '1', '130303', '0', '天河新闻', '天河新闻', 'http://dangjian.huiyi.t.weixinren.cn/upload//editor/201712/5a2ddc1f62151.png', '', '1', '1', '2', '0', '1513148596');
INSERT INTO `hy_category` VALUES ('40', '1', '130303', '3', '', '', '', '', '1', '100', '1', '0', '1513157937');
INSERT INTO `hy_category` VALUES ('41', '1', '130303', '4', '', '', '', '', '1', '100', '1', '0', '1513158778');
INSERT INTO `hy_category` VALUES ('42', '1', '130303', '5', '', '', '', '', '1', '100', '1', '0', '1513216209');
INSERT INTO `hy_category` VALUES ('43', '1', '130303', '6', '', '', '', '', '1', '100', '1', '0', '1513216211');
INSERT INTO `hy_category` VALUES ('44', '1', '130303', '7', '', '', '', '', '1', '100', '1', '0', '1513216213');
INSERT INTO `hy_category` VALUES ('45', '1', '130303', '8', '', '', '', '', '1', '100', '1', '0', '1513216218');
INSERT INTO `hy_category` VALUES ('46', '1', '130303', '9', '', '', '', '', '1', '100', '1', '0', '1513216221');
INSERT INTO `hy_category` VALUES ('47', '1', '130303', '10', '', '', '', '', '1', '100', '1', '0', '1513216223');
INSERT INTO `hy_category` VALUES ('48', '1', '130303', '0', '十九大', '十九大新闻', '/UE/5a31d90facb11.png', '', '1', '100', '2', '0', '1513216301');
INSERT INTO `hy_category` VALUES ('49', '1', '130303', '2', '', '', '', '', '2', '100', '1', '0', '1513240102');
INSERT INTO `hy_category` VALUES ('50', '1', '130303', '0', '党建专题-扶贫之路', '党建专题-扶贫之路', '', '', '1', '1', '1', '0', '1513240560');
INSERT INTO `hy_category` VALUES ('51', '1', '130303', '11', '', '', '', '', '2', '100', '2', '0', '1513245780');
INSERT INTO `hy_category` VALUES ('52', '1', '130303', '0', 'test123', '', '', '', '2', '0', '1', '1', '1513246025');
INSERT INTO `hy_category` VALUES ('53', '0', '130303', '1', '', '', '', '', '1', '100', '2', '0', '1513559391');
INSERT INTO `hy_category` VALUES ('54', '1', '130303', '0', '少年中国', '', '', '', '2', '0', '1', '1', '1513591123');
INSERT INTO `hy_category` VALUES ('55', '1', '130303', '0', '1213', '12', '', '', '1', '12', '2', '1', '1513822399');
INSERT INTO `hy_category` VALUES ('56', '1', '130303', '0', '5123', '3\n1', '', '', '1', '10', '1', '1', '1513823370');
INSERT INTO `hy_category` VALUES ('57', '1', '130303', '0', '123', '123', 'https://xiaocx.huiyi.t.weixinren.cn/upload//UE/5a3b1f682f066.jpg', '', '1', '123', '1', '1', '1513824111');
INSERT INTO `hy_category` VALUES ('58', '1', '130303', '0', '123', '2123', 'https://xiaocx.huiyi.t.weixinren.cn/upload//UE/5a3b20a840fcb.jpg', '', '2', '1', '1', '1', '1513824430');
INSERT INTO `hy_category` VALUES ('59', '4', '110101', '1', '', '', '', '', '1', '100', '1', '0', '1514378630');
INSERT INTO `hy_category` VALUES ('61', '4', '110101', '11', '', '', '', '', '2', '100', '1', '0', '1514378679');
INSERT INTO `hy_category` VALUES ('62', '3', '130304', '1', '', '', '', '', '1', '100', '1', '0', '1514424503');
INSERT INTO `hy_category` VALUES ('63', '3', '130304', '3', '', '', '', '', '1', '100', '1', '0', '1514424510');
INSERT INTO `hy_category` VALUES ('64', '3', '130304', '4', '', '', '', '', '1', '100', '1', '0', '1514424511');
INSERT INTO `hy_category` VALUES ('65', '3', '130304', '5', '', '', '', '', '1', '100', '1', '0', '1514424514');
INSERT INTO `hy_category` VALUES ('66', '3', '130304', '6', '', '', '', '', '1', '100', '2', '0', '1514424515');
INSERT INTO `hy_category` VALUES ('67', '3', '130304', '7', '', '', '', '', '1', '100', '1', '0', '1514424516');
INSERT INTO `hy_category` VALUES ('68', '3', '130304', '8', '', '', '', '', '1', '100', '2', '0', '1514424525');
INSERT INTO `hy_category` VALUES ('69', '3', '130304', '9', '', '', '', '', '1', '100', '1', '0', '1514424526');
INSERT INTO `hy_category` VALUES ('70', '3', '130304', '10', '', '', '', '', '1', '100', '1', '0', '1514424528');
INSERT INTO `hy_category` VALUES ('72', '3', '130304', '2', '', '', '', '', '2', '100', '1', '0', '1514424581');
INSERT INTO `hy_category` VALUES ('73', '4', '110101', '2', '', '', '', '', '2', '100', '1', '0', '1514425763');
INSERT INTO `hy_category` VALUES ('74', '4', '110101', '3', '', '', '', '', '1', '100', '1', '0', '1514425777');
INSERT INTO `hy_category` VALUES ('75', '4', '110101', '4', '', '', '', '', '1', '100', '1', '0', '1514425778');
INSERT INTO `hy_category` VALUES ('76', '4', '110101', '5', '', '', '', '', '1', '100', '1', '0', '1514425781');
INSERT INTO `hy_category` VALUES ('77', '4', '110101', '6', '', '', '', '', '1', '100', '1', '0', '1514425783');
INSERT INTO `hy_category` VALUES ('78', '4', '110101', '7', '', '', '', '', '1', '100', '1', '0', '1514425784');
INSERT INTO `hy_category` VALUES ('79', '4', '110101', '8', '', '', '', '', '1', '100', '1', '0', '1514425786');
INSERT INTO `hy_category` VALUES ('80', '4', '110101', '9', '', '', '', '', '1', '100', '1', '0', '1514425787');
INSERT INTO `hy_category` VALUES ('81', '4', '110101', '10', '', '', '', '', '1', '100', '1', '0', '1514425791');
INSERT INTO `hy_category` VALUES ('82', '4', '110101', '0', '哈哈哈', 'ONE', 'https://xiaocx.huiyi.t.weixinren.cn/upload//UE/5a444f0b01c22.jpg', '', '1', '1', '1', '1', '1514426124');
INSERT INTO `hy_category` VALUES ('83', '6', '130303', '1', '', '', '', '', '1', '100', '1', '0', '1514538392');
INSERT INTO `hy_category` VALUES ('84', '4', '110101', '0', '123', '123', 'http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/editor/4/3ecb3e74d352707e82d733662ac91b3f.jpg', '', '1', '123', '2', '1', '1515048627');
INSERT INTO `hy_category` VALUES ('85', '7', '140302', '2', '', '', '', '', '2', '100', '1', '0', '1515119666');
INSERT INTO `hy_category` VALUES ('86', '7', '140302', '11', '', '', '', '', '2', '100', '1', '0', '1515119668');
INSERT INTO `hy_category` VALUES ('87', '7', '140302', '1', '', '', '', '', '1', '100', '1', '0', '1515119679');
INSERT INTO `hy_category` VALUES ('88', '7', '140302', '3', '', '', '', '', '1', '100', '1', '0', '1515119681');
INSERT INTO `hy_category` VALUES ('89', '7', '140302', '4', '', '', '', '', '1', '100', '1', '0', '1515119683');
INSERT INTO `hy_category` VALUES ('90', '7', '140302', '5', '', '', '', '', '1', '100', '1', '0', '1515119685');
INSERT INTO `hy_category` VALUES ('91', '7', '140302', '6', '', '', '', '', '1', '100', '1', '0', '1515119687');
INSERT INTO `hy_category` VALUES ('92', '7', '140302', '7', '', '', '', '', '1', '100', '1', '0', '1515119689');
INSERT INTO `hy_category` VALUES ('93', '7', '140302', '8', '', '', '', '', '1', '100', '1', '0', '1515119692');
INSERT INTO `hy_category` VALUES ('94', '7', '140302', '9', '', '', '', '', '1', '100', '1', '0', '1515119694');
INSERT INTO `hy_category` VALUES ('95', '7', '140302', '10', '', '', '', '', '1', '100', '1', '0', '1515119695');
INSERT INTO `hy_category` VALUES ('96', '6', '130303', '3', '', '', '', '', '1', '100', '1', '0', '1515553880');
INSERT INTO `hy_category` VALUES ('97', '6', '130303', '2', '', '', '', '', '2', '100', '1', '0', '1515553894');
INSERT INTO `hy_category` VALUES ('98', '6', '130303', '11', '', '', '', '', '2', '100', '1', '0', '1515553896');
INSERT INTO `hy_category` VALUES ('99', '4', '110101', '0', '视频分类1', '123', 'http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/editor/4/4c2d78202abf96c56cc7ade0b2e5d75d.jpg', '', '3', '1', '1', '0', '1515655221');
INSERT INTO `hy_category` VALUES ('100', '1', '130303', '0', '双12', '', 'http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/editor/1/152c21d3196e91a94121173e1bfca8af.jpg', '', '3', '1', '1', '0', '1515846967');
INSERT INTO `hy_category` VALUES ('101', '6', '130303', '0', '党史', '党史', '', '', '3', '0', '1', '0', '1516088391');
INSERT INTO `hy_category` VALUES ('102', '3', '130304', '14', 'ufj', 'f', 'http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/editor/93ea5c39b2858d495dd587387d1a1741.png', '', '4', '100', '1', '0', '1516105445');
INSERT INTO `hy_category` VALUES ('103', '3', '130304', '11', '新时代', '', 'http://dangjian.huiyi.t.weixinren.cn/upload//editor/201712/5a30e7a5db310.png', 'djzt_xsd', '2', '100', '1', '0', '1516105568');
INSERT INTO `hy_category` VALUES ('104', '3', '130304', '0', 'fds', 'fdsa', '', '', '2', '12', '1', '0', '1516105575');
INSERT INTO `hy_category` VALUES ('105', '3', '130304', '13', '会议', '', 'http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/editor/62509993a807dff211a90dd5c07295b4.jpg', '', '3', '100', '1', '0', '1516106612');
INSERT INTO `hy_category` VALUES ('106', '3', '130304', '0', '23', '3', '', '', '3', '3', '2', '0', '1516106982');
INSERT INTO `hy_category` VALUES ('107', '3', '130304', '0', '32', '32', '', '', '3', '32', '1', '0', '1516107219');
INSERT INTO `hy_category` VALUES ('108', '3', '130304', '0', 'd', 'd', '', '', '2', '0', '2', '0', '1516152509');
INSERT INTO `hy_category` VALUES ('109', '3', '130304', '0', 'f', 'f', '', '', '1', '0', '1', '0', '1516152518');
INSERT INTO `hy_category` VALUES ('110', '3', '130304', '0', '43', '43', '', '', '1', '43', '2', '0', '1516152539');
INSERT INTO `hy_category` VALUES ('111', '3', '130304', '0', 'f', 'f', '', '', '1', '0', '2', '0', '1516152640');
INSERT INTO `hy_category` VALUES ('112', '3', '130304', '0', 'fdsa', 'fdsa', '', '', '1', '0', '2', '0', '1516154574');
INSERT INTO `hy_category` VALUES ('113', '3', '130304', '0', 'wweew', 'ewewe', '', '', '1', '0', '2', '0', '1516155147');
INSERT INTO `hy_category` VALUES ('114', '3', '130304', '0', 'wweew', 'ewewe', '', '', '1', '0', '1', '0', '1516155170');
INSERT INTO `hy_category` VALUES ('115', '0', '130300', '0', 'fd', 'fd', '', '', '1', '0', '1', '0', '1516155394');
INSERT INTO `hy_category` VALUES ('116', '0', '130300', '2', '十九大', '', 'http://dangjian.huiyi.t.weixinren.cn/upload//editor/201712/5a30e790d343d.png', 'djzt_sjd', '2', '100', '1', '0', '1516155428');
INSERT INTO `hy_category` VALUES ('117', '0', '130300', '11', '新时代', '', 'http://dangjian.huiyi.t.weixinren.cn/upload//editor/201712/5a30e7a5db310.png', 'djzt_xsd', '2', '100', '1', '0', '1516155430');
INSERT INTO `hy_category` VALUES ('118', '0', '130300', '5', '精神解读', '', 'http://dangjian.huiyi.t.weixinren.cn/upload//editor/201712/5a30e5203b08c.png', 'lxyz_jsjd', '1', '100', '1', '0', '1516155464');
INSERT INTO `hy_category` VALUES ('119', '0', '130300', '7', '理论指导', '', 'http://dangjian.huiyi.t.weixinren.cn/upload//editor/201712/5a30e5432eb4f.png', 'lxyz_llzd', '1', '100', '1', '0', '1516155466');
INSERT INTO `hy_category` VALUES ('120', '0', '130300', '12', '新闻', '', 'http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/editor/8620ea753857f86e85fa9d22661960cc.jpg', '', '3', '100', '1', '0', '1516155470');
INSERT INTO `hy_category` VALUES ('121', '0', '130300', '14', 'ufj', 'f', 'http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/editor/93ea5c39b2858d495dd587387d1a1741.png', '', '4', '100', '1', '0', '1516155474');
INSERT INTO `hy_category` VALUES ('122', '3', '130304', '15', '图书', '', 'http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/editor/001524cd7f020b1f195f20f461ed5194.jpg', '', '5', '100', '1', '0', '1516243671');
INSERT INTO `hy_category` VALUES ('123', '3', '130304', '0', '行测题', '', '', '', '7', '0', '1', '0', '1516329217');
INSERT INTO `hy_category` VALUES ('124', '3', '130304', '0', '数学题', '', '', '', '7', '0', '1', '0', '1516329234');

-- ----------------------------
-- Table structure for hy_collection
-- ----------------------------
DROP TABLE IF EXISTS `hy_collection`;
CREATE TABLE `hy_collection` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `collection_type` tinyint(1) unsigned NOT NULL COMMENT '收藏类型 1=风采 2=活动 101=两学一做 102=党建专题',
  `content_id` int(11) NOT NULL,
  `add_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hy_collection
-- ----------------------------
INSERT INTO `hy_collection` VALUES ('51', '188', '101', '10', '1514191061');
INSERT INTO `hy_collection` VALUES ('52', '188', '101', '11', '1514191064');
INSERT INTO `hy_collection` VALUES ('53', '188', '101', '3', '1514191084');
INSERT INTO `hy_collection` VALUES ('58', '17122010025893', '101', '4', '1514253458');
INSERT INTO `hy_collection` VALUES ('62', '17122010025893', '101', '3', '1514253489');
INSERT INTO `hy_collection` VALUES ('66', '17121211474354', '102', '6', '1514253585');
INSERT INTO `hy_collection` VALUES ('71', '17121211474354', '102', '4', '1514257391');
INSERT INTO `hy_collection` VALUES ('72', '17121211474354', '101', '4', '1514257427');
INSERT INTO `hy_collection` VALUES ('73', '17121211474354', '101', '10', '1514257436');
INSERT INTO `hy_collection` VALUES ('74', '17122720433916', '101', '12', '1514378946');
INSERT INTO `hy_collection` VALUES ('82', '17122720433916', '102', '14', '1514538135');
INSERT INTO `hy_collection` VALUES ('85', '17122809483784', '101', '12', '1514880200');
INSERT INTO `hy_collection` VALUES ('86', '17122809483784', '101', '17', '1514880204');
INSERT INTO `hy_collection` VALUES ('87', '17122809483784', '101', '21', '1515035113');
INSERT INTO `hy_collection` VALUES ('89', '17122809162726', '102', '12', '1515556653');
INSERT INTO `hy_collection` VALUES ('90', '18010517374964', '101', '24', '1515936267');

-- ----------------------------
-- Table structure for hy_config
-- ----------------------------
DROP TABLE IF EXISTS `hy_config`;
CREATE TABLE `hy_config` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `fkey` varchar(32) NOT NULL DEFAULT '' COMMENT '配置下标',
  `fval` text NOT NULL COMMENT '配置值',
  `type` varchar(30) NOT NULL COMMENT '配置分组',
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hy_config
-- ----------------------------
INSERT INTO `hy_config` VALUES ('1', 'xcx_api_host', 'https://dj.huiyimob.com', 'xiaocx');

-- ----------------------------
-- Table structure for hy_ebook
-- ----------------------------
DROP TABLE IF EXISTS `hy_ebook`;
CREATE TABLE `hy_ebook` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '支部ID',
  `ref_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '关联官方文章ID',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `desc` varchar(500) NOT NULL DEFAULT '' COMMENT '简介',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '分类',
  `detail` text NOT NULL COMMENT '详细',
  `sort` int(11) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `deep` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '章节层度，取值：1，2，3',
  `image` varchar(200) NOT NULL DEFAULT '' COMMENT '图片',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态：1-显示，0-隐藏',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `read_num` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '阅读次数',
  `collect_num` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `forward_num` mediumint(8) NOT NULL DEFAULT '0' COMMENT '收藏数量',
  `region_code` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT '地区编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='电子书';

-- ----------------------------
-- Records of hy_ebook
-- ----------------------------
INSERT INTO `hy_ebook` VALUES ('1', '3', '0', 'title', 'desc', '122', '魂牵梦萦', '100', '2', '魂牵梦萦', '1', '1', '1516243705', '0', '0', '0', '130304');
INSERT INTO `hy_ebook` VALUES ('2', '3', '0', 'title', 'desc', '122', '魂牵梦萦', '100', '2', '魂牵梦萦', '1', '0', '1516243745', '0', '0', '0', '130304');
INSERT INTO `hy_ebook` VALUES ('3', '3', '0', 'title', 'desc', '122', '魂牵梦萦', '100', '2', '魂牵梦萦', '1', '0', '1516243746', '0', '0', '0', '130304');
INSERT INTO `hy_ebook` VALUES ('4', '3', '0', 'title', 'desc', '122', '魂牵梦萦21', '100', '2', '魂牵梦萦21', '1', '0', '1516243749', '1', '0', '0', '130304');
INSERT INTO `hy_ebook` VALUES ('5', '3', '0', 'title', 'desc', '122', '魂牵梦萦21', '100', '1', '魂牵梦萦21', '1', '0', '1516243751', '0', '0', '0', '130304');
INSERT INTO `hy_ebook` VALUES ('6', '3', '0', 'title', 'desc', '122', '魂牵梦萦21', '100', '1', '魂牵梦萦21', '2', '0', '1516243755', '0', '0', '0', '130304');
INSERT INTO `hy_ebook` VALUES ('7', '3', '0', 'title', 'desc', '122', '魂牵梦萦21', '100', '3', '魂牵梦萦21', '2', '0', '1516243757', '0', '0', '0', '130304');
INSERT INTO `hy_ebook` VALUES ('8', '3', '1', '脸', '魂牵梦萦', '122', '&lt;p&gt;								&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;魂牵梦萦&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;							&lt;/p&gt;', '100', '3', 'http://dangjian.com/upload//editor/201712/5a34d98dde549.png', '2', '0', '1516247442', '18', '0', '0', '130304');
INSERT INTO `hy_ebook` VALUES ('9', '3', '4', '有', '魂牵梦萦', '122', '																														', '100', '2', 'http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/editor/308860c6c315324d1c41d662f0e6fc5e.jpg', '1', '0', '1516265095', '0', '0', '0', '130304');

-- ----------------------------
-- Table structure for hy_ebook_node
-- ----------------------------
DROP TABLE IF EXISTS `hy_ebook_node`;
CREATE TABLE `hy_ebook_node` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ebook_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '电子书ID',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `node_name` varchar(100) NOT NULL DEFAULT '' COMMENT '章节名称',
  `detail` text NOT NULL COMMENT '内容',
  `sort` int(11) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `node_code` bigint(20) NOT NULL DEFAULT '0' COMMENT '章节编码，1xxxxyyyyzzzz',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '层级，取值：1，2，3',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='电子书章节表';

-- ----------------------------
-- Records of hy_ebook_node
-- ----------------------------
INSERT INTO `hy_ebook_node` VALUES ('1', '8', '', '第一章', '', '100', '1000100000000', '1', '0', '1516247442');
INSERT INTO `hy_ebook_node` VALUES ('2', '8', '', '第一节', '', '100', '1000100010000', '2', '0', '1516247442');
INSERT INTO `hy_ebook_node` VALUES ('3', '8', '开始、、、', '第1回', '    玉板之上，伴随着两支源纹笔的交错落下，一道道源痕成形，然后开始彼此侵蚀吞并，犹如战场一般，无声之间，透着一种惨烈。\r\n\r\n    这种源纹博弈，与神魂强横无关，完全比拼的是对于源纹的理解。\r\n\r\n    周元站在夭夭身后，眼露惊异的望着这一幕。\r\n\r\n    他能够隐隐的感觉到，夭夭与那位灰衣老者每一次的落笔勾画源痕，都是极为的巧妙，那需要在源纹一道上拥有着极高的造诣。\r\n\r\n    至少，其中大部分的源痕，就连周元，都是看得眉心微微胀痛。\r\n\r\n    “这老头是谁？竟然能够和夭夭姐以源纹博弈...”周元惊奇的看向那位面露肃然的灰衣老者，夭夭的源纹造诣，深不可测，这还是他第一次见到夭夭认真的模样。\r\n\r\n    不过显然，面对着认真的夭夭，那位灰衣老者也是感到极为的棘手，面色严肃。\r\n\r\n    两人你来我往，僵持了约莫一炷香的时间。\r\n\r\n    夭夭玉手轻轻抚摸着吞吞柔软的毛发，眸子瞥了一眼老者，道：“这位老先生，你攻伐许久，都无法突破，何必苦撑？”\r\n\r\n    灰衣老者吹了吹胡子，老脸有些挂不住，道：“小小女娃，猖狂得紧，我念你是小辈，方才屡屡留手。”\r\n\r\n    夭夭红唇一撇，道：“老先生，你和我之间，无非便是神魂差距而已，那是你年岁得来的优势，单单的论起源纹造诣与底蕴，你怕是不见得胜我。”\r\n\r\n    灰衣老者羞恼的道：“小女娃，不要以为长得漂亮就可以胡乱说话！”\r\n\r\n    “我修行源纹的时候，你还不知道有没出生呢！”\r\n\r\n    夭夭淡淡的道：“修炼时间久，还无法胜过我，只能说老先生还有待提高。”\r\n\r\n    她声音轻柔，但却毫不留情。\r\n\r\n    灰衣老者气得吹胡子瞪眼，片刻后袖袍一拂，只见得玉板上面的源痕便是被尽数的抹去，他哼了一声，道：“等我回去研究一下，下次过来破了你这防御。”\r\n\r\n    夭夭身后的周元忍不住的笑出声来，这个老头，脸皮真的是厚，竟然这种事都做得出来。\r\n\r\n    听到周元的笑声，灰衣老者抬头瞪了他一眼，隐隐间竟是有着一股威势流露。\r\n\r\n    周元也被震了一下，停止笑声，惊疑不定的看向灰衣老者，这个老头，似乎很不一般啊...\r\n\r\n    “等你赢了我，再来耍威风吧。”夭夭出声道。\r\n\r\n    听到夭夭半点都不客气的话，灰衣老者忍不住的道：“小女娃，你知不知道老夫是谁？也敢这么说话！”\r\n\r\n    “不知道，没兴趣。”夭夭那绝美的脸颊上浮现出一抹微笑，道。\r\n\r\n    灰衣老者瞪着夭夭半晌，然后苦笑出声，道：“这次的外山弟子中，怎么出了你这么一个怪胎...”\r\n\r\n    “不过你这源纹造诣，的确非常精深，看来是家学渊源吧？”灰衣老者若有深意的道。\r\n\r\n    夭夭淡淡的道：“怎么，苍玄宗还不准人带艺入宗啊？”\r\n\r\n    灰衣老者笑道：“那倒不是，只要不对我苍玄宗有害，我苍玄宗皆可接受。”\r\n\r\n    他笑眯眯的道：“小女娃，我观你在源纹上的天赋，可谓是卓绝，那你对进入“灵纹峰”可有兴趣？如果有兴趣的话，我现在就可以推荐你进入灵纹峰，成为内山弟子。”\r\n\r\n    周元微惊，诸多弟子想要成为内山弟子，都要经历选山大典，但眼前这个老头竟然能够越过这重考验，看来身份不低啊。\r\n\r\n    他如今已是知晓，灵纹峰便是苍玄宗七峰之一，而且此峰奇特，因为所有弟子都是主修源纹，据说宗内的那些修炼宝地“源山”，便是由灵纹峰所打造。\r\n\r\n    夭夭也是看了灰衣老者一眼，然后摇了摇头，道：“不去。”\r\n\r\n    灰衣老者一滞，显然也是没想到夭夭这么有脾气，这种能够直接成为内山弟子的机会都半点不在乎。\r\n\r\n    他伸出手指，指着夭夭，点了半晌，最终苦笑着摇了摇头，道：“罢了，也随你吧。”\r\n\r\n    “若是以后有兴趣想要进入“灵纹峰”的话，只需和我一声便可，我灵纹峰上，有着诸多古老源纹，可谓是资源雄厚。”\r\n\r\n    看得出来，他生出了爱才之心，毕竟夭夭展现出来的源纹天赋，实在是让得他感到惊艳，以往所遇见的那些弟子，从未有过如此天赋。\r\n\r\n    听到古老源纹，夭夭眸子倒是动了动，但最终还是摇了摇头，周元势必要进入圣源峰获取那第二道圣纹的，所以她并不愿意去其他的地方。\r\n\r\n    灰衣老者无奈的一笑，也就不再勉强。\r\n\r\n    “你这源痕，也有些独到之处，待我回去研究研究如何破解。”他慢悠悠的站起身来，目光忽的看了周元一眼，道：“你这小娃子，最近也是搞得外山不太平啊。”\r\n\r\n    他上上下下的打量着周元，道：“不过你竟能帮人感应体内窍穴，倒是有些能耐，这可是需要极为敏锐的神魂感知才有可能做到。”\r\n\r\n    周元笑笑没有说话，他自然不会暴露破障圣纹的存在。\r\n\r\n    “你们这两个小娃子哟，不简单。”\r\n\r\n    灰衣老者笑眯眯的说了一声，然后就转身慢吞吞的离去。\r\n\r\n    周元望着他离去的背影，道：“夭夭姐，他是谁啊？”\r\n\r\n    夭夭小手掩着嘴懒洋洋的打了一个哈欠，道：“不知道，先前我在这里研究源纹，他便是窜了出来，说要指点我，我就说他本事不足以指点我。”\r\n\r\n    “于是他就恼了，要和我比试源纹造诣，结果也没赢得过我。”\r\n\r\n    周元咧咧嘴，夭夭姐，你可真是老霸道了。\r\n\r\n    这位灰衣老者一看就不简单，在苍玄宗应该有些地位，结果你却如此直白的说人家本事不够...也亏得这灰衣老头脾性还不错，不然就要翻脸了。\r\n\r\n    周元摇了摇头，也就不再多想，笑道：“不管他了，走吧，今日再带你们去那百香楼吃个痛快。”\r\n\r\n    他拍了拍腰间乾坤囊，有些得意的道：“咱现在有钱。”\r\n\r\n    吼！\r\n\r\n    夭夭对此没什么反应，吞吞却是兴奋的低吼一声，兽瞳都是放出了光。\r\n\r\n    之前好几次路过百香楼，吞吞都想再度冲进去，但却都是被早有准备的周元强行拖了回来，因为那时候的周元，实在囊中羞涩，已经吃不起了。\r\n\r\n    而如今大赚了一笔，周元自然也打算好好犒劳一下吞吞，毕竟万一那祝岳发了疯要来找他麻烦，到时候还是得将吞吞丢出去卖力气。', '100', '1000100010001', '3', '0', '1516247442');
INSERT INTO `hy_ebook_node` VALUES ('4', '8', '出发了？？', '第2回', '    周元站在夭夭身后，眼露惊异的望着这一幕。\r\n\r\n    他能够隐隐的感觉到，夭夭与那位灰衣老者每一次的落笔勾画源痕，都是极为的巧妙，那需要在源纹一道上拥有着极高的造诣。\r\n\r\n    至少，其中大部分的源痕，就连周元，都是看得眉心微微胀痛。\r\n\r\n    “这老头是谁？竟然能够和夭夭姐以源纹博弈...”周元惊奇的看向那位面露肃然的灰衣老者，夭夭的源纹造诣，深不可测，这还是他第一次见到夭夭认真的模样。\r\n\r\n    不过显然，面对着认真的夭夭，那位灰衣老者也是感到极为的棘手，面色严肃。\r\n\r\n    两人你来我往，僵持了约莫一炷香的时间。\r\n\r\n    夭夭玉手轻轻抚摸着吞吞柔软的毛发，眸子瞥了一眼老者，道：“这位老先生，你攻伐许久，都无法突破，何必苦撑？”\r\n\r\n    灰衣老者吹了吹胡子，老脸有些挂不住，道：“小小女娃，猖狂得紧，我念你是小辈，方才屡屡留手。”\r\n\r\n    夭夭红唇一撇，道：“老先生，你和我之间，无非便是神魂差距而已，那是你年岁得来的优势，单单的论起源纹造诣与底蕴，你怕是不见得胜我。”\r\n\r\n    灰衣老者羞恼的道：“小女娃，不要以为长得漂亮就可以胡乱说话！”\r\n\r\n    “我修行源纹的时候，你还不知道有没出生呢！”\r\n\r\n    夭夭淡淡的道：“修炼时间久，还无法胜过我，只能说老先生还有待提高。”\r\n\r\n    她声音轻柔，但却毫不留情。\r\n\r\n    灰衣老者气得吹胡子瞪眼，片刻后袖袍一拂，只见得玉板上面的源痕便是被尽数的抹去，他哼了一声，道：“等我回去研究一下，下次过来破了你这防御。”\r\n\r\n    夭夭身后的周元忍不住的笑出声来，这个老头，脸皮真的是厚，竟然这种事都做得出来。\r\n\r\n    听到周元的笑声，灰衣老者抬头瞪了他一眼，隐隐间竟是有着一股威势流露。\r\n\r\n    周元也被震了一下，停止笑声，惊疑不定的看向灰衣老者，这个老头，似乎很不一般啊...\r\n\r\n    “等你赢了我，再来耍威风吧。”夭夭出声道。\r\n\r\n    听到夭夭半点都不客气的话，灰衣老者忍不住的道：“小女娃，你知不知道老夫是谁？也敢这么说话！”\r\n\r\n    “不知道，没兴趣。”夭夭那绝美的脸颊上浮现出一抹微笑，道。\r\n\r\n    灰衣老者瞪着夭夭半晌，然后苦笑出声，道：“这次的外山弟子中，怎么出了你这么一个怪胎...”\r\n\r\n    “不过你这源纹造诣，的确非常精深，看来是家学渊源吧？”灰衣老者若有深意的道。\r\n\r\n    夭夭淡淡的道：“怎么，苍玄宗还不准人带艺入宗啊？”\r\n\r\n    灰衣老者笑道：“那倒不是，只要不对我苍玄宗有害，我苍玄宗皆可接受。”\r\n\r\n    他笑眯眯的道：“小女娃，我观你在源纹上的天赋，可谓是卓绝，那你对进入“灵纹峰”可有兴趣？如果有兴趣的话，我现在就可以推荐你进入灵纹峰，成为内山弟子。”\r\n\r\n    周元微惊，诸多弟子想要成为内山弟子，都要经历选山大典，但眼前这个老头竟然能够越过这重考验，看来身份不低啊。\r\n\r\n    他如今已是知晓，灵纹峰便是苍玄宗七峰之一，而且此峰奇特，因为所有弟子都是主修源纹，据说宗内的那些修炼宝地“源山”，便是由灵纹峰所打造。\r\n\r\n    夭夭也是看了灰衣老者一眼，然后摇了摇头，道：“不去。”\r\n\r\n    灰衣老者一滞，显然也是没想到夭夭这么有脾气，这种能够直接成为内山弟子的机会都半点不在乎。\r\n\r\n    他伸出手指，指着夭夭，点了半晌，最终苦笑着摇了摇头，道：“罢了，也随你吧。”\r\n\r\n    “若是以后有兴趣想要进入“灵纹峰”的话，只需和我一声便可，我灵纹峰上，有着诸多古老源纹，可谓是资源雄厚。”\r\n\r\n    看得出来，他生出了爱才之心，毕竟夭夭展现出来的源纹天赋，实在是让得他感到惊艳，以往所遇见的那些弟子，从未有过如此天赋。\r\n\r\n    听到古老源纹，夭夭眸子倒是动了动，但最终还是摇了摇头，周元势必要进入圣源峰获取那第二道圣纹的，所以她并不愿意去其他的地方。\r\n\r\n    灰衣老者无奈的一笑，也就不再勉强。\r\n\r\n    “你这源痕，也有些独到之处，待我回去研究研究如何破解。”他慢悠悠的站起身来，目光忽的看了周元一眼，道：“你这小娃子，最近也是搞得外山不太平啊。”\r\n\r\n    他上上下下的打量着周元，道：“不过你竟能帮人感应体内窍穴，倒是有些能耐，这可是需要极为敏锐的神魂感知才有可能做到。”\r\n\r\n    周元笑笑没有说话，他自然不会暴露破障圣纹的存在。\r\n\r\n    “你们这两个小娃子哟，不简单。”\r\n\r\n    灰衣老者笑眯眯的说了一声，然后就转身慢吞吞的离去。\r\n\r\n    周元望着他离去的背影，道：“夭夭姐，他是谁啊？”\r\n\r\n    夭夭小手掩着嘴懒洋洋的打了一个哈欠，道：“不知道，先前我在这里研究源纹，他便是窜了出来，说要指点我，我就说他本事不足以指点我。”\r\n\r\n    “于是他就恼了，要和我比试源纹造诣，结果也没赢得过我。”\r\n\r\n    周元咧咧嘴，夭夭姐，你可真是老霸道了。\r\n\r\n    这位灰衣老者一看就不简单，在苍玄宗应该有些地位，结果你却如此直白的说人家本事不够...也亏得这灰衣老头脾性还不错，不然就要翻脸了。\r\n\r\n    周元摇了摇头，也就不再多想，笑道：“不管他了，走吧，今日再带你们去那百香楼吃个痛快。”\r\n\r\n    他拍了拍腰间乾坤囊，有些得意的道：“咱现在有钱。”\r\n\r\n    吼！\r\n\r\n    夭夭对此没什么反应，吞吞却是兴奋的低吼一声，兽瞳都是放出了光。\r\n\r\n    之前好几次路过百香楼，吞吞都想再度冲进去，但却都是被早有准备的周元强行拖了回来，因为那时候的周元，实在囊中羞涩，已经吃不起了。\r\n\r\n    而如今大赚了一笔，周元自然也打算好好犒劳一下吞吞，毕竟万一那祝岳发了疯要来找他麻烦，到时候还是得将吞吞丢出去卖力气。', '100', '1000100010002', '3', '0', '1516247442');
INSERT INTO `hy_ebook_node` VALUES ('5', '8', '停下来', '第3回', '    山涧中，狂暴的源气自周元的体内横扫开来，宛如金色的风卷，缠绕在其周身，一股威势，渐渐的升起。\r\n\r\n    而在其对面，祝峰等人也是因为周元突然间的凌厉怔了怔，不过在听到周元那番话后，却又是个个勃然大怒起来。\r\n\r\n    “呵呵，你可还真是嚣张啊！”祝峰怒笑出声，眼神最后充满着讥讽，轻蔑的道：“还一个打一群？你以为你是谁？”\r\n\r\n    “你真觉得打败了韩山，你就有资格跟我们这些真正的一等弟子叫嚣了？”\r\n\r\n    祝峰等人面色玩味，充满着蔑意，显然觉得周元极为的可笑，毕竟不管怎么说，周元在他们眼中也不过只是太初境一重天。\r\n\r\n    而周元之前在源山，一拳打败了韩山的确有些震撼人心，但那对于他们而言，又算得了什么？\r\n\r\n    韩山不过一个二等弟子罢了，实力也只是太初境二重天。\r\n\r\n    所以，当他们看见周元竟然在他们的面前竟然也敢摆出这幅样子时，方才会感到极为的滑稽与可笑，犹如看待一个小丑般。\r\n\r\n    祝峰笑了半晌，方才止住，不过对于周元主动跳出来，他心头也是微喜的，毕竟他今日来，的确就是要找麻烦的。\r\n\r\n    所以就算周元不主动出声，他今天也不会轻易将其放过。\r\n\r\n    “一群打你一个就算了，我们怕跌份。”祝峰摇了摇头，眼神泛着一丝寒意的瞧着周元，道：“你的花言巧语对我可没什么用，所以我会用拳头，当着红衣师妹的面，让你显出你那无用的真面目！”\r\n\r\n    他一步踏出，雄浑源气陡然爆发开来，太初境三重天的威势，显露无疑。\r\n\r\n    那一旁的沈万金都是被祝峰的源气威势所震慑，面色微变，眼中有些焦虑，毕竟这祝峰可不算是无名之辈，在一等弟子中都是名气不小。\r\n\r\n    眼见着就要打起来了，沈万金目光不断的看向山涧外。\r\n\r\n    咻！\r\n\r\n    而就在此时，忽有数道破风声也是传来，然后急速的落在了溪畔，一道冷喝声随之响起：“祝峰，想要对付周元师弟，你还得问问我乔修同不同意！”\r\n\r\n    数道光影落下，露出身影， 当先一人，自然便是乔修。\r\n\r\n    显然，他也是听到了消息，怕周元吃亏，所以赶紧带人过来帮忙。\r\n\r\n    乔修面目肃然，周身涌动着强横的源气波动，这半个月来，他在外山弟子中也是混得风生水起，还得了外山十大弟子的称号，虽然只是排名第十，但身为外大陆的弟子，能够在圣州本土弟子占据绝对上风的局面中进入前十，已足以说明他的能力。\r\n\r\n    那祝峰瞧得乔修露面，眉头也是一皱，眼中有着一抹忌惮，毕竟这乔修好歹也是在十大外山弟子中排名第十，比起他来，的确要厉害一些。\r\n\r\n    不过虽说如此，但祝峰面庞并没有什么惧色，只是淡淡的道：“乔修，这里的事与你无关，你最好不要多管闲事。”\r\n\r\n    乔修沉声道：“祝峰，你不要太咄咄逼人了，周元师弟可不是惹事的人，何必总来招惹他。”\r\n\r\n    祝峰嘴角掀起一抹戏谑，道：“这可不是我们要惹事，刚才他可还在说，要一个打我们一群呢。”\r\n\r\n    其他人也是哄笑出声。\r\n\r\n    乔修面色一沉，道：“若你执意捣乱，那就怪不得我了。”\r\n\r\n    祝峰眼神也是一寒，道：“乔修，你不要以为我怕了你，跟你好生说话是给你一分面子，你们也有人在我大哥那里学习化虚术吧？”\r\n\r\n    他话语最后的威胁之意，已是清清楚楚。\r\n\r\n    乔修眼神也是微变，显然是没想到这祝峰如此的无耻，竟然敢用此事来做威胁。\r\n\r\n    不过他也并非是畏首畏尾的人，既然现了身，自然不会被祝峰轻易的吓退，所以他也不多说废话，周身源气鼓动，眼神凌厉的看向祝峰。\r\n\r\n    祝峰也是没想到这乔修如此的顽固，面色有些难看。\r\n\r\n    “呵呵，乔修，别人间的事，就你喜欢狗拿耗子多管闲事，既然你这么闲，那就来跟我过两招吧。”而就在祝峰面色难看时，一道笑声，忽的响起，只见得一道光影掠来，落在了山涧中。\r\n\r\n    那是一名身形枯瘦的男子，看上去如猴一般，双目内陷，但自其体内散发出来的源气波动，竟是丝毫不比乔修弱。\r\n\r\n    “是孙惊雷。”沈万金瞧得此人，不由得暗自惊呼出声。\r\n\r\n    周元双目微眯，这个名字，他听过，据说在那外山十大弟子中，排名第九，比乔修还靠前一位。\r\n\r\n    显然，这祝峰早已知晓乔修或许会插手，所以也请来了高手助阵。\r\n\r\n    那乔修见到那身形如猴般的青年，眼神也是一沉，心头暗叹一声，看来今日，那祝峰说什么都不愿意善罢甘休了。\r\n\r\n    “乔修师兄，这里的事，交给我便成了。”周元的目光也是在此时看来，冲着乔修微微一笑，道。\r\n\r\n    对于乔修几次的相护，他也看在眼中，对其颇有好感。\r\n\r\n    乔修苦笑了一声，只能道：“周元师弟小心一些。”\r\n\r\n    虽然他很看好周元的未来，但此时的后者，毕竟只是太初境一重天，而反观那祝峰，却是三重天中的好手，这如果冲突起来，恐怕周元讨不到好处。\r\n\r\n    周元洒然笑了笑，抬头看向那祝峰，道：“最后一次问你，你确定你们不一起吗？”\r\n\r\n    祝峰面色有些阴沉，冷笑道：“还敢耍嘴皮子，看我待会不把你这张嘴给踩烂！”\r\n\r\n    轰！\r\n\r\n    他也是再没半点犹豫，源气猛然爆发，眼神变得凌厉起来，竟直接是率先出手，身形如电，扑向周元。\r\n\r\n    他一掌横拍，竟是化出道道掌影，携带着风雷，直接对着周元周身要害笼罩而去。\r\n\r\n    这祝峰一出手，也是极为的凶狠，半点不留情面。\r\n\r\n    乔修，沈万金他们见状，都是眼神紧张。\r\n\r\n    因为他们发现周元身形动也不动，仿佛并不打算避开。\r\n\r\n    “在我面前，还敢如此托大，你以为我是韩山不成？”\r\n\r\n    祝峰森然一笑，只觉得周元太过的愚蠢，但他不仅未曾收力，反而出手愈发凶悍，最后道道掌影，尽数的落在了周元身躯之上。\r\n\r\n    咚咚！\r\n\r\n    低沉的声音不断的响起，狂风肆虐，周元周身的地面直接是被震裂开来。\r\n\r\n    山涧中，一道道目光都是紧紧的注视着。\r\n\r\n    “那周元，真是太狂妄了，面对着祝锋师兄的攻击，竟然躲都不躲？真当他是金刚不坏吗？”那跟着祝峰前来的众人，皆是嘲笑出声。\r\n\r\n    那里的烟尘渐渐散去。\r\n\r\n    不过下一刻，他们嘴角的嘲笑缓缓的凝固下来。\r\n\r\n    只见得那里，周元依旧站着，身影不动，面色淡漠，在他的身体上，并没有出现任何的伤势，仿佛先前祝峰的攻势，对他竟然没有半点的作用一般。\r\n\r\n    “怎么可能？！”一道道惊呼声响起。\r\n\r\n    “不可能！”祝峰的眼瞳也是猛的一缩，先前他可并没有留手，而且每一道攻击都是落在了周元身体上，但为何每一道攻击，都会犹如石落大海，毫无反应？\r\n\r\n    周元神色毫无波动，他只是皱眉望着祝峰，淡淡的道：“你没吃饭？”\r\n\r\n    祝峰面色羞怒，一声暴喝，源气疯狂的在其掌心汇聚，猛的五指紧握，一拳轰出，拳风滚滚，带起闷雷之声。\r\n\r\n    咚！\r\n\r\n    足以将山岩轰成碎末的一拳，落在了周元胸膛上。\r\n\r\n    在周元衣服之下，他的胸膛部位，变得虚化了许多，但同时又有着紫金色的玄蟒鳞浮现。\r\n\r\n    紫金玄蟒鳞，本就具备着强大的防御力，再加上化虚术化解了部分力量，于是，那祝峰倾尽全力的一拳，竟是连周元的防御都无法穿透。\r\n\r\n    所以周元的身体，只是微微一晃，便是平复下来。\r\n\r\n    他盯着祝峰，道：“看来你果然是没吃饭，力道软绵绵的。”\r\n\r\n    但其他人却是直接看傻了...\r\n\r\n    “他的防御这么强？！”就连乔修与那孙惊雷都是眼瞳一缩，因为就算是换作他们，恐怕都无法以肉身硬接祝峰的全力一击，还毫发无损。\r\n\r\n    祝峰也是面色浮现惊骇，他望着周元的身躯，忽然察觉到后者的胸膛部位变得虚化了许多，当即似是明白了什么，当即那惊骇欲绝的声音，便是尖锐的响了起来。\r\n\r\n    “你，你修成化虚术第一重了？！”', '100', '1000100010003', '3', '0', '1516247442');
INSERT INTO `hy_ebook_node` VALUES ('6', '8', '', '第二节', '', '100', '1000100020000', '2', '0', '1516247442');
INSERT INTO `hy_ebook_node` VALUES ('7', '8', '', '第二章', '', '100', '1000200000000', '1', '0', '1516247442');
INSERT INTO `hy_ebook_node` VALUES ('8', '8', '', '第三章', '', '100', '1000300000000', '1', '0', '1516247442');
INSERT INTO `hy_ebook_node` VALUES ('9', '8', '', '第四章', '', '100', '1000400000000', '1', '0', '1516261540');
INSERT INTO `hy_ebook_node` VALUES ('10', '8', '', '第五章', '', '100', '1000500000000', '1', '0', '1516261638');
INSERT INTO `hy_ebook_node` VALUES ('11', '8', '', '第一节', '', '100', '1000400010000', '2', '0', '1516261672');
INSERT INTO `hy_ebook_node` VALUES ('12', '8', '', '第二节', '', '100', '1000400020000', '2', '0', '1516261689');
INSERT INTO `hy_ebook_node` VALUES ('13', '8', 'title', 'node_namtitlee', 'detail', '100', '1000400020001', '3', '0', '1516261739');

-- ----------------------------
-- Table structure for hy_even
-- ----------------------------
DROP TABLE IF EXISTS `hy_even`;
CREATE TABLE `hy_even` (
  `title` varchar(255) NOT NULL COMMENT '标题',
  `even_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `content` text NOT NULL COMMENT '活动内容',
  `location` varchar(255) NOT NULL COMMENT '活动地点',
  `starttime` varchar(20) NOT NULL COMMENT '活动时间',
  `peoplenum` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '活动人数',
  `partakenum` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '参与人数',
  `photo` varchar(255) NOT NULL COMMENT '活动图片',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '审核状态 1默认通过 2不通过',
  `top` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '置顶状态 1置顶 2默认不置顶',
  `branch_id` int(11) NOT NULL DEFAULT '0' COMMENT '支部ID',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=正常 1=已删除',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  PRIMARY KEY (`even_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hy_even
-- ----------------------------
INSERT INTO `hy_even` VALUES ('测试活动1', '8', '测试内容1\r\n', '测试地点1', '测试开始时间', '11', '0', '/UE/5a2f50ebb2c73.jpg', '1513050358', '1', '1', '2', '0', '8');
INSERT INTO `hy_even` VALUES ('活动标题1', '9', '啊实打实的', '会哦东地点1', '2018-12-12', '502', '0', 'base/2017-12-12/5a2f535a8cdb8.jpg', '1513050971', '1', '2', '1', '0', '188');
INSERT INTO `hy_even` VALUES ('周末活动', '10', '活动内容', '广州市天河区', '2017-12-12', '10', '2', 'base/2017-12-12/5a2f77d9f3779.jpg', '1513060388', '1', '1', '1', '0', '17120917454970');
INSERT INTO `hy_even` VALUES ('我的活动发布', '11', '活动内容', '广州珠村', '2017-12-20', '30', '0', 'base/2017-12-18/5a3766688d5df.jpg', '1513580140', '1', '2', '1', '0', '17121211474354');
INSERT INTO `hy_even` VALUES ('活动NEW', '17', '啊大苏打', '广州天河', '2017-12-18', '100', '0', 'base/2017-12-18/5a3781479d5c7.jpg', '1513587017', '1', '2', '1', '0', '17121211474354');
INSERT INTO `hy_even` VALUES ('123', '24', 'asdasd', '134455', '2020-12-31', '20', '1', 'base/2017-12-29/5a46112df2034.png', '1514541361', '1', '2', '1', '0', '17121211474354');
INSERT INTO `hy_even` VALUES ('元旦聚会', '26', '聚会', '天河区', '2018-01-06', '20', '0', 'base/2018-01-02/5a4b0268f3f18.jpg', '1514865261', '1', '1', '6', '0', '17122911492615');
INSERT INTO `hy_even` VALUES ('团体活动', '31', '参与活动的送图片', '广州塔', '2018-01-05', '16777215', '1', 'base/2018-01-02/5a4b3bf117921.jpg', '1514880010', '1', '2', '4', '0', '17122809483784');
INSERT INTO `hy_even` VALUES ('活动1', '32', ' 啊？多少人', '广州市', '2018-01-17', '200', '1', 'base/2018-01-03/5a4c8907e41e4.jpg', '1514965293', '1', '2', '4', '0', '17122809483784');
INSERT INTO `hy_even` VALUES ('最新活动', '33', '打羽毛球', '广州天河', '2018-01-17', '30', '3', 'http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/editor/7/b71f2e648851655fa9754a2c8dc71b96.jpg', '1515119893', '1', '2', '7', '0', '18010510133514');

-- ----------------------------
-- Table structure for hy_forward_log
-- ----------------------------
DROP TABLE IF EXISTS `hy_forward_log`;
CREATE TABLE `hy_forward_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `forward_type` tinyint(1) unsigned NOT NULL COMMENT '转发类型 1=风采 2=活动 101=两学一做 102=党建专题',
  `content_id` int(11) NOT NULL,
  `add_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hy_forward_log
-- ----------------------------
INSERT INTO `hy_forward_log` VALUES ('66', '188', '101', '4', '1513319976');
INSERT INTO `hy_forward_log` VALUES ('67', '188', '101', '7', '1513320117');
INSERT INTO `hy_forward_log` VALUES ('68', '2147483647', '1', '91', '1514949016');
INSERT INTO `hy_forward_log` VALUES ('69', '2147483647', '1', '96', '1515119573');
INSERT INTO `hy_forward_log` VALUES ('70', '2147483647', '1', '97', '1515492924');

-- ----------------------------
-- Table structure for hy_group
-- ----------------------------
DROP TABLE IF EXISTS `hy_group`;
CREATE TABLE `hy_group` (
  `group_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '组ID',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '组状态1=启用 2=关闭',
  `group_name` varchar(255) NOT NULL COMMENT '组名称',
  `is_delete` tinyint(1) NOT NULL COMMENT '是否删除',
  `branch_id` int(255) NOT NULL COMMENT '支部ID',
  `region_code` int(11) NOT NULL DEFAULT '0' COMMENT '所在地区',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `member_num` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '党员数量',
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hy_group
-- ----------------------------
INSERT INTO `hy_group` VALUES ('17', '2', '广州石化分公司党支部', '0', '1', '440601', '1515751249', '0');
INSERT INTO `hy_group` VALUES ('18', '1', '广州天燃气分公司党支部', '0', '1', '440601', '1515751261', '0');
INSERT INTO `hy_group` VALUES ('19', '1', '老王科技有限公司党支部', '0', '4', '0', '1516076297', '4');
INSERT INTO `hy_group` VALUES ('20', '1', '支部一', '0', '6', '1', '1516069063', '0');
INSERT INTO `hy_group` VALUES ('21', '1', '绥宁支部', '0', '7', '0', '1516094321', '4');
INSERT INTO `hy_group` VALUES ('22', '1', '测试', '0', '4', '1', '1516094162', '1');

-- ----------------------------
-- Table structure for hy_group_member
-- ----------------------------
DROP TABLE IF EXISTS `hy_group_member`;
CREATE TABLE `hy_group_member` (
  `member_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '支部成员ID',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '党员ID',
  `group_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '支部ID',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '加入时间',
  `leave_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '离开时间',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1801161813583769 DEFAULT CHARSET=utf8 COMMENT='支部成员列表';

-- ----------------------------
-- Records of hy_group_member
-- ----------------------------
INSERT INTO `hy_group_member` VALUES ('1801161210224880', '18011612102278', '19', '1516075822', '0');
INSERT INTO `hy_group_member` VALUES ('1801161217239165', '1801161217239537', '19', '1516076243', '0');
INSERT INTO `hy_group_member` VALUES ('1801161357357349', '1801161357353693', '19', '1516082255', '0');
INSERT INTO `hy_group_member` VALUES ('1801161721324422', '1801161721329740', '21', '1516094492', '0');
INSERT INTO `hy_group_member` VALUES ('1801161728086700', '1801161728081780', '22', '1516094888', '0');
INSERT INTO `hy_group_member` VALUES ('1801161810288143', '1801161810285112', '21', '1516097428', '0');
INSERT INTO `hy_group_member` VALUES ('1801161812036755', '1801161812035760', '21', '1516097523', '0');
INSERT INTO `hy_group_member` VALUES ('1801161813583768', '1801161813587290', '21', '1516097638', '0');

-- ----------------------------
-- Table structure for hy_like_log
-- ----------------------------
DROP TABLE IF EXISTS `hy_like_log`;
CREATE TABLE `hy_like_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `like_type` tinyint(1) unsigned NOT NULL COMMENT '点赞类型 1=风采 2=活动 101=两学一做 102=党建专题',
  `content_id` int(11) NOT NULL,
  `add_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hy_like_log
-- ----------------------------
INSERT INTO `hy_like_log` VALUES ('98', '17121211474354', '1', '53', '1513258866');
INSERT INTO `hy_like_log` VALUES ('104', '188', '1', '53', '1513259085');
INSERT INTO `hy_like_log` VALUES ('105', '188', '1', '54', '1513259368');
INSERT INTO `hy_like_log` VALUES ('106', '17121211474354', '1', '55', '1513259461');
INSERT INTO `hy_like_log` VALUES ('107', '17121211474354', '1', '56', '1513259481');
INSERT INTO `hy_like_log` VALUES ('108', '3', '1', '55', '1513301289');
INSERT INTO `hy_like_log` VALUES ('110', '188', '1', '55', '1513301351');
INSERT INTO `hy_like_log` VALUES ('111', '17121211474354', '1', '54', '1513301585');
INSERT INTO `hy_like_log` VALUES ('112', '17121211474354', '1', '57', '1513301738');
INSERT INTO `hy_like_log` VALUES ('113', '188', '1', '56', '1513304190');
INSERT INTO `hy_like_log` VALUES ('114', '188', '1', '57', '1513307839');
INSERT INTO `hy_like_log` VALUES ('115', '17121315513435', '1', '53', '1513310053');
INSERT INTO `hy_like_log` VALUES ('116', '17121315513435', '1', '54', '1513310066');
INSERT INTO `hy_like_log` VALUES ('117', '17121315513435', '1', '56', '1513310074');
INSERT INTO `hy_like_log` VALUES ('118', '17121315513435', '1', '57', '1513310251');
INSERT INTO `hy_like_log` VALUES ('119', '17120917454970', '1', '59', '1513317970');
INSERT INTO `hy_like_log` VALUES ('120', '3', '1', '60', '1513318068');
INSERT INTO `hy_like_log` VALUES ('121', '3', '1', '61', '1513318196');
INSERT INTO `hy_like_log` VALUES ('123', '3', '1', '59', '1513319447');
INSERT INTO `hy_like_log` VALUES ('124', '188', '1', '60', '1513319714');
INSERT INTO `hy_like_log` VALUES ('125', '188', '1', '59', '1513319724');
INSERT INTO `hy_like_log` VALUES ('126', '17121211474354', '1', '59', '1513324674');
INSERT INTO `hy_like_log` VALUES ('127', '17121211474354', '1', '60', '1513324678');
INSERT INTO `hy_like_log` VALUES ('128', '17121211474354', '1', '61', '1513324693');
INSERT INTO `hy_like_log` VALUES ('129', '17120917454970', '1', '61', '1513326599');
INSERT INTO `hy_like_log` VALUES ('130', '17120917454970', '1', '60', '1513326661');
INSERT INTO `hy_like_log` VALUES ('131', '17121510213494', '1', '59', '1513329262');
INSERT INTO `hy_like_log` VALUES ('132', '17121211474354', '1', '62', '1513330499');
INSERT INTO `hy_like_log` VALUES ('133', '17121517350938', '1', '61', '1513330592');
INSERT INTO `hy_like_log` VALUES ('134', '17121211474354', '1', '63', '1513583581');
INSERT INTO `hy_like_log` VALUES ('135', '17121517350938', '1', '66', '1513588582');
INSERT INTO `hy_like_log` VALUES ('136', '17121517350938', '1', '67', '1513588711');
INSERT INTO `hy_like_log` VALUES ('137', '17121211474354', '1', '67', '1513590931');
INSERT INTO `hy_like_log` VALUES ('138', '17121211474354', '1', '66', '1513590964');
INSERT INTO `hy_like_log` VALUES ('139', '17122010025893', '1', '68', '1513735436');
INSERT INTO `hy_like_log` VALUES ('140', '17122010025893', '1', '67', '1513735440');
INSERT INTO `hy_like_log` VALUES ('141', '17122010025893', '1', '64', '1513735459');
INSERT INTO `hy_like_log` VALUES ('142', '17122010025893', '1', '63', '1513735467');
INSERT INTO `hy_like_log` VALUES ('143', '17122010025893', '1', '62', '1513735470');
INSERT INTO `hy_like_log` VALUES ('144', '17122010025893', '1', '61', '1513735491');
INSERT INTO `hy_like_log` VALUES ('145', '17122010025893', '1', '66', '1514252892');
INSERT INTO `hy_like_log` VALUES ('146', '17122720433916', '1', '69', '1514379247');
INSERT INTO `hy_like_log` VALUES ('149', '17122809483784', '1', '69', '1514426646');
INSERT INTO `hy_like_log` VALUES ('150', '17122720433916', '1', '80', '1514538631');
INSERT INTO `hy_like_log` VALUES ('151', '17122721011120', '1', '81', '1514539774');
INSERT INTO `hy_like_log` VALUES ('152', '17122809483784', '1', '84', '1514879860');
INSERT INTO `hy_like_log` VALUES ('153', '17122809483784', '1', '83', '1514879863');
INSERT INTO `hy_like_log` VALUES ('154', '17122809483784', '1', '86', '1514880671');
INSERT INTO `hy_like_log` VALUES ('155', '17122809483784', '1', '85', '1514880672');
INSERT INTO `hy_like_log` VALUES ('156', '17122809483784', '1', '91', '1514943531');
INSERT INTO `hy_like_log` VALUES ('157', '17122809483784', '1', '87', '1514943534');
INSERT INTO `hy_like_log` VALUES ('158', '17122809483784', '1', '90', '1514943535');
INSERT INTO `hy_like_log` VALUES ('159', '17122809483784', '1', '92', '1514945412');
INSERT INTO `hy_like_log` VALUES ('160', '18010517374964', '1', '96', '1515146098');

-- ----------------------------
-- Table structure for hy_log_read
-- ----------------------------
DROP TABLE IF EXISTS `hy_log_read`;
CREATE TABLE `hy_log_read` (
  `log_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `article_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '文章ID',
  `article_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '文章类型',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hy_log_read
-- ----------------------------
INSERT INTO `hy_log_read` VALUES ('101', '17122809162726', '10', '2', '1514537349', '1514537349');
INSERT INTO `hy_log_read` VALUES ('104', '17122720433916', '14', '2', '1514538278', '1514538288');
INSERT INTO `hy_log_read` VALUES ('105', '17122720433916', '12', '1', '1514538293', '1515844975');
INSERT INTO `hy_log_read` VALUES ('107', '17122919425475', '15', '1', '1514547838', '1514547896');
INSERT INTO `hy_log_read` VALUES ('110', '17122809483784', '12', '1', '1514880198', '1515122220');
INSERT INTO `hy_log_read` VALUES ('111', '17122809483784', '17', '1', '1514880201', '1515122308');
INSERT INTO `hy_log_read` VALUES ('112', '17122911492615', '20', '1', '1514903936', '1515979296');
INSERT INTO `hy_log_read` VALUES ('113', '17122911492615', '19', '1', '1514944090', '1516004684');
INSERT INTO `hy_log_read` VALUES ('116', '17121211474354', '9', '1', '1514971931', '1514971931');
INSERT INTO `hy_log_read` VALUES ('117', '17122809483784', '21', '1', '1515035097', '1515469631');
INSERT INTO `hy_log_read` VALUES ('118', '17122720433916', '9', '2', '1515119150', '1515119150');
INSERT INTO `hy_log_read` VALUES ('119', '17122720433916', '21', '1', '1515119159', '1516012400');
INSERT INTO `hy_log_read` VALUES ('120', '18010510133514', '16', '2', '1515121714', '1515121714');
INSERT INTO `hy_log_read` VALUES ('121', '18010510133514', '24', '1', '1515122124', '1515123031');
INSERT INTO `hy_log_read` VALUES ('122', '17122809483784', '16', '1', '1515122276', '1515469629');
INSERT INTO `hy_log_read` VALUES ('123', '17122809483784', '18', '1', '1515122506', '1515122511');
INSERT INTO `hy_log_read` VALUES ('128', '17122809483784', '13', '2', '1515469636', '1515469636');
INSERT INTO `hy_log_read` VALUES ('129', '17122809483784', '14', '2', '1515469638', '1515469638');
INSERT INTO `hy_log_read` VALUES ('130', '18010918094337', '15', '2', '1515543135', '1515543135');
INSERT INTO `hy_log_read` VALUES ('131', '17122809162726', '11', '2', '1515556527', '1515556527');
INSERT INTO `hy_log_read` VALUES ('132', '17122809162726', '12', '2', '1515556643', '1515557063');
INSERT INTO `hy_log_read` VALUES ('133', '18011012004787', '12', '2', '1515556862', '1515557084');
INSERT INTO `hy_log_read` VALUES ('134', '18010918094337', '25', '1', '1515578011', '1515808252');
INSERT INTO `hy_log_read` VALUES ('135', '18011112185646', '23', '1', '1515644369', '1515644369');
INSERT INTO `hy_log_read` VALUES ('137', '17122720433916', '17', '1', '1515838140', '1516012394');
INSERT INTO `hy_log_read` VALUES ('138', '18011512065371', '15', '2', '1515989275', '1515989275');
INSERT INTO `hy_log_read` VALUES ('139', '18011520114242', '20', '1', '1516022114', '1516022114');
INSERT INTO `hy_log_read` VALUES ('140', '1801171806056671', '8', '5', '1516591621', '1516706327');
INSERT INTO `hy_log_read` VALUES ('141', '1801171806056671', '13', '7', '1516608630', '1516766147');
INSERT INTO `hy_log_read` VALUES ('142', '1801171806056671', '3', '7', '1516673677', '1516677558');
INSERT INTO `hy_log_read` VALUES ('143', '1801171806056671', '9', '7', '1516695588', '1516695885');
INSERT INTO `hy_log_read` VALUES ('144', '1801171806056671', '4', '5', '1516705432', '1516705432');
INSERT INTO `hy_log_read` VALUES ('145', '2147483647', '13', '7', '1516776497', '1516776497');

-- ----------------------------
-- Table structure for hy_lxyz
-- ----------------------------
DROP TABLE IF EXISTS `hy_lxyz`;
CREATE TABLE `hy_lxyz` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '支部ID',
  `admin_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `ref_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '关联官方文章ID',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `refer` varchar(100) NOT NULL DEFAULT '' COMMENT '来源',
  `keywords` varchar(100) NOT NULL DEFAULT '' COMMENT '关键词',
  `desc` varchar(500) NOT NULL DEFAULT '' COMMENT '简介',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '分类',
  `detail` text NOT NULL COMMENT '详细',
  `video_id` varchar(50) NOT NULL DEFAULT '' COMMENT '视频点播ID',
  `sort` int(11) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `images` text NOT NULL COMMENT '系列图，多张用“,”分开',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态：1-显示，2-隐藏',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `show_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '显示时间',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `read_num` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '阅读次数',
  `collect_num` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `forward_num` mediumint(8) NOT NULL DEFAULT '0' COMMENT '收藏数量',
  `region_code` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='两学一做';

-- ----------------------------
-- Records of hy_lxyz
-- ----------------------------
INSERT INTO `hy_lxyz` VALUES ('29', '4', '0', '4', '人民日报社论', '人民日报', '不忘历史', '今天是南京大屠杀惨案发生80周年，也是第四个南京大屠杀死难者国家公祭日。在这个沉痛的日子里，让我们深切缅怀南京大屠杀的无辜死难者，深切缅怀所有惨遭日本侵略者杀戮的死难同胞，深切缅怀革命先烈和民族英雄。', '59', '&lt;p style=&quot;white-space: normal;&quot;&gt;“侵华日寇，毁吾南京。劫掠黎庶，屠戮苍生。卅万亡灵，饮恨江城。日月惨淡，寰宇震惊。兽行暴虐，旷世未闻。”&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;　　今天是南京大屠杀惨案发生80周年，也是第四个南京大屠杀死难者国家公祭日。在这个沉痛的日子里，让我们深切缅怀南京大屠杀的无辜死难者，深切缅怀所有惨遭日本侵略者杀戮的死难同胞，深切缅怀为中国人民抗日战争胜利献出生命的革命先烈和民族英雄。&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;　　3年前的今天，习近平总书记在南京大屠杀死难者国家公祭仪式上发表讲话，表达中国人民坚定不移走和平发展道路的崇高愿望，宣示中国人民牢记历史、不忘过去，珍爱和平、开创未来的坚定立场。3年来，我们以国家之名祭奠死难者，以尊崇之心珍视和平，以民族之力矢志复兴。今天，中华民族的发展前景无比光明，中国人民维护和平的决心坚定不移。&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;　　1937年7月7日，日本侵略者悍然发动了全面侵华战争，给中国人民带来了前所未有的巨大灾难。12月13日，侵华日军野蛮侵入南京，制造了灭绝人性的南京大屠杀惨案，30万同胞惨遭杀戮。这一骇人听闻的反人类罪行，是人类历史上十分黑暗的一页，是中华民族永远的伤痛。面对极其野蛮、极其残暴的日本侵略者，具有伟大爱国主义精神的中国人民没有屈服，在中国共产党号召和引领下，全民族各种积极力量同仇敌忾、共御外敌，最终赢得了中国人民抗日战争伟大胜利，也为世界反法西斯战争胜利作出了重大贡献。&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;　　“谁忘记历史，谁就会在灵魂上生病。”80年过去，侵略者的枪声淹没在历史尘埃里，但中华门城墙上的弹孔依然清晰可见；南京城的不绝哀号已随风逝去，但“万人坑”的累累白骨还在。历史不会因时代变迁而改变，事实也不会因巧舌抵赖而消失。南京大屠杀惨案铁证如山、不容否认。任何倒行逆施妄图篡改历史、否认暴行，为南京大屠杀惨案和侵略战争翻案的丑恶行径，不仅13亿中国人民不会答应，也将受到世界上一切爱好和平与正义人民的谴责和唾弃。“国之大事，在祀与戎。”年复一年的国家公祭向世人宣示，中国人民反对侵略战争、反对篡改历史的立场坚定不移，中国人民团结一心实现民族复兴的决心坚定不移，中国人民捍卫人类尊严、维护世界和平的意志坚定不移。&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;　　以国之名，我们呼唤中华儿女勠力同心为建设社会主义现代化强国、实现中华民族伟大复兴的中国梦作出新贡献。“四万万人齐蹈厉，同心同德一戎衣”，从中国人民赢得抗日战争伟大胜利，开启中华民族由衰败走向振兴的重大转折，到中国特色社会主义进入新时代，意味着中华民族迎来了从站起来、富起来到强起来的伟大飞跃，中华崛起之功业，民族复兴之愿景，因为一代代中华儿女接续奋斗而曙光在前。在铭记历史中砥砺不忘初心、牢记使命的坚定信念，在缅怀同胞和先烈中凝聚以爱国主义为核心的伟大民族精神，我们一定能走好新时代的长征路，在新征程上不断夺取新胜利。&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;　　以国之名，我们呼吁世界各国共襄构建人类命运共同体的伟业，努力建设一个持久和平、共同繁荣的世界。中华民族经历了同胞惨遭屠戮、山河喋血的痛苦，更懂得和平“受益而不觉，失之则难存”，更坚定“坚持和平发展，共同开创世界和平充满希望的未来”的决心。从“一带一路”成为各国共同发展的合作平台，到构建人类命运共同体不断付诸实践，中国始终把为人类作出新的更大贡献作为自己的使命，始终做世界和平的建设者、全球发展的贡献者、国际秩序的维护者，同各国一道共同创造人类的美好未来。&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;　　不忘历史，矢志复兴。今天的中国，任人宰割、饱受欺凌的时代已经一去不复返了。全体中华儿女携手同心凝聚磅礴力量，为实现中华民族伟大复兴中国梦而不懈奋斗，正是对死难同胞和革命先烈的最好告慰。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '', '100', '0', '', '1', '0', '1516108287', '1516108287', '12', '1', '0', '110000');
INSERT INTO `hy_lxyz` VALUES ('30', '4', '0', '2', '关于加强新形势下党的督促检查工作的意见', '人民日报', '工作意见', '2017年6月6日施行', '76', '&lt;p&gt;&lt;span style=&quot;&quot;&gt;近日，中共中央印发《关于加强新形势下党的督促检查工作的意见》（以下简称《意见》）。《意见》深入贯彻党的十八大以来以习近平同志为核心的党中央对加强督促检查、抓好落实作出的一系列重要指示和部署，从指导思想、主要任务、工作原则、工作制度、效能建设、组织领导等方面，对加强新形势下党的督促检查工作提出明确要求和重要措施。&lt;/span&gt;&lt;span style=&quot;&quot;&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	《意见》指出，督促检查工作作为党的工作的重要组成部分，是推动党的决策落实的重要手段，是促进党的决策完善的重要途径，是改进党的作风、密切党同人民群众血肉联系的重要渠道。当前，随着全面建成小康社会进入决胜阶段，全面深化改革进入攻坚期和深水区，全面依法治国和全面从严治党纵深推进，抓落实的任务更重、要求更高。各级党组织都要切实增强“一分部署、九分落实”意识，从实现党的执政目标、满足人民群众热切期盼、巩固党的执政地位的高度，充分认识加强督促检查、抓好落实的极端重要性和紧迫性，着力提高督促检查工作能力和水平，推动党中央决策部署不折不扣贯彻落实。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	《意见》强调，加强新形势下党的督促检查工作，必须深入贯彻习近平总书记系列重要讲话精神和治国理政新理念新思想新战略，切实增强政治意识、大局意识、核心意识、看齐意识，围绕统筹推进“五位一体”总体布局和协调推进“四个全面”战略布局，以踏石留印、抓铁有痕的劲头，深入一线、真督实查，跟踪问效、强化问责，坚决维护以习近平同志为核心的党中央权威，保证全党令行禁止，确保党中央决策部署落地生根，为实现“两个一百年”奋斗目标、实现中华民族伟大复兴的中国梦提供有力保障。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	《意见》提出，党的督促检查工作的主要任务是推动党的理论路线方针政策贯彻执行和党中央决策部署贯彻落实。开展督促检查工作，要紧紧围绕党和国家一个时期的中心任务和重点工作，始终在大局下行动、处处为大局服务；要摸清实情、聚焦问题，敢于较真碰硬、加强督促整改；要实事求是、喜忧兼报，客观公正地评价工作、认识问题；要在党中央统一领导下，各级党组织分级负责，严格依照国家法律和党内法规，善于运用法治思维和法治方式推进落实；要既督任务、督进度、督成效，又查认识、查责任、查作风，确保决策部署落实到位。着眼提升督促检查工作科学化、规范化、制度化水平，建立健全任务分解、回访调研、批示件办理、联合督查、调研督查、决策落实情况报告、核查复核、督促整改等工作制度。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	《意见》要求，加强督促检查工作计划和统筹，改进创新督促检查方式方法，充分运用督促检查结果，提升督促检查工作效能。制定督促检查工作年度计划和阶段性安排，增强工作的系统性、科学性、预见性。加强现场核查、实地暗访、随机抽查，着力发现问题、解决问题、推动工作。对督促检查中发现的问题，要责成并督促有关地区、部门、单位认真纠正整改、汲取教训，及时完善政策；对问题突出的地区、部门、单位相关责任人进行约谈。督促检查情况可以在一定范围内通报或在新闻媒体上公布，接受各方面监督。将督促检查结果纳入组织人事部门对领导班子、领导干部的综合考核评价内容，纳入绩效考核部门的年度考核内容。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	《意见》强调，强化督促检查工作责任追究。对决策执行不力、工作落实不到位，领导督促检查工作不力，不按要求报告贯彻落实情况，不认真纠正整改存在的问题，妨碍、干扰、阻挠督促检查工作正常开展，打击、报复、陷害反映问题的干部群众，以及督促检查工作人员失职失责的，视情节轻重，依据《中国共产党问责条例》、《中国共产党纪律处分条例》等有关规定严肃问责。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	《意见》强调，要强化各级党委的督促检查工作主体责任，建立健全党委领导、党委办公厅（室）牵头抓总、部门分工负责、各方面参与的督促检查工作格局，形成抓落实合力。各级党委要将作决策、抓督查、保落实一体部署、一体推进，党委书记、党委常委会委员、党委委员要亲自抓督促检查工作；党委办公厅（室）要切实履行抓落实基本职能，主动谋划、加强协调；党委工作部门、党组、基层党组织要认真履行职责范围内的督促检查工作责任。加强督促检查机构和队伍建设，将督促检查干部培训纳入干部教育培训工作计划，努力建设对党忠诚、敢于担当、业务精湛、作风扎实的党委督促检查干部队伍。&lt;/p&gt;&lt;/span&gt;&lt;/p&gt;', '', '100', '0', 'http://dangjian.huiyi.t.weixinren.cn/upload//editor/201712/5a30eda5d2b9b.jpg', '2', '0', '1516108307', '1516108307', '0', '0', '0', '110000');
INSERT INTO `hy_lxyz` VALUES ('31', '7', '0', '2', '关于加强新形势下党的督促检查工作的意见', '人民日报', '工作意见', '2017年6月6日施行', '87', '&lt;p&gt;&lt;span style=&quot;&quot;&gt;近日，中共中央印发《关于加强新形势下党的督促检查工作的意见》（以下简称《意见》）。《意见》深入贯彻党的十八大以来以习近平同志为核心的党中央对加强督促检查、抓好落实作出的一系列重要指示和部署，从指导思想、主要任务、工作原则、工作制度、效能建设、组织领导等方面，对加强新形势下党的督促检查工作提出明确要求和重要措施。&lt;/span&gt;&lt;span style=&quot;&quot;&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	《意见》指出，督促检查工作作为党的工作的重要组成部分，是推动党的决策落实的重要手段，是促进党的决策完善的重要途径，是改进党的作风、密切党同人民群众血肉联系的重要渠道。当前，随着全面建成小康社会进入决胜阶段，全面深化改革进入攻坚期和深水区，全面依法治国和全面从严治党纵深推进，抓落实的任务更重、要求更高。各级党组织都要切实增强“一分部署、九分落实”意识，从实现党的执政目标、满足人民群众热切期盼、巩固党的执政地位的高度，充分认识加强督促检查、抓好落实的极端重要性和紧迫性，着力提高督促检查工作能力和水平，推动党中央决策部署不折不扣贯彻落实。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	《意见》强调，加强新形势下党的督促检查工作，必须深入贯彻习近平总书记系列重要讲话精神和治国理政新理念新思想新战略，切实增强政治意识、大局意识、核心意识、看齐意识，围绕统筹推进“五位一体”总体布局和协调推进“四个全面”战略布局，以踏石留印、抓铁有痕的劲头，深入一线、真督实查，跟踪问效、强化问责，坚决维护以习近平同志为核心的党中央权威，保证全党令行禁止，确保党中央决策部署落地生根，为实现“两个一百年”奋斗目标、实现中华民族伟大复兴的中国梦提供有力保障。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	《意见》提出，党的督促检查工作的主要任务是推动党的理论路线方针政策贯彻执行和党中央决策部署贯彻落实。开展督促检查工作，要紧紧围绕党和国家一个时期的中心任务和重点工作，始终在大局下行动、处处为大局服务；要摸清实情、聚焦问题，敢于较真碰硬、加强督促整改；要实事求是、喜忧兼报，客观公正地评价工作、认识问题；要在党中央统一领导下，各级党组织分级负责，严格依照国家法律和党内法规，善于运用法治思维和法治方式推进落实；要既督任务、督进度、督成效，又查认识、查责任、查作风，确保决策部署落实到位。着眼提升督促检查工作科学化、规范化、制度化水平，建立健全任务分解、回访调研、批示件办理、联合督查、调研督查、决策落实情况报告、核查复核、督促整改等工作制度。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	《意见》要求，加强督促检查工作计划和统筹，改进创新督促检查方式方法，充分运用督促检查结果，提升督促检查工作效能。制定督促检查工作年度计划和阶段性安排，增强工作的系统性、科学性、预见性。加强现场核查、实地暗访、随机抽查，着力发现问题、解决问题、推动工作。对督促检查中发现的问题，要责成并督促有关地区、部门、单位认真纠正整改、汲取教训，及时完善政策；对问题突出的地区、部门、单位相关责任人进行约谈。督促检查情况可以在一定范围内通报或在新闻媒体上公布，接受各方面监督。将督促检查结果纳入组织人事部门对领导班子、领导干部的综合考核评价内容，纳入绩效考核部门的年度考核内容。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	《意见》强调，强化督促检查工作责任追究。对决策执行不力、工作落实不到位，领导督促检查工作不力，不按要求报告贯彻落实情况，不认真纠正整改存在的问题，妨碍、干扰、阻挠督促检查工作正常开展，打击、报复、陷害反映问题的干部群众，以及督促检查工作人员失职失责的，视情节轻重，依据《中国共产党问责条例》、《中国共产党纪律处分条例》等有关规定严肃问责。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	《意见》强调，要强化各级党委的督促检查工作主体责任，建立健全党委领导、党委办公厅（室）牵头抓总、部门分工负责、各方面参与的督促检查工作格局，形成抓落实合力。各级党委要将作决策、抓督查、保落实一体部署、一体推进，党委书记、党委常委会委员、党委委员要亲自抓督促检查工作；党委办公厅（室）要切实履行抓落实基本职能，主动谋划、加强协调；党委工作部门、党组、基层党组织要认真履行职责范围内的督促检查工作责任。加强督促检查机构和队伍建设，将督促检查干部培训纳入干部教育培训工作计划，努力建设对党忠诚、敢于担当、业务精湛、作风扎实的党委督促检查干部队伍。&lt;/p&gt;&lt;/span&gt;&lt;/p&gt;', '', '100', '0', 'http://dangjian.huiyi.t.weixinren.cn/upload//editor/201712/5a30eda5d2b9b.jpg', '1', '0', '1516108833', '1516108833', '14', '0', '0', '0');
INSERT INTO `hy_lxyz` VALUES ('32', '7', '0', '1', '中国共产党工作机关条例（试行）', '中国共产党新闻网', '机关条例', '中国共产党工作机关条例，施行时间2017年3月1日', '88', '&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;&quot;&gt;\r\n	近日，中共中央印发了《中国共产党工作机关条例（试行）》（以下简称《条例》），并发出通知，要求各地区各部门认真遵照执行。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;&quot;&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	通知强调，党的工作机关是党实施政治、思想和组织领导的政治机关，是落实党中央和地方各级党委决策部署，实施党的领导、加强党的建设、推进党的事业的执行机关，在革命、建设、改革各个时期都发挥了重要作用。新的历史条件下，我们党要更好进行具有许多新的历史特点的伟大斗争、推进党的建设新的伟大工程、推进中国特色社会主义伟大事业，必须进一步加强和规范党的工作机关工作。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	通知指出，《条例》是规范党的工作机关设立、职责和运行的基础主干党内法规，是继党组工作条例、地方党委工作条例之后，加强党的组织制度建设的又一重要成果，对于夯实党执政治国的组织制度基础，推进国家治理体系和治理能力现代化，提高党的领导水平和执政水平具有重要意义。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	通知要求，各级党委要从坚定不移推进全面从严治党的战略高度，充分认识加强和改进党的工作机关工作的重要性和紧迫性，切实加强对《条例》实施的组织领导。要通过举办研讨班、培训班等形式，组织各级领导干部特别是党的工作机关领导班子成员认真学习《条例》，准确掌握《条例》内容，深刻领会《条例》精神，不断提高运用《条例》做好党的工作机关工作的能力和水平。各级党委和党的各级工作机关要对照《条例》规定，对党的工作机关的设立、领导机构和决策形式、工作规则等进行一次全面清理规范。中央有关部门要抓好督促落实，适时对《条例》实施情况进行专项检查，确保各项规定要求落到实处。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	《中国共产党工作机关条例（试行）》全文如下。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	第一章 总则&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	第一条 为了规范党的工作机关的设立和运行，提高党的工作机关履职能力和工作水平，保证党的理论和路线方针政策得到有效贯彻执行，根据《中国共产党章程》，制定本条例。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	第二条 党的工作机关是党实施政治、思想和组织领导的政治机关，是落实党中央和地方各级党委决策部署，实施党的领导、加强党的建设、推进党的事业的执行机关，主要包括办公厅（室）、职能部门、办事机构和派出机关。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	第三条 本条例适用于中央和地方党的工作机关。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	党委直属事业单位、设在党的工作机关或者由党的工作机关管理的机关，参照本条例执行，法律法规和中央另有规定的除外。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	党的纪律检查机关的产生和运行，按照党章和中央有关规定执行。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	第四条 党的工作机关开展工作应当遵循以下原则：&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	（一）坚持加强党的领导，坚决维护党中央权威；&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	（二）坚持党的政治路线、思想路线、组织路线、群众路线；&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	（三）坚持贯彻民主集中制，增强党的团结统一和机关工作活力；&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	（四）坚持各司其职、相互配合，确保党的各项工作协调一致、协同推进；&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	（五）坚持全面从严治党、依规治党，依照党章党规履行职责；&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	（六）坚持在宪法法律范围内活动，支持同级国家机关和其他组织依法依章程开展工作。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	第二章 设立&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	第五条 党的工作机关的设立，应当适应加强党的领导和党的建设的需要，遵循精简、统一、效能原则，实行总量控制和限额管理。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	根据工作需要，党的工作机关可以与职责相近的国家机关等合并设立或者合署办公。合并设立或者合署办公仍由党委主管。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	严格控制议事协调机构常设办事机构的设立。议事协调机构负责的事项，可以交由现有工作机关牵头协调或者建立协调配合机制解决的，不另设常设办事机构。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	第六条 党中央工作机关的设立、撤销、合并或者变更，由中央机构编制管理部门提出方案，按程序报党中央审批决定。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	地方党委工作机关的设立、撤销、合并或者变更，由同级机构编制管理部门提出方案，按规定程序由本级党委讨论决定后，报上级党委审批。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	第七条 党的工作机关的领导机构和决策形式是部（厅、室）务会或者委员会，一般由正职、副职、派驻纪检组组长或者纪工委书记及其他成员组成。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	党的工作机关的领导职数，根据工作需要和从严控制的原则，严格按照有关规定执行。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	党的工作机关正职由上级机构领导成员兼任的，可以设常务副职，协助其处理日常工作。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	党的工作机关不设正职领导助理，一般不设秘书长。确有必要时，经党中央批准，党中央职能部门可以设秘书长。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	第八条 党的工作机关根据工作需要和精干效能的原则设置必要的内设机构。内设机构的设立、撤销、合并或者变更，按照规定的权限和程序审批。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	第九条 党的工作机关在核定的行政编制内配备机关工作人员。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	第三章 职责&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	第十条 党的工作机关应当职责明确、权责一致，其职责一般依据党章党规确定，具体职责由有关职能配置、内设机构、人员编制规定予以明确。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	应当由党委履行的职责，党委不得将其授予工作机关。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	第十一条 党的工作机关应当履行以下职责：&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	（一）坚决贯彻落实党的理论和路线方针政策以及党委决策部署，确保政令畅通；&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	（二）研究部署职责范围内的工作，按照规定制发党内法规和规范性文件，抓好组织实施和督促落实；&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	（三）当好党委参谋助手，及时报告有关情况、反映问题、提出意见建议，为党委决策提供服务；&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	（四）抓好机关党的建设工作，加强对本单位群团工作的领导；&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	（五）承办党委和上级工作机关交办的有关事项。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	第十二条 党委办公厅（室）是党委的综合部门，负责推动党委决策部署的落实，按照党委要求协调有关方面开展工作，承担党委运行保障具体事务。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	第十三条 党委职能部门是负责党委某一方面工作的主管部门，按照规定行使相对独立的管理职能，制定相关政策法规并组织实施，协调指导本系统、本领域工作。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	第十四条 党委办事机构是协助党委办理某一方面重要事务的机构，一般是指党委为加强跨领域、跨部门重要工作的领导和组织协调而设立的议事协调机构的常设办事机构，承担议事协调机构的综合性服务工作，可以根据有关规定履行特定管理职责。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	第十五条 党委派出机关是党委为加强对特定领域、行业、系统领导而派出的工作机关，根据有关规定代表党委领导该领域、行业、系统的工作。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	第十六条 \r\n党的工作机关必须牢固树立政治意识、大局意识、核心意识、看齐意识，始终在思想上政治上行动上同党中央保持高度一致。按照全面从严治党要求，加强机关党的建设和队伍思想政治建设，教育引导党员干部坚定理想信念，强化宗旨意识，始终保持对党的事业、对党中央的绝对忠诚，自觉践行“三严三实”要求，在守纪律、讲规矩方面作出表率。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	党的工作机关应当加强业务能力建设，开展经常性的学习培训和业务交流，勇于探索实践，善于总结工作规律，不断提高干部队伍专业化水平和履职尽责本领。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	第四章 决策与执行&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	第十七条 \r\n党的工作机关必须坚持民主集中制，领导班子实行集体领导和个人分工负责相结合的制度。凡属本机关重大事项，应当按照集体领导、民主集中、个别酝酿、会议决定的原则，由领导班子集体研究决定。领导班子成员应当根据集体决定和分工，勇于担当，敢于负责，切实履行职责。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	第十八条 党的工作机关应当通过召开部（厅、室）务会会议、委员会会议等形式讨论决定下列重大事项：&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	（一）学习贯彻党中央、上级和本级党委的有关决定、指示和工作部署；&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	（二）研究讨论贯彻执行本机关职责范围内相关方针政策与法律法规的具体措施；&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	（三）讨论决定本机关重大决策、重要人事任免、重大项目安排、大额资金使用等事项；&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	（四）审议向党中央或者本级党委以及上级党的工作机关请示报告的重要事项；&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	（五）研究部署本机关党的建设方面的重要事项；&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	（六）研究讨论其他重要事项。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	党的工作机关领导班子应当科学决策、民主决策、依法决策。对重大事项的决策，一般应当经过调查研究、征求意见、专业评估、合法合规性审查和集体讨论决定等程序。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	第十九条 部（厅、室）务会会议、委员会会议由党的工作机关主要负责同志召集并主持，领导班子成员参加。根据工作需要，会议召集人可以确定有关人员列席会议。会议由专门人员如实记录，对决定事项编发会议纪要，并按照规定存档备查。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	第二十条 党的工作机关应当建立有效的督查、评估和反馈机制，确保领导班子决策落实。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	第二十一条 \r\n党的工作机关根据工作需要，可以召开部长（主任、书记）办公会议，组织推进部（厅、室）务会会议、委员会会议决策事项的落实和研究讨论专项工作。部长（主任、书记）办公会议由部长（主任、书记）或者委托领导班子其他成员主持召开，领导班子有关成员和有关内设机构主要负责人等参加。部长（主任、书记）办公会议不得代替部（厅、室）务会会议、委员会会议作出决策。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	第二十二条 \r\n党的工作机关领导班子及其成员应当加强思想政治建设，认真学习马克思列宁主义、毛泽东思想，坚持用中国特色社会主义理论体系武装头脑，深入学习贯彻习近平总书记系列重要讲话精神和治国理政新理念新思想新战略，不断增强中国特色社会主义的道路自信、理论自信、制度自信、文化自信。严守党的政治纪律和政治规矩，严肃党内政治生活。严格落实中央关于改进工作作风、密切联系群众的各项规定，坚决反对形式主义、官僚主义、享乐主义和奢靡之风。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	党的工作机关领导班子应当认真履行全面从严治党主体责任，落实党风廉政建设责任制，模范执行廉洁自律各项规定，坚决维护党的纪律，推动形成风清气正、干事创业的良好环境。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	第五章 监督与追责&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	第二十三条 党的工作机关接受党委的全面监督，每年至少向党委作1次全面工作情况报告，遇有重要情况及时请示报告。执行党中央和上级党组织某项重要指示和决定的情况，应当进行专题报告。对党的工作机关作出的不适当决定，本级党委或者上级党的工作机关有权撤销或者变更。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	党的工作机关应当自觉接受党的纪律检查机关及其派驻机构、党委直属机关纪工委以及机关纪委的监督。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	第二十四条 党的工作机关领导班子应当自觉接受党内监督和群众监督。领导班子成员应当如实向党组织报告个人有关事项、述职述廉述德，接受组织监督。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	第二十五条 党委应当定期对所属工作机关履职情况进行检查考核，具体工作由党委组织部门负责，考核结果在一定范围内通报。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	第二十六条 党的工作机关领导班子成员违反本条例有关规定的，根据情节轻重，给予批评教育、责令作出检查、诫勉、通报批评或者调离岗位、责令辞职、免职、降职等处理；应当追究党纪政纪责任的，依照有关规定给予相应处分。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	第六章 附则&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	第二十七条 机构编制管理部门应当根据本条例科学编制党的工作机关职能配置、内设机构、人员编制规定，按程序报本级党委审批后，以党委文件或者党委办公厅（室）文件形式发布。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	第二十八条 中央军事委员会可以根据本条例，制定相关规定。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	第二十九条 本条例由中央办公厅商中央组织部、中央机构编制委员会办公室解释。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	第三十条 本条例自2017年3月1日起施行。&lt;/p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '', '100', '0', 'http://dangjian.huiyi.t.weixinren.cn/upload//editor/201712/5a30ed1163e21.jpg', '1', '0', '1516108837', '1516108837', '0', '0', '0', '0');
INSERT INTO `hy_lxyz` VALUES ('33', '3', '0', '4', '人民日报社论', '人民日报', '不忘历史', '今天是南京大屠杀惨案发生80周年，也是第四个南京大屠杀死难者国家公祭日。在这个沉痛的日子里，让我们深切缅怀南京大屠杀的无辜死难者，深切缅怀所有惨遭日本侵略者杀戮的死难同胞，深切缅怀革命先烈和民族英雄。', '63', '&lt;p style=&quot;white-space: normal;&quot;&gt;“侵华日寇，毁吾南京。劫掠黎庶，屠戮苍生。卅万亡灵，饮恨江城。日月惨淡，寰宇震惊。兽行暴虐，旷世未闻。”&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;　　今天是南京大屠杀惨案发生80周年，也是第四个南京大屠杀死难者国家公祭日。在这个沉痛的日子里，让我们深切缅怀南京大屠杀的无辜死难者，深切缅怀所有惨遭日本侵略者杀戮的死难同胞，深切缅怀为中国人民抗日战争胜利献出生命的革命先烈和民族英雄。&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;　　3年前的今天，习近平总书记在南京大屠杀死难者国家公祭仪式上发表讲话，表达中国人民坚定不移走和平发展道路的崇高愿望，宣示中国人民牢记历史、不忘过去，珍爱和平、开创未来的坚定立场。3年来，我们以国家之名祭奠死难者，以尊崇之心珍视和平，以民族之力矢志复兴。今天，中华民族的发展前景无比光明，中国人民维护和平的决心坚定不移。&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;　　1937年7月7日，日本侵略者悍然发动了全面侵华战争，给中国人民带来了前所未有的巨大灾难。12月13日，侵华日军野蛮侵入南京，制造了灭绝人性的南京大屠杀惨案，30万同胞惨遭杀戮。这一骇人听闻的反人类罪行，是人类历史上十分黑暗的一页，是中华民族永远的伤痛。面对极其野蛮、极其残暴的日本侵略者，具有伟大爱国主义精神的中国人民没有屈服，在中国共产党号召和引领下，全民族各种积极力量同仇敌忾、共御外敌，最终赢得了中国人民抗日战争伟大胜利，也为世界反法西斯战争胜利作出了重大贡献。&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;　　“谁忘记历史，谁就会在灵魂上生病。”80年过去，侵略者的枪声淹没在历史尘埃里，但中华门城墙上的弹孔依然清晰可见；南京城的不绝哀号已随风逝去，但“万人坑”的累累白骨还在。历史不会因时代变迁而改变，事实也不会因巧舌抵赖而消失。南京大屠杀惨案铁证如山、不容否认。任何倒行逆施妄图篡改历史、否认暴行，为南京大屠杀惨案和侵略战争翻案的丑恶行径，不仅13亿中国人民不会答应，也将受到世界上一切爱好和平与正义人民的谴责和唾弃。“国之大事，在祀与戎。”年复一年的国家公祭向世人宣示，中国人民反对侵略战争、反对篡改历史的立场坚定不移，中国人民团结一心实现民族复兴的决心坚定不移，中国人民捍卫人类尊严、维护世界和平的意志坚定不移。&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;　　以国之名，我们呼唤中华儿女勠力同心为建设社会主义现代化强国、实现中华民族伟大复兴的中国梦作出新贡献。“四万万人齐蹈厉，同心同德一戎衣”，从中国人民赢得抗日战争伟大胜利，开启中华民族由衰败走向振兴的重大转折，到中国特色社会主义进入新时代，意味着中华民族迎来了从站起来、富起来到强起来的伟大飞跃，中华崛起之功业，民族复兴之愿景，因为一代代中华儿女接续奋斗而曙光在前。在铭记历史中砥砺不忘初心、牢记使命的坚定信念，在缅怀同胞和先烈中凝聚以爱国主义为核心的伟大民族精神，我们一定能走好新时代的长征路，在新征程上不断夺取新胜利。&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;　　以国之名，我们呼吁世界各国共襄构建人类命运共同体的伟业，努力建设一个持久和平、共同繁荣的世界。中华民族经历了同胞惨遭屠戮、山河喋血的痛苦，更懂得和平“受益而不觉，失之则难存”，更坚定“坚持和平发展，共同开创世界和平充满希望的未来”的决心。从“一带一路”成为各国共同发展的合作平台，到构建人类命运共同体不断付诸实践，中国始终把为人类作出新的更大贡献作为自己的使命，始终做世界和平的建设者、全球发展的贡献者、国际秩序的维护者，同各国一道共同创造人类的美好未来。&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;　　不忘历史，矢志复兴。今天的中国，任人宰割、饱受欺凌的时代已经一去不复返了。全体中华儿女携手同心凝聚磅礴力量，为实现中华民族伟大复兴中国梦而不懈奋斗，正是对死难同胞和革命先烈的最好告慰。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '', '100', '0', '', '1', '0', '1516183721', '1516183721', '0', '0', '0', '130304');
INSERT INTO `hy_lxyz` VALUES ('34', '3', '0', '2', '关于加强新形势下党的督促检查工作的意见', '人民日报', '工作意见', '2017年6月6日施行', '66', '&lt;p&gt;&lt;span style=&quot;&quot;&gt;近日，中共中央印发《关于加强新形势下党的督促检查工作的意见》（以下简称《意见》）。《意见》深入贯彻党的十八大以来以习近平同志为核心的党中央对加强督促检查、抓好落实作出的一系列重要指示和部署，从指导思想、主要任务、工作原则、工作制度、效能建设、组织领导等方面，对加强新形势下党的督促检查工作提出明确要求和重要措施。&lt;/span&gt;&lt;span style=&quot;&quot;&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	《意见》指出，督促检查工作作为党的工作的重要组成部分，是推动党的决策落实的重要手段，是促进党的决策完善的重要途径，是改进党的作风、密切党同人民群众血肉联系的重要渠道。当前，随着全面建成小康社会进入决胜阶段，全面深化改革进入攻坚期和深水区，全面依法治国和全面从严治党纵深推进，抓落实的任务更重、要求更高。各级党组织都要切实增强“一分部署、九分落实”意识，从实现党的执政目标、满足人民群众热切期盼、巩固党的执政地位的高度，充分认识加强督促检查、抓好落实的极端重要性和紧迫性，着力提高督促检查工作能力和水平，推动党中央决策部署不折不扣贯彻落实。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	《意见》强调，加强新形势下党的督促检查工作，必须深入贯彻习近平总书记系列重要讲话精神和治国理政新理念新思想新战略，切实增强政治意识、大局意识、核心意识、看齐意识，围绕统筹推进“五位一体”总体布局和协调推进“四个全面”战略布局，以踏石留印、抓铁有痕的劲头，深入一线、真督实查，跟踪问效、强化问责，坚决维护以习近平同志为核心的党中央权威，保证全党令行禁止，确保党中央决策部署落地生根，为实现“两个一百年”奋斗目标、实现中华民族伟大复兴的中国梦提供有力保障。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	《意见》提出，党的督促检查工作的主要任务是推动党的理论路线方针政策贯彻执行和党中央决策部署贯彻落实。开展督促检查工作，要紧紧围绕党和国家一个时期的中心任务和重点工作，始终在大局下行动、处处为大局服务；要摸清实情、聚焦问题，敢于较真碰硬、加强督促整改；要实事求是、喜忧兼报，客观公正地评价工作、认识问题；要在党中央统一领导下，各级党组织分级负责，严格依照国家法律和党内法规，善于运用法治思维和法治方式推进落实；要既督任务、督进度、督成效，又查认识、查责任、查作风，确保决策部署落实到位。着眼提升督促检查工作科学化、规范化、制度化水平，建立健全任务分解、回访调研、批示件办理、联合督查、调研督查、决策落实情况报告、核查复核、督促整改等工作制度。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	《意见》要求，加强督促检查工作计划和统筹，改进创新督促检查方式方法，充分运用督促检查结果，提升督促检查工作效能。制定督促检查工作年度计划和阶段性安排，增强工作的系统性、科学性、预见性。加强现场核查、实地暗访、随机抽查，着力发现问题、解决问题、推动工作。对督促检查中发现的问题，要责成并督促有关地区、部门、单位认真纠正整改、汲取教训，及时完善政策；对问题突出的地区、部门、单位相关责任人进行约谈。督促检查情况可以在一定范围内通报或在新闻媒体上公布，接受各方面监督。将督促检查结果纳入组织人事部门对领导班子、领导干部的综合考核评价内容，纳入绩效考核部门的年度考核内容。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	《意见》强调，强化督促检查工作责任追究。对决策执行不力、工作落实不到位，领导督促检查工作不力，不按要求报告贯彻落实情况，不认真纠正整改存在的问题，妨碍、干扰、阻挠督促检查工作正常开展，打击、报复、陷害反映问题的干部群众，以及督促检查工作人员失职失责的，视情节轻重，依据《中国共产党问责条例》、《中国共产党纪律处分条例》等有关规定严肃问责。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	《意见》强调，要强化各级党委的督促检查工作主体责任，建立健全党委领导、党委办公厅（室）牵头抓总、部门分工负责、各方面参与的督促检查工作格局，形成抓落实合力。各级党委要将作决策、抓督查、保落实一体部署、一体推进，党委书记、党委常委会委员、党委委员要亲自抓督促检查工作；党委办公厅（室）要切实履行抓落实基本职能，主动谋划、加强协调；党委工作部门、党组、基层党组织要认真履行职责范围内的督促检查工作责任。加强督促检查机构和队伍建设，将督促检查干部培训纳入干部教育培训工作计划，努力建设对党忠诚、敢于担当、业务精湛、作风扎实的党委督促检查干部队伍。&lt;/p&gt;&lt;/span&gt;&lt;/p&gt;', '', '100', '0', 'http://dangjian.huiyi.t.weixinren.cn/upload//editor/201712/5a30eda5d2b9b.jpg', '1', '0', '1516183724', '1516183724', '0', '0', '0', '130304');
INSERT INTO `hy_lxyz` VALUES ('35', '0', '31', '5', '两学一做111', '来源', '关键词关键词', '魂牵梦萦', '118', '&lt;p&gt;魂牵梦萦魂牵梦萦魂牵梦萦魂牵梦萦魂牵梦萦&lt;/p&gt;', '', '101', '0', 'http://dangjian.com/upload//editor/201712/5a28f650d9137.png', '2', '0', '1516118400', '1516188784', '0', '0', '0', '130300');
INSERT INTO `hy_lxyz` VALUES ('36', '3', '0', '3', 'fdsafdsa', 'fdsafdsa', 'fdsafdsafdsa', 'fdsafdsafdsaf', '114', '&lt;p&gt;								&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;fdsafdsafdsafdsafdsa&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;							&lt;/p&gt;', '', '100', '0', 'http://dangjian.com/upload//editor/201712/5a28bdc20e291.PNG,http://dangjian.com/upload//editor/201712/5a28bdc2280a7.png', '2', '0', '1516245588', '1516245588', '0', '0', '0', '130304');
INSERT INTO `hy_lxyz` VALUES ('37', '3', '0', '1', '标题', '来源', '关键词', '简介简介简介简介', '109', '&lt;p&gt;								&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/upload/editor/201712/1512629294508936.png&quot; title=&quot;1512629294508936.png&quot; alt=&quot;2345截图20160923154812.PNG&quot;/&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;详细详细详细详细详细详细详细详细详细详细详细详细								&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;							&lt;/p&gt;', '', '99', '0', 'http://dangjian.com/upload//editor/201712/5a27c18dbd838.png,http://dangjian.com/upload//editor/201712/5a27c18dbd838.png,http://dangjian.com/upload//editor/201712/5a28bdac1eb33.PNG,http://dangjian.com/upload//editor/201712/5a28bdac2f4d7.png', '1', '0', '1516245684', '1516245684', '0', '0', '0', '130304');

-- ----------------------------
-- Table structure for hy_notice
-- ----------------------------
DROP TABLE IF EXISTS `hy_notice`;
CREATE TABLE `hy_notice` (
  `notice_id` int(40) unsigned NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `content` text NOT NULL COMMENT '公告内容',
  `title` varchar(255) NOT NULL COMMENT '公告标题',
  `addtime` int(20) NOT NULL,
  `top` int(255) NOT NULL DEFAULT '2',
  `branch_id` int(11) NOT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除 0=正常 1=已删除',
  PRIMARY KEY (`notice_id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hy_notice
-- ----------------------------
INSERT INTO `hy_notice` VALUES ('35', '“纠正‘四风’不能止步，作风建设永远在路上。”近日，习近平总书记就新华社一篇《形式主义、官僚主义新表现值得警惕》的文章，对加强党的作风建设作出重要指示。\r\n\r\n这一重要指示，一针见血、切中时弊，内涵丰富、要求明确，充分表明以习近平同志为核心的党中央坚定不移全面从严治党、持之以恒正风肃纪的鲜明态度和坚定决心，在各地党员干部中引起强烈反响。', '习近平纠正“四风”重要指示引起强烈反响', '1513147819', '2', '1', '0');
INSERT INTO `hy_notice` VALUES ('37', '习近平同志所作的党的十九大报告强调，要完善各类国有资产管理体制，改革国有资本授权经营体制，加快国有经济布局优化、结构调整、战略性重组，促进国有资产保值增值，推动国有资本做强做优做大，有效防止国有资产流失。深化国有企业改革，发展混合所有制经济，培育具有全球竞争力的世界一流企业。这是在新的历史起点上，以习近平同志为核心的党中央对国有企业改革作出的重大部署，为新时代国有企业改革指明了方向、提供了根本遵循。', '深化国有企业改革', '1513147907', '1', '1', '0');
INSERT INTO `hy_notice` VALUES ('41', '&lt;p&gt;各党员同志：\n\n请于2017-12-18日8点，至党组织会议室参与学习活动0&lt;/p&gt;', '关于组织学习十九大精神的通知', '1513594544', '1', '1', '0');
INSERT INTO `hy_notice` VALUES ('42', '&lt;p&gt;&lt;img src=&quot;https://xiaocx.huiyi.t.weixinren.cn/upload//UE/5a388c776d9c0.jpg&quot; title=&quot;&quot; alt=&quot;&quot;/&gt;1212&lt;/p&gt;', '测试富文本', '1513654072', '2', '1', '0');
INSERT INTO `hy_notice` VALUES ('43', '&lt;p&gt;12344&lt;br/&gt;&lt;/p&gt;', '5123', '1513823140', '1', '1', '1');
INSERT INTO `hy_notice` VALUES ('44', '&lt;p&gt;123&lt;/p&gt;', '123', '1513824777', '1', '1', '1');
INSERT INTO `hy_notice` VALUES ('45', '&lt;p&gt;欢迎欢迎！！！&lt;/p&gt;', 'Hello 欢迎来到党支部', '1514944557', '2', '4', '0');
INSERT INTO `hy_notice` VALUES ('46', '&lt;p class=&quot;text&quot; style=&quot;margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em; text-align: center;&quot;&gt;&lt;strong&gt;央视网消息&lt;/strong&gt;：刚刚闭幕的中央农村工作会议指出，实施乡村振兴战略，是解决人民日益增长的美好生活需要和不平衡不充分的发展之间矛盾的必然要求，是我们党“三农”工作一系列方针政策的继承和发展，是中国特色社会主义进入新时代做好“三农”工作的总抓手。这将为新时代乡村全面振兴谱写出怎样的新篇章呢？&lt;/p&gt;&lt;p class=&quot;text&quot; style=&quot;margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;text-align:center;margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;img src=&quot;http://inews.gtimg.com/newsapp_bt/0/2624445535/641&quot; style=&quot;border: 0px; vertical-align: middle; max-width: 640px; display: block;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p class=&quot;text&quot; style=&quot;margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em; text-align: center;&quot;&gt;国务院发展研究中心农村经济研究部部长叶兴庆表示：“这次中央农村工作会议，首次全面系统总结了党的十八大以来，习近平‘三农’工作的新理念新思想新战略。是习近平新时代中国特色社会主义思想的重要组成部分，也是未来实施乡村振兴战略，做好新时代的农业农村工作的行动指南。”&lt;/p&gt;&lt;p class=&quot;text&quot; style=&quot;margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em; text-align: center;&quot;&gt;如何将这一行动指南贯彻到乡村振兴的具体实践中？中央农村工作会议用八个“坚持”，进行了详细阐述。&lt;/p&gt;&lt;p class=&quot;text&quot; style=&quot;margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;text-align:center;margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;img src=&quot;http://inews.gtimg.com/newsapp_bt/0/2624445537/641&quot; style=&quot;border: 0px; vertical-align: middle; max-width: 640px; display: block;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p class=&quot;text&quot; style=&quot;margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em; text-align: center;&quot;&gt;农业部农村经济研究中心主任宋洪远说：“实施乡村振兴战略，这是我们党中央深刻把握我国农情国情，着眼于党和国家事业全局，着眼于‘两个一百年’目标导向和补齐农业农村发展短板这个问题导向，提出来的一个战略部署安排。”&lt;/p&gt;&lt;p class=&quot;text&quot; style=&quot;margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;text-align:center;margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;img src=&quot;http://inews.gtimg.com/newsapp_bt/0/2624445538/641&quot; style=&quot;border: 0px; vertical-align: middle; max-width: 640px; display: block;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p class=&quot;text&quot; style=&quot;margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em; text-align: center;&quot;&gt;实施乡村振兴战略，中央农村工作会议明确目标任务：到2020年，乡村振兴取得重要进展，制度框架和政策体系基本形成；到2035年，乡村振兴取得决定性进展，农业农村现代化基本实现；到2050年，乡村全面振兴，农业强、农村美、农民富全面实现。&lt;/p&gt;&lt;p class=&quot;text&quot; style=&quot;margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;text-align:center;margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;img src=&quot;http://inews.gtimg.com/newsapp_bt/0/2624445539/641&quot; style=&quot;border: 0px; vertical-align: middle; max-width: 640px; display: block;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p class=&quot;text&quot; style=&quot;margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em; text-align: center;&quot;&gt;中央农村工作领导小组办公室主任韩俊强调：“没有农业、农村的现代化，没有农民的现代化，国家的现代化是不完整的。所以说一定要在乡村振兴方面有更明确的目标，要有更加有力度的政策。”&lt;/p&gt;&lt;p class=&quot;text&quot; style=&quot;margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em; text-align: center;&quot;&gt;走中国特色社会主义乡村振兴道路，让农业成为有奔头的产业，让农民成为有吸引力的职业，让农村成为安居乐业的美丽家园，这给广大农业工作者和亿万农民发出了动员令。&lt;/p&gt;&lt;p class=&quot;text&quot; style=&quot;margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;text-align:center;margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;img src=&quot;http://inews.gtimg.com/newsapp_bt/0/2624445540/641&quot; style=&quot;border: 0px; vertical-align: middle; max-width: 640px; display: block;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p class=&quot;text&quot; style=&quot;margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em; text-align: center;&quot;&gt;在中国特色社会主义新时代，乡村振兴战略描绘的一项项具体目标和举措，正在推动农业全面升级、农村全面进步、农民全面发展，谱写新时代乡村全面振兴新篇章。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '乡村振兴战略绘制“三农”发展新蓝图', '1514958433', '2', '6', '0');
INSERT INTO `hy_notice` VALUES ('47', '&lt;p&gt;公告标题公告标题公告标题公告标题公告标题公告标题公告标题公告标题公告标题公告标题公告标题公告标题公告标题公告标题公告标题公告标题公告标题公告标题公告标题公告标题公告标题公告标题公告标题公告标题公告标题公告标题&lt;/p&gt;', '公告标题', '1515400553', '2', '7', '0');

-- ----------------------------
-- Table structure for hy_option
-- ----------------------------
DROP TABLE IF EXISTS `hy_option`;
CREATE TABLE `hy_option` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `study_time` int(11) NOT NULL COMMENT '截止时间',
  `type` int(20) NOT NULL COMMENT '内容类型:101=两学一做 102=党建专题 103=视频 104=音频 105=电子书 106=读书 107=评测 108=相册',
  `content_id` int(20) NOT NULL COMMENT '内容ID',
  `importent_status` tinyint(1) NOT NULL COMMENT '重要状态 0=无重要状态 1=重要状态',
  `branch_id` bigint(20) NOT NULL COMMENT '小程序ID',
  `region_code` bigint(20) NOT NULL,
  `is_delete` tinyint(1) NOT NULL COMMENT '是否删除 默认0 删除为1',
  `add_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hy_option
-- ----------------------------
INSERT INTO `hy_option` VALUES ('1', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `hy_option` VALUES ('2', '121345', '102', '40', '0', '1234', '0', '0', '0');
INSERT INTO `hy_option` VALUES ('3', '121345', '102', '41', '1', '1234', '0', '0', '0');
INSERT INTO `hy_option` VALUES ('4', '121345', '102', '42', '1', '0', '0', '0', '0');
INSERT INTO `hy_option` VALUES ('5', '121345', '102', '43', '1', '0', '0', '0', '0');
INSERT INTO `hy_option` VALUES ('6', '121345', '102', '44', '0', '0', '0', '0', '0');
INSERT INTO `hy_option` VALUES ('7', '121345', '102', '10058', '0', '0', '0', '0', '0');
INSERT INTO `hy_option` VALUES ('8', '1526345981', '105', '8', '0', '3', '0', '0', '0');

-- ----------------------------
-- Table structure for hy_partake
-- ----------------------------
DROP TABLE IF EXISTS `hy_partake`;
CREATE TABLE `hy_partake` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(21) NOT NULL COMMENT '用户ID',
  `partake_type` tinyint(1) unsigned NOT NULL COMMENT '报名类型 1=风采 2=活动 101=两学一做 102=党建专题',
  `content_id` int(11) NOT NULL,
  `add_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hy_partake
-- ----------------------------
INSERT INTO `hy_partake` VALUES ('49', '17122809483784', '2', '25', '1514543479');
INSERT INTO `hy_partake` VALUES ('50', '17122721011120', '2', '22', '1514543524');
INSERT INTO `hy_partake` VALUES ('51', '17122721011120', '2', '20', '1514543538');
INSERT INTO `hy_partake` VALUES ('52', '17122010025893', '2', '10', '1514855679');
INSERT INTO `hy_partake` VALUES ('53', '17122809483784', '2', '29', '1514877409');
INSERT INTO `hy_partake` VALUES ('54', '17122809483784', '2', '31', '1514880030');
INSERT INTO `hy_partake` VALUES ('55', '17122809483784', '2', '32', '1514965443');
INSERT INTO `hy_partake` VALUES ('56', '18010517374964', '2', '33', '1515145996');
INSERT INTO `hy_partake` VALUES ('57', '18010918094337', '2', '33', '1515539685');
INSERT INTO `hy_partake` VALUES ('58', '18011609462427', '2', '33', '1516068923');

-- ----------------------------
-- Table structure for hy_partymien
-- ----------------------------
DROP TABLE IF EXISTS `hy_partymien`;
CREATE TABLE `hy_partymien` (
  `mien_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '风采ID',
  `content` text NOT NULL COMMENT '内容',
  `photo` varchar(500) DEFAULT NULL COMMENT '风采图片',
  `readnum` int(11) NOT NULL DEFAULT '0' COMMENT '阅读量',
  `likenum` int(11) NOT NULL DEFAULT '0' COMMENT '点赞量',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '党员ID',
  `branch_id` int(11) NOT NULL DEFAULT '0' COMMENT '支部ID',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '审核状态 1默认审核通过 2审核不通过',
  `top` tinyint(1) NOT NULL DEFAULT '2' COMMENT '置顶状态 1置顶 2默认不置顶 ',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `forward_num` mediumint(8) NOT NULL DEFAULT '0' COMMENT '转发数量',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0=正常 1=已删除',
  PRIMARY KEY (`mien_id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 COMMENT='党员风采';

-- ----------------------------
-- Records of hy_partymien
-- ----------------------------
INSERT INTO `hy_partymien` VALUES ('70', '聊聊', '', '0', '0', '17122720273550', '6', '2', '2', '1514455485', '0', '0');
INSERT INTO `hy_partymien` VALUES ('71', 'OK', '', '0', '0', '17122720273550', '6', '2', '2', '1514519090', '0', '0');
INSERT INTO `hy_partymien` VALUES ('82', '⊙∀⊙！扑克', 'base/2017-12-29/5a461297b452d.jpg', '0', '0', '17122911492615', '6', '1', '2', '1514541721', '0', '0');
INSERT INTO `hy_partymien` VALUES ('83', '床前明月光', 'base/2018-01-02/5a4b3b34c1af8.jpg', '0', '1', '17122809483784', '4', '1', '2', '1514879798', '0', '0');
INSERT INTO `hy_partymien` VALUES ('84', '疑是地上霜', 'base/2018-01-02/5a4b3b6a7620f.jpg', '0', '1', '17122809483784', '4', '1', '2', '1514879851', '0', '0');
INSERT INTO `hy_partymien` VALUES ('91', '5Zev5Zev77yM5LuK5aSp5aSp5rCU5oy65LiN6ZSZ5b6X77yM5L2g6K+05piv5ZCn8J+YifCfmInmiJHku6zljrvlnZAxMjM0NTbot6/lhazkuqTovablkKfwn5qM', 'base/2018-01-03/5a4c33c5bed44.jpg', '0', '1', '17122809483784', '4', '2', '2', '1514943434', '2', '0');
INSERT INTO `hy_partymien` VALUES ('92', '8J+YjvCfmI7wn5iOMTIzNDU2YWJjZGVmZ2hpamvku4rlpKnEsWxsxLFsbMSxxLHov5jMpMykzIjMiOWQg8ykzKTMiMyI5ZCnzKTMpMyIzIhsbMSxbGzEscSxbGzEsWxsxLHEseW5ssykzKTMiMyI5be0zKTMpMyIzIjniLnMpMykzIjMiGxsxLFsbMSx', 'base/2018-01-03/5a4c3b42f142f.jpg', '0', '1', '17122809483784', '4', '2', '2', '1514945358', '1', '0');
INSERT INTO `hy_partymien` VALUES ('93', '5LuK5aSp5aSp5rCU55yf5aW98J+Ygg==', 'base/2018-01-04/5a4d9a2f51b52.jpg', '0', '0', '17122809483784', '4', '1', '2', '1515035191', '0', '0');
INSERT INTO `hy_partymien` VALUES ('97', 'MjAxOC0wMS0wOQ==', 'http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/editor/7/a211c94d1fbd0336b3a55572410334c3.jpg', '0', '0', '18010517374964', '7', '1', '2', '1515491803', '1', '0');

-- ----------------------------
-- Table structure for hy_point_rule
-- ----------------------------
DROP TABLE IF EXISTS `hy_point_rule`;
CREATE TABLE `hy_point_rule` (
  `rule_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '支部ID',
  `rule_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '规则类型：登录、点赞等等',
  `rule_cat` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '规则所属分类：1-帐号奖励，2-学习文章，3-风采',
  `point` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '获得积分',
  `primary_key` varchar(50) NOT NULL DEFAULT '' COMMENT '关联ID名',
  `max_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '上限类型：1-仅一次，2-每条上限，3-每日上限',
  `max_point` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '上限积分',
  PRIMARY KEY (`rule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8 COMMENT='积分规则表';

-- ----------------------------
-- Records of hy_point_rule
-- ----------------------------
INSERT INTO `hy_point_rule` VALUES ('1', '1', '11', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('2', '1', '12', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('3', '1', '13', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('4', '1', '14', '1', '5', '', '3', '5');
INSERT INTO `hy_point_rule` VALUES ('5', '1', '21', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('6', '1', '22', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('7', '1', '23', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('8', '1', '24', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('9', '1', '25', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('10', '1', '26', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('11', '1', '27', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('12', '1', '28', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('13', '1', '31', '3', '5', '', '3', '25');
INSERT INTO `hy_point_rule` VALUES ('14', '1', '32', '3', '2', 'content_id', '2', '20');
INSERT INTO `hy_point_rule` VALUES ('15', '1', '33', '3', '1', 'content_id', '3', '20');
INSERT INTO `hy_point_rule` VALUES ('16', '1', '34', '3', '1', 'content_id', '2', '10');
INSERT INTO `hy_point_rule` VALUES ('17', '1', '35', '3', '1', 'content_id', '3', '20');
INSERT INTO `hy_point_rule` VALUES ('18', '2', '11', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('19', '2', '12', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('20', '2', '13', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('21', '2', '14', '1', '5', '', '3', '5');
INSERT INTO `hy_point_rule` VALUES ('22', '2', '21', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('23', '2', '22', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('24', '2', '23', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('25', '2', '24', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('26', '2', '25', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('27', '2', '26', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('28', '2', '27', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('29', '2', '28', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('30', '2', '31', '3', '5', '', '3', '25');
INSERT INTO `hy_point_rule` VALUES ('31', '2', '32', '3', '2', 'content_id', '2', '20');
INSERT INTO `hy_point_rule` VALUES ('32', '2', '33', '3', '1', 'content_id', '3', '20');
INSERT INTO `hy_point_rule` VALUES ('33', '2', '34', '3', '1', 'content_id', '2', '10');
INSERT INTO `hy_point_rule` VALUES ('34', '2', '35', '3', '1', 'content_id', '3', '20');
INSERT INTO `hy_point_rule` VALUES ('35', '3', '11', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('36', '3', '12', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('37', '3', '13', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('38', '3', '14', '1', '5', '', '3', '5');
INSERT INTO `hy_point_rule` VALUES ('39', '3', '21', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('40', '3', '22', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('41', '3', '23', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('42', '3', '24', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('43', '3', '25', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('44', '3', '26', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('45', '3', '27', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('46', '3', '28', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('47', '3', '31', '3', '5', '', '3', '25');
INSERT INTO `hy_point_rule` VALUES ('48', '3', '32', '3', '2', 'content_id', '2', '20');
INSERT INTO `hy_point_rule` VALUES ('49', '3', '33', '3', '1', 'content_id', '3', '20');
INSERT INTO `hy_point_rule` VALUES ('50', '3', '34', '3', '1', 'content_id', '2', '10');
INSERT INTO `hy_point_rule` VALUES ('51', '3', '35', '3', '1', 'content_id', '3', '20');
INSERT INTO `hy_point_rule` VALUES ('52', '4', '11', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('53', '4', '12', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('54', '4', '13', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('55', '4', '14', '1', '5', '', '3', '5');
INSERT INTO `hy_point_rule` VALUES ('56', '4', '21', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('57', '4', '22', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('58', '4', '23', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('59', '4', '24', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('60', '4', '25', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('61', '4', '26', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('62', '4', '27', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('63', '4', '28', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('64', '4', '31', '3', '5', '', '3', '25');
INSERT INTO `hy_point_rule` VALUES ('65', '4', '32', '3', '2', 'content_id', '2', '20');
INSERT INTO `hy_point_rule` VALUES ('66', '4', '33', '3', '1', 'content_id', '3', '20');
INSERT INTO `hy_point_rule` VALUES ('67', '4', '34', '3', '1', 'content_id', '2', '10');
INSERT INTO `hy_point_rule` VALUES ('68', '4', '35', '3', '1', 'content_id', '3', '20');
INSERT INTO `hy_point_rule` VALUES ('69', '5', '11', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('70', '5', '12', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('71', '5', '13', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('72', '5', '14', '1', '5', '', '3', '5');
INSERT INTO `hy_point_rule` VALUES ('73', '5', '21', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('74', '5', '22', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('75', '5', '23', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('76', '5', '24', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('77', '5', '25', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('78', '5', '26', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('79', '5', '27', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('80', '5', '28', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('81', '5', '31', '3', '5', '', '3', '25');
INSERT INTO `hy_point_rule` VALUES ('82', '5', '32', '3', '2', 'content_id', '2', '20');
INSERT INTO `hy_point_rule` VALUES ('83', '5', '33', '3', '1', 'content_id', '3', '20');
INSERT INTO `hy_point_rule` VALUES ('84', '5', '34', '3', '1', 'content_id', '2', '10');
INSERT INTO `hy_point_rule` VALUES ('85', '5', '35', '3', '1', 'content_id', '3', '20');
INSERT INTO `hy_point_rule` VALUES ('86', '6', '11', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('87', '6', '12', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('88', '6', '13', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('89', '6', '14', '1', '5', '', '3', '5');
INSERT INTO `hy_point_rule` VALUES ('90', '6', '21', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('91', '6', '22', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('92', '6', '23', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('93', '6', '24', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('94', '6', '25', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('95', '6', '26', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('96', '6', '27', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('97', '6', '28', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('98', '6', '31', '3', '5', '', '3', '25');
INSERT INTO `hy_point_rule` VALUES ('99', '6', '32', '3', '2', 'content_id', '2', '20');
INSERT INTO `hy_point_rule` VALUES ('100', '6', '33', '3', '1', 'content_id', '3', '20');
INSERT INTO `hy_point_rule` VALUES ('101', '6', '34', '3', '1', 'content_id', '2', '10');
INSERT INTO `hy_point_rule` VALUES ('102', '6', '35', '3', '1', 'content_id', '3', '20');
INSERT INTO `hy_point_rule` VALUES ('103', '7', '11', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('104', '7', '12', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('105', '7', '13', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('106', '7', '14', '1', '5', '', '3', '5');
INSERT INTO `hy_point_rule` VALUES ('107', '7', '21', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('108', '7', '22', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('109', '7', '23', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('110', '7', '24', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('111', '7', '25', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('112', '7', '26', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('113', '7', '27', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('114', '7', '28', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('115', '7', '31', '3', '5', '', '3', '25');
INSERT INTO `hy_point_rule` VALUES ('116', '7', '32', '3', '2', 'content_id', '2', '20');
INSERT INTO `hy_point_rule` VALUES ('117', '7', '33', '3', '1', 'content_id', '3', '20');
INSERT INTO `hy_point_rule` VALUES ('118', '7', '34', '3', '1', 'content_id', '2', '10');
INSERT INTO `hy_point_rule` VALUES ('119', '7', '35', '3', '1', 'content_id', '3', '20');
INSERT INTO `hy_point_rule` VALUES ('120', '8', '11', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('121', '8', '12', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('122', '8', '13', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('123', '8', '14', '1', '5', '', '3', '5');
INSERT INTO `hy_point_rule` VALUES ('124', '8', '21', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('125', '8', '22', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('126', '8', '23', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('127', '8', '24', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('128', '8', '25', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('129', '8', '26', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('130', '8', '27', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('131', '8', '28', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('132', '8', '31', '3', '5', '', '3', '25');
INSERT INTO `hy_point_rule` VALUES ('133', '8', '32', '3', '2', 'content_id', '2', '20');
INSERT INTO `hy_point_rule` VALUES ('134', '8', '33', '3', '1', 'content_id', '3', '20');
INSERT INTO `hy_point_rule` VALUES ('135', '8', '34', '3', '1', 'content_id', '2', '10');
INSERT INTO `hy_point_rule` VALUES ('136', '8', '35', '3', '1', 'content_id', '3', '20');
INSERT INTO `hy_point_rule` VALUES ('137', '4294967295', '11', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('138', '4294967295', '12', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('139', '4294967295', '13', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('140', '4294967295', '14', '1', '5', '', '3', '5');
INSERT INTO `hy_point_rule` VALUES ('141', '4294967295', '21', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('142', '4294967295', '22', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('143', '4294967295', '23', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('144', '4294967295', '24', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('145', '4294967295', '25', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('146', '4294967295', '26', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('147', '4294967295', '27', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('148', '4294967295', '28', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('149', '4294967295', '31', '3', '5', '', '3', '25');
INSERT INTO `hy_point_rule` VALUES ('150', '4294967295', '32', '3', '2', 'content_id', '2', '20');
INSERT INTO `hy_point_rule` VALUES ('151', '4294967295', '33', '3', '1', 'content_id', '3', '20');
INSERT INTO `hy_point_rule` VALUES ('152', '4294967295', '34', '3', '1', 'content_id', '2', '10');
INSERT INTO `hy_point_rule` VALUES ('153', '4294967295', '35', '3', '1', 'content_id', '3', '20');
INSERT INTO `hy_point_rule` VALUES ('154', '9', '11', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('155', '9', '12', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('156', '9', '13', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('157', '9', '14', '1', '5', '', '3', '5');
INSERT INTO `hy_point_rule` VALUES ('158', '9', '21', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('159', '9', '22', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('160', '9', '23', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('161', '9', '24', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('162', '9', '25', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('163', '9', '26', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('164', '9', '27', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('165', '9', '28', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('166', '9', '31', '3', '5', '', '3', '25');
INSERT INTO `hy_point_rule` VALUES ('167', '9', '32', '3', '2', 'content_id', '2', '20');
INSERT INTO `hy_point_rule` VALUES ('168', '9', '33', '3', '1', 'content_id', '3', '20');
INSERT INTO `hy_point_rule` VALUES ('169', '9', '34', '3', '1', 'content_id', '2', '10');
INSERT INTO `hy_point_rule` VALUES ('170', '9', '35', '3', '1', 'content_id', '3', '20');
INSERT INTO `hy_point_rule` VALUES ('171', '10', '11', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('172', '10', '12', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('173', '10', '13', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('174', '10', '14', '1', '5', '', '3', '5');
INSERT INTO `hy_point_rule` VALUES ('175', '10', '21', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('176', '10', '22', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('177', '10', '23', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('178', '10', '24', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('179', '10', '25', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('180', '10', '26', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('181', '10', '27', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('182', '10', '28', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('183', '10', '31', '3', '5', '', '3', '25');
INSERT INTO `hy_point_rule` VALUES ('184', '10', '32', '3', '2', 'content_id', '2', '20');
INSERT INTO `hy_point_rule` VALUES ('185', '10', '33', '3', '1', 'content_id', '3', '20');
INSERT INTO `hy_point_rule` VALUES ('186', '10', '34', '3', '1', 'content_id', '2', '10');
INSERT INTO `hy_point_rule` VALUES ('187', '10', '35', '3', '1', 'content_id', '3', '20');
INSERT INTO `hy_point_rule` VALUES ('188', '13', '11', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('189', '13', '12', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('190', '13', '13', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('191', '13', '14', '1', '5', '', '3', '5');
INSERT INTO `hy_point_rule` VALUES ('192', '13', '21', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('193', '13', '22', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('194', '13', '23', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('195', '13', '24', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('196', '13', '25', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('197', '13', '26', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('198', '13', '27', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('199', '13', '28', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('200', '13', '31', '3', '5', '', '3', '25');
INSERT INTO `hy_point_rule` VALUES ('201', '13', '32', '3', '2', 'content_id', '2', '20');
INSERT INTO `hy_point_rule` VALUES ('202', '13', '33', '3', '1', 'content_id', '3', '20');
INSERT INTO `hy_point_rule` VALUES ('203', '13', '34', '3', '1', 'content_id', '2', '10');
INSERT INTO `hy_point_rule` VALUES ('204', '13', '35', '3', '1', 'content_id', '3', '20');
INSERT INTO `hy_point_rule` VALUES ('205', '14', '11', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('206', '14', '12', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('207', '14', '13', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('208', '14', '14', '1', '5', '', '3', '5');
INSERT INTO `hy_point_rule` VALUES ('209', '14', '21', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('210', '14', '22', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('211', '14', '23', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('212', '14', '24', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('213', '14', '25', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('214', '14', '26', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('215', '14', '27', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('216', '14', '28', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('217', '14', '31', '3', '5', '', '3', '25');
INSERT INTO `hy_point_rule` VALUES ('218', '14', '32', '3', '2', 'content_id', '2', '20');
INSERT INTO `hy_point_rule` VALUES ('219', '14', '33', '3', '1', 'content_id', '3', '20');
INSERT INTO `hy_point_rule` VALUES ('220', '14', '34', '3', '1', 'content_id', '2', '10');
INSERT INTO `hy_point_rule` VALUES ('221', '14', '35', '3', '1', 'content_id', '3', '20');
INSERT INTO `hy_point_rule` VALUES ('222', '1516160993103', '11', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('223', '1516160993103', '12', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('224', '1516160993103', '13', '1', '10', '', '1', '10');
INSERT INTO `hy_point_rule` VALUES ('225', '1516160993103', '14', '1', '5', '', '3', '5');
INSERT INTO `hy_point_rule` VALUES ('226', '1516160993103', '21', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('227', '1516160993103', '22', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('228', '1516160993103', '23', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('229', '1516160993103', '24', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('230', '1516160993103', '25', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('231', '1516160993103', '26', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('232', '1516160993103', '27', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('233', '1516160993103', '28', '2', '1', 'id', '3', '10');
INSERT INTO `hy_point_rule` VALUES ('234', '1516160993103', '31', '3', '5', '', '3', '25');
INSERT INTO `hy_point_rule` VALUES ('235', '1516160993103', '32', '3', '2', 'content_id', '2', '20');
INSERT INTO `hy_point_rule` VALUES ('236', '1516160993103', '33', '3', '1', 'content_id', '3', '20');
INSERT INTO `hy_point_rule` VALUES ('237', '1516160993103', '34', '3', '1', 'content_id', '2', '10');
INSERT INTO `hy_point_rule` VALUES ('238', '1516160993103', '35', '3', '1', 'content_id', '3', '20');

-- ----------------------------
-- Table structure for hy_question
-- ----------------------------
DROP TABLE IF EXISTS `hy_question`;
CREATE TABLE `hy_question` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '支部ID',
  `ref_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '关联官方文章ID',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `desc` varchar(500) NOT NULL DEFAULT '' COMMENT '简介',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '分类',
  `limit_time` int(11) NOT NULL DEFAULT '0' COMMENT '答题时间(分)',
  `detail` text NOT NULL COMMENT '详细',
  `sort` int(11) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `image` varchar(200) NOT NULL DEFAULT '' COMMENT '图片',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态：1-显示，0-隐藏',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `read_num` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '阅读次数',
  `collect_num` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `forward_num` mediumint(8) NOT NULL DEFAULT '0' COMMENT '收藏数量',
  `region_code` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT '地区编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='评测表';

-- ----------------------------
-- Records of hy_question
-- ----------------------------
INSERT INTO `hy_question` VALUES ('1', '3', '0', 'title1', 'desc1', '123', '60', 'detail1', '100', 'image1', '1', '0', '1516329259', '0', '0', '0', '130304');
INSERT INTO `hy_question` VALUES ('2', '3', '0', 'title', 'desc', '123', '60', 'detail', '100', 'image', '1', '0', '1516329274', '0', '0', '0', '130304');
INSERT INTO `hy_question` VALUES ('3', '3', '0', 'title', 'desc', '123', '60', 'detail', '100', 'image', '1', '0', '1516329275', '7', '0', '0', '130304');
INSERT INTO `hy_question` VALUES ('4', '3', '0', 'title', 'desc', '123', '60', 'detail', '100', 'image', '1', '0', '1516329275', '0', '0', '0', '130304');
INSERT INTO `hy_question` VALUES ('5', '3', '0', 'title', 'desc', '123', '60', 'detail', '100', 'image', '1', '0', '1516329276', '0', '0', '0', '130304');
INSERT INTO `hy_question` VALUES ('6', '3', '0', 'title', 'desc', '123', '60', 'detail', '100', 'image', '1', '0', '1516329276', '0', '0', '0', '130304');
INSERT INTO `hy_question` VALUES ('7', '3', '0', 'title', 'desc', '123', '60', 'detail', '100', 'image', '1', '0', '1516329276', '0', '0', '0', '130304');
INSERT INTO `hy_question` VALUES ('8', '3', '0', 'title', 'desc', '123', '60', 'detail', '100', 'image', '1', '0', '1516329277', '0', '0', '0', '130304');
INSERT INTO `hy_question` VALUES ('9', '3', '0', 'title', 'desc', '123', '60', 'detail', '100', 'image', '1', '0', '1516329277', '4', '0', '0', '130304');
INSERT INTO `hy_question` VALUES ('10', '3', '0', 'title', 'desc', '123', '60', 'detail', '100', 'image', '1', '0', '1516329278', '0', '0', '0', '130304');
INSERT INTO `hy_question` VALUES ('11', '3', '0', 'title', 'desc', '123', '60', 'detail', '100', 'image', '1', '0', '1516329543', '0', '0', '0', '130304');
INSERT INTO `hy_question` VALUES ('13', '3', '1', '23432', '4324', '124', '3600', '&lt;p&gt;432432&lt;/p&gt;', '100', 'http://dangjian.com/upload//editor/201712/5a34d9a21c854.png', '1', '0', '1516330742', '34', '0', '0', '130304');
INSERT INTO `hy_question` VALUES ('14', '3', '2', '月', '月', '123', '60', '															', '100', 'http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/editor/dc6f19e5743541b31025987c6b3b33bc.jpg', '1', '0', '1516330762', '0', '0', '0', '130304');

-- ----------------------------
-- Table structure for hy_question_detail
-- ----------------------------
DROP TABLE IF EXISTS `hy_question_detail`;
CREATE TABLE `hy_question_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评测ID',
  `title` varchar(500) NOT NULL DEFAULT '' COMMENT '题目标题',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型：1-单选，2-多选',
  `sort` int(11) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `result` varchar(50) NOT NULL DEFAULT '' COMMENT '正确答案，多个用逗号隔开，比如“0,2”表示第1个和第3个答案正确',
  `score` decimal(4,1) NOT NULL DEFAULT '0.0' COMMENT '题目分数',
  `item` text NOT NULL COMMENT '答案选项,json数组,比如：["xxx","yyy","zzz"]',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='答卷题目表';

-- ----------------------------
-- Records of hy_question_detail
-- ----------------------------
INSERT INTO `hy_question_detail` VALUES ('1', '13', 'ifds', '1', '100', '2', '10.0', '[\"324\",\"432\",\"432\",\"d43\"]', '0', '1516330742');
INSERT INTO `hy_question_detail` VALUES ('2', '13', '第二题魂牵梦萦', '2', '100', '0,1', '10.0', '[\"放\",\"放\",\"扔\"]', '0', '1516330742');
INSERT INTO `hy_question_detail` VALUES ('3', '13', '城', '1', '100', '1', '1.0', '[\"有\",\"授命\",\"地\"]', '0', '1516330742');
INSERT INTO `hy_question_detail` VALUES ('4', '14', '工', '1', '100', '0', '1.0', '[\"32\",\"32\",\"32\"]', '0', '1516330762');
INSERT INTO `hy_question_detail` VALUES ('5', '14', '厅', '2', '100', '0,2', '12.0', '[\"123152\",\"15416\",\"呻\"]', '0', '1516330762');
INSERT INTO `hy_question_detail` VALUES ('6', '1', 'title', '1', '100', '1', '5.0', '[\"content1\",\"content2\",\"content3\"]', '1', '1516345943');
INSERT INTO `hy_question_detail` VALUES ('7', '1', 'title', '1', '100', '1,2', '5.0', '[\"content1\",\"content1\",\"content1\"]', '0', '1516345981');

-- ----------------------------
-- Table structure for hy_read
-- ----------------------------
DROP TABLE IF EXISTS `hy_read`;
CREATE TABLE `hy_read` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `desc` varchar(500) NOT NULL DEFAULT '' COMMENT '简介',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '分类',
  `detail` text NOT NULL COMMENT '详细',
  `jump_url` varchar(200) NOT NULL DEFAULT '' COMMENT '跳转地址',
  `sort` int(11) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `image` varchar(200) NOT NULL DEFAULT '' COMMENT '图片',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态：1-显示，2-隐藏',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `ref_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '关联官方文章ID',
  `read_num` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '阅读次数',
  `collect_num` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `forward_num` mediumint(8) NOT NULL DEFAULT '0' COMMENT '收藏数量',
  `branch_id` int(11) NOT NULL COMMENT '支部ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='读书频道';

-- ----------------------------
-- Records of hy_read
-- ----------------------------
INSERT INTO `hy_read` VALUES ('8', '读书好', '好读书', '110', '&lt;p&gt;读书吧33&lt;/p&gt;', 'http://baidu.com', '2', 'http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/editor/a681bb6852f7e3993b6ef2fce9714010.jpg', '1', '1', '1516188556', '1', '0', '0', '0', '87');
INSERT INTO `hy_read` VALUES ('9', '读书好', '好读书', '123', '&lt;p&gt;读书吧&lt;/p&gt;', 'http://baidu.com', '100', 'http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/editor/a681bb6852f7e3993b6ef2fce9714010.jpg', '1', '0', '1516189289', '1', '0', '0', '0', '4');

-- ----------------------------
-- Table structure for hy_region
-- ----------------------------
DROP TABLE IF EXISTS `hy_region`;
CREATE TABLE `hy_region` (
  `region_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `region_code` bigint(11) unsigned NOT NULL DEFAULT '0',
  `region_name` varchar(32) NOT NULL DEFAULT '',
  `region_level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `region_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `repealed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`region_id`),
  UNIQUE KEY `region_code` (`region_code`),
  KEY `repealed` (`repealed`)
) ENGINE=InnoDB AUTO_INCREMENT=3580 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hy_region
-- ----------------------------
INSERT INTO `hy_region` VALUES ('1', '110000', '北京市', '1', '11', '0');
INSERT INTO `hy_region` VALUES ('2', '110100', '北京市辖区', '2', '22', '0');
INSERT INTO `hy_region` VALUES ('3', '110101', '东城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('4', '110102', '西城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('5', '110105', '朝阳区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('6', '110106', '丰台区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('7', '110107', '石景山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('8', '110108', '海淀区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('9', '110109', '门头沟区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('10', '110111', '房山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('11', '110112', '通州区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('12', '110113', '顺义区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('13', '110114', '昌平区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('14', '110115', '大兴区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('15', '110116', '怀柔区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('16', '110117', '平谷区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('17', '110200', '市辖县', '2', '22', '0');
INSERT INTO `hy_region` VALUES ('18', '110228', '密云县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('19', '110229', '延庆县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('20', '120000', '天津市', '1', '11', '0');
INSERT INTO `hy_region` VALUES ('21', '120100', '市辖区', '2', '22', '0');
INSERT INTO `hy_region` VALUES ('22', '120101', '和平区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('23', '120102', '河东区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('24', '120103', '河西区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('25', '120104', '南开区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('26', '120105', '河北区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('27', '120106', '红桥区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('28', '120110', '东丽区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('29', '120111', '西青区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('30', '120112', '津南区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('31', '120113', '北辰区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('32', '120114', '武清区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('33', '120115', '宝坻区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('34', '120116', '滨海新区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('35', '120200', '市辖县', '2', '22', '0');
INSERT INTO `hy_region` VALUES ('36', '120221', '宁河县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('37', '120223', '静海县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('38', '120225', '蓟县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('39', '130000', '河北省', '1', '12', '0');
INSERT INTO `hy_region` VALUES ('40', '130100', '石家庄市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('42', '130102', '长安区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('43', '130104', '桥西区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('44', '130105', '新华区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('45', '130107', '井陉矿区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('46', '130108', '裕华区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('47', '130109', '藁城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('48', '130110', '鹿泉区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('49', '130111', '栾城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('50', '130121', '井陉县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('51', '130123', '正定县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('52', '130125', '行唐县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('53', '130126', '灵寿县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('54', '130127', '高邑县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('55', '130128', '深泽县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('56', '130129', '赞皇县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('57', '130130', '无极县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('58', '130131', '平山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('59', '130132', '元氏县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('60', '130133', '赵县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('61', '130181', '辛集市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('62', '130183', '晋州市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('63', '130184', '新乐市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('64', '130200', '唐山市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('66', '130202', '路南区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('67', '130203', '路北区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('68', '130204', '古冶区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('69', '130205', '开平区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('70', '130207', '丰南区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('71', '130208', '丰润区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('72', '130209', '曹妃甸区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('73', '130223', '滦县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('74', '130224', '滦南县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('75', '130225', '乐亭县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('76', '130227', '迁西县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('77', '130229', '玉田县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('78', '130281', '遵化市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('79', '130283', '迁安市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('80', '130300', '秦皇岛市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('82', '130302', '海港区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('83', '130303', '山海关区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('84', '130304', '北戴河区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('85', '130321', '青龙满族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('86', '130322', '昌黎县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('87', '130323', '抚宁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('88', '130324', '卢龙县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('89', '130400', '邯郸市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('91', '130402', '邯山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('92', '130403', '丛台区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('93', '130404', '复兴区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('94', '130406', '峰峰矿区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('95', '130421', '邯郸县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('96', '130423', '临漳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('97', '130424', '成安县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('98', '130425', '大名县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('99', '130426', '涉县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('100', '130427', '磁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('101', '130428', '肥乡县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('102', '130429', '永年县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('103', '130430', '邱县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('104', '130431', '鸡泽县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('105', '130432', '广平县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('106', '130433', '馆陶县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('107', '130434', '魏县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('108', '130435', '曲周县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('109', '130481', '武安市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('110', '130500', '邢台市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('112', '130502', '桥东区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('113', '130503', '桥西区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('114', '130521', '邢台县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('115', '130522', '临城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('116', '130523', '内丘县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('117', '130524', '柏乡县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('118', '130525', '隆尧县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('119', '130526', '任县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('120', '130527', '南和县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('121', '130528', '宁晋县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('122', '130529', '巨鹿县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('123', '130530', '新河县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('124', '130531', '广宗县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('125', '130532', '平乡县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('126', '130533', '威县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('127', '130534', '清河县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('128', '130535', '临西县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('129', '130581', '南宫市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('130', '130582', '沙河市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('131', '130600', '保定市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('133', '130602', '新市区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('134', '130603', '北市区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('135', '130604', '南市区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('136', '130621', '满城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('137', '130622', '清苑县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('138', '130623', '涞水县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('139', '130624', '阜平县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('140', '130625', '徐水县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('141', '130626', '定兴县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('142', '130627', '唐县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('143', '130628', '高阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('144', '130629', '容城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('145', '130630', '涞源县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('146', '130631', '望都县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('147', '130632', '安新县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('148', '130633', '易县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('149', '130634', '曲阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('150', '130635', '蠡县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('151', '130636', '顺平县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('152', '130637', '博野县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('153', '130638', '雄县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('154', '130681', '涿州市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('155', '130682', '定州市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('156', '130683', '安国市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('157', '130684', '高碑店市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('158', '130700', '张家口市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('160', '130702', '桥东区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('161', '130703', '桥西区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('162', '130705', '宣化区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('163', '130706', '下花园区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('164', '130721', '宣化县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('165', '130722', '张北县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('166', '130723', '康保县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('167', '130724', '沽源县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('168', '130725', '尚义县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('169', '130726', '蔚县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('170', '130727', '阳原县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('171', '130728', '怀安县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('172', '130729', '万全县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('173', '130730', '怀来县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('174', '130731', '涿鹿县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('175', '130732', '赤城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('176', '130733', '崇礼县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('177', '130800', '承德市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('179', '130802', '双桥区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('180', '130803', '双滦区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('181', '130804', '鹰手营子矿区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('182', '130821', '承德县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('183', '130822', '兴隆县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('184', '130823', '平泉县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('185', '130824', '滦平县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('186', '130825', '隆化县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('187', '130826', '丰宁满族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('188', '130827', '宽城满族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('189', '130828', '围场满族蒙古族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('190', '130900', '沧州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('192', '130902', '新华区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('193', '130903', '运河区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('194', '130921', '沧县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('195', '130922', '青县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('196', '130923', '东光县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('197', '130924', '海兴县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('198', '130925', '盐山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('199', '130926', '肃宁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('200', '130927', '南皮县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('201', '130928', '吴桥县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('202', '130929', '献县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('203', '130930', '孟村回族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('204', '130981', '泊头市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('205', '130982', '任丘市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('206', '130983', '黄骅市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('207', '130984', '河间市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('208', '131000', '廊坊市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('210', '131002', '安次区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('211', '131003', '广阳区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('212', '131022', '固安县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('213', '131023', '永清县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('214', '131024', '香河县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('215', '131025', '大城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('216', '131026', '文安县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('217', '131028', '大厂回族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('218', '131081', '霸州市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('219', '131082', '三河市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('220', '131100', '衡水市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('222', '131102', '桃城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('223', '131121', '枣强县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('224', '131122', '武邑县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('225', '131123', '武强县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('226', '131124', '饶阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('227', '131125', '安平县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('228', '131126', '故城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('229', '131127', '景县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('230', '131128', '阜城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('231', '131181', '冀州市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('232', '131182', '深州市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('233', '140000', '山西省', '1', '12', '0');
INSERT INTO `hy_region` VALUES ('234', '140100', '太原市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('236', '140105', '小店区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('237', '140106', '迎泽区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('238', '140107', '杏花岭区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('239', '140108', '尖草坪区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('240', '140109', '万柏林区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('241', '140110', '晋源区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('242', '140121', '清徐县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('243', '140122', '阳曲县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('244', '140123', '娄烦县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('245', '140181', '古交市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('246', '140200', '大同市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('248', '140202', '城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('249', '140203', '矿区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('250', '140211', '南郊区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('251', '140212', '新荣区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('252', '140221', '阳高县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('253', '140222', '天镇县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('254', '140223', '广灵县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('255', '140224', '灵丘县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('256', '140225', '浑源县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('257', '140226', '左云县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('258', '140227', '大同县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('259', '140300', '阳泉市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('261', '140302', '城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('262', '140303', '矿区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('263', '140311', '郊区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('264', '140321', '平定县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('265', '140322', '盂县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('266', '140400', '长治市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('268', '140402', '城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('269', '140411', '郊区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('270', '140421', '长治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('271', '140423', '襄垣县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('272', '140424', '屯留县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('273', '140425', '平顺县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('274', '140426', '黎城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('275', '140427', '壶关县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('276', '140428', '长子县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('277', '140429', '武乡县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('278', '140430', '沁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('279', '140431', '沁源县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('280', '140481', '潞城市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('281', '140500', '晋城市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('283', '140502', '城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('284', '140521', '沁水县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('285', '140522', '阳城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('286', '140524', '陵川县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('287', '140525', '泽州县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('288', '140581', '高平市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('289', '140600', '朔州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('291', '140602', '朔城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('292', '140603', '平鲁区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('293', '140621', '山阴县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('294', '140622', '应县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('295', '140623', '右玉县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('296', '140624', '怀仁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('297', '140700', '晋中市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('299', '140702', '榆次区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('300', '140721', '榆社县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('301', '140722', '左权县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('302', '140723', '和顺县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('303', '140724', '昔阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('304', '140725', '寿阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('305', '140726', '太谷县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('306', '140727', '祁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('307', '140728', '平遥县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('308', '140729', '灵石县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('309', '140781', '介休市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('310', '140800', '运城市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('312', '140802', '盐湖区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('313', '140821', '临猗县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('314', '140822', '万荣县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('315', '140823', '闻喜县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('316', '140824', '稷山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('317', '140825', '新绛县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('318', '140826', '绛县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('319', '140827', '垣曲县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('320', '140828', '夏县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('321', '140829', '平陆县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('322', '140830', '芮城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('323', '140881', '永济市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('324', '140882', '河津市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('325', '140900', '忻州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('327', '140902', '忻府区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('328', '140921', '定襄县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('329', '140922', '五台县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('330', '140923', '代县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('331', '140924', '繁峙县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('332', '140925', '宁武县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('333', '140926', '静乐县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('334', '140927', '神池县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('335', '140928', '五寨县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('336', '140929', '岢岚县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('337', '140930', '河曲县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('338', '140931', '保德县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('339', '140932', '偏关县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('340', '140981', '原平市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('341', '141000', '临汾市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('343', '141002', '尧都区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('344', '141021', '曲沃县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('345', '141022', '翼城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('346', '141023', '襄汾县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('347', '141024', '洪洞县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('348', '141025', '古县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('349', '141026', '安泽县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('350', '141027', '浮山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('351', '141028', '吉县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('352', '141029', '乡宁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('353', '141030', '大宁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('354', '141031', '隰县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('355', '141032', '永和县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('356', '141033', '蒲县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('357', '141034', '汾西县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('358', '141081', '侯马市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('359', '141082', '霍州市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('360', '141100', '吕梁市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('362', '141102', '离石区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('363', '141121', '文水县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('364', '141122', '交城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('365', '141123', '兴县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('366', '141124', '临县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('367', '141125', '柳林县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('368', '141126', '石楼县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('369', '141127', '岚县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('370', '141128', '方山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('371', '141129', '中阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('372', '141130', '交口县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('373', '141181', '孝义市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('374', '141182', '汾阳市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('375', '150000', '内蒙古', '1', '12', '0');
INSERT INTO `hy_region` VALUES ('376', '150100', '呼和浩特市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('378', '150102', '新城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('379', '150103', '回民区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('380', '150104', '玉泉区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('381', '150105', '赛罕区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('382', '150121', '土默特左旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('383', '150122', '托克托县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('384', '150123', '和林格尔县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('385', '150124', '清水河县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('386', '150125', '武川县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('387', '150200', '包头市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('389', '150202', '东河区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('390', '150203', '昆都仑区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('391', '150204', '青山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('392', '150205', '石拐区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('393', '150206', '白云鄂博矿区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('394', '150207', '九原区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('395', '150221', '土默特右旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('396', '150222', '固阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('397', '150223', '达尔罕茂明安联合旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('398', '150300', '乌海市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('400', '150302', '海勃湾区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('401', '150303', '海南区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('402', '150304', '乌达区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('403', '150400', '赤峰市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('405', '150402', '红山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('406', '150403', '元宝山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('407', '150404', '松山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('408', '150421', '阿鲁科尔沁旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('409', '150422', '巴林左旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('410', '150423', '巴林右旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('411', '150424', '林西县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('412', '150425', '克什克腾旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('413', '150426', '翁牛特旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('414', '150428', '喀喇沁旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('415', '150429', '宁城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('416', '150430', '敖汉旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('417', '150500', '通辽市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('419', '150502', '科尔沁区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('420', '150521', '科尔沁左翼中旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('421', '150522', '科尔沁左翼后旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('422', '150523', '开鲁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('423', '150524', '库伦旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('424', '150525', '奈曼旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('425', '150526', '扎鲁特旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('426', '150581', '霍林郭勒市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('427', '150600', '鄂尔多斯市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('429', '150602', '东胜区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('430', '150621', '达拉特旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('431', '150622', '准格尔旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('432', '150623', '鄂托克前旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('433', '150624', '鄂托克旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('434', '150625', '杭锦旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('435', '150626', '乌审旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('436', '150627', '伊金霍洛旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('437', '150700', '呼伦贝尔市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('439', '150702', '海拉尔区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('440', '150703', '扎赉诺尔区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('441', '150721', '阿荣旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('442', '150722', '莫力达瓦达斡尔族自治旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('443', '150723', '鄂伦春自治旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('444', '150724', '鄂温克族自治旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('445', '150725', '陈巴尔虎旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('446', '150726', '新巴尔虎左旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('447', '150727', '新巴尔虎右旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('448', '150781', '满洲里市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('449', '150782', '牙克石市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('450', '150783', '扎兰屯市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('451', '150784', '额尔古纳市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('452', '150785', '根河市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('453', '150800', '巴彦淖尔市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('455', '150802', '临河区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('456', '150821', '五原县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('457', '150822', '磴口县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('458', '150823', '乌拉特前旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('459', '150824', '乌拉特中旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('460', '150825', '乌拉特后旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('461', '150826', '杭锦后旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('462', '150900', '乌兰察布市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('464', '150902', '集宁区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('465', '150921', '卓资县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('466', '150922', '化德县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('467', '150923', '商都县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('468', '150924', '兴和县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('469', '150925', '凉城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('470', '150926', '察哈尔右翼前旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('471', '150927', '察哈尔右翼中旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('472', '150928', '察哈尔右翼后旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('473', '150929', '四子王旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('474', '150981', '丰镇市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('475', '152200', '兴安盟', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('476', '152201', '乌兰浩特市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('477', '152202', '阿尔山市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('478', '152221', '科尔沁右翼前旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('479', '152222', '科尔沁右翼中旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('480', '152223', '扎赉特旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('481', '152224', '突泉县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('482', '152500', '锡林郭勒盟', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('483', '152501', '二连浩特市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('484', '152502', '锡林浩特市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('485', '152522', '阿巴嘎旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('486', '152523', '苏尼特左旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('487', '152524', '苏尼特右旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('488', '152525', '东乌珠穆沁旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('489', '152526', '西乌珠穆沁旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('490', '152527', '太仆寺旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('491', '152528', '镶黄旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('492', '152529', '正镶白旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('493', '152530', '正蓝旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('494', '152531', '多伦县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('495', '152900', '阿拉善盟', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('496', '152921', '阿拉善左旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('497', '152922', '阿拉善右旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('498', '152923', '额济纳旗', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('499', '210000', '辽宁省', '1', '12', '0');
INSERT INTO `hy_region` VALUES ('500', '210100', '沈阳市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('502', '210102', '和平区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('503', '210103', '沈河区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('504', '210104', '大东区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('505', '210105', '皇姑区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('506', '210106', '铁西区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('507', '210111', '苏家屯区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('508', '210112', '浑南区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('509', '210113', '沈北新区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('510', '210114', '于洪区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('511', '210122', '辽中县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('512', '210123', '康平县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('513', '210124', '法库县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('514', '210181', '新民市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('515', '210200', '大连市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('517', '210202', '中山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('518', '210203', '西岗区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('519', '210204', '沙河口区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('520', '210211', '甘井子区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('521', '210212', '旅顺口区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('522', '210213', '金州区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('523', '210224', '长海县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('524', '210281', '瓦房店市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('525', '210282', '普兰店市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('526', '210283', '庄河市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('527', '210300', '鞍山市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('529', '210302', '铁东区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('530', '210303', '铁西区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('531', '210304', '立山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('532', '210311', '千山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('533', '210321', '台安县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('534', '210323', '岫岩满族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('535', '210381', '海城市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('536', '210400', '抚顺市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('538', '210402', '新抚区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('539', '210403', '东洲区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('540', '210404', '望花区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('541', '210411', '顺城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('542', '210421', '抚顺县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('543', '210422', '新宾满族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('544', '210423', '清原满族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('545', '210500', '本溪市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('547', '210502', '平山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('548', '210503', '溪湖区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('549', '210504', '明山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('550', '210505', '南芬区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('551', '210521', '本溪满族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('552', '210522', '桓仁满族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('553', '210600', '丹东市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('555', '210602', '元宝区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('556', '210603', '振兴区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('557', '210604', '振安区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('558', '210624', '宽甸满族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('559', '210681', '东港市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('560', '210682', '凤城市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('561', '210700', '锦州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('563', '210702', '古塔区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('564', '210703', '凌河区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('565', '210711', '太和区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('566', '210726', '黑山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('567', '210727', '义县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('568', '210781', '凌海市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('569', '210782', '北镇市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('570', '210800', '营口市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('572', '210802', '站前区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('573', '210803', '西市区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('574', '210804', '鲅鱼圈区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('575', '210811', '老边区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('576', '210881', '盖州市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('577', '210882', '大石桥市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('578', '210900', '阜新市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('580', '210902', '海州区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('581', '210903', '新邱区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('582', '210904', '太平区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('583', '210905', '清河门区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('584', '210911', '细河区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('585', '210921', '阜新蒙古族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('586', '210922', '彰武县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('587', '211000', '辽阳市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('589', '211002', '白塔区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('590', '211003', '文圣区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('591', '211004', '宏伟区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('592', '211005', '弓长岭区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('593', '211011', '太子河区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('594', '211021', '辽阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('595', '211081', '灯塔市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('596', '211100', '盘锦市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('598', '211102', '双台子区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('599', '211103', '兴隆台区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('600', '211121', '大洼县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('601', '211122', '盘山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('602', '211200', '铁岭市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('604', '211202', '银州区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('605', '211204', '清河区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('606', '211221', '铁岭县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('607', '211223', '西丰县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('608', '211224', '昌图县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('609', '211281', '调兵山市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('610', '211282', '开原市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('611', '211300', '朝阳市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('613', '211302', '双塔区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('614', '211303', '龙城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('615', '211321', '朝阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('616', '211322', '建平县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('617', '211324', '喀喇沁左翼蒙古族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('618', '211381', '北票市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('619', '211382', '凌源市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('620', '211400', '葫芦岛市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('622', '211402', '连山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('623', '211403', '龙港区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('624', '211404', '南票区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('625', '211421', '绥中县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('626', '211422', '建昌县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('627', '211481', '兴城市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('628', '220000', '吉林省', '1', '12', '0');
INSERT INTO `hy_region` VALUES ('629', '220100', '长春市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('631', '220102', '南关区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('632', '220103', '宽城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('633', '220104', '朝阳区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('634', '220105', '二道区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('635', '220106', '绿园区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('636', '220112', '双阳区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('637', '220113', '九台区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('638', '220122', '农安县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('639', '220182', '榆树市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('640', '220183', '德惠市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('641', '220200', '吉林市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('643', '220202', '昌邑区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('644', '220203', '龙潭区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('645', '220204', '船营区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('646', '220211', '丰满区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('647', '220221', '永吉县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('648', '220281', '蛟河市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('649', '220282', '桦甸市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('650', '220283', '舒兰市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('651', '220284', '磐石市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('652', '220300', '四平市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('654', '220302', '铁西区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('655', '220303', '铁东区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('656', '220322', '梨树县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('657', '220323', '伊通满族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('658', '220381', '公主岭市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('659', '220382', '双辽市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('660', '220400', '辽源市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('662', '220402', '龙山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('663', '220403', '西安区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('664', '220421', '东丰县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('665', '220422', '东辽县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('666', '220500', '通化市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('668', '220502', '东昌区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('669', '220503', '二道江区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('670', '220521', '通化县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('671', '220523', '辉南县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('672', '220524', '柳河县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('673', '220581', '梅河口市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('674', '220582', '集安市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('675', '220600', '白山市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('677', '220602', '浑江区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('678', '220605', '江源区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('679', '220621', '抚松县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('680', '220622', '靖宇县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('681', '220623', '长白朝鲜族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('682', '220681', '临江市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('683', '220700', '松原市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('685', '220702', '宁江区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('686', '220721', '前郭尔罗斯蒙古族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('687', '220722', '长岭县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('688', '220723', '乾安县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('689', '220781', '扶余市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('690', '220800', '白城市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('692', '220802', '洮北区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('693', '220821', '镇赉县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('694', '220822', '通榆县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('695', '220881', '洮南市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('696', '220882', '大安市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('697', '222400', '延边朝鲜族自治州', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('698', '222401', '延吉市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('699', '222402', '图们市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('700', '222403', '敦化市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('701', '222404', '珲春市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('702', '222405', '龙井市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('703', '222406', '和龙市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('704', '222424', '汪清县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('705', '222426', '安图县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('706', '230000', '黑龙江省', '1', '12', '0');
INSERT INTO `hy_region` VALUES ('707', '230100', '哈尔滨市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('709', '230102', '道里区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('710', '230103', '南岗区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('711', '230104', '道外区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('712', '230108', '平房区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('713', '230109', '松北区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('714', '230110', '香坊区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('715', '230111', '呼兰区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('716', '230112', '阿城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('717', '230123', '依兰县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('718', '230124', '方正县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('719', '230125', '宾县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('720', '230126', '巴彦县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('721', '230127', '木兰县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('722', '230128', '通河县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('723', '230129', '延寿县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('724', '230182', '双城市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('725', '230183', '尚志市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('726', '230184', '五常市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('727', '230200', '齐齐哈尔市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('729', '230202', '龙沙区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('730', '230203', '建华区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('731', '230204', '铁锋区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('732', '230205', '昂昂溪区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('733', '230206', '富拉尔基区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('734', '230207', '碾子山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('735', '230208', '梅里斯达斡尔族区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('736', '230221', '龙江县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('737', '230223', '依安县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('738', '230224', '泰来县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('739', '230225', '甘南县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('740', '230227', '富裕县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('741', '230229', '克山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('742', '230230', '克东县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('743', '230231', '拜泉县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('744', '230281', '讷河市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('745', '230300', '鸡西市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('747', '230302', '鸡冠区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('748', '230303', '恒山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('749', '230304', '滴道区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('750', '230305', '梨树区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('751', '230306', '城子河区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('752', '230307', '麻山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('753', '230321', '鸡东县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('754', '230381', '虎林市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('755', '230382', '密山市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('756', '230400', '鹤岗市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('758', '230402', '向阳区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('759', '230403', '工农区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('760', '230404', '南山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('761', '230405', '兴安区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('762', '230406', '东山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('763', '230407', '兴山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('764', '230421', '萝北县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('765', '230422', '绥滨县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('766', '230500', '双鸭山市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('768', '230502', '尖山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('769', '230503', '岭东区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('770', '230505', '四方台区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('771', '230506', '宝山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('772', '230521', '集贤县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('773', '230522', '友谊县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('774', '230523', '宝清县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('775', '230524', '饶河县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('776', '230600', '大庆市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('778', '230602', '萨尔图区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('779', '230603', '龙凤区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('780', '230604', '让胡路区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('781', '230605', '红岗区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('782', '230606', '大同区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('783', '230621', '肇州县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('784', '230622', '肇源县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('785', '230623', '林甸县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('786', '230624', '杜尔伯特蒙古族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('787', '230700', '伊春市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('789', '230702', '伊春区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('790', '230703', '南岔区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('791', '230704', '友好区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('792', '230705', '西林区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('793', '230706', '翠峦区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('794', '230707', '新青区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('795', '230708', '美溪区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('796', '230709', '金山屯区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('797', '230710', '五营区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('798', '230711', '乌马河区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('799', '230712', '汤旺河区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('800', '230713', '带岭区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('801', '230714', '乌伊岭区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('802', '230715', '红星区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('803', '230716', '上甘岭区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('804', '230722', '嘉荫县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('805', '230781', '铁力市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('806', '230800', '佳木斯市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('808', '230803', '向阳区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('809', '230804', '前进区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('810', '230805', '东风区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('811', '230811', '郊区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('812', '230822', '桦南县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('813', '230826', '桦川县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('814', '230828', '汤原县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('815', '230833', '抚远县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('816', '230881', '同江市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('817', '230882', '富锦市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('818', '230900', '七台河市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('820', '230902', '新兴区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('821', '230903', '桃山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('822', '230904', '茄子河区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('823', '230921', '勃利县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('824', '231000', '牡丹江市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('826', '231002', '东安区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('827', '231003', '阳明区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('828', '231004', '爱民区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('829', '231005', '西安区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('830', '231024', '东宁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('831', '231025', '林口县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('832', '231081', '绥芬河市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('833', '231083', '海林市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('834', '231084', '宁安市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('835', '231085', '穆棱市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('836', '231100', '黑河市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('838', '231102', '爱辉区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('839', '231121', '嫩江县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('840', '231123', '逊克县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('841', '231124', '孙吴县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('842', '231181', '北安市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('843', '231182', '五大连池市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('844', '231200', '绥化市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('846', '231202', '北林区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('847', '231221', '望奎县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('848', '231222', '兰西县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('849', '231223', '青冈县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('850', '231224', '庆安县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('851', '231225', '明水县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('852', '231226', '绥棱县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('853', '231281', '安达市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('854', '231282', '肇东市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('855', '231283', '海伦市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('856', '232700', '大兴安岭地区', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('857', '232721', '呼玛县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('858', '232722', '塔河县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('859', '232723', '漠河县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('860', '310000', '上海市', '1', '11', '0');
INSERT INTO `hy_region` VALUES ('861', '310100', '市辖区', '2', '22', '0');
INSERT INTO `hy_region` VALUES ('862', '310101', '黄浦区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('863', '310104', '徐汇区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('864', '310105', '长宁区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('865', '310106', '静安区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('866', '310107', '普陀区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('867', '310108', '闸北区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('868', '310109', '虹口区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('869', '310110', '杨浦区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('870', '310112', '闵行区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('871', '310113', '宝山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('872', '310114', '嘉定区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('873', '310115', '浦东新区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('874', '310116', '金山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('875', '310117', '松江区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('876', '310118', '青浦区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('877', '310120', '奉贤区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('878', '310200', '市辖县', '2', '22', '0');
INSERT INTO `hy_region` VALUES ('879', '310230', '崇明县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('880', '320000', '江苏省', '1', '12', '0');
INSERT INTO `hy_region` VALUES ('881', '320100', '南京市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('883', '320102', '玄武区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('884', '320104', '秦淮区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('885', '320105', '建邺区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('886', '320106', '鼓楼区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('887', '320111', '浦口区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('888', '320113', '栖霞区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('889', '320114', '雨花台区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('890', '320115', '江宁区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('891', '320116', '六合区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('892', '320117', '溧水区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('893', '320118', '高淳区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('894', '320200', '无锡市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('896', '320202', '崇安区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('897', '320203', '南长区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('898', '320204', '北塘区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('899', '320205', '锡山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('900', '320206', '惠山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('901', '320211', '滨湖区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('902', '320281', '江阴市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('903', '320282', '宜兴市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('904', '320300', '徐州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('906', '320302', '鼓楼区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('907', '320303', '云龙区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('908', '320305', '贾汪区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('909', '320311', '泉山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('910', '320312', '铜山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('911', '320321', '丰县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('912', '320322', '沛县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('913', '320324', '睢宁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('914', '320381', '新沂市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('915', '320382', '邳州市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('916', '320400', '常州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('918', '320402', '天宁区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('919', '320404', '钟楼区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('920', '320405', '戚墅堰区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('921', '320411', '新北区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('922', '320412', '武进区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('923', '320481', '溧阳市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('924', '320482', '金坛市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('925', '320500', '苏州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('927', '320505', '虎丘区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('928', '320506', '吴中区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('929', '320507', '相城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('930', '320508', '姑苏区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('931', '320509', '吴江区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('932', '320581', '常熟市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('933', '320582', '张家港市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('934', '320583', '昆山市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('935', '320585', '太仓市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('936', '320600', '南通市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('938', '320602', '崇川区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('939', '320611', '港闸区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('940', '320612', '通州区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('941', '320621', '海安县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('942', '320623', '如东县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('943', '320681', '启东市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('944', '320682', '如皋市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('945', '320684', '海门市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('946', '320700', '连云港市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('948', '320703', '连云区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('949', '320706', '海州区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('950', '320707', '赣榆区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('951', '320722', '东海县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('952', '320723', '灌云县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('953', '320724', '灌南县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('954', '320800', '淮安市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('956', '320802', '清河区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('957', '320803', '淮安区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('958', '320804', '淮阴区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('959', '320811', '清浦区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('960', '320826', '涟水县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('961', '320829', '洪泽县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('962', '320830', '盱眙县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('963', '320831', '金湖县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('964', '320900', '盐城市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('966', '320902', '亭湖区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('967', '320903', '盐都区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('968', '320921', '响水县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('969', '320922', '滨海县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('970', '320923', '阜宁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('971', '320924', '射阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('972', '320925', '建湖县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('973', '320981', '东台市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('974', '320982', '大丰市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('975', '321000', '扬州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('977', '321002', '广陵区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('978', '321003', '邗江区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('979', '321012', '江都区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('980', '321023', '宝应县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('981', '321081', '仪征市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('982', '321084', '高邮市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('983', '321100', '镇江市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('985', '321102', '京口区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('986', '321111', '润州区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('987', '321112', '丹徒区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('988', '321181', '丹阳市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('989', '321182', '扬中市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('990', '321183', '句容市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('991', '321200', '泰州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('993', '321202', '海陵区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('994', '321203', '高港区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('995', '321204', '姜堰区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('996', '321281', '兴化市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('997', '321282', '靖江市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('998', '321283', '泰兴市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('999', '321300', '宿迁市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1001', '321302', '宿城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1002', '321311', '宿豫区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1003', '321322', '沭阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1004', '321323', '泗阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1005', '321324', '泗洪县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1006', '330000', '浙江省', '1', '12', '0');
INSERT INTO `hy_region` VALUES ('1007', '330100', '杭州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1009', '330102', '上城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1010', '330103', '下城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1011', '330104', '江干区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1012', '330105', '拱墅区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1013', '330106', '西湖区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1014', '330108', '滨江区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1015', '330109', '萧山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1016', '330110', '余杭区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1017', '330122', '桐庐县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1018', '330127', '淳安县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1019', '330182', '建德市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1020', '330183', '富阳市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1021', '330185', '临安市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1022', '330200', '宁波市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1024', '330203', '海曙区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1025', '330204', '江东区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1026', '330205', '江北区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1027', '330206', '北仑区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1028', '330211', '镇海区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1029', '330212', '鄞州区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1030', '330225', '象山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1031', '330226', '宁海县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1032', '330281', '余姚市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1033', '330282', '慈溪市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1034', '330283', '奉化市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1035', '330300', '温州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1037', '330302', '鹿城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1038', '330303', '龙湾区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1039', '330304', '瓯海区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1040', '330322', '洞头县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1041', '330324', '永嘉县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1042', '330326', '平阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1043', '330327', '苍南县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1044', '330328', '文成县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1045', '330329', '泰顺县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1046', '330381', '瑞安市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1047', '330382', '乐清市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1048', '330400', '嘉兴市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1050', '330402', '南湖区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1051', '330411', '秀洲区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1052', '330421', '嘉善县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1053', '330424', '海盐县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1054', '330481', '海宁市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1055', '330482', '平湖市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1056', '330483', '桐乡市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1057', '330500', '湖州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1059', '330502', '吴兴区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1060', '330503', '南浔区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1061', '330521', '德清县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1062', '330522', '长兴县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1063', '330523', '安吉县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1064', '330600', '绍兴市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1066', '330602', '越城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1067', '330603', '柯桥区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1068', '330604', '上虞区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1069', '330624', '新昌县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1070', '330681', '诸暨市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1071', '330683', '嵊州市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1072', '330700', '金华市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1074', '330702', '婺城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1075', '330703', '金东区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1076', '330723', '武义县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1077', '330726', '浦江县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1078', '330727', '磐安县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1079', '330781', '兰溪市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1080', '330782', '义乌市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1081', '330783', '东阳市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1082', '330784', '永康市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1083', '330800', '衢州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1085', '330802', '柯城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1086', '330803', '衢江区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1087', '330822', '常山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1088', '330824', '开化县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1089', '330825', '龙游县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1090', '330881', '江山市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1091', '330900', '舟山市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1093', '330902', '定海区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1094', '330903', '普陀区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1095', '330921', '岱山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1096', '330922', '嵊泗县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1097', '331000', '台州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1099', '331002', '椒江区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1100', '331003', '黄岩区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1101', '331004', '路桥区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1102', '331021', '玉环县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1103', '331022', '三门县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1104', '331023', '天台县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1105', '331024', '仙居县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1106', '331081', '温岭市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1107', '331082', '临海市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1108', '331100', '丽水市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1110', '331102', '莲都区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1111', '331121', '青田县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1112', '331122', '缙云县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1113', '331123', '遂昌县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1114', '331124', '松阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1115', '331125', '云和县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1116', '331126', '庆元县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1117', '331127', '景宁畲族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1118', '331181', '龙泉市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1119', '340000', '安徽省', '1', '12', '0');
INSERT INTO `hy_region` VALUES ('1120', '340100', '合肥市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1122', '340102', '瑶海区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1123', '340103', '庐阳区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1124', '340104', '蜀山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1125', '340111', '包河区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1126', '340121', '长丰县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1127', '340122', '肥东县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1128', '340123', '肥西县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1129', '340124', '庐江县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1130', '340181', '巢湖市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1131', '340200', '芜湖市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1133', '340202', '镜湖区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1134', '340203', '弋江区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1135', '340207', '鸠江区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1136', '340208', '三山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1137', '340221', '芜湖县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1138', '340222', '繁昌县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1139', '340223', '南陵县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1140', '340225', '无为县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1141', '340300', '蚌埠市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1143', '340302', '龙子湖区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1144', '340303', '蚌山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1145', '340304', '禹会区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1146', '340311', '淮上区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1147', '340321', '怀远县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1148', '340322', '五河县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1149', '340323', '固镇县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1150', '340400', '淮南市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1152', '340402', '大通区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1153', '340403', '田家庵区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1154', '340404', '谢家集区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1155', '340405', '八公山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1156', '340406', '潘集区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1157', '340421', '凤台县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1158', '340500', '马鞍山市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1160', '340503', '花山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1161', '340504', '雨山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1162', '340506', '博望区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1163', '340521', '当涂县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1164', '340522', '含山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1165', '340523', '和县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1166', '340600', '淮北市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1168', '340602', '杜集区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1169', '340603', '相山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1170', '340604', '烈山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1171', '340621', '濉溪县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1172', '340700', '铜陵市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1174', '340702', '铜官山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1175', '340703', '狮子山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1176', '340711', '郊区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1177', '340721', '铜陵县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1178', '340800', '安庆市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1180', '340802', '迎江区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1181', '340803', '大观区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1182', '340811', '宜秀区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1183', '340822', '怀宁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1184', '340823', '枞阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1185', '340824', '潜山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1186', '340825', '太湖县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1187', '340826', '宿松县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1188', '340827', '望江县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1189', '340828', '岳西县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1190', '340881', '桐城市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1191', '341000', '黄山市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1193', '341002', '屯溪区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1194', '341003', '黄山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1195', '341004', '徽州区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1196', '341021', '歙县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1197', '341022', '休宁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1198', '341023', '黟县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1199', '341024', '祁门县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1200', '341100', '滁州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1202', '341102', '琅琊区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1203', '341103', '南谯区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1204', '341122', '来安县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1205', '341124', '全椒县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1206', '341125', '定远县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1207', '341126', '凤阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1208', '341181', '天长市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1209', '341182', '明光市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1210', '341200', '阜阳市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1212', '341202', '颍州区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1213', '341203', '颍东区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1214', '341204', '颍泉区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1215', '341221', '临泉县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1216', '341222', '太和县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1217', '341225', '阜南县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1218', '341226', '颍上县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1219', '341282', '界首市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1220', '341300', '宿州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1222', '341302', '埇桥区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1223', '341321', '砀山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1224', '341322', '萧县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1225', '341323', '灵璧县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1226', '341324', '泗县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1227', '341500', '六安市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1229', '341502', '金安区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1230', '341503', '裕安区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1231', '341521', '寿县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1232', '341522', '霍邱县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1233', '341523', '舒城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1234', '341524', '金寨县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1235', '341525', '霍山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1236', '341600', '亳州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1238', '341602', '谯城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1239', '341621', '涡阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1240', '341622', '蒙城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1241', '341623', '利辛县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1242', '341700', '池州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1244', '341702', '贵池区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1245', '341721', '东至县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1246', '341722', '石台县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1247', '341723', '青阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1248', '341800', '宣城市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1250', '341802', '宣州区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1251', '341821', '郎溪县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1252', '341822', '广德县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1253', '341823', '泾县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1254', '341824', '绩溪县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1255', '341825', '旌德县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1256', '341881', '宁国市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1257', '350000', '福建省', '1', '12', '0');
INSERT INTO `hy_region` VALUES ('1258', '350100', '福州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1260', '350102', '鼓楼区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1261', '350103', '台江区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1262', '350104', '仓山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1263', '350105', '马尾区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1264', '350111', '晋安区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1265', '350121', '闽侯县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1266', '350122', '连江县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1267', '350123', '罗源县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1268', '350124', '闽清县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1269', '350125', '永泰县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1270', '350128', '平潭县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1271', '350181', '福清市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1272', '350182', '长乐市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1273', '350200', '厦门市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1275', '350203', '思明区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1276', '350205', '海沧区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1277', '350206', '湖里区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1278', '350211', '集美区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1279', '350212', '同安区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1280', '350213', '翔安区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1281', '350300', '莆田市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1283', '350302', '城厢区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1284', '350303', '涵江区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1285', '350304', '荔城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1286', '350305', '秀屿区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1287', '350322', '仙游县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1288', '350400', '三明市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1290', '350402', '梅列区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1291', '350403', '三元区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1292', '350421', '明溪县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1293', '350423', '清流县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1294', '350424', '宁化县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1295', '350425', '大田县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1296', '350426', '尤溪县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1297', '350427', '沙县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1298', '350428', '将乐县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1299', '350429', '泰宁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1300', '350430', '建宁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1301', '350481', '永安市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1302', '350500', '泉州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1304', '350502', '鲤城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1305', '350503', '丰泽区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1306', '350504', '洛江区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1307', '350505', '泉港区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1308', '350521', '惠安县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1309', '350524', '安溪县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1310', '350525', '永春县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1311', '350526', '德化县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1312', '350527', '金门县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1313', '350581', '石狮市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1314', '350582', '晋江市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1315', '350583', '南安市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1316', '350600', '漳州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1318', '350602', '芗城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1319', '350603', '龙文区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1320', '350622', '云霄县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1321', '350623', '漳浦县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1322', '350624', '诏安县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1323', '350625', '长泰县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1324', '350626', '东山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1325', '350627', '南靖县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1326', '350628', '平和县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1327', '350629', '华安县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1328', '350681', '龙海市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1329', '350700', '南平市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1331', '350702', '延平区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1332', '350721', '顺昌县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1333', '350722', '浦城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1334', '350723', '光泽县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1335', '350724', '松溪县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1336', '350725', '政和县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1337', '350781', '邵武市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1338', '350782', '武夷山市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1339', '350783', '建瓯市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1340', '350784', '建阳市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1341', '350800', '龙岩市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1343', '350802', '新罗区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1344', '350821', '长汀县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1345', '350822', '永定县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1346', '350823', '上杭县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1347', '350824', '武平县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1348', '350825', '连城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1349', '350881', '漳平市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1350', '350900', '宁德市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1352', '350902', '蕉城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1353', '350921', '霞浦县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1354', '350922', '古田县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1355', '350923', '屏南县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1356', '350924', '寿宁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1357', '350925', '周宁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1358', '350926', '柘荣县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1359', '350981', '福安市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1360', '350982', '福鼎市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1361', '360000', '江西省', '1', '12', '0');
INSERT INTO `hy_region` VALUES ('1362', '360100', '南昌市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1364', '360102', '东湖区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1365', '360103', '西湖区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1366', '360104', '青云谱区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1367', '360105', '湾里区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1368', '360111', '青山湖区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1369', '360121', '南昌县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1370', '360122', '新建县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1371', '360123', '安义县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1372', '360124', '进贤县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1373', '360200', '景德镇市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1375', '360202', '昌江区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1376', '360203', '珠山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1377', '360222', '浮梁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1378', '360281', '乐平市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1379', '360300', '萍乡市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1381', '360302', '安源区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1382', '360313', '湘东区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1383', '360321', '莲花县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1384', '360322', '上栗县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1385', '360323', '芦溪县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1386', '360400', '九江市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1388', '360402', '庐山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1389', '360403', '浔阳区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1390', '360421', '九江县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1391', '360423', '武宁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1392', '360424', '修水县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1393', '360425', '永修县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1394', '360426', '德安县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1395', '360427', '星子县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1396', '360428', '都昌县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1397', '360429', '湖口县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1398', '360430', '彭泽县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1399', '360481', '瑞昌市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1400', '360482', '共青城市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1401', '360500', '新余市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1403', '360502', '渝水区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1404', '360521', '分宜县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1405', '360600', '鹰潭市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1407', '360602', '月湖区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1408', '360622', '余江县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1409', '360681', '贵溪市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1410', '360700', '赣州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1412', '360702', '章贡区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1413', '360703', '南康区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1414', '360721', '赣县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1415', '360722', '信丰县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1416', '360723', '大余县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1417', '360724', '上犹县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1418', '360725', '崇义县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1419', '360726', '安远县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1420', '360727', '龙南县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1421', '360728', '定南县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1422', '360729', '全南县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1423', '360730', '宁都县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1424', '360731', '于都县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1425', '360732', '兴国县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1426', '360733', '会昌县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1427', '360734', '寻乌县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1428', '360735', '石城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1429', '360781', '瑞金市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1430', '360800', '吉安市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1432', '360802', '吉州区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1433', '360803', '青原区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1434', '360821', '吉安县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1435', '360822', '吉水县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1436', '360823', '峡江县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1437', '360824', '新干县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1438', '360825', '永丰县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1439', '360826', '泰和县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1440', '360827', '遂川县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1441', '360828', '万安县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1442', '360829', '安福县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1443', '360830', '永新县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1444', '360881', '井冈山市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1445', '360900', '宜春市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1447', '360902', '袁州区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1448', '360921', '奉新县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1449', '360922', '万载县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1450', '360923', '上高县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1451', '360924', '宜丰县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1452', '360925', '靖安县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1453', '360926', '铜鼓县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1454', '360981', '丰城市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1455', '360982', '樟树市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1456', '360983', '高安市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1457', '361000', '抚州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1459', '361002', '临川区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1460', '361021', '南城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1461', '361022', '黎川县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1462', '361023', '南丰县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1463', '361024', '崇仁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1464', '361025', '乐安县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1465', '361026', '宜黄县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1466', '361027', '金溪县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1467', '361028', '资溪县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1468', '361029', '东乡县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1469', '361030', '广昌县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1470', '361100', '上饶市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1472', '361102', '信州区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1473', '361121', '上饶县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1474', '361122', '广丰县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1475', '361123', '玉山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1476', '361124', '铅山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1477', '361125', '横峰县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1478', '361126', '弋阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1479', '361127', '余干县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1480', '361128', '鄱阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1481', '361129', '万年县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1482', '361130', '婺源县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1483', '361181', '德兴市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1484', '370000', '山东省', '1', '12', '0');
INSERT INTO `hy_region` VALUES ('1485', '370100', '济南市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1487', '370102', '历下区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1488', '370103', '市中区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1489', '370104', '槐荫区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1490', '370105', '天桥区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1491', '370112', '历城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1492', '370113', '长清区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1493', '370124', '平阴县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1494', '370125', '济阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1495', '370126', '商河县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1496', '370181', '章丘市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1497', '370200', '青岛市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1499', '370202', '市南区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1500', '370203', '市北区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1501', '370211', '黄岛区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1502', '370212', '崂山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1503', '370213', '李沧区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1504', '370214', '城阳区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1505', '370281', '胶州市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1506', '370282', '即墨市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1507', '370283', '平度市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1508', '370285', '莱西市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1509', '370300', '淄博市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1511', '370302', '淄川区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1512', '370303', '张店区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1513', '370304', '博山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1514', '370305', '临淄区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1515', '370306', '周村区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1516', '370321', '桓台县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1517', '370322', '高青县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1518', '370323', '沂源县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1519', '370400', '枣庄市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1521', '370402', '市中区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1522', '370403', '薛城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1523', '370404', '峄城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1524', '370405', '台儿庄区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1525', '370406', '山亭区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1526', '370481', '滕州市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1527', '370500', '东营市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1529', '370502', '东营区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1530', '370503', '河口区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1531', '370521', '垦利县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1532', '370522', '利津县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1533', '370523', '广饶县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1534', '370600', '烟台市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1536', '370602', '芝罘区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1537', '370611', '福山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1538', '370612', '牟平区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1539', '370613', '莱山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1540', '370634', '长岛县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1541', '370681', '龙口市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1542', '370682', '莱阳市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1543', '370683', '莱州市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1544', '370684', '蓬莱市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1545', '370685', '招远市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1546', '370686', '栖霞市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1547', '370687', '海阳市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1548', '370700', '潍坊市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1550', '370702', '潍城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1551', '370703', '寒亭区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1552', '370704', '坊子区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1553', '370705', '奎文区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1554', '370724', '临朐县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1555', '370725', '昌乐县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1556', '370781', '青州市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1557', '370782', '诸城市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1558', '370783', '寿光市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1559', '370784', '安丘市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1560', '370785', '高密市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1561', '370786', '昌邑市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1562', '370800', '济宁市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1564', '370811', '任城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1565', '370812', '兖州区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1566', '370826', '微山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1567', '370827', '鱼台县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1568', '370828', '金乡县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1569', '370829', '嘉祥县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1570', '370830', '汶上县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1571', '370831', '泗水县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1572', '370832', '梁山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1573', '370881', '曲阜市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1574', '370883', '邹城市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1575', '370900', '泰安市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1577', '370902', '泰山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1578', '370911', '岱岳区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1579', '370921', '宁阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1580', '370923', '东平县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1581', '370982', '新泰市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1582', '370983', '肥城市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1583', '371000', '威海市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1585', '371002', '环翠区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1586', '371003', '文登区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1587', '371082', '荣成市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1588', '371083', '乳山市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1589', '371100', '日照市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1591', '371102', '东港区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1592', '371103', '岚山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1593', '371121', '五莲县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1594', '371122', '莒县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1595', '371200', '莱芜市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1597', '371202', '莱城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1598', '371203', '钢城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1599', '371300', '临沂市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1601', '371302', '兰山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1602', '371311', '罗庄区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1603', '371312', '河东区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1604', '371321', '沂南县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1605', '371322', '郯城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1606', '371323', '沂水县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1607', '371324', '兰陵县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1608', '371325', '费县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1609', '371326', '平邑县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1610', '371327', '莒南县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1611', '371328', '蒙阴县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1612', '371329', '临沭县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1613', '371400', '德州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1615', '371402', '德城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1616', '371403', '陵城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1617', '371422', '宁津县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1618', '371423', '庆云县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1619', '371424', '临邑县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1620', '371425', '齐河县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1621', '371426', '平原县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1622', '371427', '夏津县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1623', '371428', '武城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1624', '371481', '乐陵市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1625', '371482', '禹城市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1626', '371500', '聊城市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1628', '371502', '东昌府区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1629', '371521', '阳谷县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1630', '371522', '莘县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1631', '371523', '茌平县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1632', '371524', '东阿县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1633', '371525', '冠县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1634', '371526', '高唐县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1635', '371581', '临清市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1636', '371600', '滨州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1638', '371602', '滨城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1639', '371603', '沾化区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1640', '371621', '惠民县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1641', '371622', '阳信县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1642', '371623', '无棣县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1643', '371625', '博兴县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1644', '371626', '邹平县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1645', '371700', '菏泽市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1647', '371702', '牡丹区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1648', '371721', '曹县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1649', '371722', '单县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1650', '371723', '成武县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1651', '371724', '巨野县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1652', '371725', '郓城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1653', '371726', '鄄城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1654', '371727', '定陶县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1655', '371728', '东明县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1656', '410000', '河南省', '1', '12', '0');
INSERT INTO `hy_region` VALUES ('1657', '410100', '郑州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1659', '410102', '中原区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1660', '410103', '二七区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1661', '410104', '管城回族区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1662', '410105', '金水区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1663', '410106', '上街区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1664', '410108', '惠济区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1665', '410122', '中牟县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1666', '410181', '巩义市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1667', '410182', '荥阳市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1668', '410183', '新密市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1669', '410184', '新郑市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1670', '410185', '登封市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1671', '410200', '开封市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1673', '410202', '龙亭区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1674', '410203', '顺河回族区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1675', '410204', '鼓楼区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1676', '410205', '禹王台区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1677', '410211', '金明区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1678', '410221', '杞县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1679', '410222', '通许县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1680', '410223', '尉氏县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1681', '410224', '开封县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1682', '410225', '兰考县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1683', '410300', '洛阳市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1685', '410302', '老城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1686', '410303', '西工区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1687', '410304', '瀍河回族区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1688', '410305', '涧西区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1689', '410306', '吉利区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1690', '410311', '洛龙区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1691', '410322', '孟津县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1692', '410323', '新安县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1693', '410324', '栾川县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1694', '410325', '嵩县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1695', '410326', '汝阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1696', '410327', '宜阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1697', '410328', '洛宁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1698', '410329', '伊川县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1699', '410381', '偃师市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1700', '410400', '平顶山市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1702', '410402', '新华区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1703', '410403', '卫东区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1704', '410404', '石龙区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1705', '410411', '湛河区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1706', '410421', '宝丰县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1707', '410422', '叶县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1708', '410423', '鲁山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1709', '410425', '郏县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1710', '410481', '舞钢市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1711', '410482', '汝州市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1712', '410500', '安阳市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1714', '410502', '文峰区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1715', '410503', '北关区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1716', '410505', '殷都区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1717', '410506', '龙安区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1718', '410522', '安阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1719', '410523', '汤阴县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1720', '410526', '滑县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1721', '410527', '内黄县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1722', '410581', '林州市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1723', '410600', '鹤壁市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1725', '410602', '鹤山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1726', '410603', '山城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1727', '410611', '淇滨区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1728', '410621', '浚县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1729', '410622', '淇县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1730', '410700', '新乡市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1732', '410702', '红旗区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1733', '410703', '卫滨区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1734', '410704', '凤泉区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1735', '410711', '牧野区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1736', '410721', '新乡县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1737', '410724', '获嘉县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1738', '410725', '原阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1739', '410726', '延津县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1740', '410727', '封丘县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1741', '410728', '长垣县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1742', '410781', '卫辉市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1743', '410782', '辉县市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1744', '410800', '焦作市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1746', '410802', '解放区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1747', '410803', '中站区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1748', '410804', '马村区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1749', '410811', '山阳区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1750', '410821', '修武县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1751', '410822', '博爱县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1752', '410823', '武陟县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1753', '410825', '温县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1754', '410882', '沁阳市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1755', '410883', '孟州市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1756', '410900', '濮阳市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1758', '410902', '华龙区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1759', '410922', '清丰县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1760', '410923', '南乐县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1761', '410926', '范县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1762', '410927', '台前县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1763', '410928', '濮阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1764', '411000', '许昌市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1766', '411002', '魏都区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1767', '411023', '许昌县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1768', '411024', '鄢陵县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1769', '411025', '襄城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1770', '411081', '禹州市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1771', '411082', '长葛市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1772', '411100', '漯河市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1774', '411102', '源汇区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1775', '411103', '郾城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1776', '411104', '召陵区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1777', '411121', '舞阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1778', '411122', '临颍县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1779', '411200', '三门峡市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1781', '411202', '湖滨区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1782', '411221', '渑池县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1783', '411222', '陕县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1784', '411224', '卢氏县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1785', '411281', '义马市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1786', '411282', '灵宝市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1787', '411300', '南阳市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1789', '411302', '宛城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1790', '411303', '卧龙区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1791', '411321', '南召县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1792', '411322', '方城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1793', '411323', '西峡县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1794', '411324', '镇平县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1795', '411325', '内乡县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1796', '411326', '淅川县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1797', '411327', '社旗县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1798', '411328', '唐河县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1799', '411329', '新野县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1800', '411330', '桐柏县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1801', '411381', '邓州市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1802', '411400', '商丘市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1804', '411402', '梁园区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1805', '411403', '睢阳区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1806', '411421', '民权县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1807', '411422', '睢县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1808', '411423', '宁陵县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1809', '411424', '柘城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1810', '411425', '虞城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1811', '411426', '夏邑县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1812', '411481', '永城市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1813', '411500', '信阳市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1815', '411502', '浉河区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1816', '411503', '平桥区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1817', '411521', '罗山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1818', '411522', '光山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1819', '411523', '新县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1820', '411524', '商城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1821', '411525', '固始县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1822', '411526', '潢川县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1823', '411527', '淮滨县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1824', '411528', '息县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1825', '411600', '周口市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1827', '411602', '川汇区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1828', '411621', '扶沟县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1829', '411622', '西华县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1830', '411623', '商水县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1831', '411624', '沈丘县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1832', '411625', '郸城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1833', '411626', '淮阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1834', '411627', '太康县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1835', '411628', '鹿邑县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1836', '411681', '项城市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1837', '411700', '驻马店市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1839', '411702', '驿城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1840', '411721', '西平县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1841', '411722', '上蔡县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1842', '411723', '平舆县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1843', '411724', '正阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1844', '411725', '确山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1845', '411726', '泌阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1846', '411727', '汝南县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1847', '411728', '遂平县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1848', '411729', '新蔡县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1849', '419000', '省直辖县', '2', '29', '0');
INSERT INTO `hy_region` VALUES ('1850', '419001', '济源市', '3', '32', '0');
INSERT INTO `hy_region` VALUES ('1851', '420000', '湖北省', '1', '12', '0');
INSERT INTO `hy_region` VALUES ('1852', '420100', '武汉市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1854', '420102', '江岸区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1855', '420103', '江汉区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1856', '420104', '硚口区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1857', '420105', '汉阳区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1858', '420106', '武昌区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1859', '420107', '青山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1860', '420111', '洪山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1861', '420112', '东西湖区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1862', '420113', '汉南区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1863', '420114', '蔡甸区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1864', '420115', '江夏区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1865', '420116', '黄陂区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1866', '420117', '新洲区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1867', '420200', '黄石市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1869', '420202', '黄石港区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1870', '420203', '西塞山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1871', '420204', '下陆区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1872', '420205', '铁山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1873', '420222', '阳新县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1874', '420281', '大冶市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1875', '420300', '十堰市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1877', '420302', '茅箭区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1878', '420303', '张湾区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1879', '420304', '郧阳区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1880', '420322', '郧西县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1881', '420323', '竹山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1882', '420324', '竹溪县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1883', '420325', '房县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1884', '420381', '丹江口市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1885', '420500', '宜昌市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1887', '420502', '西陵区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1888', '420503', '伍家岗区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1889', '420504', '点军区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1890', '420505', '猇亭区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1891', '420506', '夷陵区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1892', '420525', '远安县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1893', '420526', '兴山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1894', '420527', '秭归县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1895', '420528', '长阳土家族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1896', '420529', '五峰土家族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1897', '420581', '宜都市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1898', '420582', '当阳市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1899', '420583', '枝江市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1900', '420600', '襄阳市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1902', '420602', '襄城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1903', '420606', '樊城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1904', '420607', '襄州区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1905', '420624', '南漳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1906', '420625', '谷城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1907', '420626', '保康县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1908', '420682', '老河口市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1909', '420683', '枣阳市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1910', '420684', '宜城市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1911', '420700', '鄂州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1913', '420702', '梁子湖区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1914', '420703', '华容区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1915', '420704', '鄂城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1916', '420800', '荆门市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1918', '420802', '东宝区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1919', '420804', '掇刀区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1920', '420821', '京山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1921', '420822', '沙洋县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1922', '420881', '钟祥市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1923', '420900', '孝感市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1925', '420902', '孝南区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1926', '420921', '孝昌县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1927', '420922', '大悟县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1928', '420923', '云梦县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1929', '420981', '应城市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1930', '420982', '安陆市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1931', '420984', '汉川市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1932', '421000', '荆州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1934', '421002', '沙市区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1935', '421003', '荆州区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1936', '421022', '公安县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1937', '421023', '监利县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1938', '421024', '江陵县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1939', '421081', '石首市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1940', '421083', '洪湖市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1941', '421087', '松滋市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1942', '421100', '黄冈市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1944', '421102', '黄州区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1945', '421121', '团风县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1946', '421122', '红安县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1947', '421123', '罗田县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1948', '421124', '英山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1949', '421125', '浠水县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1950', '421126', '蕲春县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1951', '421127', '黄梅县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1952', '421181', '麻城市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1953', '421182', '武穴市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1954', '421200', '咸宁市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1956', '421202', '咸安区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1957', '421221', '嘉鱼县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1958', '421222', '通城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1959', '421223', '崇阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1960', '421224', '通山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1961', '421281', '赤壁市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1962', '421300', '随州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1964', '421303', '曾都区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1965', '421321', '随县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1966', '421381', '广水市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1967', '422800', '恩施土家族苗族自治州', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1968', '422801', '恩施市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1969', '422802', '利川市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1970', '422822', '建始县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1971', '422823', '巴东县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1972', '422825', '宣恩县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1973', '422826', '咸丰县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1974', '422827', '来凤县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1975', '422828', '鹤峰县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1976', '429000', '省直辖县', '2', '29', '0');
INSERT INTO `hy_region` VALUES ('1977', '429004', '仙桃市', '3', '32', '0');
INSERT INTO `hy_region` VALUES ('1978', '429005', '潜江市', '3', '32', '0');
INSERT INTO `hy_region` VALUES ('1979', '429006', '天门市', '3', '32', '0');
INSERT INTO `hy_region` VALUES ('1980', '429021', '神农架林区', '3', '32', '0');
INSERT INTO `hy_region` VALUES ('1981', '430000', '湖南省', '1', '12', '0');
INSERT INTO `hy_region` VALUES ('1982', '430100', '长沙市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1984', '430102', '芙蓉区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1985', '430103', '天心区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1986', '430104', '岳麓区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1987', '430105', '开福区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1988', '430111', '雨花区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1989', '430112', '望城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1990', '430121', '长沙县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1991', '430124', '宁乡县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1992', '430181', '浏阳市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1993', '430200', '株洲市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('1995', '430202', '荷塘区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1996', '430203', '芦淞区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1997', '430204', '石峰区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1998', '430211', '天元区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('1999', '430221', '株洲县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2000', '430223', '攸县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2001', '430224', '茶陵县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2002', '430225', '炎陵县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2003', '430281', '醴陵市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2004', '430300', '湘潭市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2006', '430302', '雨湖区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2007', '430304', '岳塘区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2008', '430321', '湘潭县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2009', '430381', '湘乡市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2010', '430382', '韶山市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2011', '430400', '衡阳市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2013', '430405', '珠晖区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2014', '430406', '雁峰区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2015', '430407', '石鼓区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2016', '430408', '蒸湘区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2017', '430412', '南岳区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2018', '430421', '衡阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2019', '430422', '衡南县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2020', '430423', '衡山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2021', '430424', '衡东县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2022', '430426', '祁东县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2023', '430481', '耒阳市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2024', '430482', '常宁市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2025', '430500', '邵阳市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2027', '430502', '双清区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2028', '430503', '大祥区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2029', '430511', '北塔区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2030', '430521', '邵东县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2031', '430522', '新邵县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2032', '430523', '邵阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2033', '430524', '隆回县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2034', '430525', '洞口县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2035', '430527', '绥宁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2036', '430528', '新宁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2037', '430529', '城步苗族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2038', '430581', '武冈市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2039', '430600', '岳阳市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2041', '430602', '岳阳楼区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2042', '430603', '云溪区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2043', '430611', '君山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2044', '430621', '岳阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2045', '430623', '华容县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2046', '430624', '湘阴县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2047', '430626', '平江县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2048', '430681', '汨罗市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2049', '430682', '临湘市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2050', '430700', '常德市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2052', '430702', '武陵区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2053', '430703', '鼎城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2054', '430721', '安乡县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2055', '430722', '汉寿县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2056', '430723', '澧县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2057', '430724', '临澧县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2058', '430725', '桃源县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2059', '430726', '石门县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2060', '430781', '津市市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2061', '430800', '张家界市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2063', '430802', '永定区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2064', '430811', '武陵源区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2065', '430821', '慈利县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2066', '430822', '桑植县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2067', '430900', '益阳市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2069', '430902', '资阳区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2070', '430903', '赫山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2071', '430921', '南县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2072', '430922', '桃江县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2073', '430923', '安化县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2074', '430981', '沅江市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2075', '431000', '郴州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2077', '431002', '北湖区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2078', '431003', '苏仙区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2079', '431021', '桂阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2080', '431022', '宜章县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2081', '431023', '永兴县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2082', '431024', '嘉禾县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2083', '431025', '临武县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2084', '431026', '汝城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2085', '431027', '桂东县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2086', '431028', '安仁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2087', '431081', '资兴市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2088', '431100', '永州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2090', '431102', '零陵区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2091', '431103', '冷水滩区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2092', '431121', '祁阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2093', '431122', '东安县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2094', '431123', '双牌县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2095', '431124', '道县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2096', '431125', '江永县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2097', '431126', '宁远县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2098', '431127', '蓝山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2099', '431128', '新田县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2100', '431129', '江华瑶族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2101', '431200', '怀化市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2103', '431202', '鹤城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2104', '431221', '中方县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2105', '431222', '沅陵县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2106', '431223', '辰溪县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2107', '431224', '溆浦县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2108', '431225', '会同县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2109', '431226', '麻阳苗族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2110', '431227', '新晃侗族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2111', '431228', '芷江侗族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2112', '431229', '靖州苗族侗族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2113', '431230', '通道侗族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2114', '431281', '洪江市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2115', '431300', '娄底市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2117', '431302', '娄星区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2118', '431321', '双峰县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2119', '431322', '新化县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2120', '431381', '冷水江市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2121', '431382', '涟源市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2122', '433100', '湘西土家族苗族自治州', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2123', '433101', '吉首市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2124', '433122', '泸溪县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2125', '433123', '凤凰县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2126', '433124', '花垣县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2127', '433125', '保靖县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2128', '433126', '古丈县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2129', '433127', '永顺县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2130', '433130', '龙山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2131', '440000', '广东省', '1', '12', '0');
INSERT INTO `hy_region` VALUES ('2132', '440100', '广州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2134', '440103', '荔湾区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2135', '440104', '越秀区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2136', '440105', '海珠区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2137', '440106', '天河区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2138', '440111', '白云区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2139', '440112', '黄埔区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2140', '440113', '番禺区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2141', '440114', '花都区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2142', '440115', '南沙区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2143', '440116', '萝岗区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2144', '440117', '从化区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2145', '440118', '增城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2146', '440200', '韶关市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2148', '440203', '武江区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2149', '440204', '浈江区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2150', '440205', '曲江区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2151', '440222', '始兴县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2152', '440224', '仁化县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2153', '440229', '翁源县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2154', '440232', '乳源瑶族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2155', '440233', '新丰县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2156', '440281', '乐昌市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2157', '440282', '南雄市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2158', '440300', '深圳市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2160', '440303', '罗湖区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2161', '440304', '福田区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2162', '440305', '南山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2163', '440306', '宝安区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2164', '440307', '龙岗区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2165', '440308', '盐田区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2166', '440400', '珠海市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2168', '440402', '香洲区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2169', '440403', '斗门区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2170', '440404', '金湾区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2171', '440500', '汕头市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2173', '440507', '龙湖区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2174', '440511', '金平区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2175', '440512', '濠江区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2176', '440513', '潮阳区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2177', '440514', '潮南区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2178', '440515', '澄海区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2179', '440523', '南澳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2180', '440600', '佛山市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2182', '440604', '禅城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2183', '440605', '南海区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2184', '440606', '顺德区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2185', '440607', '三水区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2186', '440608', '高明区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2187', '440700', '江门市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2189', '440703', '蓬江区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2190', '440704', '江海区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2191', '440705', '新会区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2192', '440781', '台山市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2193', '440783', '开平市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2194', '440784', '鹤山市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2195', '440785', '恩平市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2196', '440800', '湛江市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2198', '440802', '赤坎区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2199', '440803', '霞山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2200', '440804', '坡头区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2201', '440811', '麻章区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2202', '440823', '遂溪县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2203', '440825', '徐闻县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2204', '440881', '廉江市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2205', '440882', '雷州市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2206', '440883', '吴川市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2207', '440900', '茂名市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2209', '440902', '茂南区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2210', '440904', '电白区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2211', '440981', '高州市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2212', '440982', '化州市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2213', '440983', '信宜市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2214', '441200', '肇庆市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2216', '441202', '端州区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2217', '441203', '鼎湖区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2218', '441223', '广宁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2219', '441224', '怀集县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2220', '441225', '封开县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2221', '441226', '德庆县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2222', '441283', '高要市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2223', '441284', '四会市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2224', '441300', '惠州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2226', '441302', '惠城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2227', '441303', '惠阳区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2228', '441322', '博罗县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2229', '441323', '惠东县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2230', '441324', '龙门县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2231', '441400', '梅州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2233', '441402', '梅江区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2234', '441403', '梅县区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2235', '441422', '大埔县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2236', '441423', '丰顺县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2237', '441424', '五华县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2238', '441426', '平远县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2239', '441427', '蕉岭县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2240', '441481', '兴宁市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2241', '441500', '汕尾市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2243', '441502', '城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2244', '441521', '海丰县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2245', '441523', '陆河县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2246', '441581', '陆丰市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2247', '441600', '河源市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2249', '441602', '源城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2250', '441621', '紫金县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2251', '441622', '龙川县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2252', '441623', '连平县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2253', '441624', '和平县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2254', '441625', '东源县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2255', '441700', '阳江市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2257', '441702', '江城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2258', '441721', '阳西县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2259', '441723', '阳东县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2260', '441781', '阳春市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2261', '441800', '清远市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2263', '441802', '清城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2264', '441803', '清新区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2265', '441821', '佛冈县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2266', '441823', '阳山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2267', '441825', '连山壮族瑶族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2268', '441826', '连南瑶族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2269', '441881', '英德市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2270', '441882', '连州市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2271', '441900', '东莞市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2272', '442000', '中山市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2273', '445100', '潮州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2275', '445102', '湘桥区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2276', '445103', '潮安区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2277', '445122', '饶平县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2278', '445200', '揭阳市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2280', '445202', '榕城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2281', '445203', '揭东区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2282', '445222', '揭西县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2283', '445224', '惠来县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2284', '445281', '普宁市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2285', '445300', '云浮市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2287', '445302', '云城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2288', '445303', '云安区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2289', '445321', '新兴县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2290', '445322', '郁南县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2291', '445381', '罗定市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2292', '450000', '广西', '1', '12', '0');
INSERT INTO `hy_region` VALUES ('2293', '450100', '南宁市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2295', '450102', '兴宁区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2296', '450103', '青秀区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2297', '450105', '江南区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2298', '450107', '西乡塘区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2299', '450108', '良庆区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2300', '450109', '邕宁区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2301', '450122', '武鸣县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2302', '450123', '隆安县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2303', '450124', '马山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2304', '450125', '上林县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2305', '450126', '宾阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2306', '450127', '横县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2307', '450200', '柳州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2309', '450202', '城中区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2310', '450203', '鱼峰区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2311', '450204', '柳南区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2312', '450205', '柳北区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2313', '450221', '柳江县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2314', '450222', '柳城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2315', '450223', '鹿寨县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2316', '450224', '融安县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2317', '450225', '融水苗族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2318', '450226', '三江侗族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2319', '450300', '桂林市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2321', '450302', '秀峰区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2322', '450303', '叠彩区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2323', '450304', '象山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2324', '450305', '七星区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2325', '450311', '雁山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2326', '450312', '临桂区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2327', '450321', '阳朔县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2328', '450323', '灵川县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2329', '450324', '全州县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2330', '450325', '兴安县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2331', '450326', '永福县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2332', '450327', '灌阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2333', '450328', '龙胜各族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2334', '450329', '资源县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2335', '450330', '平乐县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2336', '450331', '荔浦县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2337', '450332', '恭城瑶族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2338', '450400', '梧州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2340', '450403', '万秀区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2341', '450405', '长洲区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2342', '450406', '龙圩区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2343', '450421', '苍梧县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2344', '450422', '藤县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2345', '450423', '蒙山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2346', '450481', '岑溪市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2347', '450500', '北海市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2349', '450502', '海城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2350', '450503', '银海区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2351', '450512', '铁山港区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2352', '450521', '合浦县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2353', '450600', '防城港市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2355', '450602', '港口区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2356', '450603', '防城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2357', '450621', '上思县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2358', '450681', '东兴市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2359', '450700', '钦州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2361', '450702', '钦南区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2362', '450703', '钦北区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2363', '450721', '灵山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2364', '450722', '浦北县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2365', '450800', '贵港市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2367', '450802', '港北区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2368', '450803', '港南区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2369', '450804', '覃塘区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2370', '450821', '平南县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2371', '450881', '桂平市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2372', '450900', '玉林市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2374', '450902', '玉州区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2375', '450903', '福绵区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2376', '450921', '容县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2377', '450922', '陆川县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2378', '450923', '博白县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2379', '450924', '兴业县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2380', '450981', '北流市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2381', '451000', '百色市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2383', '451002', '右江区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2384', '451021', '田阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2385', '451022', '田东县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2386', '451023', '平果县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2387', '451024', '德保县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2388', '451025', '靖西县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2389', '451026', '那坡县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2390', '451027', '凌云县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2391', '451028', '乐业县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2392', '451029', '田林县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2393', '451030', '西林县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2394', '451031', '隆林各族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2395', '451100', '贺州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2397', '451102', '八步区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2398', '451121', '昭平县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2399', '451122', '钟山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2400', '451123', '富川瑶族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2401', '451200', '河池市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2403', '451202', '金城江区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2404', '451221', '南丹县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2405', '451222', '天峨县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2406', '451223', '凤山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2407', '451224', '东兰县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2408', '451225', '罗城仫佬族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2409', '451226', '环江毛南族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2410', '451227', '巴马瑶族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2411', '451228', '都安瑶族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2412', '451229', '大化瑶族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2413', '451281', '宜州市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2414', '451300', '来宾市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2416', '451302', '兴宾区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2417', '451321', '忻城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2418', '451322', '象州县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2419', '451323', '武宣县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2420', '451324', '金秀瑶族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2421', '451381', '合山市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2422', '451400', '崇左市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2424', '451402', '江州区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2425', '451421', '扶绥县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2426', '451422', '宁明县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2427', '451423', '龙州县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2428', '451424', '大新县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2429', '451425', '天等县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2430', '451481', '凭祥市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2431', '460000', '海南省', '1', '12', '0');
INSERT INTO `hy_region` VALUES ('2432', '460100', '海口市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2434', '460105', '秀英区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2435', '460106', '龙华区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2436', '460107', '琼山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2437', '460108', '美兰区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2438', '460200', '三亚市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2440', '460202', '海棠区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2441', '460203', '吉阳区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2442', '460204', '天涯区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2443', '460205', '崖州区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2444', '460300', '三沙市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2445', '469000', '省直辖县', '2', '29', '0');
INSERT INTO `hy_region` VALUES ('2446', '469001', '五指山市', '3', '32', '0');
INSERT INTO `hy_region` VALUES ('2447', '469002', '琼海市', '3', '32', '0');
INSERT INTO `hy_region` VALUES ('2448', '469003', '儋州市', '3', '32', '0');
INSERT INTO `hy_region` VALUES ('2449', '469005', '文昌市', '3', '32', '0');
INSERT INTO `hy_region` VALUES ('2450', '469006', '万宁市', '3', '32', '0');
INSERT INTO `hy_region` VALUES ('2451', '469007', '东方市', '3', '32', '0');
INSERT INTO `hy_region` VALUES ('2452', '469021', '定安县', '3', '32', '0');
INSERT INTO `hy_region` VALUES ('2453', '469022', '屯昌县', '3', '32', '0');
INSERT INTO `hy_region` VALUES ('2454', '469023', '澄迈县', '3', '32', '0');
INSERT INTO `hy_region` VALUES ('2455', '469024', '临高县', '3', '32', '0');
INSERT INTO `hy_region` VALUES ('2456', '469025', '白沙黎族自治县', '3', '32', '0');
INSERT INTO `hy_region` VALUES ('2457', '469026', '昌江黎族自治县', '3', '32', '0');
INSERT INTO `hy_region` VALUES ('2458', '469027', '乐东黎族自治县', '3', '32', '0');
INSERT INTO `hy_region` VALUES ('2459', '469028', '陵水黎族自治县', '3', '32', '0');
INSERT INTO `hy_region` VALUES ('2460', '469029', '保亭黎族苗族自治县', '3', '32', '0');
INSERT INTO `hy_region` VALUES ('2461', '469030', '琼中黎族苗族自治县', '3', '32', '0');
INSERT INTO `hy_region` VALUES ('2462', '500000', '重庆市', '1', '11', '0');
INSERT INTO `hy_region` VALUES ('2463', '500100', '市辖区', '2', '22', '0');
INSERT INTO `hy_region` VALUES ('2464', '500101', '万州区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2465', '500102', '涪陵区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2466', '500103', '渝中区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2467', '500104', '大渡口区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2468', '500105', '江北区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2469', '500106', '沙坪坝区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2470', '500107', '九龙坡区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2471', '500108', '南岸区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2472', '500109', '北碚区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2473', '500110', '綦江区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2474', '500111', '大足区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2475', '500112', '渝北区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2476', '500113', '巴南区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2477', '500114', '黔江区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2478', '500115', '长寿区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2479', '500116', '江津区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2480', '500117', '合川区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2481', '500118', '永川区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2482', '500119', '南川区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2483', '500120', '璧山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2484', '500151', '铜梁区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2485', '500200', '市辖县', '2', '22', '0');
INSERT INTO `hy_region` VALUES ('2486', '500223', '潼南县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2487', '500226', '荣昌县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2488', '500228', '梁平县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2489', '500229', '城口县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2490', '500230', '丰都县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2491', '500231', '垫江县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2492', '500232', '武隆县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2493', '500233', '忠县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2494', '500234', '开县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2495', '500235', '云阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2496', '500236', '奉节县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2497', '500237', '巫山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2498', '500238', '巫溪县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2499', '500240', '石柱土家族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2500', '500241', '秀山土家族苗族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2501', '500242', '酉阳土家族苗族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2502', '500243', '彭水苗族土家族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2503', '510000', '四川省', '1', '12', '0');
INSERT INTO `hy_region` VALUES ('2504', '510100', '成都市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2506', '510104', '锦江区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2507', '510105', '青羊区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2508', '510106', '金牛区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2509', '510107', '武侯区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2510', '510108', '成华区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2511', '510112', '龙泉驿区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2512', '510113', '青白江区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2513', '510114', '新都区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2514', '510115', '温江区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2515', '510121', '金堂县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2516', '510122', '双流县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2517', '510124', '郫县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2518', '510129', '大邑县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2519', '510131', '蒲江县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2520', '510132', '新津县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2521', '510181', '都江堰市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2522', '510182', '彭州市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2523', '510183', '邛崃市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2524', '510184', '崇州市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2525', '510300', '自贡市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2527', '510302', '自流井区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2528', '510303', '贡井区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2529', '510304', '大安区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2530', '510311', '沿滩区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2531', '510321', '荣县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2532', '510322', '富顺县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2533', '510400', '攀枝花市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2535', '510402', '东区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2536', '510403', '西区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2537', '510411', '仁和区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2538', '510421', '米易县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2539', '510422', '盐边县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2540', '510500', '泸州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2542', '510502', '江阳区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2543', '510503', '纳溪区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2544', '510504', '龙马潭区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2545', '510521', '泸县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2546', '510522', '合江县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2547', '510524', '叙永县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2548', '510525', '古蔺县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2549', '510600', '德阳市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2551', '510603', '旌阳区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2552', '510623', '中江县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2553', '510626', '罗江县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2554', '510681', '广汉市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2555', '510682', '什邡市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2556', '510683', '绵竹市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2557', '510700', '绵阳市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2559', '510703', '涪城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2560', '510704', '游仙区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2561', '510722', '三台县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2562', '510723', '盐亭县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2563', '510724', '安县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2564', '510725', '梓潼县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2565', '510726', '北川羌族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2566', '510727', '平武县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2567', '510781', '江油市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2568', '510800', '广元市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2570', '510802', '利州区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2571', '510811', '昭化区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2572', '510812', '朝天区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2573', '510821', '旺苍县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2574', '510822', '青川县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2575', '510823', '剑阁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2576', '510824', '苍溪县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2577', '510900', '遂宁市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2579', '510903', '船山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2580', '510904', '安居区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2581', '510921', '蓬溪县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2582', '510922', '射洪县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2583', '510923', '大英县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2584', '511000', '内江市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2586', '511002', '市中区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2587', '511011', '东兴区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2588', '511024', '威远县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2589', '511025', '资中县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2590', '511028', '隆昌县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2591', '511100', '乐山市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2593', '511102', '市中区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2594', '511111', '沙湾区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2595', '511112', '五通桥区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2596', '511113', '金口河区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2597', '511123', '犍为县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2598', '511124', '井研县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2599', '511126', '夹江县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2600', '511129', '沐川县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2601', '511132', '峨边彝族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2602', '511133', '马边彝族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2603', '511181', '峨眉山市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2604', '511300', '南充市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2606', '511302', '顺庆区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2607', '511303', '高坪区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2608', '511304', '嘉陵区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2609', '511321', '南部县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2610', '511322', '营山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2611', '511323', '蓬安县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2612', '511324', '仪陇县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2613', '511325', '西充县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2614', '511381', '阆中市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2615', '511400', '眉山市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2617', '511402', '东坡区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2618', '511421', '仁寿县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2619', '511422', '彭山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2620', '511423', '洪雅县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2621', '511424', '丹棱县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2622', '511425', '青神县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2623', '511500', '宜宾市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2625', '511502', '翠屏区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2626', '511503', '南溪区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2627', '511521', '宜宾县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2628', '511523', '江安县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2629', '511524', '长宁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2630', '511525', '高县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2631', '511526', '珙县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2632', '511527', '筠连县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2633', '511528', '兴文县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2634', '511529', '屏山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2635', '511600', '广安市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2637', '511602', '广安区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2638', '511603', '前锋区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2639', '511621', '岳池县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2640', '511622', '武胜县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2641', '511623', '邻水县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2642', '511681', '华蓥市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2643', '511700', '达州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2645', '511702', '通川区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2646', '511703', '达川区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2647', '511722', '宣汉县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2648', '511723', '开江县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2649', '511724', '大竹县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2650', '511725', '渠县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2651', '511781', '万源市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2652', '511800', '雅安市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2654', '511802', '雨城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2655', '511803', '名山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2656', '511822', '荥经县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2657', '511823', '汉源县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2658', '511824', '石棉县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2659', '511825', '天全县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2660', '511826', '芦山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2661', '511827', '宝兴县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2662', '511900', '巴中市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2664', '511902', '巴州区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2665', '511903', '恩阳区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2666', '511921', '通江县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2667', '511922', '南江县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2668', '511923', '平昌县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2669', '512000', '资阳市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2671', '512002', '雁江区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2672', '512021', '安岳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2673', '512022', '乐至县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2674', '512081', '简阳市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2675', '513200', '阿坝藏族羌族自治州', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2676', '513221', '汶川县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2677', '513222', '理县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2678', '513223', '茂县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2679', '513224', '松潘县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2680', '513225', '九寨沟县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2681', '513226', '金川县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2682', '513227', '小金县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2683', '513228', '黑水县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2684', '513229', '马尔康县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2685', '513230', '壤塘县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2686', '513231', '阿坝县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2687', '513232', '若尔盖县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2688', '513233', '红原县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2689', '513300', '甘孜藏族自治州', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2690', '513321', '康定县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2691', '513322', '泸定县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2692', '513323', '丹巴县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2693', '513324', '九龙县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2694', '513325', '雅江县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2695', '513326', '道孚县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2696', '513327', '炉霍县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2697', '513328', '甘孜县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2698', '513329', '新龙县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2699', '513330', '德格县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2700', '513331', '白玉县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2701', '513332', '石渠县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2702', '513333', '色达县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2703', '513334', '理塘县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2704', '513335', '巴塘县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2705', '513336', '乡城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2706', '513337', '稻城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2707', '513338', '得荣县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2708', '513400', '凉山彝族自治州', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2709', '513401', '西昌市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2710', '513422', '木里藏族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2711', '513423', '盐源县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2712', '513424', '德昌县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2713', '513425', '会理县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2714', '513426', '会东县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2715', '513427', '宁南县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2716', '513428', '普格县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2717', '513429', '布拖县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2718', '513430', '金阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2719', '513431', '昭觉县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2720', '513432', '喜德县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2721', '513433', '冕宁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2722', '513434', '越西县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2723', '513435', '甘洛县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2724', '513436', '美姑县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2725', '513437', '雷波县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2726', '520000', '贵州省', '1', '12', '0');
INSERT INTO `hy_region` VALUES ('2727', '520100', '贵阳市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2729', '520102', '南明区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2730', '520103', '云岩区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2731', '520111', '花溪区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2732', '520112', '乌当区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2733', '520113', '白云区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2734', '520115', '观山湖区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2735', '520121', '开阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2736', '520122', '息烽县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2737', '520123', '修文县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2738', '520181', '清镇市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2739', '520200', '六盘水市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2740', '520201', '钟山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2741', '520203', '六枝特区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2742', '520221', '水城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2743', '520222', '盘县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2744', '520300', '遵义市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2746', '520302', '红花岗区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2747', '520303', '汇川区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2748', '520321', '遵义县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2749', '520322', '桐梓县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2750', '520323', '绥阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2751', '520324', '正安县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2752', '520325', '道真仡佬族苗族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2753', '520326', '务川仡佬族苗族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2754', '520327', '凤冈县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2755', '520328', '湄潭县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2756', '520329', '余庆县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2757', '520330', '习水县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2758', '520381', '赤水市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2759', '520382', '仁怀市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2760', '520400', '安顺市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2762', '520402', '西秀区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2763', '520421', '平坝县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2764', '520422', '普定县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2765', '520423', '镇宁布依族苗族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2766', '520424', '关岭布依族苗族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2767', '520425', '紫云苗族布依族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2768', '520500', '毕节市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2770', '520502', '七星关区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2771', '520521', '大方县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2772', '520522', '黔西县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2773', '520523', '金沙县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2774', '520524', '织金县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2775', '520525', '纳雍县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2776', '520526', '威宁彝族回族苗族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2777', '520527', '赫章县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2778', '520600', '铜仁市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2780', '520602', '碧江区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2781', '520603', '万山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2782', '520621', '江口县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2783', '520622', '玉屏侗族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2784', '520623', '石阡县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2785', '520624', '思南县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2786', '520625', '印江土家族苗族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2787', '520626', '德江县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2788', '520627', '沿河土家族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2789', '520628', '松桃苗族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2790', '522300', '黔西南布依族苗族自治州', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2791', '522301', '兴义市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2792', '522322', '兴仁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2793', '522323', '普安县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2794', '522324', '晴隆县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2795', '522325', '贞丰县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2796', '522326', '望谟县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2797', '522327', '册亨县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2798', '522328', '安龙县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2799', '522600', '黔东南苗族侗族自治州', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2800', '522601', '凯里市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2801', '522622', '黄平县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2802', '522623', '施秉县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2803', '522624', '三穗县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2804', '522625', '镇远县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2805', '522626', '岑巩县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2806', '522627', '天柱县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2807', '522628', '锦屏县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2808', '522629', '剑河县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2809', '522630', '台江县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2810', '522631', '黎平县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2811', '522632', '榕江县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2812', '522633', '从江县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2813', '522634', '雷山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2814', '522635', '麻江县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2815', '522636', '丹寨县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2816', '522700', '黔南布依族苗族自治州', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2817', '522701', '都匀市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2818', '522702', '福泉市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2819', '522722', '荔波县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2820', '522723', '贵定县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2821', '522725', '瓮安县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2822', '522726', '独山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2823', '522727', '平塘县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2824', '522728', '罗甸县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2825', '522729', '长顺县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2826', '522730', '龙里县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2827', '522731', '惠水县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2828', '522732', '三都水族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2829', '530000', '云南省', '1', '12', '0');
INSERT INTO `hy_region` VALUES ('2830', '530100', '昆明市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2832', '530102', '五华区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2833', '530103', '盘龙区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2834', '530111', '官渡区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2835', '530112', '西山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2836', '530113', '东川区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2837', '530114', '呈贡区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2838', '530122', '晋宁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2839', '530124', '富民县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2840', '530125', '宜良县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2841', '530126', '石林彝族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2842', '530127', '嵩明县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2843', '530128', '禄劝彝族苗族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2844', '530129', '寻甸回族彝族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2845', '530181', '安宁市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2846', '530300', '曲靖市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2848', '530302', '麒麟区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2849', '530321', '马龙县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2850', '530322', '陆良县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2851', '530323', '师宗县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2852', '530324', '罗平县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2853', '530325', '富源县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2854', '530326', '会泽县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2855', '530328', '沾益县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2856', '530381', '宣威市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2857', '530400', '玉溪市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2859', '530402', '红塔区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2860', '530421', '江川县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2861', '530422', '澄江县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2862', '530423', '通海县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2863', '530424', '华宁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2864', '530425', '易门县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2865', '530426', '峨山彝族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2866', '530427', '新平彝族傣族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2867', '530428', '元江哈尼族彝族傣族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2868', '530500', '保山市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2870', '530502', '隆阳区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2871', '530521', '施甸县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2872', '530522', '腾冲县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2873', '530523', '龙陵县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2874', '530524', '昌宁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2875', '530600', '昭通市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2877', '530602', '昭阳区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2878', '530621', '鲁甸县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2879', '530622', '巧家县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2880', '530623', '盐津县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2881', '530624', '大关县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2882', '530625', '永善县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2883', '530626', '绥江县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2884', '530627', '镇雄县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2885', '530628', '彝良县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2886', '530629', '威信县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2887', '530630', '水富县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2888', '530700', '丽江市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2890', '530702', '古城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2891', '530721', '玉龙纳西族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2892', '530722', '永胜县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2893', '530723', '华坪县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2894', '530724', '宁蒗彝族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2895', '530800', '普洱市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2897', '530802', '思茅区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2898', '530821', '宁洱哈尼族彝族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2899', '530822', '墨江哈尼族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2900', '530823', '景东彝族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2901', '530824', '景谷傣族彝族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2902', '530825', '镇沅彝族哈尼族拉祜族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2903', '530826', '江城哈尼族彝族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2904', '530827', '孟连傣族拉祜族佤族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2905', '530828', '澜沧拉祜族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2906', '530829', '西盟佤族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2907', '530900', '临沧市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2909', '530902', '临翔区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2910', '530921', '凤庆县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2911', '530922', '云县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2912', '530923', '永德县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2913', '530924', '镇康县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2914', '530925', '双江拉祜族佤族布朗族傣族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2915', '530926', '耿马傣族佤族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2916', '530927', '沧源佤族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2917', '532300', '楚雄彝族自治州', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2918', '532301', '楚雄市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2919', '532322', '双柏县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2920', '532323', '牟定县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2921', '532324', '南华县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2922', '532325', '姚安县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2923', '532326', '大姚县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2924', '532327', '永仁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2925', '532328', '元谋县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2926', '532329', '武定县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2927', '532331', '禄丰县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2928', '532500', '红河哈尼族彝族自治州', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2929', '532501', '个旧市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2930', '532502', '开远市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2931', '532503', '蒙自市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2932', '532504', '弥勒市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2933', '532523', '屏边苗族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2934', '532524', '建水县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2935', '532525', '石屏县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2936', '532527', '泸西县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2937', '532528', '元阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2938', '532529', '红河县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2939', '532530', '金平苗族瑶族傣族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2940', '532531', '绿春县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2941', '532532', '河口瑶族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2942', '532600', '文山壮族苗族自治州', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2943', '532601', '文山市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2944', '532622', '砚山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2945', '532623', '西畴县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2946', '532624', '麻栗坡县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2947', '532625', '马关县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2948', '532626', '丘北县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2949', '532627', '广南县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2950', '532628', '富宁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2951', '532800', '西双版纳傣族自治州', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2952', '532801', '景洪市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2953', '532822', '勐海县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2954', '532823', '勐腊县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2955', '532900', '大理白族自治州', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2956', '532901', '大理市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2957', '532922', '漾濞彝族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2958', '532923', '祥云县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2959', '532924', '宾川县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2960', '532925', '弥渡县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2961', '532926', '南涧彝族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2962', '532927', '巍山彝族回族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2963', '532928', '永平县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2964', '532929', '云龙县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2965', '532930', '洱源县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2966', '532931', '剑川县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2967', '532932', '鹤庆县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2968', '533100', '德宏傣族景颇族自治州', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2969', '533102', '瑞丽市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2970', '533103', '芒市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2971', '533122', '梁河县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2972', '533123', '盈江县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2973', '533124', '陇川县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2974', '533300', '怒江傈僳族自治州', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2975', '533321', '泸水县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2976', '533323', '福贡县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2977', '533324', '贡山独龙族怒族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2978', '533325', '兰坪白族普米族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2979', '533400', '迪庆藏族自治州', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2980', '533421', '香格里拉县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2981', '533422', '德钦县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2982', '533423', '维西傈僳族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2983', '540000', '西藏', '1', '12', '0');
INSERT INTO `hy_region` VALUES ('2984', '540100', '拉萨市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2986', '540102', '城关区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2987', '540121', '林周县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2988', '540122', '当雄县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2989', '540123', '尼木县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2990', '540124', '曲水县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2991', '540125', '堆龙德庆县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2992', '540126', '达孜县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2993', '540127', '墨竹工卡县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2994', '540200', '日喀则市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('2995', '540202', '桑珠孜区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2996', '540221', '南木林县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2997', '540222', '江孜县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2998', '540223', '定日县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('2999', '540224', '萨迦县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3000', '540225', '拉孜县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3001', '540226', '昂仁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3002', '540227', '谢通门县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3003', '540228', '白朗县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3004', '540229', '仁布县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3005', '540230', '康马县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3006', '540231', '定结县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3007', '540232', '仲巴县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3008', '540233', '亚东县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3009', '540234', '吉隆县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3010', '540235', '聂拉木县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3011', '540236', '萨嘎县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3012', '540237', '岗巴县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3013', '542100', '昌都地区', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3014', '542121', '昌都县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3015', '542122', '江达县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3016', '542123', '贡觉县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3017', '542124', '类乌齐县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3018', '542125', '丁青县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3019', '542126', '察雅县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3020', '542127', '八宿县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3021', '542128', '左贡县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3022', '542129', '芒康县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3023', '542132', '洛隆县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3024', '542133', '边坝县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3025', '542200', '山南地区', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3026', '542221', '乃东县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3027', '542222', '扎囊县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3028', '542223', '贡嘎县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3029', '542224', '桑日县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3030', '542225', '琼结县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3031', '542226', '曲松县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3032', '542227', '措美县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3033', '542228', '洛扎县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3034', '542229', '加查县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3035', '542231', '隆子县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3036', '542232', '错那县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3037', '542233', '浪卡子县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3038', '542400', '那曲地区', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3039', '542421', '那曲县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3040', '542422', '嘉黎县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3041', '542423', '比如县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3042', '542424', '聂荣县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3043', '542425', '安多县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3044', '542426', '申扎县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3045', '542427', '索县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3046', '542428', '班戈县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3047', '542429', '巴青县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3048', '542430', '尼玛县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3049', '542431', '双湖县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3050', '542500', '阿里地区', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3051', '542521', '普兰县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3052', '542522', '札达县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3053', '542523', '噶尔县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3054', '542524', '日土县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3055', '542525', '革吉县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3056', '542526', '改则县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3057', '542527', '措勤县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3058', '542600', '林芝地区', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3059', '542621', '林芝县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3060', '542622', '工布江达县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3061', '542623', '米林县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3062', '542624', '墨脱县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3063', '542625', '波密县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3064', '542626', '察隅县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3065', '542627', '朗县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3066', '610000', '陕西省', '1', '12', '0');
INSERT INTO `hy_region` VALUES ('3067', '610100', '西安市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3069', '610102', '新城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3070', '610103', '碑林区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3071', '610104', '莲湖区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3072', '610111', '灞桥区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3073', '610112', '未央区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3074', '610113', '雁塔区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3075', '610114', '阎良区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3076', '610115', '临潼区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3077', '610116', '长安区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3078', '610122', '蓝田县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3079', '610124', '周至县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3080', '610125', '户县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3081', '610126', '高陵县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3082', '610200', '铜川市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3084', '610202', '王益区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3085', '610203', '印台区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3086', '610204', '耀州区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3087', '610222', '宜君县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3088', '610300', '宝鸡市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3090', '610302', '渭滨区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3091', '610303', '金台区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3092', '610304', '陈仓区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3093', '610322', '凤翔县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3094', '610323', '岐山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3095', '610324', '扶风县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3096', '610326', '眉县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3097', '610327', '陇县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3098', '610328', '千阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3099', '610329', '麟游县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3100', '610330', '凤县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3101', '610331', '太白县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3102', '610400', '咸阳市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3104', '610402', '秦都区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3105', '610403', '杨陵区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3106', '610404', '渭城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3107', '610422', '三原县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3108', '610423', '泾阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3109', '610424', '乾县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3110', '610425', '礼泉县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3111', '610426', '永寿县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3112', '610427', '彬县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3113', '610428', '长武县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3114', '610429', '旬邑县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3115', '610430', '淳化县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3116', '610431', '武功县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3117', '610481', '兴平市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3118', '610500', '渭南市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3120', '610502', '临渭区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3121', '610521', '华县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3122', '610522', '潼关县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3123', '610523', '大荔县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3124', '610524', '合阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3125', '610525', '澄城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3126', '610526', '蒲城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3127', '610527', '白水县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3128', '610528', '富平县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3129', '610581', '韩城市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3130', '610582', '华阴市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3131', '610600', '延安市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3133', '610602', '宝塔区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3134', '610621', '延长县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3135', '610622', '延川县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3136', '610623', '子长县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3137', '610624', '安塞县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3138', '610625', '志丹县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3139', '610626', '吴起县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3140', '610627', '甘泉县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3141', '610628', '富县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3142', '610629', '洛川县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3143', '610630', '宜川县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3144', '610631', '黄龙县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3145', '610632', '黄陵县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3146', '610700', '汉中市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3148', '610702', '汉台区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3149', '610721', '南郑县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3150', '610722', '城固县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3151', '610723', '洋县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3152', '610724', '西乡县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3153', '610725', '勉县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3154', '610726', '宁强县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3155', '610727', '略阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3156', '610728', '镇巴县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3157', '610729', '留坝县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3158', '610730', '佛坪县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3159', '610800', '榆林市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3161', '610802', '榆阳区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3162', '610821', '神木县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3163', '610822', '府谷县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3164', '610823', '横山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3165', '610824', '靖边县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3166', '610825', '定边县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3167', '610826', '绥德县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3168', '610827', '米脂县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3169', '610828', '佳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3170', '610829', '吴堡县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3171', '610830', '清涧县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3172', '610831', '子洲县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3173', '610900', '安康市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3175', '610902', '汉滨区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3176', '610921', '汉阴县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3177', '610922', '石泉县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3178', '610923', '宁陕县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3179', '610924', '紫阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3180', '610925', '岚皋县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3181', '610926', '平利县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3182', '610927', '镇坪县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3183', '610928', '旬阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3184', '610929', '白河县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3185', '611000', '商洛市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3187', '611002', '商州区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3188', '611021', '洛南县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3189', '611022', '丹凤县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3190', '611023', '商南县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3191', '611024', '山阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3192', '611025', '镇安县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3193', '611026', '柞水县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3194', '620000', '甘肃省', '1', '12', '0');
INSERT INTO `hy_region` VALUES ('3195', '620100', '兰州市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3197', '620102', '城关区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3198', '620103', '七里河区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3199', '620104', '西固区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3200', '620105', '安宁区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3201', '620111', '红古区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3202', '620121', '永登县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3203', '620122', '皋兰县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3204', '620123', '榆中县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3205', '620200', '嘉峪关市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3207', '620300', '金昌市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3209', '620302', '金川区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3210', '620321', '永昌县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3211', '620400', '白银市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3213', '620402', '白银区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3214', '620403', '平川区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3215', '620421', '靖远县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3216', '620422', '会宁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3217', '620423', '景泰县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3218', '620500', '天水市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3220', '620502', '秦州区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3221', '620503', '麦积区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3222', '620521', '清水县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3223', '620522', '秦安县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3224', '620523', '甘谷县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3225', '620524', '武山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3226', '620525', '张家川回族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3227', '620600', '武威市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3229', '620602', '凉州区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3230', '620621', '民勤县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3231', '620622', '古浪县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3232', '620623', '天祝藏族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3233', '620700', '张掖市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3235', '620702', '甘州区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3236', '620721', '肃南裕固族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3237', '620722', '民乐县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3238', '620723', '临泽县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3239', '620724', '高台县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3240', '620725', '山丹县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3241', '620800', '平凉市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3243', '620802', '崆峒区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3244', '620821', '泾川县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3245', '620822', '灵台县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3246', '620823', '崇信县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3247', '620824', '华亭县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3248', '620825', '庄浪县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3249', '620826', '静宁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3250', '620900', '酒泉市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3252', '620902', '肃州区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3253', '620921', '金塔县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3254', '620922', '瓜州县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3255', '620923', '肃北蒙古族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3256', '620924', '阿克塞哈萨克族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3257', '620981', '玉门市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3258', '620982', '敦煌市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3259', '621000', '庆阳市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3261', '621002', '西峰区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3262', '621021', '庆城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3263', '621022', '环县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3264', '621023', '华池县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3265', '621024', '合水县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3266', '621025', '正宁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3267', '621026', '宁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3268', '621027', '镇原县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3269', '621100', '定西市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3271', '621102', '安定区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3272', '621121', '通渭县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3273', '621122', '陇西县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3274', '621123', '渭源县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3275', '621124', '临洮县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3276', '621125', '漳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3277', '621126', '岷县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3278', '621200', '陇南市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3280', '621202', '武都区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3281', '621221', '成县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3282', '621222', '文县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3283', '621223', '宕昌县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3284', '621224', '康县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3285', '621225', '西和县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3286', '621226', '礼县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3287', '621227', '徽县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3288', '621228', '两当县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3289', '622900', '临夏回族自治州', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3290', '622901', '临夏市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3291', '622921', '临夏县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3292', '622922', '康乐县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3293', '622923', '永靖县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3294', '622924', '广河县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3295', '622925', '和政县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3296', '622926', '东乡族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3297', '622927', '积石山保安族东乡族撒拉族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3298', '623000', '甘南藏族自治州', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3299', '623001', '合作市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3300', '623021', '临潭县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3301', '623022', '卓尼县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3302', '623023', '舟曲县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3303', '623024', '迭部县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3304', '623025', '玛曲县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3305', '623026', '碌曲县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3306', '623027', '夏河县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3307', '630000', '青海省', '1', '12', '0');
INSERT INTO `hy_region` VALUES ('3308', '630100', '西宁市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3310', '630102', '城东区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3311', '630103', '城中区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3312', '630104', '城西区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3313', '630105', '城北区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3314', '630121', '大通回族土族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3315', '630122', '湟中县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3316', '630123', '湟源县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3317', '630200', '海东市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3318', '630202', '乐都区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3319', '630221', '平安县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3320', '630222', '民和回族土族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3321', '630223', '互助土族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3322', '630224', '化隆回族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3323', '630225', '循化撒拉族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3324', '632200', '海北藏族自治州', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3325', '632221', '门源回族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3326', '632222', '祁连县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3327', '632223', '海晏县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3328', '632224', '刚察县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3329', '632300', '黄南藏族自治州', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3330', '632321', '同仁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3331', '632322', '尖扎县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3332', '632323', '泽库县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3333', '632324', '河南蒙古族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3334', '632500', '海南藏族自治州', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3335', '632521', '共和县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3336', '632522', '同德县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3337', '632523', '贵德县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3338', '632524', '兴海县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3339', '632525', '贵南县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3340', '632600', '果洛藏族自治州', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3341', '632621', '玛沁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3342', '632622', '班玛县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3343', '632623', '甘德县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3344', '632624', '达日县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3345', '632625', '久治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3346', '632626', '玛多县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3347', '632700', '玉树藏族自治州', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3348', '632701', '玉树市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3349', '632722', '杂多县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3350', '632723', '称多县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3351', '632724', '治多县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3352', '632725', '囊谦县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3353', '632726', '曲麻莱县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3354', '632800', '海西蒙古族藏族自治州', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3355', '632801', '格尔木市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3356', '632802', '德令哈市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3357', '632821', '乌兰县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3358', '632822', '都兰县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3359', '632823', '天峻县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3360', '640000', '宁夏', '1', '12', '0');
INSERT INTO `hy_region` VALUES ('3361', '640100', '银川市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3363', '640104', '兴庆区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3364', '640105', '西夏区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3365', '640106', '金凤区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3366', '640121', '永宁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3367', '640122', '贺兰县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3368', '640181', '灵武市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3369', '640200', '石嘴山市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3371', '640202', '大武口区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3372', '640205', '惠农区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3373', '640221', '平罗县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3374', '640300', '吴忠市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3376', '640302', '利通区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3377', '640303', '红寺堡区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3378', '640323', '盐池县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3379', '640324', '同心县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3380', '640381', '青铜峡市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3381', '640400', '固原市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3383', '640402', '原州区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3384', '640422', '西吉县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3385', '640423', '隆德县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3386', '640424', '泾源县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3387', '640425', '彭阳县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3388', '640500', '中卫市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3390', '640502', '沙坡头区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3391', '640521', '中宁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3392', '640522', '海原县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3393', '650000', '新疆', '1', '12', '0');
INSERT INTO `hy_region` VALUES ('3394', '650100', '乌鲁木齐市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3396', '650102', '天山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3397', '650103', '沙依巴克区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3398', '650104', '新市区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3399', '650105', '水磨沟区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3400', '650106', '头屯河区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3401', '650107', '达坂城区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3402', '650109', '米东区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3403', '650121', '乌鲁木齐县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3404', '650200', '克拉玛依市', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3406', '650202', '独山子区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3407', '650203', '克拉玛依区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3408', '650204', '白碱滩区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3409', '650205', '乌尔禾区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3410', '652100', '吐鲁番地区', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3411', '652101', '吐鲁番市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3412', '652122', '鄯善县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3413', '652123', '托克逊县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3414', '652200', '哈密地区', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3415', '652201', '哈密市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3416', '652222', '巴里坤哈萨克自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3417', '652223', '伊吾县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3418', '652300', '昌吉回族自治州', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3419', '652301', '昌吉市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3420', '652302', '阜康市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3421', '652323', '呼图壁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3422', '652324', '玛纳斯县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3423', '652325', '奇台县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3424', '652327', '吉木萨尔县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3425', '652328', '木垒哈萨克自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3426', '652700', '博尔塔拉蒙古自治州', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3427', '652701', '博乐市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3428', '652702', '阿拉山口市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3429', '652722', '精河县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3430', '652723', '温泉县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3431', '652800', '巴音郭楞蒙古自治州', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3432', '652801', '库尔勒市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3433', '652822', '轮台县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3434', '652823', '尉犁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3435', '652824', '若羌县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3436', '652825', '且末县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3437', '652826', '焉耆回族自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3438', '652827', '和静县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3439', '652828', '和硕县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3440', '652829', '博湖县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3441', '652900', '阿克苏地区', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3442', '652901', '阿克苏市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3443', '652922', '温宿县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3444', '652923', '库车县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3445', '652924', '沙雅县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3446', '652925', '新和县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3447', '652926', '拜城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3448', '652927', '乌什县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3449', '652928', '阿瓦提县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3450', '652929', '柯坪县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3451', '653000', '克孜勒苏柯尔克孜自治州', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3452', '653001', '阿图什市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3453', '653022', '阿克陶县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3454', '653023', '阿合奇县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3455', '653024', '乌恰县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3456', '653100', '喀什地区', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3457', '653101', '喀什市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3458', '653121', '疏附县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3459', '653122', '疏勒县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3460', '653123', '英吉沙县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3461', '653124', '泽普县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3462', '653125', '莎车县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3463', '653126', '叶城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3464', '653127', '麦盖提县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3465', '653128', '岳普湖县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3466', '653129', '伽师县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3467', '653130', '巴楚县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3468', '653131', '塔什库尔干塔吉克自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3469', '653200', '和田地区', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3470', '653201', '和田市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3471', '653221', '和田县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3472', '653222', '墨玉县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3473', '653223', '皮山县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3474', '653224', '洛浦县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3475', '653225', '策勒县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3476', '653226', '于田县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3477', '653227', '民丰县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3478', '654000', '伊犁哈萨克自治州', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3479', '654002', '伊宁市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3480', '654003', '奎屯市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3481', '654021', '伊宁县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3482', '654022', '察布查尔锡伯自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3483', '654023', '霍城县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3484', '654024', '巩留县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3485', '654025', '新源县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3486', '654026', '昭苏县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3487', '654027', '特克斯县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3488', '654028', '尼勒克县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3489', '654200', '塔城地区', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3490', '654201', '塔城市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3491', '654202', '乌苏市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3492', '654221', '额敏县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3493', '654223', '沙湾县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3494', '654224', '托里县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3495', '654225', '裕民县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3496', '654226', '和布克赛尔蒙古自治县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3497', '654300', '阿勒泰地区', '2', '21', '0');
INSERT INTO `hy_region` VALUES ('3498', '654301', '阿勒泰市', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3499', '654321', '布尔津县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3500', '654322', '富蕴县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3501', '654323', '福海县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3502', '654324', '哈巴河县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3503', '654325', '青河县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3504', '654326', '吉木乃县', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3505', '659000', '自治区直辖县', '2', '29', '0');
INSERT INTO `hy_region` VALUES ('3506', '659001', '石河子市', '3', '32', '0');
INSERT INTO `hy_region` VALUES ('3507', '659002', '阿拉尔市', '3', '32', '0');
INSERT INTO `hy_region` VALUES ('3508', '659003', '图木舒克市', '3', '32', '0');
INSERT INTO `hy_region` VALUES ('3509', '659004', '五家渠市', '3', '32', '0');
INSERT INTO `hy_region` VALUES ('3513', '442051', '城区', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3514', '442052', '火炬开发区', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3515', '442053', '小榄镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3516', '442054', '古镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3517', '442055', '三乡镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3518', '442056', '民众镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3519', '442057', '东凤镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3520', '442058', '板芙镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3521', '442059', '神湾镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3522', '442060', '横栏镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3523', '442061', '港口镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3524', '442062', '三角镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3525', '442063', '大涌镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3526', '442064', '南头镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3527', '442065', '沙溪镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3528', '442066', '坦洲镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3529', '442067', '黄圃镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3530', '442068', '五桂山镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3531', '442069', '南朗镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3532', '442070', '沙朗镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3533', '442071', '阜沙镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3534', '442072', '东升镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3535', '441951', '长安镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3536', '441952', '莞城区', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3537', '441953', '南城区', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3538', '441954', '寮步镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3539', '441955', '大岭山镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3540', '441956', '横沥镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3541', '441957', '常平镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3542', '441958', '厚街镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3543', '441959', '万江区', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3544', '441960', '樟木头镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3545', '441961', '塘厦镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3546', '441962', '凤岗镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3547', '441963', '大朗镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3548', '441964', '东坑镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3549', '441965', '清溪镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3550', '441966', '企石镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3551', '441967', '茶山镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3552', '441968', '东城区', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3553', '441969', '虎门镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3554', '441970', '黄江镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3555', '441971', '石排镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3556', '441972', '道滘镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3557', '441973', '沙田镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3558', '441974', '高埗镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3559', '441975', '石龙镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3560', '441976', '石碣镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3561', '441977', '洪梅镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3562', '441978', '麻涌镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3563', '441979', '松山湖', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3564', '441980', '桥头镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3565', '441981', '望牛墩镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3566', '441982', '中堂镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3567', '441983', '谢岗镇', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3568', '460351', '中沙群岛', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3569', '460352', '西沙群岛', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3570', '460353', '南沙群岛', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3571', '620251', '长城区', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3572', '620252', '镜铁区', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3573', '620253', '雄关区', '3', '88', '0');
INSERT INTO `hy_region` VALUES ('3574', '440309', '龙华区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3575', '440310', '坪山区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3576', '440311', '光明新区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3577', '440312', '大鹏新区', '3', '31', '0');
INSERT INTO `hy_region` VALUES ('3578', '4401110100', '京溪路', '4', '0', '0');
INSERT INTO `hy_region` VALUES ('3579', '4401110101', '云景花园', '5', '0', '0');

-- ----------------------------
-- Table structure for hy_special
-- ----------------------------
DROP TABLE IF EXISTS `hy_special`;
CREATE TABLE `hy_special` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '支部ID',
  `admin_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `ref_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '关联官方文章ID',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `refer` varchar(100) NOT NULL DEFAULT '' COMMENT '来源',
  `keywords` varchar(100) NOT NULL DEFAULT '' COMMENT '关键词',
  `desc` varchar(500) NOT NULL DEFAULT '' COMMENT '简介',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '分类',
  `detail` text NOT NULL COMMENT '详细',
  `video_id` varchar(50) NOT NULL DEFAULT '' COMMENT '视频点播ID',
  `sort` int(11) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `images` text NOT NULL COMMENT '系列图，多张用“,”分开',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态：1-显示，2-隐藏',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `show_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '显示时间',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `read_num` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '阅读次数',
  `collect_num` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  `forward_num` mediumint(8) NOT NULL DEFAULT '0' COMMENT '收藏数量',
  `region_code` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='党建专题';

-- ----------------------------
-- Records of hy_special
-- ----------------------------
INSERT INTO `hy_special` VALUES ('20', '4', '0', '3', '坚定人民代表大会制度自信', '人民日报', '人大制度', '人大制度理论和实践创新成果交流研讨会12日在北京召开。全国人大常委会委员长张德江出席会议并讲话。他强调，要全面学习贯彻习近平新时代中国特色社会主义思想，坚持发展我国社会主义民主政治，深刻认识人民代表大会制度的科学内涵、基本特征和本质要求，坚定人民代表大会制度自信，为实现中华民族伟大复兴的中国梦提供更加坚实的制度保障。', '61', '&lt;p&gt;人民网北京12月12日电&amp;nbsp;人大制度理论和实践创新成果交流研讨会12日在北京召开。全国人大常委会委员长张德江出席会议并讲话。他强调，要全面学习贯彻习近平新时代中国特色社会主义思想，坚持发展我国社会主义民主政治，深刻认识人民代表大会制度的科学内涵、基本特征和本质要求，坚定人民代表大会制度自信，为实现中华民族伟大复兴的中国梦提供更加坚实的制度保障。&lt;/p&gt;&lt;p&gt;\r\n	　　张德江指出，人民代表大会制度是中国共产党和中国人民的伟大创造，是坚持党的领导、人民当家作主、依法治国有机统一的根本政治制度安排，集中体现了社会主义民主政治的优势和特点。中国共产党领导是人民代表大会制度的本质特征和最大优势，也是做好人大工作的根本保证和关键所在。我们要坚定不移走中国特色社会主义政治发展道路，牢固树立“四个意识”，坚定人民代表大会制度自信，始终坚持党的领导，坚决维护习近平总书记的核心地位，坚决维护以习近平同志为核心的党中央权威和集中统一领导。&lt;/p&gt;&lt;p&gt;\r\n	　　张德江强调，人民代表大会制度保证和支持中国人民当家作主，确保国家和民族的前途命运牢牢掌握在人民手中，在全面依法治国进程中发挥着重要作用，是支撑国家治理体系和治理能力的根本政治制度。人大工作要坚持人民主体地位，保障人民民主权利，充分发挥人大代表作用，扩大人民有序政治参与。要坚持立法先行，完善以宪法为核心的中国特色社会主义法律体系，抓住提高立法质量这个关键，深入推进科学立法、民主立法、依法立法。要充分发挥立法引领、推动、规范、保障改革作用，确保重大改革于法有据、顺利实施。要切实把宪法法律赋予的监督权用起来，坚持正确监督、有效监督，增强监督实效。&lt;/p&gt;&lt;p&gt;\r\n	　　张德江强调，全国人大及其常委会要在以习近平同志为核心的党中央坚强领导下，紧紧围绕党的十九大确定的重大决策部署，全面履行宪法法律赋予的各项职责，按照总结、继承、完善、提高的原则，全面加强和改进人大工作，推动人民代表大会制度与时俱进，在新时代探索新实践、展现新作为。&lt;/p&gt;&lt;p&gt;\r\n	　　全国人大常委会副委员长李建国出席会议。全国人大常委会办公厅、专门委员会、工作委员会和中国人大制度理论研究会有关负责同志，以及部分专家学者参加会议。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '', '100', '0', '', '1', '0', '1516108383', '1516108383', '9', '1', '0', '110000');
INSERT INTO `hy_special` VALUES ('21', '7', '0', '3', '坚定人民代表大会制度自信', '人民日报', '人大制度', '人大制度理论和实践创新成果交流研讨会12日在北京召开。全国人大常委会委员长张德江出席会议并讲话。他强调，要全面学习贯彻习近平新时代中国特色社会主义思想，坚持发展我国社会主义民主政治，深刻认识人民代表大会制度的科学内涵、基本特征和本质要求，坚定人民代表大会制度自信，为实现中华民族伟大复兴的中国梦提供更加坚实的制度保障。', '85', '&lt;p&gt;人民网北京12月12日电&amp;nbsp;人大制度理论和实践创新成果交流研讨会12日在北京召开。全国人大常委会委员长张德江出席会议并讲话。他强调，要全面学习贯彻习近平新时代中国特色社会主义思想，坚持发展我国社会主义民主政治，深刻认识人民代表大会制度的科学内涵、基本特征和本质要求，坚定人民代表大会制度自信，为实现中华民族伟大复兴的中国梦提供更加坚实的制度保障。&lt;/p&gt;&lt;p&gt;\r\n	　　张德江指出，人民代表大会制度是中国共产党和中国人民的伟大创造，是坚持党的领导、人民当家作主、依法治国有机统一的根本政治制度安排，集中体现了社会主义民主政治的优势和特点。中国共产党领导是人民代表大会制度的本质特征和最大优势，也是做好人大工作的根本保证和关键所在。我们要坚定不移走中国特色社会主义政治发展道路，牢固树立“四个意识”，坚定人民代表大会制度自信，始终坚持党的领导，坚决维护习近平总书记的核心地位，坚决维护以习近平同志为核心的党中央权威和集中统一领导。&lt;/p&gt;&lt;p&gt;\r\n	　　张德江强调，人民代表大会制度保证和支持中国人民当家作主，确保国家和民族的前途命运牢牢掌握在人民手中，在全面依法治国进程中发挥着重要作用，是支撑国家治理体系和治理能力的根本政治制度。人大工作要坚持人民主体地位，保障人民民主权利，充分发挥人大代表作用，扩大人民有序政治参与。要坚持立法先行，完善以宪法为核心的中国特色社会主义法律体系，抓住提高立法质量这个关键，深入推进科学立法、民主立法、依法立法。要充分发挥立法引领、推动、规范、保障改革作用，确保重大改革于法有据、顺利实施。要切实把宪法法律赋予的监督权用起来，坚持正确监督、有效监督，增强监督实效。&lt;/p&gt;&lt;p&gt;\r\n	　　张德江强调，全国人大及其常委会要在以习近平同志为核心的党中央坚强领导下，紧紧围绕党的十九大确定的重大决策部署，全面履行宪法法律赋予的各项职责，按照总结、继承、完善、提高的原则，全面加强和改进人大工作，推动人民代表大会制度与时俱进，在新时代探索新实践、展现新作为。&lt;/p&gt;&lt;p&gt;\r\n	　　全国人大常委会副委员长李建国出席会议。全国人大常委会办公厅、专门委员会、工作委员会和中国人大制度理论研究会有关负责同志，以及部分专家学者参加会议。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '', '100', '0', '', '2', '1', '1516108461', '1516108461', '0', '0', '0', '0');
INSERT INTO `hy_special` VALUES ('22', '4', '0', '2', '人民日报社论：不忘历史 矢志复兴', '人民日报', '不忘历史', '今天是南京大屠杀惨案发生80周年，也是第四个南京大屠杀死难者国家公祭日。在这个沉痛的日子里，让我们深切缅怀南京大屠杀的无辜死难者，深切缅怀所有惨遭日本侵略者杀戮的死难同胞，深切缅怀革命先烈和民族英雄。', '61', '&lt;p&gt;“侵华日寇，毁吾南京。劫掠黎庶，屠戮苍生。卅万亡灵，饮恨江城。日月惨淡，寰宇震惊。兽行暴虐，旷世未闻。”&lt;/p&gt;&lt;p&gt;\r\n	　　今天是南京大屠杀惨案发生80周年，也是第四个南京大屠杀死难者国家公祭日。在这个沉痛的日子里，让我们深切缅怀南京大屠杀的无辜死难者，深切缅怀所有惨遭日本侵略者杀戮的死难同胞，深切缅怀为中国人民抗日战争胜利献出生命的革命先烈和民族英雄。&lt;/p&gt;&lt;p&gt;\r\n	　　3年前的今天，习近平总书记在南京大屠杀死难者国家公祭仪式上发表讲话，表达中国人民坚定不移走和平发展道路的崇高愿望，宣示中国人民牢记历史、不忘过去，珍爱和平、开创未来的坚定立场。3年来，我们以国家之名祭奠死难者，以尊崇之心珍视和平，以民族之力矢志复兴。今天，中华民族的发展前景无比光明，中国人民维护和平的决心坚定不移。&lt;/p&gt;&lt;p&gt;\r\n	　　1937年7月7日，日本侵略者悍然发动了全面侵华战争，给中国人民带来了前所未有的巨大灾难。12月13日，侵华日军野蛮侵入南京，制造了灭绝人性的南京大屠杀惨案，30万同胞惨遭杀戮。这一骇人听闻的反人类罪行，是人类历史上十分黑暗的一页，是中华民族永远的伤痛。面对极其野蛮、极其残暴的日本侵略者，具有伟大爱国主义精神的中国人民没有屈服，在中国共产党号召和引领下，全民族各种积极力量同仇敌忾、共御外敌，最终赢得了中国人民抗日战争伟大胜利，也为世界反法西斯战争胜利作出了重大贡献。&lt;/p&gt;&lt;p&gt;\r\n	　　“谁忘记历史，谁就会在灵魂上生病。”80年过去，侵略者的枪声淹没在历史尘埃里，但中华门城墙上的弹孔依然清晰可见；南京城的不绝哀号已随风逝去，但“万人坑”的累累白骨还在。历史不会因时代变迁而改变，事实也不会因巧舌抵赖而消失。南京大屠杀惨案铁证如山、不容否认。任何倒行逆施妄图篡改历史、否认暴行，为南京大屠杀惨案和侵略战争翻案的丑恶行径，不仅13亿中国人民不会答应，也将受到世界上一切爱好和平与正义人民的谴责和唾弃。“国之大事，在祀与戎。”年复一年的国家公祭向世人宣示，中国人民反对侵略战争、反对篡改历史的立场坚定不移，中国人民团结一心实现民族复兴的决心坚定不移，中国人民捍卫人类尊严、维护世界和平的意志坚定不移。&lt;/p&gt;&lt;p&gt;\r\n	　　以国之名，我们呼唤中华儿女勠力同心为建设社会主义现代化强国、实现中华民族伟大复兴的中国梦作出新贡献。“四万万人齐蹈厉，同心同德一戎衣”，从中国人民赢得抗日战争伟大胜利，开启中华民族由衰败走向振兴的重大转折，到中国特色社会主义进入新时代，意味着中华民族迎来了从站起来、富起来到强起来的伟大飞跃，中华崛起之功业，民族复兴之愿景，因为一代代中华儿女接续奋斗而曙光在前。在铭记历史中砥砺不忘初心、牢记使命的坚定信念，在缅怀同胞和先烈中凝聚以爱国主义为核心的伟大民族精神，我们一定能走好新时代的长征路，在新征程上不断夺取新胜利。&lt;/p&gt;&lt;p&gt;\r\n	　　以国之名，我们呼吁世界各国共襄构建人类命运共同体的伟业，努力建设一个持久和平、共同繁荣的世界。中华民族经历了同胞惨遭屠戮、山河喋血的痛苦，更懂得和平“受益而不觉，失之则难存”，更坚定“坚持和平发展，共同开创世界和平充满希望的未来”的决心。从“一带一路”成为各国共同发展的合作平台，到构建人类命运共同体不断付诸实践，中国始终把为人类作出新的更大贡献作为自己的使命，始终做世界和平的建设者、全球发展的贡献者、国际秩序的维护者，同各国一道共同创造人类的美好未来。&lt;/p&gt;&lt;p&gt;\r\n	　　不忘历史，矢志复兴。今天的中国，任人宰割、饱受欺凌的时代已经一去不复返了。全体中华儿女携手同心凝聚磅礴力量，为实现中华民族伟大复兴中国梦而不懈奋斗，正是对死难同胞和革命先烈的最好告慰。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '', '100', '0', 'http://dangjian.huiyi.t.weixinren.cn/upload//editor/201712/5a30eb9f6e851.jpg', '1', '0', '1516108654', '1516108654', '6', '2', '0', '110000');
INSERT INTO `hy_special` VALUES ('23', '7', '0', '2', '人民日报社论：不忘历史 矢志复兴', '人民日报', '不忘历史', '今天是南京大屠杀惨案发生80周年，也是第四个南京大屠杀死难者国家公祭日。在这个沉痛的日子里，让我们深切缅怀南京大屠杀的无辜死难者，深切缅怀所有惨遭日本侵略者杀戮的死难同胞，深切缅怀革命先烈和民族英雄。', '85', '&lt;p&gt;“侵华日寇，毁吾南京。劫掠黎庶，屠戮苍生。卅万亡灵，饮恨江城。日月惨淡，寰宇震惊。兽行暴虐，旷世未闻。”&lt;/p&gt;&lt;p&gt;\r\n	　　今天是南京大屠杀惨案发生80周年，也是第四个南京大屠杀死难者国家公祭日。在这个沉痛的日子里，让我们深切缅怀南京大屠杀的无辜死难者，深切缅怀所有惨遭日本侵略者杀戮的死难同胞，深切缅怀为中国人民抗日战争胜利献出生命的革命先烈和民族英雄。&lt;/p&gt;&lt;p&gt;\r\n	　　3年前的今天，习近平总书记在南京大屠杀死难者国家公祭仪式上发表讲话，表达中国人民坚定不移走和平发展道路的崇高愿望，宣示中国人民牢记历史、不忘过去，珍爱和平、开创未来的坚定立场。3年来，我们以国家之名祭奠死难者，以尊崇之心珍视和平，以民族之力矢志复兴。今天，中华民族的发展前景无比光明，中国人民维护和平的决心坚定不移。&lt;/p&gt;&lt;p&gt;\r\n	　　1937年7月7日，日本侵略者悍然发动了全面侵华战争，给中国人民带来了前所未有的巨大灾难。12月13日，侵华日军野蛮侵入南京，制造了灭绝人性的南京大屠杀惨案，30万同胞惨遭杀戮。这一骇人听闻的反人类罪行，是人类历史上十分黑暗的一页，是中华民族永远的伤痛。面对极其野蛮、极其残暴的日本侵略者，具有伟大爱国主义精神的中国人民没有屈服，在中国共产党号召和引领下，全民族各种积极力量同仇敌忾、共御外敌，最终赢得了中国人民抗日战争伟大胜利，也为世界反法西斯战争胜利作出了重大贡献。&lt;/p&gt;&lt;p&gt;\r\n	　　“谁忘记历史，谁就会在灵魂上生病。”80年过去，侵略者的枪声淹没在历史尘埃里，但中华门城墙上的弹孔依然清晰可见；南京城的不绝哀号已随风逝去，但“万人坑”的累累白骨还在。历史不会因时代变迁而改变，事实也不会因巧舌抵赖而消失。南京大屠杀惨案铁证如山、不容否认。任何倒行逆施妄图篡改历史、否认暴行，为南京大屠杀惨案和侵略战争翻案的丑恶行径，不仅13亿中国人民不会答应，也将受到世界上一切爱好和平与正义人民的谴责和唾弃。“国之大事，在祀与戎。”年复一年的国家公祭向世人宣示，中国人民反对侵略战争、反对篡改历史的立场坚定不移，中国人民团结一心实现民族复兴的决心坚定不移，中国人民捍卫人类尊严、维护世界和平的意志坚定不移。&lt;/p&gt;&lt;p&gt;\r\n	　　以国之名，我们呼唤中华儿女勠力同心为建设社会主义现代化强国、实现中华民族伟大复兴的中国梦作出新贡献。“四万万人齐蹈厉，同心同德一戎衣”，从中国人民赢得抗日战争伟大胜利，开启中华民族由衰败走向振兴的重大转折，到中国特色社会主义进入新时代，意味着中华民族迎来了从站起来、富起来到强起来的伟大飞跃，中华崛起之功业，民族复兴之愿景，因为一代代中华儿女接续奋斗而曙光在前。在铭记历史中砥砺不忘初心、牢记使命的坚定信念，在缅怀同胞和先烈中凝聚以爱国主义为核心的伟大民族精神，我们一定能走好新时代的长征路，在新征程上不断夺取新胜利。&lt;/p&gt;&lt;p&gt;\r\n	　　以国之名，我们呼吁世界各国共襄构建人类命运共同体的伟业，努力建设一个持久和平、共同繁荣的世界。中华民族经历了同胞惨遭屠戮、山河喋血的痛苦，更懂得和平“受益而不觉，失之则难存”，更坚定“坚持和平发展，共同开创世界和平充满希望的未来”的决心。从“一带一路”成为各国共同发展的合作平台，到构建人类命运共同体不断付诸实践，中国始终把为人类作出新的更大贡献作为自己的使命，始终做世界和平的建设者、全球发展的贡献者、国际秩序的维护者，同各国一道共同创造人类的美好未来。&lt;/p&gt;&lt;p&gt;\r\n	　　不忘历史，矢志复兴。今天的中国，任人宰割、饱受欺凌的时代已经一去不复返了。全体中华儿女携手同心凝聚磅礴力量，为实现中华民族伟大复兴中国梦而不懈奋斗，正是对死难同胞和革命先烈的最好告慰。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '', '100', '0', 'http://dangjian.huiyi.t.weixinren.cn/upload//editor/201712/5a30eb9f6e851.jpg', '1', '0', '1516108698', '1516108698', '14', '2', '0', '0');
INSERT INTO `hy_special` VALUES ('24', '7', '0', '1', '习近平总书记纠正“四风”重要指示引起强烈反响', '新华社', '作风建设', '“10月27日，市委召開中心組學習會議，傳達學習黨的十九大精神和十九屆一中全會精神﹔11月2日、11月8日，連續兩次召開市委常委會就深入學習宣傳貫徹落實黨的十九大精神和省委十一屆五次全會精神進行專題研究﹔11月10日，召開全市領導干部大會，對學習宣傳貫徹落實十九大精神和省委十一屆五次全會精神作出具體部署。”11月16日，十九大代表、晉城市委書記張九萍介紹了連日來學習貫徹十九大精神的情況。', '86', '&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	“纠正‘四风’不能止步，作风建设永远在路上。”近日，习近平总书记就新华社一篇《形式主义、官僚主义新表现值得警惕》的文章，对加强党的作风建设作出重要指示。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	这一重要指示，一针见血、切中时弊，内涵丰富、要求明确，充分表明以习近平同志为核心的党中央坚定不移全面从严治党、持之以恒正风肃纪的鲜明态度和坚定决心，在各地党员干部中引起强烈反响。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	&lt;strong&gt;驰而不息：绝不能有歇歇脚、松口气的想法&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	党的十八大以来，从制定和执行中央八项规定开始，全党上下纠正“四风”取得重大成效。新华社文章反映，当前“四风”问题中，享乐主义和奢靡之风基本刹住，但形式主义、官僚主义在一定程度上仍然存在，并呈现出一些新的表现形式。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	习近平总书记指出，文章反映的情况，看似新表现，实则老问题，再次表明“四风”问题具有顽固性反复性。纠正“四风”不能止步，作风建设永远在路上。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	“逆水行舟用力撑，一篙松劲退千寻。党的十九大之后，习近平总书记再次对作风建设作出重要指示，释放出驰而不息正风肃纪的强烈信号。”北京市纪委常委陈名杰说，反“四风”绝不能有歇歇脚、松口气的想法，要提高政治站位，增强政治自觉，以永远在路上的坚韧，锲而不舍抓好作风建设。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	陈名杰表示，北京市纪委市监委领导班子成员将自觉对照习近平总书记重要指示精神，对存在的问题切实整改，特别要在如何精简办事环节、畅通工作渠道、提高办事效率上下功夫，力戒各种形式主义、官僚主义。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	习近平总书记的重要指示就像一针“清醒剂”，让广大党员干部始终保持一份纠正“四风”的清醒自觉。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	“‘四风’问题具有顽固性反复性，有一些不良作风像割韭菜一样，割了一茬长一茬。”湖南省郴州市纪委书记李超认为，必须清醒地认识到作风建设既是攻坚战更是持久战，敢于担当、敢打硬仗。郴州市将持续开展“治陋习、树新风”作风建设主题活动，针对办事拖沓敷衍、懒政庸政怠政等形式主义、官僚主义突出问题进行深入整改，成风化俗、形成习惯，推动党员干部作风不断好转，行政效能不断优化。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	改进调查研究、转变文风会风，是纠正“四风”的重要内容。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	“调查研究必须真正深入基层、深入群众，才能取得实实在在的成效。”湖北省纪委党风政风监督室副主任刘南中介绍，湖北纪检监察机关将把形式主义、官僚主义作为纪律审查和党内问责的重点，继续加大追责问责、通报曝光力度，督促党员干部改进调研方式，转变会风、文风，让越来越多的干部把深入基层一线听民声、查实情作为改进工作的重要方式。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	&lt;strong&gt;落细落实：以扎实过硬的措施切实整改&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	纠正“四风”，关键在落实，最终看成效。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	习近平总书记明确要求，各地区各部门都要摆摆表现，找找差距，抓住主要矛盾，特别要针对表态多调门高、行动少落实差等突出问题，拿出过硬措施，扎扎实实地改。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	贵州六盘水市盘州市委书记付国祥表示，要以作风攻坚战保障脱贫攻坚战。“盘州是国家级贫困县，现有贫困人口10.12万人，脱贫攻坚任务艰巨，不是简单一哄而上、喊几句口号、堆几处‘盆景’能完成的，必须发扬艰苦奋斗、老实正派的作风，用心用情用力做到‘准’和‘实’。我们将强化督促督导、过程考核、监督问责和结果运用，对于工作推进不力、工作滞后、推诿扯皮、不作为、慢作为、乱作为的干部，实行一票否决，就地免职。”&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	作风建设根本上是为了密切党与群众的血肉联系，必须回应群众需求，满足人民期待。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	“作为窗口单位，我们的作风怎么样，老百姓看得最清楚。政府改革不是闭门造车，最终要以市场、群众的满意度来评判。”上海浦东新区行政服务中心主任蒋红军说，浦东新区在服务大厅里专门设置了“找茬”窗口，民众和企业在办事过程中遇到了什么问题、有任何建议都可以直接向窗口反映解决。下一步我们还将继续改进服务，借助“互联网+政务服务”手段，把方便留给群众、把复杂交给系统。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	习近平总书记曾经指出，形式主义实质是主观主义、功利主义，根源是政绩观错位、责任心缺失。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	“为人民服务是具体的、不是抽象的，是实在的、不是空洞的。”陕西咸阳市委书记岳亮表示，要树立正确的政绩观，绝不做表面文章，力戒形式主义，真心实意为群众做实事、办好事、解难事。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	“我们将积极推进智慧城市‘六个一’惠民工程，探索为老旧小区加装电梯，深化推行‘只跑一次’、贫困群众用药保障、新农合即时报销直通车、一枚公章管审批等民生领域改革，不断满足广大群众对美好生活的向往。”岳亮说。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	&lt;strong&gt;“头雁效应”：领导干部要带头转作风&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	作风好不好，关键看领导。领导干部是作风建设的组织者、管理者、推动者，是作风建设的风向标和指示灯。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	习近平总书记在重要指示中指出，各级领导干部要带头转变作风，身体力行，以上率下，形成“头雁效应”。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	“‘头雁效应’很关键，‘关键少数’要抓牢。”福建福州市长乐区委书记许南吉对习近平总书记的重要指示深有感触。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	他介绍，去年9月以来，长乐区委把开展移风易俗作为全面从严治党的重要内容，坚持抓住党员干部这个关键少数，着力破除大操大办婚丧喜庆的陋习，通过建立党员领导干部操办或参加婚丧喜庆活动报告公示制度，将模范遵守移风易俗情况纳入干部考察内容，广泛开展谈话提醒，拉紧领导干部的作风红线。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	“下一步，我们将继续坚持领导干部带头，一级带着一级干、一级做给一级看，抓住主体责任的‘牛鼻子’，严肃问责，坚定不移将作风建设进行到底。”许南吉说。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	“纠正‘四风’，必须坚持从各级领导干部做起，以上率下、层层带动，坚决防止不良风气反弹回潮。”辽宁省纪委常务副书记丁顺生说，今年以来，辽宁省先后推出省人大常委会原副秘书长、办公厅原主任李会永，沈阳市原副市长祁鸣，省财政厅原副厅长魏跃晖等8篇剖析报告和忏悔录，他们把中央八项规定精神当成耳旁风，当面一套、背后一套，在私人会所接受他人宴请、公车私用、变相公款旅游等问题一经披露，在全省县处级以上党员领导干部中引起很大震动。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	“通过纪律教育，强化纪律执行，让党员干部知敬畏、存戒惧、守底线，习惯在受监督和约束的环境中工作生活。”丁顺生说。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	内蒙古乌海市委书记史万钧认为，作风建设是关乎人心向背和党的生死存亡的重大问题，各级党委必须坚决扛起管党治党的政治责任。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	他介绍，乌海市及时制定出台贯彻落实中央八项规定精神的具体实施办法，将贯彻落实情况纳入落实党风廉政建设责任制、领导干部述职述廉、年终实绩考核范围，构建起了“暗访、执纪、追责、曝光”四并重工作机制，严肃查处违反中央八项规定精神问题75件，给予党政纪处分55人，通报曝光违规违纪问题27批95起，释放出执纪必严、违纪必究的强烈信号。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	习近平总书记在重要指示中强调，在即将开展的“不忘初心、牢记使命”主题教育中，要力戒形式主义，以好的作风确保好的效果。&lt;/p&gt;&lt;p&gt;\r\n\r\n	“作为地市一级党委的主要负责人，我们必须以永远在路上的决心和韧劲纠正‘四风’，自觉担起推进作风建设的主体责任，知责明责、履责尽责、考责问责，切实把责任扛在肩上、记在心上、抓在手上，以实际行动继续交上作风建设的优异答卷。”史万钧说。&lt;span style=&quot;text-indent: 2em;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '', '100', '0', 'http://dangjian.huiyi.t.weixinren.cn/upload//editor/201712/5a30eb0210a51.jpg', '1', '0', '1516108703', '1516108703', '12', '1', '0', '0');
INSERT INTO `hy_special` VALUES ('25', '3', '0', '3', '坚定人民代表大会制度自信', '人民日报', '人大制度', '人大制度理论和实践创新成果交流研讨会12日在北京召开。全国人大常委会委员长张德江出席会议并讲话。他强调，要全面学习贯彻习近平新时代中国特色社会主义思想，坚持发展我国社会主义民主政治，深刻认识人民代表大会制度的科学内涵、基本特征和本质要求，坚定人民代表大会制度自信，为实现中华民族伟大复兴的中国梦提供更加坚实的制度保障。', '71', '&lt;p&gt;人民网北京12月12日电&amp;nbsp;人大制度理论和实践创新成果交流研讨会12日在北京召开。全国人大常委会委员长张德江出席会议并讲话。他强调，要全面学习贯彻习近平新时代中国特色社会主义思想，坚持发展我国社会主义民主政治，深刻认识人民代表大会制度的科学内涵、基本特征和本质要求，坚定人民代表大会制度自信，为实现中华民族伟大复兴的中国梦提供更加坚实的制度保障。&lt;/p&gt;&lt;p&gt;\r\n	　　张德江指出，人民代表大会制度是中国共产党和中国人民的伟大创造，是坚持党的领导、人民当家作主、依法治国有机统一的根本政治制度安排，集中体现了社会主义民主政治的优势和特点。中国共产党领导是人民代表大会制度的本质特征和最大优势，也是做好人大工作的根本保证和关键所在。我们要坚定不移走中国特色社会主义政治发展道路，牢固树立“四个意识”，坚定人民代表大会制度自信，始终坚持党的领导，坚决维护习近平总书记的核心地位，坚决维护以习近平同志为核心的党中央权威和集中统一领导。&lt;/p&gt;&lt;p&gt;\r\n	　　张德江强调，人民代表大会制度保证和支持中国人民当家作主，确保国家和民族的前途命运牢牢掌握在人民手中，在全面依法治国进程中发挥着重要作用，是支撑国家治理体系和治理能力的根本政治制度。人大工作要坚持人民主体地位，保障人民民主权利，充分发挥人大代表作用，扩大人民有序政治参与。要坚持立法先行，完善以宪法为核心的中国特色社会主义法律体系，抓住提高立法质量这个关键，深入推进科学立法、民主立法、依法立法。要充分发挥立法引领、推动、规范、保障改革作用，确保重大改革于法有据、顺利实施。要切实把宪法法律赋予的监督权用起来，坚持正确监督、有效监督，增强监督实效。&lt;/p&gt;&lt;p&gt;\r\n	　　张德江强调，全国人大及其常委会要在以习近平同志为核心的党中央坚强领导下，紧紧围绕党的十九大确定的重大决策部署，全面履行宪法法律赋予的各项职责，按照总结、继承、完善、提高的原则，全面加强和改进人大工作，推动人民代表大会制度与时俱进，在新时代探索新实践、展现新作为。&lt;/p&gt;&lt;p&gt;\r\n	　　全国人大常委会副委员长李建国出席会议。全国人大常委会办公厅、专门委员会、工作委员会和中国人大制度理论研究会有关负责同志，以及部分专家学者参加会议。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '', '100', '0', '', '1', '0', '1516183619', '1516183619', '0', '0', '0', '130304');
INSERT INTO `hy_special` VALUES ('26', '3', '0', '1', '习近平总书记纠正“四风”重要指示引起强烈反响', '新华社', '作风建设', '“10月27日，市委召開中心組學習會議，傳達學習黨的十九大精神和十九屆一中全會精神﹔11月2日、11月8日，連續兩次召開市委常委會就深入學習宣傳貫徹落實黨的十九大精神和省委十一屆五次全會精神進行專題研究﹔11月10日，召開全市領導干部大會，對學習宣傳貫徹落實十九大精神和省委十一屆五次全會精神作出具體部署。”11月16日，十九大代表、晉城市委書記張九萍介紹了連日來學習貫徹十九大精神的情況。', '72', '&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	“纠正‘四风’不能止步，作风建设永远在路上。”近日，习近平总书记就新华社一篇《形式主义、官僚主义新表现值得警惕》的文章，对加强党的作风建设作出重要指示。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	这一重要指示，一针见血、切中时弊，内涵丰富、要求明确，充分表明以习近平同志为核心的党中央坚定不移全面从严治党、持之以恒正风肃纪的鲜明态度和坚定决心，在各地党员干部中引起强烈反响。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	&lt;strong&gt;驰而不息：绝不能有歇歇脚、松口气的想法&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	党的十八大以来，从制定和执行中央八项规定开始，全党上下纠正“四风”取得重大成效。新华社文章反映，当前“四风”问题中，享乐主义和奢靡之风基本刹住，但形式主义、官僚主义在一定程度上仍然存在，并呈现出一些新的表现形式。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	习近平总书记指出，文章反映的情况，看似新表现，实则老问题，再次表明“四风”问题具有顽固性反复性。纠正“四风”不能止步，作风建设永远在路上。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	“逆水行舟用力撑，一篙松劲退千寻。党的十九大之后，习近平总书记再次对作风建设作出重要指示，释放出驰而不息正风肃纪的强烈信号。”北京市纪委常委陈名杰说，反“四风”绝不能有歇歇脚、松口气的想法，要提高政治站位，增强政治自觉，以永远在路上的坚韧，锲而不舍抓好作风建设。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	陈名杰表示，北京市纪委市监委领导班子成员将自觉对照习近平总书记重要指示精神，对存在的问题切实整改，特别要在如何精简办事环节、畅通工作渠道、提高办事效率上下功夫，力戒各种形式主义、官僚主义。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	习近平总书记的重要指示就像一针“清醒剂”，让广大党员干部始终保持一份纠正“四风”的清醒自觉。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	“‘四风’问题具有顽固性反复性，有一些不良作风像割韭菜一样，割了一茬长一茬。”湖南省郴州市纪委书记李超认为，必须清醒地认识到作风建设既是攻坚战更是持久战，敢于担当、敢打硬仗。郴州市将持续开展“治陋习、树新风”作风建设主题活动，针对办事拖沓敷衍、懒政庸政怠政等形式主义、官僚主义突出问题进行深入整改，成风化俗、形成习惯，推动党员干部作风不断好转，行政效能不断优化。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	改进调查研究、转变文风会风，是纠正“四风”的重要内容。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	“调查研究必须真正深入基层、深入群众，才能取得实实在在的成效。”湖北省纪委党风政风监督室副主任刘南中介绍，湖北纪检监察机关将把形式主义、官僚主义作为纪律审查和党内问责的重点，继续加大追责问责、通报曝光力度，督促党员干部改进调研方式，转变会风、文风，让越来越多的干部把深入基层一线听民声、查实情作为改进工作的重要方式。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	&lt;strong&gt;落细落实：以扎实过硬的措施切实整改&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	纠正“四风”，关键在落实，最终看成效。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	习近平总书记明确要求，各地区各部门都要摆摆表现，找找差距，抓住主要矛盾，特别要针对表态多调门高、行动少落实差等突出问题，拿出过硬措施，扎扎实实地改。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	贵州六盘水市盘州市委书记付国祥表示，要以作风攻坚战保障脱贫攻坚战。“盘州是国家级贫困县，现有贫困人口10.12万人，脱贫攻坚任务艰巨，不是简单一哄而上、喊几句口号、堆几处‘盆景’能完成的，必须发扬艰苦奋斗、老实正派的作风，用心用情用力做到‘准’和‘实’。我们将强化督促督导、过程考核、监督问责和结果运用，对于工作推进不力、工作滞后、推诿扯皮、不作为、慢作为、乱作为的干部，实行一票否决，就地免职。”&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	作风建设根本上是为了密切党与群众的血肉联系，必须回应群众需求，满足人民期待。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	“作为窗口单位，我们的作风怎么样，老百姓看得最清楚。政府改革不是闭门造车，最终要以市场、群众的满意度来评判。”上海浦东新区行政服务中心主任蒋红军说，浦东新区在服务大厅里专门设置了“找茬”窗口，民众和企业在办事过程中遇到了什么问题、有任何建议都可以直接向窗口反映解决。下一步我们还将继续改进服务，借助“互联网+政务服务”手段，把方便留给群众、把复杂交给系统。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	习近平总书记曾经指出，形式主义实质是主观主义、功利主义，根源是政绩观错位、责任心缺失。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	“为人民服务是具体的、不是抽象的，是实在的、不是空洞的。”陕西咸阳市委书记岳亮表示，要树立正确的政绩观，绝不做表面文章，力戒形式主义，真心实意为群众做实事、办好事、解难事。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	“我们将积极推进智慧城市‘六个一’惠民工程，探索为老旧小区加装电梯，深化推行‘只跑一次’、贫困群众用药保障、新农合即时报销直通车、一枚公章管审批等民生领域改革，不断满足广大群众对美好生活的向往。”岳亮说。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	&lt;strong&gt;“头雁效应”：领导干部要带头转作风&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	作风好不好，关键看领导。领导干部是作风建设的组织者、管理者、推动者，是作风建设的风向标和指示灯。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	习近平总书记在重要指示中指出，各级领导干部要带头转变作风，身体力行，以上率下，形成“头雁效应”。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	“‘头雁效应’很关键，‘关键少数’要抓牢。”福建福州市长乐区委书记许南吉对习近平总书记的重要指示深有感触。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	他介绍，去年9月以来，长乐区委把开展移风易俗作为全面从严治党的重要内容，坚持抓住党员干部这个关键少数，着力破除大操大办婚丧喜庆的陋习，通过建立党员领导干部操办或参加婚丧喜庆活动报告公示制度，将模范遵守移风易俗情况纳入干部考察内容，广泛开展谈话提醒，拉紧领导干部的作风红线。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	“下一步，我们将继续坚持领导干部带头，一级带着一级干、一级做给一级看，抓住主体责任的‘牛鼻子’，严肃问责，坚定不移将作风建设进行到底。”许南吉说。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	“纠正‘四风’，必须坚持从各级领导干部做起，以上率下、层层带动，坚决防止不良风气反弹回潮。”辽宁省纪委常务副书记丁顺生说，今年以来，辽宁省先后推出省人大常委会原副秘书长、办公厅原主任李会永，沈阳市原副市长祁鸣，省财政厅原副厅长魏跃晖等8篇剖析报告和忏悔录，他们把中央八项规定精神当成耳旁风，当面一套、背后一套，在私人会所接受他人宴请、公车私用、变相公款旅游等问题一经披露，在全省县处级以上党员领导干部中引起很大震动。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	“通过纪律教育，强化纪律执行，让党员干部知敬畏、存戒惧、守底线，习惯在受监督和约束的环境中工作生活。”丁顺生说。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	内蒙古乌海市委书记史万钧认为，作风建设是关乎人心向背和党的生死存亡的重大问题，各级党委必须坚决扛起管党治党的政治责任。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	他介绍，乌海市及时制定出台贯彻落实中央八项规定精神的具体实施办法，将贯彻落实情况纳入落实党风廉政建设责任制、领导干部述职述廉、年终实绩考核范围，构建起了“暗访、执纪、追责、曝光”四并重工作机制，严肃查处违反中央八项规定精神问题75件，给予党政纪处分55人，通报曝光违规违纪问题27批95起，释放出执纪必严、违纪必究的强烈信号。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;\r\n	习近平总书记在重要指示中强调，在即将开展的“不忘初心、牢记使命”主题教育中，要力戒形式主义，以好的作风确保好的效果。&lt;/p&gt;&lt;p&gt;\r\n\r\n	“作为地市一级党委的主要负责人，我们必须以永远在路上的决心和韧劲纠正‘四风’，自觉担起推进作风建设的主体责任，知责明责、履责尽责、考责问责，切实把责任扛在肩上、记在心上、抓在手上，以实际行动继续交上作风建设的优异答卷。”史万钧说。&lt;span style=&quot;text-indent: 2em;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '', '100', '0', 'http://dangjian.huiyi.t.weixinren.cn/upload//editor/201712/5a30eb0210a51.jpg', '1', '0', '1516183624', '1516183624', '1', '0', '0', '130304');
INSERT INTO `hy_special` VALUES ('27', '3', '0', '2', '人民日报社论：不忘历史 矢志复兴', '人民日报', '不忘历史', '今天是南京大屠杀惨案发生80周年，也是第四个南京大屠杀死难者国家公祭日。在这个沉痛的日子里，让我们深切缅怀南京大屠杀的无辜死难者，深切缅怀所有惨遭日本侵略者杀戮的死难同胞，深切缅怀革命先烈和民族英雄。', '71', '&lt;p&gt;“侵华日寇，毁吾南京。劫掠黎庶，屠戮苍生。卅万亡灵，饮恨江城。日月惨淡，寰宇震惊。兽行暴虐，旷世未闻。”&lt;/p&gt;&lt;p&gt;\r\n	　　今天是南京大屠杀惨案发生80周年，也是第四个南京大屠杀死难者国家公祭日。在这个沉痛的日子里，让我们深切缅怀南京大屠杀的无辜死难者，深切缅怀所有惨遭日本侵略者杀戮的死难同胞，深切缅怀为中国人民抗日战争胜利献出生命的革命先烈和民族英雄。&lt;/p&gt;&lt;p&gt;\r\n	　　3年前的今天，习近平总书记在南京大屠杀死难者国家公祭仪式上发表讲话，表达中国人民坚定不移走和平发展道路的崇高愿望，宣示中国人民牢记历史、不忘过去，珍爱和平、开创未来的坚定立场。3年来，我们以国家之名祭奠死难者，以尊崇之心珍视和平，以民族之力矢志复兴。今天，中华民族的发展前景无比光明，中国人民维护和平的决心坚定不移。&lt;/p&gt;&lt;p&gt;\r\n	　　1937年7月7日，日本侵略者悍然发动了全面侵华战争，给中国人民带来了前所未有的巨大灾难。12月13日，侵华日军野蛮侵入南京，制造了灭绝人性的南京大屠杀惨案，30万同胞惨遭杀戮。这一骇人听闻的反人类罪行，是人类历史上十分黑暗的一页，是中华民族永远的伤痛。面对极其野蛮、极其残暴的日本侵略者，具有伟大爱国主义精神的中国人民没有屈服，在中国共产党号召和引领下，全民族各种积极力量同仇敌忾、共御外敌，最终赢得了中国人民抗日战争伟大胜利，也为世界反法西斯战争胜利作出了重大贡献。&lt;/p&gt;&lt;p&gt;\r\n	　　“谁忘记历史，谁就会在灵魂上生病。”80年过去，侵略者的枪声淹没在历史尘埃里，但中华门城墙上的弹孔依然清晰可见；南京城的不绝哀号已随风逝去，但“万人坑”的累累白骨还在。历史不会因时代变迁而改变，事实也不会因巧舌抵赖而消失。南京大屠杀惨案铁证如山、不容否认。任何倒行逆施妄图篡改历史、否认暴行，为南京大屠杀惨案和侵略战争翻案的丑恶行径，不仅13亿中国人民不会答应，也将受到世界上一切爱好和平与正义人民的谴责和唾弃。“国之大事，在祀与戎。”年复一年的国家公祭向世人宣示，中国人民反对侵略战争、反对篡改历史的立场坚定不移，中国人民团结一心实现民族复兴的决心坚定不移，中国人民捍卫人类尊严、维护世界和平的意志坚定不移。&lt;/p&gt;&lt;p&gt;\r\n	　　以国之名，我们呼唤中华儿女勠力同心为建设社会主义现代化强国、实现中华民族伟大复兴的中国梦作出新贡献。“四万万人齐蹈厉，同心同德一戎衣”，从中国人民赢得抗日战争伟大胜利，开启中华民族由衰败走向振兴的重大转折，到中国特色社会主义进入新时代，意味着中华民族迎来了从站起来、富起来到强起来的伟大飞跃，中华崛起之功业，民族复兴之愿景，因为一代代中华儿女接续奋斗而曙光在前。在铭记历史中砥砺不忘初心、牢记使命的坚定信念，在缅怀同胞和先烈中凝聚以爱国主义为核心的伟大民族精神，我们一定能走好新时代的长征路，在新征程上不断夺取新胜利。&lt;/p&gt;&lt;p&gt;\r\n	　　以国之名，我们呼吁世界各国共襄构建人类命运共同体的伟业，努力建设一个持久和平、共同繁荣的世界。中华民族经历了同胞惨遭屠戮、山河喋血的痛苦，更懂得和平“受益而不觉，失之则难存”，更坚定“坚持和平发展，共同开创世界和平充满希望的未来”的决心。从“一带一路”成为各国共同发展的合作平台，到构建人类命运共同体不断付诸实践，中国始终把为人类作出新的更大贡献作为自己的使命，始终做世界和平的建设者、全球发展的贡献者、国际秩序的维护者，同各国一道共同创造人类的美好未来。&lt;/p&gt;&lt;p&gt;\r\n	　　不忘历史，矢志复兴。今天的中国，任人宰割、饱受欺凌的时代已经一去不复返了。全体中华儿女携手同心凝聚磅礴力量，为实现中华民族伟大复兴中国梦而不懈奋斗，正是对死难同胞和革命先烈的最好告慰。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '', '100', '0', 'http://dangjian.huiyi.t.weixinren.cn/upload//editor/201712/5a30eb9f6e851.jpg', '1', '0', '1516183686', '1516183686', '0', '0', '0', '130304');

-- ----------------------------
-- Table structure for hy_top
-- ----------------------------
DROP TABLE IF EXISTS `hy_top`;
CREATE TABLE `hy_top` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `top_type` tinyint(1) unsigned NOT NULL COMMENT '首页推荐类型 1=风采 2=活动 3=公告 101=两学一做 102=党建专题',
  `content_id` int(11) NOT NULL,
  `add_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=325 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hy_top
-- ----------------------------
INSERT INTO `hy_top` VALUES ('56', '1', '67', '1513750749');
INSERT INTO `hy_top` VALUES ('82', '101', '5', '1513838372');
INSERT INTO `hy_top` VALUES ('91', '101', '2', '1513839085');
INSERT INTO `hy_top` VALUES ('104', '101', '0', '1513931485');
INSERT INTO `hy_top` VALUES ('171', '1', '12', '1514187757');
INSERT INTO `hy_top` VALUES ('175', '3', '37', '1514269059');
INSERT INTO `hy_top` VALUES ('178', '3', '35', '1514269285');
INSERT INTO `hy_top` VALUES ('183', '1', '63', '1514274334');
INSERT INTO `hy_top` VALUES ('232', '1', '59', '1514277489');
INSERT INTO `hy_top` VALUES ('242', '1', '69', '1514428841');
INSERT INTO `hy_top` VALUES ('244', '101', '15', '1514431004');
INSERT INTO `hy_top` VALUES ('245', '101', '14', '1514431004');
INSERT INTO `hy_top` VALUES ('247', '102', '12', '1514431038');
INSERT INTO `hy_top` VALUES ('248', '102', '11', '1514431039');
INSERT INTO `hy_top` VALUES ('257', '4', '324', '1514432875');
INSERT INTO `hy_top` VALUES ('258', '4', '325', '1514432882');
INSERT INTO `hy_top` VALUES ('259', '4', '326', '1514432885');
INSERT INTO `hy_top` VALUES ('260', '1', '68', '1514518881');
INSERT INTO `hy_top` VALUES ('262', '3', '41', '1514518925');
INSERT INTO `hy_top` VALUES ('266', '1', '70', '1514525634');
INSERT INTO `hy_top` VALUES ('267', '1', '71', '1514525909');
INSERT INTO `hy_top` VALUES ('268', '101', '4', '1514530058');
INSERT INTO `hy_top` VALUES ('269', '102', '4', '1514530061');
INSERT INTO `hy_top` VALUES ('270', '101', '9', '1514530065');
INSERT INTO `hy_top` VALUES ('271', '102', '3', '1514530068');
INSERT INTO `hy_top` VALUES ('273', '101', '19', '1514858458');
INSERT INTO `hy_top` VALUES ('274', '101', '20', '1514858458');
INSERT INTO `hy_top` VALUES ('276', '101', '17', '1514863753');
INSERT INTO `hy_top` VALUES ('277', '101', '12', '1514863765');
INSERT INTO `hy_top` VALUES ('278', '1', '81', '1514863797');
INSERT INTO `hy_top` VALUES ('279', '1', '75', '1514863799');
INSERT INTO `hy_top` VALUES ('280', '1', '79', '1514865188');
INSERT INTO `hy_top` VALUES ('283', '2', '10', '1514878917');
INSERT INTO `hy_top` VALUES ('284', '2', '26', '1514878919');
INSERT INTO `hy_top` VALUES ('285', '2', '17', '1514878920');
INSERT INTO `hy_top` VALUES ('288', '2', '25', '1514878987');
INSERT INTO `hy_top` VALUES ('289', '2', '21', '1514878990');
INSERT INTO `hy_top` VALUES ('290', '1', '84', '1514880149');
INSERT INTO `hy_top` VALUES ('291', '1', '83', '1514880150');
INSERT INTO `hy_top` VALUES ('297', '3', '45', '1514944590');
INSERT INTO `hy_top` VALUES ('298', '1', '90', '1514944600');
INSERT INTO `hy_top` VALUES ('304', '3', '46', '1514958433');
INSERT INTO `hy_top` VALUES ('310', '2', '31', '1514964985');
INSERT INTO `hy_top` VALUES ('312', '4', '327', '1515048788');
INSERT INTO `hy_top` VALUES ('313', '1', '96', '1515119631');
INSERT INTO `hy_top` VALUES ('314', '101', '24', '1515119773');
INSERT INTO `hy_top` VALUES ('315', '101', '23', '1515119774');
INSERT INTO `hy_top` VALUES ('316', '101', '22', '1515119775');
INSERT INTO `hy_top` VALUES ('318', '101', '18', '1515122488');
INSERT INTO `hy_top` VALUES ('319', '101', '21', '1515122584');
INSERT INTO `hy_top` VALUES ('320', '2', '33', '1515146175');
INSERT INTO `hy_top` VALUES ('321', '101', '25', '1515398634');
INSERT INTO `hy_top` VALUES ('322', '3', '47', '1515400553');
INSERT INTO `hy_top` VALUES ('323', '1', '93', '1515492091');
INSERT INTO `hy_top` VALUES ('324', '1', '97', '1515492410');

-- ----------------------------
-- Table structure for hy_user_exam
-- ----------------------------
DROP TABLE IF EXISTS `hy_user_exam`;
CREATE TABLE `hy_user_exam` (
  `exam_id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '学习ID',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `image` varchar(200) NOT NULL DEFAULT '' COMMENT '图片',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '学习状态 默认0=正在学习 1=学习完成',
  `content_id` int(11) NOT NULL DEFAULT '0' COMMENT '学习内容ID',
  `limit_time` int(11) NOT NULL DEFAULT '0' COMMENT '规定时间',
  `answer_time` int(11) NOT NULL DEFAULT '0' COMMENT '做题时间',
  `score` decimal(8,1) NOT NULL DEFAULT '0.0' COMMENT '得分',
  `total_score` decimal(8,1) NOT NULL DEFAULT '0.0' COMMENT '总分数',
  `wrong_count` smallint(5) NOT NULL DEFAULT '0' COMMENT '答错数量',
  `right_count` smallint(5) NOT NULL DEFAULT '0' COMMENT '答对数量',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '学习开始时间',
  `over_time` int(11) NOT NULL DEFAULT '0' COMMENT '学习结束时间',
  `option_id` int(11) NOT NULL DEFAULT '0' COMMENT '任务ID 默认0=无任务',
  PRIMARY KEY (`exam_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='我的评测';

-- ----------------------------
-- Records of hy_user_exam
-- ----------------------------
INSERT INTO `hy_user_exam` VALUES ('1', '1801171806056671', '23432', 'http://dangjian.com/upload//editor/201712/5a34d9a21c854.png', '1', '13', '60', '3600', '100.0', '0.0', '0', '0', '1516345981', '1516349581', '0');
INSERT INTO `hy_user_exam` VALUES ('2', '1801171806056671', '23432', 'http://dangjian.com/upload//editor/201712/5a34d9a21c854.png', '1', '13', '60', '60', '0.0', '0.0', '0', '0', '1516619620', '1516619680', '0');
INSERT INTO `hy_user_exam` VALUES ('3', '1801171806056671', '23432', 'http://dangjian.com/upload//editor/201712/5a34d9a21c854.png', '1', '13', '60', '60', '100.0', '0.0', '0', '0', '1516619722', '1516619782', '0');
INSERT INTO `hy_user_exam` VALUES ('4', '1801171806056671', '23432', 'http://dangjian.com/upload//editor/201712/5a34d9a21c854.png', '1', '13', '60', '60', '0.0', '0.0', '0', '0', '1516620122', '1516620182', '0');
INSERT INTO `hy_user_exam` VALUES ('5', '1801171806056671', '23432', 'http://dangjian.com/upload//editor/201712/5a34d9a21c854.png', '1', '13', '60', '60', '0.0', '0.0', '0', '0', '1516621350', '1516621410', '0');
INSERT INTO `hy_user_exam` VALUES ('6', '1801171806056671', '23432', 'http://dangjian.com/upload//editor/201712/5a34d9a21c854.png', '1', '13', '60', '60', '0.0', '0.0', '0', '0', '1516621415', '1516621475', '0');
INSERT INTO `hy_user_exam` VALUES ('7', '1801171806056671', '23432', 'http://dangjian.com/upload//editor/201712/5a34d9a21c854.png', '1', '13', '60', '60', '0.0', '0.0', '0', '0', '1516621591', '1516621651', '0');
INSERT INTO `hy_user_exam` VALUES ('8', '1801171806056671', '23432', 'http://dangjian.com/upload//editor/201712/5a34d9a21c854.png', '1', '13', '60', '60', '0.0', '0.0', '0', '0', '1516621737', '1516621797', '0');
INSERT INTO `hy_user_exam` VALUES ('9', '1801171806056671', '23432', 'http://dangjian.com/upload//editor/201712/5a34d9a21c854.png', '1', '13', '3600', '2514', '10.0', '0.0', '0', '0', '1516621801', '1516624315', '0');
INSERT INTO `hy_user_exam` VALUES ('12', '1801171806056671', 'title', 'image', '1', '3', '60', '60', '0.0', '0.0', '0', '0', '1516673771', '1516673831', '0');
INSERT INTO `hy_user_exam` VALUES ('13', '1801171806056671', 'title', 'image', '1', '3', '60', '60', '0.0', '0.0', '0', '0', '1516674222', '1516674282', '0');
INSERT INTO `hy_user_exam` VALUES ('14', '1801171806056671', 'title', 'image', '1', '3', '60', '60', '0.0', '0.0', '0', '0', '1516677130', '1516677190', '0');
INSERT INTO `hy_user_exam` VALUES ('15', '1801171806056671', 'title', 'image', '1', '3', '60', '60', '0.0', '0.0', '0', '0', '1516677558', '1516677618', '0');
INSERT INTO `hy_user_exam` VALUES ('16', '1801171806056671', 'title', 'image', '1', '9', '60', '60', '0.0', '0.0', '0', '0', '1516695588', '1516695648', '0');
INSERT INTO `hy_user_exam` VALUES ('17', '1801171806056671', 'title', 'image', '1', '9', '60', '60', '0.0', '0.0', '0', '0', '1516695883', '1516695943', '0');
INSERT INTO `hy_user_exam` VALUES ('18', '1801171806056671', '23432', 'http://dangjian.com/upload//editor/201712/5a34d9a21c854.png', '1', '13', '3600', '0', '0.0', '0.0', '0', '0', '1516695943', '1516695943', '8');
INSERT INTO `hy_user_exam` VALUES ('19', '1801171806056671', '23432', 'http://dangjian.com/upload//editor/201712/5a34d9a21c854.png', '1', '13', '60', '60', '11.0', '21.0', '1', '2', '1516766113', '1516766173', '0');
INSERT INTO `hy_user_exam` VALUES ('20', '2147483647', '23432', 'http://dangjian.com/upload//editor/201712/5a34d9a21c854.png', '1', '13', '3600', '175', '10.0', '21.0', '2', '1', '1516776497', '1516776672', '0');

-- ----------------------------
-- Table structure for hy_user_exam_log
-- ----------------------------
DROP TABLE IF EXISTS `hy_user_exam_log`;
CREATE TABLE `hy_user_exam_log` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '学习ID',
  `exam_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联我的评测ID',
  `rows_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联题目ID',
  `answer` varchar(50) NOT NULL DEFAULT '' COMMENT '用户填写答案，多个用逗号隔开',
  `is_right` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否正确',
  `score` decimal(8,1) NOT NULL DEFAULT '0.0' COMMENT '分数',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='我的评测日志';

-- ----------------------------
-- Records of hy_user_exam_log
-- ----------------------------
INSERT INTO `hy_user_exam_log` VALUES ('1', '3', '1', '1', '1', '100.0', '0');
INSERT INTO `hy_user_exam_log` VALUES ('4', '9', '2', '0,1', '1', '10.0', '1516624301');
INSERT INTO `hy_user_exam_log` VALUES ('5', '9', '3', '0,1', '0', '1.0', '1516624315');
INSERT INTO `hy_user_exam_log` VALUES ('6', '19', '1', '1', '0', '10.0', '1516766180');
INSERT INTO `hy_user_exam_log` VALUES ('7', '19', '2', '0,1', '1', '10.0', '1516766194');
INSERT INTO `hy_user_exam_log` VALUES ('8', '19', '3', '1', '1', '1.0', '1516766252');
INSERT INTO `hy_user_exam_log` VALUES ('9', '20', '1', '2', '1', '10.0', '1516776541');

-- ----------------------------
-- Table structure for hy_user_info
-- ----------------------------
DROP TABLE IF EXISTS `hy_user_info`;
CREATE TABLE `hy_user_info` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `branch_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属小程序',
  `group_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属支部',
  `real_name` varchar(20) NOT NULL DEFAULT '' COMMENT '姓名',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '电话',
  `id_no` varchar(18) NOT NULL DEFAULT '' COMMENT '身份证号',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '密码盐值',
  `user_img` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `user_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '级别',
  `openid` varchar(50) NOT NULL DEFAULT '' COMMENT 'OPENID',
  `unionid` varchar(50) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `reg_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `nick_name` varchar(20) NOT NULL COMMENT '昵称',
  `sex` int(1) NOT NULL DEFAULT '1' COMMENT '性别 1=男 2=女',
  `birthday` varchar(30) NOT NULL COMMENT '年-月-日',
  `join_day` varchar(10) NOT NULL DEFAULT '' COMMENT '入党时间',
  `district` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '所在区域',
  `signature` varchar(255) NOT NULL DEFAULT '' COMMENT '党宣誓言',
  `points` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '用户积分',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `member_no` varchar(30) NOT NULL DEFAULT '' COMMENT '党员编号',
  PRIMARY KEY (`user_id`),
  KEY `branch_id` (`branch_id`),
  KEY `mobile` (`mobile`),
  KEY `openid` (`openid`),
  KEY `status` (`status`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1801191145497963 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of hy_user_info
-- ----------------------------
INSERT INTO `hy_user_info` VALUES ('18011520114242', '6', '0', '黄禹锡', '13268065059', '', '650d7f421842ee9c61a5ec9314f5d1ab', '0', '', '1', 'oLgTz0OuAlAZlKZXtmtn3yzWchts', '', '1', '1516018302', '', '1', '', '', '0', '', '0', '0', '');
INSERT INTO `hy_user_info` VALUES ('18011520163175', '4', '0', '高翠明', '13330192433', '362227198404132271', '1e9d458c2caca7d89d6716152e6735fe', '0', '', '1', '', '', '2', '1516018591', '', '1', '1995-01-15', '2013-01-15', '150102', '', '0', '0', '');
INSERT INTO `hy_user_info` VALUES ('18011609351888', '1', '18', '高翠明2', '13330194400', '', '6c7b7cff02d0b8d60914be355137d025', '0', '', '1', '', '', '1', '1516066518', '', '1', '', '', '440601', '', '0', '0', '');
INSERT INTO `hy_user_info` VALUES ('18011612102278', '4', '19', '小高', '13330194400', '', '6c7b7cff02d0b8d60914be355137d025', '0', '', '1', '', '', '2', '1516075822', '', '1', '', '', '0', '', '0', '0', '');
INSERT INTO `hy_user_info` VALUES ('1801161217239537', '4', '19', '高高', '17688862433', '', '44dd9723e6bdfc7c23e3a8493d7b2e92', '0', '', '1', 'oZEgl0VAowRZwDOukCKUSsC2u7iw', '', '1', '1516076243', '', '1', '', '', '0', '', '0', '0', '');
INSERT INTO `hy_user_info` VALUES ('1801161357353693', '4', '19', '吴好人', '13800138000', '', '3334768acc5712f9875c6146bb84a623', '0', '', '1', 'oZEgl0QxfK7kphlzglYKmJveBu8U', '', '1', '1516082255', '', '1', '', '', '0', '', '0', '0', '');
INSERT INTO `hy_user_info` VALUES ('1801161721329740', '7', '21', '彭涛', '18588853515', '', '171254e1fefb5a8a0a913076be273d6a', '0', 'http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/editor177d14bfc97bc1a76bb5f3e5f6cc2833.jpg', '100', 'oNWb00NhhdlDFZ304oMNinEIAHks', '', '1', '1516094492', '', '1', '1993-08-15', '2018-01-16', '430527', '为人民服务', '0', '0', '');
INSERT INTO `hy_user_info` VALUES ('1801161728081780', '4', '22', 'Marko', '15521099542', '', 'ad6720d90e4b14924baeedcb37317c74', '0', 'http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/editor150e95171a80b0ddea9bd1100619d941.jpg', '1', 'oZEgl0UGs8B3wWFJdtZw2eLLVjvw', '', '1', '1516094888', 'marko', '1', '2018-01-17', '2018-01-16', '130302', '哈哈', '0', '0', '');
INSERT INTO `hy_user_info` VALUES ('1801161810285112', '7', '0', '彭一一', '15243993784', '', 'b9723ab6ce001f2a2dc90d4722d745cc', '0', '', '1', '', '', '1', '1516097428', '', '1', '', '', '0', '', '0', '0', '');
INSERT INTO `hy_user_info` VALUES ('1801161812035760', '7', '0', '彭二二', '11111111111', '', '053dfce08f7e56145f6e5b7ff45daa15', '0', '', '1', '', '', '1', '1516097523', '', '1', '', '', '0', '', '0', '0', '');
INSERT INTO `hy_user_info` VALUES ('1801161813587290', '7', '0', '彭三三', '11111111110', '', 'decd05bd937bbf4c71b11187fba3b1f3', '0', '', '1', '', '', '1', '1516097638', '', '1', '', '', '0', '', '0', '0', '');
INSERT INTO `hy_user_info` VALUES ('1801162001235191', '7', '23', '黄飞', '13710031085', '', '618e75019751cdb973fe148b4df04ac4', '0', '', '1', 'oNWb00MM1iu3HTPUi9q4cQZlr9q4', '', '1', '1516104083', '', '1', '', '', '1', '', '0', '0', '');
INSERT INTO `hy_user_info` VALUES ('1801162210527323', '7', '0', '123', '11111111113', '', '122fdb029ebb367bbeb6606e807855f2', '0', '', '1', '', '', '1', '1516111852', '', '1', '', '', '0', '', '0', '0', '');
INSERT INTO `hy_user_info` VALUES ('1801171806056671', '3', '25', '柯琼远', '13450223260', '', 'c0e7f0de33c01adc7807376470f36d81', '0', '', '1', 'o_AAF0RpqVmzBFJ8IMpt4Ya9rRLc', '', '1', '1516183565', '', '1', '', '', '130304', '', '0', '0', '');
INSERT INTO `hy_user_info` VALUES ('1801171811127505', '7', '0', '彭11', '11111111115', '', 'e3818b5f614f62b9fb7ee460a77d9867', '0', '', '1', 'oNWb00NhhdlDFZ304oMNinEIAHks', '', '1', '1516183872', '', '1', '', '', '0', '', '0', '0', '');
INSERT INTO `hy_user_info` VALUES ('1801172031569890', '7', '0', '删除测试', '11111111114', '', 'efcae8a142e938d7742b518c7b9eb13d', '0', '', '1', '', '', '1', '1516192316', '', '1', '', '', '0', '', '0', '0', '');
INSERT INTO `hy_user_info` VALUES ('1801172033349890', '7', '0', '11', '11111111118', '', '308e67def921f719d912c627067a1477', '0', '', '1', '', '', '1', '1516192414', '', '1', '', '', '0', '', '0', '0', '');
INSERT INTO `hy_user_info` VALUES ('1801172035518176', '7', '0', '222', '11111111121', '', '1c9e51e468e0984707f12a25e353a806', '0', '', '1', '', '', '1', '1516192551', '', '1', '', '', '0', '', '0', '0', '');
INSERT INTO `hy_user_info` VALUES ('1801172042509890', '7', '21', '135', '11111111131', '', 'eceab7f6c4999243f16861b938ef6ca3', '0', '', '1', '', '', '1', '1516192970', '', '1', '', '', '0', '', '0', '0', '');
INSERT INTO `hy_user_info` VALUES ('1801191139053661', '7', '24', '梁水明', '13826113909', '', '3843102c781d160e3a294009cc22fef8', '0', '', '1', 'oNWb00DxF8doCDVQ1KnzBGF3FpT8', '', '1', '1516333145', '', '1', '', '', '1', '', '0', '0', '');
INSERT INTO `hy_user_info` VALUES ('1801191145497962', '7', '21', '邮政芮总', '13172074530', '', 'ec7f5b04a82f6e2ecec7528888ad45ba', '0', '', '1', 'oNWb00PevC5Qp6gLIe0qzszLQ6Q8', '', '1', '1516333549', '', '1', '', '', '0', '', '0', '0', '');

-- ----------------------------
-- Table structure for hy_user_point
-- ----------------------------
DROP TABLE IF EXISTS `hy_user_point`;
CREATE TABLE `hy_user_point` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `branch_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '支部ID',
  `rank_points` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '总积分',
  `study_points` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '学习分',
  `mien_points` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '风采分',
  `exam_points` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '考试分',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18011512065372 DEFAULT CHARSET=utf8 COMMENT='用户积分表';

-- ----------------------------
-- Records of hy_user_point
-- ----------------------------
INSERT INTO `hy_user_point` VALUES ('188', '1', '8', '3', '0', '0');
INSERT INTO `hy_user_point` VALUES ('17120917454970', '1', '96', '2', '24', '0');
INSERT INTO `hy_user_point` VALUES ('17121211474354', '1', '139', '14', '35', '0');
INSERT INTO `hy_user_point` VALUES ('17121421083186', '1', '2', '0', '0', '0');
INSERT INTO `hy_user_point` VALUES ('17121510213494', '1', '5', '0', '0', '0');
INSERT INTO `hy_user_point` VALUES ('17121517350938', '1', '65', '7', '38', '0');
INSERT INTO `hy_user_point` VALUES ('17122010025893', '1', '33', '11', '7', '0');
INSERT INTO `hy_user_point` VALUES ('17122718493470', '3', '15', '0', '0', '0');
INSERT INTO `hy_user_point` VALUES ('17122720273550', '3', '30', '0', '10', '0');
INSERT INTO `hy_user_point` VALUES ('17122720433916', '4', '51', '5', '16', '0');
INSERT INTO `hy_user_point` VALUES ('17122721011120', '4', '29', '1', '8', '0');
INSERT INTO `hy_user_point` VALUES ('17122809162726', '3', '60', '5', '0', '0');
INSERT INTO `hy_user_point` VALUES ('17122809483784', '4', '150', '8', '87', '0');
INSERT INTO `hy_user_point` VALUES ('17122911492615', '6', '57', '2', '5', '0');
INSERT INTO `hy_user_point` VALUES ('17122911545083', '6', '20', '0', '0', '0');
INSERT INTO `hy_user_point` VALUES ('17122919425475', '3', '11', '1', '0', '0');
INSERT INTO `hy_user_point` VALUES ('18010316510393', '6', '15', '0', '0', '0');
INSERT INTO `hy_user_point` VALUES ('18010513331041', '6', '20', '0', '0', '0');
INSERT INTO `hy_user_point` VALUES ('18010517374964', '7', '63', '4', '9', '0');
INSERT INTO `hy_user_point` VALUES ('18010517385642', '7', '25', '0', '0', '0');
INSERT INTO `hy_user_point` VALUES ('18010918094337', '7', '32', '2', '0', '0');
INSERT INTO `hy_user_point` VALUES ('18011012004787', '3', '21', '1', '0', '0');
INSERT INTO `hy_user_point` VALUES ('18011112185646', '7', '11', '1', '0', '0');
INSERT INTO `hy_user_point` VALUES ('18011512065371', '7', '16', '1', '0', '0');

-- ----------------------------
-- Table structure for hy_user_point_log
-- ----------------------------
DROP TABLE IF EXISTS `hy_user_point_log`;
CREATE TABLE `hy_user_point_log` (
  `point_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `branch_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '支部ID',
  `rule_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '规则类型：登录、点赞等等',
  `primary_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联ID',
  `point` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '获得积分',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`point_id`)
) ENGINE=InnoDB AUTO_INCREMENT=365 DEFAULT CHARSET=utf8 COMMENT='积分流水表';

-- ----------------------------
-- Records of hy_user_point_log
-- ----------------------------
INSERT INTO `hy_user_point_log` VALUES ('7', '17121315513435', '0', '11', '0', '10', '1513309877');
INSERT INTO `hy_user_point_log` VALUES ('8', '17121211474354', '1', '13', '0', '10', '1513309986');
INSERT INTO `hy_user_point_log` VALUES ('9', '17121315513435', '0', '35', '0', '1', '1513310053');
INSERT INTO `hy_user_point_log` VALUES ('10', '17121315513435', '0', '35', '0', '1', '1513310066');
INSERT INTO `hy_user_point_log` VALUES ('11', '17121315513435', '0', '35', '0', '1', '1513310074');
INSERT INTO `hy_user_point_log` VALUES ('12', '17121315513435', '0', '35', '57', '1', '1513310251');
INSERT INTO `hy_user_point_log` VALUES ('13', '1', '0', '34', '57', '1', '1513310251');
INSERT INTO `hy_user_point_log` VALUES ('14', '17121211474354', '1', '21', '2', '1', '1513310269');
INSERT INTO `hy_user_point_log` VALUES ('15', '17121315513435', '0', '13', '0', '10', '1513310298');
INSERT INTO `hy_user_point_log` VALUES ('16', '17121211474354', '1', '21', '4', '1', '1513310387');
INSERT INTO `hy_user_point_log` VALUES ('17', '17121211474354', '1', '22', '4', '1', '1513310421');
INSERT INTO `hy_user_point_log` VALUES ('18', '17121510213494', '1', '13', '0', '10', '1513310587');
INSERT INTO `hy_user_point_log` VALUES ('19', '17121510213494', '1', '21', '2', '1', '1513312440');
INSERT INTO `hy_user_point_log` VALUES ('20', '17121510213494', '1', '21', '4', '1', '1513312703');
INSERT INTO `hy_user_point_log` VALUES ('21', '17120917454970', '1', '13', '0', '10', '1513316020');
INSERT INTO `hy_user_point_log` VALUES ('22', '17120917454970', '1', '31', '0', '5', '1513317953');
INSERT INTO `hy_user_point_log` VALUES ('23', '17120917454970', '1', '35', '59', '1', '1513317970');
INSERT INTO `hy_user_point_log` VALUES ('24', '17120917454970', '1', '34', '59', '1', '1513317970');
INSERT INTO `hy_user_point_log` VALUES ('25', '17121315513435', '0', '31', '0', '5', '1513318046');
INSERT INTO `hy_user_point_log` VALUES ('26', '17121315513435', '0', '35', '60', '1', '1513318068');
INSERT INTO `hy_user_point_log` VALUES ('27', '17121315513435', '0', '34', '60', '1', '1513318068');
INSERT INTO `hy_user_point_log` VALUES ('28', '17120917454970', '1', '31', '0', '5', '1513318153');
INSERT INTO `hy_user_point_log` VALUES ('29', '17121315513435', '0', '35', '61', '1', '1513318196');
INSERT INTO `hy_user_point_log` VALUES ('30', '17120917454970', '1', '34', '61', '1', '1513318196');
INSERT INTO `hy_user_point_log` VALUES ('31', '188', '0', '35', '59', '1', '1513319235');
INSERT INTO `hy_user_point_log` VALUES ('32', '17120917454970', '1', '34', '59', '1', '1513319235');
INSERT INTO `hy_user_point_log` VALUES ('33', '17120917454970', '1', '34', '59', '1', '1513319447');
INSERT INTO `hy_user_point_log` VALUES ('34', '188', '0', '35', '60', '1', '1513319714');
INSERT INTO `hy_user_point_log` VALUES ('35', '17121315513435', '0', '34', '60', '1', '1513319714');
INSERT INTO `hy_user_point_log` VALUES ('36', '17120917454970', '1', '34', '59', '1', '1513319724');
INSERT INTO `hy_user_point_log` VALUES ('37', '17121211474354', '1', '35', '59', '1', '1513324674');
INSERT INTO `hy_user_point_log` VALUES ('38', '17120917454970', '1', '34', '59', '1', '1513324674');
INSERT INTO `hy_user_point_log` VALUES ('39', '17121211474354', '1', '35', '60', '1', '1513324678');
INSERT INTO `hy_user_point_log` VALUES ('40', '17121315513435', '0', '34', '60', '1', '1513324678');
INSERT INTO `hy_user_point_log` VALUES ('41', '17121211474354', '1', '35', '61', '1', '1513324693');
INSERT INTO `hy_user_point_log` VALUES ('42', '17120917454970', '1', '34', '61', '1', '1513324693');
INSERT INTO `hy_user_point_log` VALUES ('43', '17120917454970', '1', '35', '61', '1', '1513326599');
INSERT INTO `hy_user_point_log` VALUES ('44', '17120917454970', '1', '34', '61', '1', '1513326599');
INSERT INTO `hy_user_point_log` VALUES ('45', '17120917454970', '1', '35', '60', '1', '1513326661');
INSERT INTO `hy_user_point_log` VALUES ('46', '17121315513435', '0', '34', '60', '1', '1513326661');
INSERT INTO `hy_user_point_log` VALUES ('47', '17121510213494', '1', '35', '59', '1', '1513329262');
INSERT INTO `hy_user_point_log` VALUES ('48', '17120917454970', '1', '34', '59', '1', '1513329262');
INSERT INTO `hy_user_point_log` VALUES ('49', '17121211474354', '1', '31', '0', '5', '1513330222');
INSERT INTO `hy_user_point_log` VALUES ('50', '17121211474354', '1', '35', '62', '1', '1513330499');
INSERT INTO `hy_user_point_log` VALUES ('51', '17121211474354', '1', '34', '62', '1', '1513330499');
INSERT INTO `hy_user_point_log` VALUES ('52', '17121517350938', '1', '35', '61', '1', '1513330592');
INSERT INTO `hy_user_point_log` VALUES ('53', '17120917454970', '1', '34', '61', '1', '1513330592');
INSERT INTO `hy_user_point_log` VALUES ('54', '17120917454970', '1', '11', '0', '10', '1513330929');
INSERT INTO `hy_user_point_log` VALUES ('55', '17120917454970', '1', '14', '0', '5', '1513331057');
INSERT INTO `hy_user_point_log` VALUES ('56', '17121211474354', '1', '11', '0', '10', '1513331130');
INSERT INTO `hy_user_point_log` VALUES ('57', '17121211474354', '1', '14', '0', '5', '1513331158');
INSERT INTO `hy_user_point_log` VALUES ('58', '17120917454970', '1', '21', '2', '1', '1513331512');
INSERT INTO `hy_user_point_log` VALUES ('59', '17120917454970', '1', '21', '4', '1', '1513331515');
INSERT INTO `hy_user_point_log` VALUES ('60', '17121211474354', '1', '14', '0', '5', '1513382826');
INSERT INTO `hy_user_point_log` VALUES ('61', '17120917454970', '1', '14', '0', '5', '1513384905');
INSERT INTO `hy_user_point_log` VALUES ('62', '17121211474354', '1', '33', '59', '1', '1513389612');
INSERT INTO `hy_user_point_log` VALUES ('63', '0', '0', '32', '59', '2', '1513389612');
INSERT INTO `hy_user_point_log` VALUES ('64', '0', '0', '32', '59', '2', '1513389658');
INSERT INTO `hy_user_point_log` VALUES ('65', '17121211474354', '1', '33', '61', '1', '1513389670');
INSERT INTO `hy_user_point_log` VALUES ('66', '0', '0', '32', '61', '2', '1513389670');
INSERT INTO `hy_user_point_log` VALUES ('67', '17121517144136', '0', '11', '0', '10', '1513392623');
INSERT INTO `hy_user_point_log` VALUES ('68', '0', '0', '32', '59', '2', '1513392887');
INSERT INTO `hy_user_point_log` VALUES ('69', '188', '0', '21', '2', '1', '1513415041');
INSERT INTO `hy_user_point_log` VALUES ('70', '188', '0', '21', '5', '1', '1513415444');
INSERT INTO `hy_user_point_log` VALUES ('71', '17121211474354', '1', '14', '0', '5', '1513558015');
INSERT INTO `hy_user_point_log` VALUES ('72', '17121211474354', '1', '33', '62', '1', '1513562532');
INSERT INTO `hy_user_point_log` VALUES ('73', '0', '0', '32', '62', '2', '1513562532');
INSERT INTO `hy_user_point_log` VALUES ('74', '0', '0', '32', '61', '2', '1513562538');
INSERT INTO `hy_user_point_log` VALUES ('75', '0', '0', '32', '59', '2', '1513562543');
INSERT INTO `hy_user_point_log` VALUES ('76', '0', '0', '32', '59', '2', '1513580804');
INSERT INTO `hy_user_point_log` VALUES ('77', '17121211474354', '1', '31', '0', '5', '1513583068');
INSERT INTO `hy_user_point_log` VALUES ('78', '17121211474354', '1', '33', '63', '1', '1513583098');
INSERT INTO `hy_user_point_log` VALUES ('79', '0', '0', '32', '63', '2', '1513583098');
INSERT INTO `hy_user_point_log` VALUES ('80', '17121211474354', '1', '35', '63', '1', '1513583581');
INSERT INTO `hy_user_point_log` VALUES ('81', '17121211474354', '1', '34', '63', '1', '1513583581');
INSERT INTO `hy_user_point_log` VALUES ('82', '17121517350938', '1', '11', '0', '10', '1513587624');
INSERT INTO `hy_user_point_log` VALUES ('83', '17121517350938', '1', '14', '0', '5', '1513587652');
INSERT INTO `hy_user_point_log` VALUES ('84', '17121517350938', '1', '21', '2', '1', '1513587935');
INSERT INTO `hy_user_point_log` VALUES ('85', '17121517350938', '1', '21', '4', '1', '1513587938');
INSERT INTO `hy_user_point_log` VALUES ('86', '17121517350938', '1', '31', '0', '5', '1513588237');
INSERT INTO `hy_user_point_log` VALUES ('87', '17121517350938', '1', '31', '0', '5', '1513588393');
INSERT INTO `hy_user_point_log` VALUES ('88', '17121517350938', '1', '31', '0', '5', '1513588496');
INSERT INTO `hy_user_point_log` VALUES ('89', '17121517350938', '1', '33', '66', '1', '1513588554');
INSERT INTO `hy_user_point_log` VALUES ('90', '0', '0', '32', '66', '2', '1513588554');
INSERT INTO `hy_user_point_log` VALUES ('91', '17121517350938', '1', '35', '66', '1', '1513588582');
INSERT INTO `hy_user_point_log` VALUES ('92', '17121517350938', '1', '34', '66', '1', '1513588582');
INSERT INTO `hy_user_point_log` VALUES ('93', '17121517350938', '1', '31', '0', '5', '1513588686');
INSERT INTO `hy_user_point_log` VALUES ('94', '17121517350938', '1', '35', '67', '1', '1513588711');
INSERT INTO `hy_user_point_log` VALUES ('95', '17121517350938', '1', '34', '67', '1', '1513588711');
INSERT INTO `hy_user_point_log` VALUES ('96', '17121517350938', '1', '33', '67', '1', '1513588729');
INSERT INTO `hy_user_point_log` VALUES ('97', '0', '0', '32', '67', '2', '1513588729');
INSERT INTO `hy_user_point_log` VALUES ('98', '17121517350938', '1', '22', '4', '1', '1513589234');
INSERT INTO `hy_user_point_log` VALUES ('99', '17121211474354', '1', '35', '67', '1', '1513590931');
INSERT INTO `hy_user_point_log` VALUES ('100', '17121517350938', '1', '34', '67', '1', '1513590931');
INSERT INTO `hy_user_point_log` VALUES ('101', '17121211474354', '1', '35', '66', '1', '1513590964');
INSERT INTO `hy_user_point_log` VALUES ('102', '17121517350938', '1', '34', '66', '1', '1513590964');
INSERT INTO `hy_user_point_log` VALUES ('103', '17121517350938', '1', '22', '6', '1', '1513591368');
INSERT INTO `hy_user_point_log` VALUES ('104', '17121211474354', '1', '22', '6', '1', '1513592192');
INSERT INTO `hy_user_point_log` VALUES ('105', '17121517350938', '1', '22', '3', '1', '1513593633');
INSERT INTO `hy_user_point_log` VALUES ('106', '17121517350938', '1', '22', '2', '1', '1513593636');
INSERT INTO `hy_user_point_log` VALUES ('107', '17121517350938', '1', '22', '1', '1', '1513593640');
INSERT INTO `hy_user_point_log` VALUES ('108', '17121211474354', '1', '14', '0', '5', '1513644672');
INSERT INTO `hy_user_point_log` VALUES ('109', '17121211474354', '1', '22', '1', '1', '1513645737');
INSERT INTO `hy_user_point_log` VALUES ('110', '17121517350938', '1', '14', '0', '5', '1513646480');
INSERT INTO `hy_user_point_log` VALUES ('111', '17121517350938', '1', '31', '0', '5', '1513649740');
INSERT INTO `hy_user_point_log` VALUES ('112', '17121211474354', '1', '14', '0', '5', '1513732336');
INSERT INTO `hy_user_point_log` VALUES ('113', '17120917454970', '1', '14', '0', '5', '1513733123');
INSERT INTO `hy_user_point_log` VALUES ('114', '17121517293461', '0', '11', '0', '10', '1513734950');
INSERT INTO `hy_user_point_log` VALUES ('115', '17121517293461', '0', '14', '0', '5', '1513735046');
INSERT INTO `hy_user_point_log` VALUES ('116', '17122010025893', '1', '11', '0', '10', '1513735378');
INSERT INTO `hy_user_point_log` VALUES ('117', '17122010025893', '1', '35', '68', '1', '1513735436');
INSERT INTO `hy_user_point_log` VALUES ('118', '17121517350938', '1', '34', '68', '1', '1513735436');
INSERT INTO `hy_user_point_log` VALUES ('119', '17122010025893', '1', '35', '67', '1', '1513735440');
INSERT INTO `hy_user_point_log` VALUES ('120', '17121517350938', '1', '34', '67', '1', '1513735440');
INSERT INTO `hy_user_point_log` VALUES ('121', '17122010025893', '1', '35', '64', '1', '1513735459');
INSERT INTO `hy_user_point_log` VALUES ('122', '17121517350938', '1', '34', '64', '1', '1513735459');
INSERT INTO `hy_user_point_log` VALUES ('123', '17122010025893', '1', '35', '63', '1', '1513735467');
INSERT INTO `hy_user_point_log` VALUES ('124', '17121211474354', '1', '34', '63', '1', '1513735467');
INSERT INTO `hy_user_point_log` VALUES ('125', '17122010025893', '1', '35', '62', '1', '1513735470');
INSERT INTO `hy_user_point_log` VALUES ('126', '17121211474354', '1', '34', '62', '1', '1513735470');
INSERT INTO `hy_user_point_log` VALUES ('127', '17122010025893', '1', '35', '61', '1', '1513735491');
INSERT INTO `hy_user_point_log` VALUES ('128', '17120917454970', '1', '34', '61', '1', '1513735491');
INSERT INTO `hy_user_point_log` VALUES ('129', '17121211474354', '1', '14', '0', '5', '1513818630');
INSERT INTO `hy_user_point_log` VALUES ('130', '17120917454970', '1', '14', '0', '5', '1513834704');
INSERT INTO `hy_user_point_log` VALUES ('131', '17121211474354', '1', '14', '0', '5', '1514164037');
INSERT INTO `hy_user_point_log` VALUES ('132', '17121211474354', '1', '21', '8', '1', '1514164599');
INSERT INTO `hy_user_point_log` VALUES ('133', '17121211474354', '1', '21', '9', '1', '1514164628');
INSERT INTO `hy_user_point_log` VALUES ('134', '17121211474354', '1', '21', '10', '1', '1514164648');
INSERT INTO `hy_user_point_log` VALUES ('135', '17121211474354', '1', '22', '3', '1', '1514166006');
INSERT INTO `hy_user_point_log` VALUES ('136', '17121211474354', '1', '22', '2', '1', '1514166010');
INSERT INTO `hy_user_point_log` VALUES ('137', '17120917454970', '1', '14', '0', '5', '1514166746');
INSERT INTO `hy_user_point_log` VALUES ('138', '17121211474354', '1', '21', '11', '1', '1514170527');
INSERT INTO `hy_user_point_log` VALUES ('139', '188', '0', '21', '9', '1', '1514173230');
INSERT INTO `hy_user_point_log` VALUES ('140', '17121211474354', '1', '22', '8', '1', '1514197375');
INSERT INTO `hy_user_point_log` VALUES ('141', '17121211474354', '1', '14', '0', '5', '1514249998');
INSERT INTO `hy_user_point_log` VALUES ('142', '17122010025893', '1', '14', '0', '5', '1514252838');
INSERT INTO `hy_user_point_log` VALUES ('143', '17121517144136', '0', '14', '0', '5', '1514252838');
INSERT INTO `hy_user_point_log` VALUES ('144', '17122010025893', '1', '35', '66', '1', '1514252892');
INSERT INTO `hy_user_point_log` VALUES ('145', '17121517350938', '1', '34', '66', '1', '1514252892');
INSERT INTO `hy_user_point_log` VALUES ('146', '17122010025893', '1', '21', '4', '1', '1514253457');
INSERT INTO `hy_user_point_log` VALUES ('147', '17122010025893', '1', '21', '10', '1', '1514253464');
INSERT INTO `hy_user_point_log` VALUES ('148', '17122010025893', '1', '21', '9', '1', '1514253487');
INSERT INTO `hy_user_point_log` VALUES ('149', '17122010025893', '1', '21', '11', '1', '1514253497');
INSERT INTO `hy_user_point_log` VALUES ('150', '17122010025893', '1', '22', '4', '1', '1514253672');
INSERT INTO `hy_user_point_log` VALUES ('151', '17122010025893', '1', '22', '7', '1', '1514253775');
INSERT INTO `hy_user_point_log` VALUES ('152', '17122010025893', '1', '22', '8', '1', '1514253781');
INSERT INTO `hy_user_point_log` VALUES ('153', '17122010025893', '1', '22', '5', '1', '1514253790');
INSERT INTO `hy_user_point_log` VALUES ('154', '17122010025893', '1', '22', '3', '1', '1514253792');
INSERT INTO `hy_user_point_log` VALUES ('155', '17122010025893', '1', '22', '2', '1', '1514253802');
INSERT INTO `hy_user_point_log` VALUES ('156', '17122010025893', '1', '22', '1', '1', '1514253808');
INSERT INTO `hy_user_point_log` VALUES ('157', '17121211474354', '1', '22', '7', '1', '1514255436');
INSERT INTO `hy_user_point_log` VALUES ('158', '17121211474354', '1', '22', '5', '1', '1514255449');
INSERT INTO `hy_user_point_log` VALUES ('159', '17121211474354', '1', '14', '0', '5', '1514336569');
INSERT INTO `hy_user_point_log` VALUES ('160', '17120917454970', '1', '14', '0', '5', '1514338710');
INSERT INTO `hy_user_point_log` VALUES ('161', '17122718493470', '3', '11', '0', '10', '1514371773');
INSERT INTO `hy_user_point_log` VALUES ('162', '17122718493470', '3', '14', '0', '5', '1514371876');
INSERT INTO `hy_user_point_log` VALUES ('163', '17122720273550', '3', '11', '0', '10', '1514377655');
INSERT INTO `hy_user_point_log` VALUES ('164', '17122720433916', '4', '11', '0', '10', '1514378619');
INSERT INTO `hy_user_point_log` VALUES ('165', '17122720433916', '4', '21', '12', '1', '1514378878');
INSERT INTO `hy_user_point_log` VALUES ('166', '17122720433916', '4', '31', '0', '5', '1514379034');
INSERT INTO `hy_user_point_log` VALUES ('167', '17122720433916', '4', '35', '69', '1', '1514379247');
INSERT INTO `hy_user_point_log` VALUES ('168', '17122720433916', '4', '34', '69', '1', '1514379247');
INSERT INTO `hy_user_point_log` VALUES ('169', '17122720433916', '4', '33', '69', '1', '1514379264');
INSERT INTO `hy_user_point_log` VALUES ('170', '0', '0', '32', '69', '2', '1514379264');
INSERT INTO `hy_user_point_log` VALUES ('171', '17122721011120', '4', '11', '0', '10', '1514379671');
INSERT INTO `hy_user_point_log` VALUES ('172', '17122721011120', '4', '21', '12', '1', '1514379700');
INSERT INTO `hy_user_point_log` VALUES ('173', '17122721011120', '4', '14', '0', '5', '1514379970');
INSERT INTO `hy_user_point_log` VALUES ('174', '17122809162726', '3', '11', '0', '10', '1514423787');
INSERT INTO `hy_user_point_log` VALUES ('175', '17122809483784', '4', '11', '0', '10', '1514425717');
INSERT INTO `hy_user_point_log` VALUES ('176', '17122809483784', '4', '21', '12', '1', '1514425832');
INSERT INTO `hy_user_point_log` VALUES ('177', '17122809483784', '4', '21', '16', '1', '1514425900');
INSERT INTO `hy_user_point_log` VALUES ('178', '17122809483784', '4', '21', '17', '1', '1514425968');
INSERT INTO `hy_user_point_log` VALUES ('179', '17122809483784', '4', '21', '18', '1', '1514425995');
INSERT INTO `hy_user_point_log` VALUES ('180', '17122809483784', '4', '35', '69', '1', '1514426646');
INSERT INTO `hy_user_point_log` VALUES ('181', '17122720433916', '4', '34', '69', '1', '1514426646');
INSERT INTO `hy_user_point_log` VALUES ('182', '17122809483784', '4', '14', '0', '5', '1514428354');
INSERT INTO `hy_user_point_log` VALUES ('183', '17122809483784', '4', '22', '14', '1', '1514431324');
INSERT INTO `hy_user_point_log` VALUES ('184', '17122809483784', '4', '22', '13', '1', '1514431339');
INSERT INTO `hy_user_point_log` VALUES ('185', '17122809483784', '4', '22', '9', '1', '1514431381');
INSERT INTO `hy_user_point_log` VALUES ('186', '17122809162726', '3', '14', '0', '5', '1514443067');
INSERT INTO `hy_user_point_log` VALUES ('187', '17122809162726', '3', '21', '14', '1', '1514443193');
INSERT INTO `hy_user_point_log` VALUES ('188', '17122720273550', '3', '14', '0', '5', '1514455463');
INSERT INTO `hy_user_point_log` VALUES ('189', '17122720273550', '3', '31', '0', '5', '1514455485');
INSERT INTO `hy_user_point_log` VALUES ('190', '17122809162726', '3', '14', '0', '5', '1514510284');
INSERT INTO `hy_user_point_log` VALUES ('191', '17122720273550', '3', '14', '0', '5', '1514510607');
INSERT INTO `hy_user_point_log` VALUES ('192', '17122720273550', '3', '31', '0', '5', '1514519090');
INSERT INTO `hy_user_point_log` VALUES ('193', '17122911492615', '6', '11', '0', '10', '1514519365');
INSERT INTO `hy_user_point_log` VALUES ('194', '17122911545083', '6', '11', '0', '10', '1514519690');
INSERT INTO `hy_user_point_log` VALUES ('195', '17122911492615', '6', '14', '0', '5', '1514520148');
INSERT INTO `hy_user_point_log` VALUES ('196', '17121211474354', '1', '14', '0', '5', '1514528253');
INSERT INTO `hy_user_point_log` VALUES ('197', '17122809483784', '4', '14', '0', '5', '1514530383');
INSERT INTO `hy_user_point_log` VALUES ('198', '17122809483784', '4', '31', '0', '5', '1514531887');
INSERT INTO `hy_user_point_log` VALUES ('199', '17122809483784', '4', '31', '0', '5', '1514531999');
INSERT INTO `hy_user_point_log` VALUES ('200', '17122809483784', '4', '31', '0', '5', '1514532125');
INSERT INTO `hy_user_point_log` VALUES ('201', '17122809483784', '4', '31', '0', '5', '1514532299');
INSERT INTO `hy_user_point_log` VALUES ('202', '17122809483784', '4', '31', '0', '5', '1514532326');
INSERT INTO `hy_user_point_log` VALUES ('203', '17122720433916', '4', '14', '0', '5', '1514534394');
INSERT INTO `hy_user_point_log` VALUES ('204', '17122809162726', '3', '22', '10', '1', '1514537349');
INSERT INTO `hy_user_point_log` VALUES ('205', '17122809162726', '3', '22', '12', '1', '1514537600');
INSERT INTO `hy_user_point_log` VALUES ('206', '17122720433916', '4', '22', '14', '1', '1514538129');
INSERT INTO `hy_user_point_log` VALUES ('207', '17122720433916', '4', '31', '0', '5', '1514538325');
INSERT INTO `hy_user_point_log` VALUES ('208', '17122809162726', '3', '21', '13', '1', '1514538376');
INSERT INTO `hy_user_point_log` VALUES ('209', '17122720433916', '4', '35', '80', '1', '1514538631');
INSERT INTO `hy_user_point_log` VALUES ('210', '17122720433916', '4', '34', '80', '1', '1514538631');
INSERT INTO `hy_user_point_log` VALUES ('211', '17122721011120', '4', '14', '0', '5', '1514539454');
INSERT INTO `hy_user_point_log` VALUES ('212', '17122721011120', '4', '31', '0', '5', '1514539691');
INSERT INTO `hy_user_point_log` VALUES ('213', '17122721011120', '4', '35', '81', '1', '1514539774');
INSERT INTO `hy_user_point_log` VALUES ('214', '17122721011120', '4', '34', '81', '1', '1514539774');
INSERT INTO `hy_user_point_log` VALUES ('215', '17122721011120', '4', '33', '81', '1', '1514539782');
INSERT INTO `hy_user_point_log` VALUES ('216', '0', '0', '32', '81', '2', '1514539782');
INSERT INTO `hy_user_point_log` VALUES ('217', '0', '0', '32', '81', '2', '1514539834');
INSERT INTO `hy_user_point_log` VALUES ('218', '17122911492615', '6', '31', '0', '5', '1514541721');
INSERT INTO `hy_user_point_log` VALUES ('219', '17120917454970', '1', '14', '0', '5', '1514543645');
INSERT INTO `hy_user_point_log` VALUES ('220', '17122919425475', '3', '11', '0', '10', '1514547774');
INSERT INTO `hy_user_point_log` VALUES ('221', '17122919425475', '3', '21', '15', '1', '1514547838');
INSERT INTO `hy_user_point_log` VALUES ('222', '17122809162726', '3', '14', '0', '5', '1514855670');
INSERT INTO `hy_user_point_log` VALUES ('223', '17122911545083', '6', '14', '0', '5', '1514855700');
INSERT INTO `hy_user_point_log` VALUES ('224', '17122911492615', '6', '14', '0', '5', '1514861572');
INSERT INTO `hy_user_point_log` VALUES ('225', '17122809483784', '4', '14', '0', '5', '1514861840');
INSERT INTO `hy_user_point_log` VALUES ('226', '17122809483784', '4', '33', '75', '1', '1514879483');
INSERT INTO `hy_user_point_log` VALUES ('227', '0', '0', '32', '75', '2', '1514879483');
INSERT INTO `hy_user_point_log` VALUES ('228', '17122809483784', '4', '31', '0', '5', '1514879798');
INSERT INTO `hy_user_point_log` VALUES ('229', '17122809483784', '4', '31', '0', '5', '1514879851');
INSERT INTO `hy_user_point_log` VALUES ('230', '17122809483784', '4', '35', '84', '1', '1514879860');
INSERT INTO `hy_user_point_log` VALUES ('231', '17122809483784', '4', '34', '84', '1', '1514879860');
INSERT INTO `hy_user_point_log` VALUES ('232', '17122809483784', '4', '35', '83', '1', '1514879863');
INSERT INTO `hy_user_point_log` VALUES ('233', '17122809483784', '4', '34', '83', '1', '1514879863');
INSERT INTO `hy_user_point_log` VALUES ('234', '17122809483784', '4', '31', '0', '5', '1514880576');
INSERT INTO `hy_user_point_log` VALUES ('235', '17122809483784', '4', '31', '0', '5', '1514880649');
INSERT INTO `hy_user_point_log` VALUES ('236', '17122809483784', '4', '35', '86', '1', '1514880671');
INSERT INTO `hy_user_point_log` VALUES ('237', '17122809483784', '4', '34', '86', '1', '1514880671');
INSERT INTO `hy_user_point_log` VALUES ('238', '17122809483784', '4', '35', '85', '1', '1514880672');
INSERT INTO `hy_user_point_log` VALUES ('239', '17122809483784', '4', '34', '85', '1', '1514880672');
INSERT INTO `hy_user_point_log` VALUES ('240', '17122809483784', '4', '31', '0', '5', '1514881275');
INSERT INTO `hy_user_point_log` VALUES ('241', '17122911492615', '6', '21', '20', '1', '1514903936');
INSERT INTO `hy_user_point_log` VALUES ('242', '17121211474354', '1', '14', '0', '5', '1514941360');
INSERT INTO `hy_user_point_log` VALUES ('243', '17122809483784', '4', '14', '0', '5', '1514943375');
INSERT INTO `hy_user_point_log` VALUES ('244', '17122809483784', '4', '31', '0', '5', '1514943434');
INSERT INTO `hy_user_point_log` VALUES ('245', '17122809483784', '4', '33', '91', '1', '1514943465');
INSERT INTO `hy_user_point_log` VALUES ('246', '0', '0', '32', '91', '2', '1514943465');
INSERT INTO `hy_user_point_log` VALUES ('247', '17122809483784', '4', '35', '91', '1', '1514943531');
INSERT INTO `hy_user_point_log` VALUES ('248', '17122809483784', '4', '34', '91', '1', '1514943531');
INSERT INTO `hy_user_point_log` VALUES ('249', '17122809483784', '4', '35', '87', '1', '1514943534');
INSERT INTO `hy_user_point_log` VALUES ('250', '17122809483784', '4', '34', '87', '1', '1514943534');
INSERT INTO `hy_user_point_log` VALUES ('251', '17122809483784', '4', '35', '90', '1', '1514943535');
INSERT INTO `hy_user_point_log` VALUES ('252', '17122809483784', '4', '34', '90', '1', '1514943535');
INSERT INTO `hy_user_point_log` VALUES ('253', '17122911492615', '6', '14', '0', '5', '1514944014');
INSERT INTO `hy_user_point_log` VALUES ('254', '17122911492615', '6', '21', '19', '1', '1514944090');
INSERT INTO `hy_user_point_log` VALUES ('255', '17122809162726', '3', '14', '0', '5', '1514944290');
INSERT INTO `hy_user_point_log` VALUES ('256', '17122809483784', '4', '31', '0', '5', '1514945358');
INSERT INTO `hy_user_point_log` VALUES ('257', '17122809483784', '4', '35', '92', '1', '1514945412');
INSERT INTO `hy_user_point_log` VALUES ('258', '17122809483784', '4', '34', '92', '1', '1514945412');
INSERT INTO `hy_user_point_log` VALUES ('259', '17122809483784', '4', '33', '92', '1', '1514946269');
INSERT INTO `hy_user_point_log` VALUES ('260', '0', '0', '32', '92', '2', '1514946269');
INSERT INTO `hy_user_point_log` VALUES ('261', '17122809483784', '4', '32', '91', '2', '1514949016');
INSERT INTO `hy_user_point_log` VALUES ('262', '18010316510393', '6', '11', '0', '10', '1514969463');
INSERT INTO `hy_user_point_log` VALUES ('263', '17121211474354', '1', '14', '0', '5', '1515030037');
INSERT INTO `hy_user_point_log` VALUES ('264', '17120917454970', '1', '14', '0', '5', '1515031523');
INSERT INTO `hy_user_point_log` VALUES ('265', '17122809483784', '4', '14', '0', '5', '1515035095');
INSERT INTO `hy_user_point_log` VALUES ('266', '17122809483784', '4', '21', '21', '1', '1515035097');
INSERT INTO `hy_user_point_log` VALUES ('267', '17122809483784', '4', '31', '0', '5', '1515035191');
INSERT INTO `hy_user_point_log` VALUES ('268', '17121211474354', '1', '31', '0', '5', '1515036755');
INSERT INTO `hy_user_point_log` VALUES ('269', '17121211474354', '1', '31', '0', '5', '1515048511');
INSERT INTO `hy_user_point_log` VALUES ('270', '18010316510393', '6', '14', '0', '5', '1515080159');
INSERT INTO `hy_user_point_log` VALUES ('271', '17120917454970', '1', '14', '0', '5', '1515113746');
INSERT INTO `hy_user_point_log` VALUES ('272', '17121211474354', '1', '14', '0', '5', '1515113864');
INSERT INTO `hy_user_point_log` VALUES ('273', '17122809483784', '4', '14', '0', '5', '1515117898');
INSERT INTO `hy_user_point_log` VALUES ('274', '17122911492615', '6', '14', '0', '5', '1515117997');
INSERT INTO `hy_user_point_log` VALUES ('275', '18010510133514', '7', '11', '0', '10', '1515118415');
INSERT INTO `hy_user_point_log` VALUES ('276', '17122720433916', '4', '14', '0', '5', '1515118884');
INSERT INTO `hy_user_point_log` VALUES ('277', '17122720433916', '4', '22', '9', '1', '1515119150');
INSERT INTO `hy_user_point_log` VALUES ('278', '17122720433916', '4', '21', '21', '1', '1515119159');
INSERT INTO `hy_user_point_log` VALUES ('279', '18010510133514', '7', '14', '0', '5', '1515119409');
INSERT INTO `hy_user_point_log` VALUES ('280', '18010510133514', '7', '31', '0', '5', '1515119528');
INSERT INTO `hy_user_point_log` VALUES ('281', '18010510133514', '7', '33', '96', '1', '1515119573');
INSERT INTO `hy_user_point_log` VALUES ('282', '18010510133514', '7', '32', '96', '2', '1515119573');
INSERT INTO `hy_user_point_log` VALUES ('283', '18010510445988', '7', '11', '0', '10', '1515120299');
INSERT INTO `hy_user_point_log` VALUES ('284', '18010510133514', '7', '22', '16', '1', '1515121714');
INSERT INTO `hy_user_point_log` VALUES ('285', '18010510133514', '7', '21', '24', '1', '1515122124');
INSERT INTO `hy_user_point_log` VALUES ('286', '17122809162726', '3', '14', '0', '5', '1515123383');
INSERT INTO `hy_user_point_log` VALUES ('287', '18010511403037', '7', '11', '0', '10', '1515123630');
INSERT INTO `hy_user_point_log` VALUES ('288', '18010511403037', '7', '14', '0', '5', '1515124107');
INSERT INTO `hy_user_point_log` VALUES ('289', '18010512031954', '7', '11', '0', '10', '1515124999');
INSERT INTO `hy_user_point_log` VALUES ('290', '18010512031954', '7', '14', '0', '5', '1515125184');
INSERT INTO `hy_user_point_log` VALUES ('291', '18010513331041', '6', '11', '0', '10', '1515130389');
INSERT INTO `hy_user_point_log` VALUES ('292', '18010513331041', '6', '14', '0', '5', '1515130398');
INSERT INTO `hy_user_point_log` VALUES ('293', '18010517374964', '7', '11', '0', '10', '1515145069');
INSERT INTO `hy_user_point_log` VALUES ('294', '18010517385642', '7', '11', '0', '10', '1515145136');
INSERT INTO `hy_user_point_log` VALUES ('295', '18010517374964', '7', '14', '0', '5', '1515145601');
INSERT INTO `hy_user_point_log` VALUES ('296', '18010517374964', '7', '35', '96', '1', '1515146098');
INSERT INTO `hy_user_point_log` VALUES ('297', '18010510133514', '7', '34', '96', '1', '1515146098');
INSERT INTO `hy_user_point_log` VALUES ('298', '18010517374964', '7', '21', '23', '1', '1515146110');
INSERT INTO `hy_user_point_log` VALUES ('299', '18010517374964', '7', '14', '0', '5', '1515373994');
INSERT INTO `hy_user_point_log` VALUES ('300', '18010517374964', '7', '22', '15', '1', '1515394821');
INSERT INTO `hy_user_point_log` VALUES ('301', '18010517374964', '7', '21', '25', '1', '1515398642');
INSERT INTO `hy_user_point_log` VALUES ('302', '17122809162726', '3', '14', '0', '5', '1515401545');
INSERT INTO `hy_user_point_log` VALUES ('303', '17122809483784', '4', '14', '0', '5', '1515414526');
INSERT INTO `hy_user_point_log` VALUES ('304', '17122809483784', '4', '14', '0', '5', '1515469613');
INSERT INTO `hy_user_point_log` VALUES ('305', '17122911492615', '6', '14', '0', '5', '1515486486');
INSERT INTO `hy_user_point_log` VALUES ('306', '18010517374964', '7', '14', '0', '5', '1515491009');
INSERT INTO `hy_user_point_log` VALUES ('307', '18010517374964', '7', '31', '0', '5', '1515491803');
INSERT INTO `hy_user_point_log` VALUES ('308', '17121211474354', '1', '14', '0', '5', '1515492109');
INSERT INTO `hy_user_point_log` VALUES ('309', '18010918094337', '7', '11', '0', '10', '1515492583');
INSERT INTO `hy_user_point_log` VALUES ('310', '18010517374964', '7', '33', '97', '1', '1515492924');
INSERT INTO `hy_user_point_log` VALUES ('311', '18010517374964', '7', '32', '97', '2', '1515492924');
INSERT INTO `hy_user_point_log` VALUES ('312', '18010918094337', '7', '14', '0', '5', '1515501853');
INSERT INTO `hy_user_point_log` VALUES ('313', '18010918094337', '7', '14', '0', '5', '1515539639');
INSERT INTO `hy_user_point_log` VALUES ('314', '18010918094337', '7', '22', '15', '1', '1515543135');
INSERT INTO `hy_user_point_log` VALUES ('315', '17122809483784', '4', '14', '0', '5', '1515543585');
INSERT INTO `hy_user_point_log` VALUES ('316', '18010517374964', '7', '14', '0', '5', '1515547826');
INSERT INTO `hy_user_point_log` VALUES ('317', '17122809162726', '3', '14', '0', '5', '1515549803');
INSERT INTO `hy_user_point_log` VALUES ('318', '17122911492615', '6', '14', '0', '5', '1515550665');
INSERT INTO `hy_user_point_log` VALUES ('319', '17122809162726', '3', '22', '11', '1', '1515556527');
INSERT INTO `hy_user_point_log` VALUES ('320', '18011012004787', '3', '11', '0', '10', '1515556847');
INSERT INTO `hy_user_point_log` VALUES ('321', '18011012004787', '3', '22', '12', '1', '1515556862');
INSERT INTO `hy_user_point_log` VALUES ('322', '18011012004787', '3', '14', '0', '5', '1515556891');
INSERT INTO `hy_user_point_log` VALUES ('323', '18010517385642', '7', '14', '0', '5', '1515557014');
INSERT INTO `hy_user_point_log` VALUES ('324', '18010918094337', '7', '21', '25', '1', '1515578011');
INSERT INTO `hy_user_point_log` VALUES ('325', '18011012004787', '3', '14', '0', '5', '1515634198');
INSERT INTO `hy_user_point_log` VALUES ('326', '18010517374964', '7', '14', '0', '5', '1515636087');
INSERT INTO `hy_user_point_log` VALUES ('327', '17122911492615', '6', '14', '0', '5', '1515641684');
INSERT INTO `hy_user_point_log` VALUES ('328', '18011112185646', '7', '11', '0', '10', '1515644335');
INSERT INTO `hy_user_point_log` VALUES ('329', '18011112185646', '7', '21', '23', '1', '1515644369');
INSERT INTO `hy_user_point_log` VALUES ('330', '18010517374964', '7', '21', '24', '1', '1515644374');
INSERT INTO `hy_user_point_log` VALUES ('331', '18010517385642', '7', '14', '0', '5', '1515664451');
INSERT INTO `hy_user_point_log` VALUES ('332', '17120917454970', '1', '14', '0', '5', '1515664481');
INSERT INTO `hy_user_point_log` VALUES ('333', '18010517374964', '7', '14', '0', '5', '1515747392');
INSERT INTO `hy_user_point_log` VALUES ('334', '18010918094337', '7', '14', '0', '5', '1515808210');
INSERT INTO `hy_user_point_log` VALUES ('335', '17122720433916', '4', '14', '0', '5', '1515817732');
INSERT INTO `hy_user_point_log` VALUES ('336', '17122809162726', '3', '14', '0', '5', '1515826357');
INSERT INTO `hy_user_point_log` VALUES ('337', '17122720433916', '4', '21', '17', '1', '1515838140');
INSERT INTO `hy_user_point_log` VALUES ('338', '18010513331041', '6', '14', '0', '5', '1515844889');
INSERT INTO `hy_user_point_log` VALUES ('339', '18010517374964', '7', '14', '0', '5', '1515844915');
INSERT INTO `hy_user_point_log` VALUES ('340', '18010517385642', '7', '14', '0', '5', '1515905517');
INSERT INTO `hy_user_point_log` VALUES ('341', '18010517374964', '7', '14', '0', '5', '1515936208');
INSERT INTO `hy_user_point_log` VALUES ('342', '17122911492615', '6', '14', '0', '5', '1515976199');
INSERT INTO `hy_user_point_log` VALUES ('343', '18011512065371', '7', '11', '0', '10', '1515989213');
INSERT INTO `hy_user_point_log` VALUES ('344', '18011512065371', '7', '22', '15', '1', '1515989275');
INSERT INTO `hy_user_point_log` VALUES ('345', '18011512065371', '7', '14', '0', '5', '1515990279');
INSERT INTO `hy_user_point_log` VALUES ('346', '17122809162726', '3', '14', '0', '5', '1515992181');
INSERT INTO `hy_user_point_log` VALUES ('347', '18010918094337', '7', '14', '0', '5', '1516004873');
INSERT INTO `hy_user_point_log` VALUES ('348', '17122911545083', '6', '14', '0', '5', '1516006029');
INSERT INTO `hy_user_point_log` VALUES ('349', '17122720433916', '4', '14', '0', '5', '1516011000');
INSERT INTO `hy_user_point_log` VALUES ('350', '18011520114242', '6', '11', '0', '10', '1516018376');
INSERT INTO `hy_user_point_log` VALUES ('351', '18011520163175', '4', '11', '0', '10', '1516018642');
INSERT INTO `hy_user_point_log` VALUES ('352', '18011520163175', '4', '14', '0', '5', '1516018655');
INSERT INTO `hy_user_point_log` VALUES ('353', '18011520114242', '6', '21', '20', '1', '1516022114');
INSERT INTO `hy_user_point_log` VALUES ('354', '18011520163175', '4', '14', '0', '5', '1516064834');
INSERT INTO `hy_user_point_log` VALUES ('355', '18011609462427', '7', '11', '0', '10', '1516067262');
INSERT INTO `hy_user_point_log` VALUES ('356', '18011520114242', '6', '14', '0', '5', '1516068616');
INSERT INTO `hy_user_point_log` VALUES ('357', '18011609462427', '7', '14', '0', '5', '1516068765');
INSERT INTO `hy_user_point_log` VALUES ('358', '18011612102278', '4', '11', '0', '10', '1516075891');
INSERT INTO `hy_user_point_log` VALUES ('359', '1801161721329740', '7', '11', '0', '10', '1516094521');
INSERT INTO `hy_user_point_log` VALUES ('360', '1801161721329740', '7', '14', '0', '5', '1516094555');
INSERT INTO `hy_user_point_log` VALUES ('361', '1801161728081780', '4', '11', '0', '10', '1516094903');
INSERT INTO `hy_user_point_log` VALUES ('362', '1801161810285112', '7', '11', '0', '10', '1516097840');
INSERT INTO `hy_user_point_log` VALUES ('363', '1801161810285112', '7', '14', '0', '5', '1516098304');
INSERT INTO `hy_user_point_log` VALUES ('364', '1801171806056671', '3', '27', '13', '1', '1516766113');

-- ----------------------------
-- Table structure for hy_user_session
-- ----------------------------
DROP TABLE IF EXISTS `hy_user_session`;
CREATE TABLE `hy_user_session` (
  `sesskey` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `expiry` int(11) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `branch_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '支部ID',
  `region_code` bigint(20) NOT NULL,
  UNIQUE KEY `sesskey` (`sesskey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of hy_user_session
-- ----------------------------
INSERT INTO `hy_user_session` VALUES ('166765a61aa5641d9e152ab7703c6f86ce9320adba23025787554558289', '1516954838', '1801161728081780', '4', '130302');
INSERT INTO `hy_user_session` VALUES ('166765a61ab56b5b25313269b770a90de0cb1caef8e1614d5ba99520864', '1516955094', '1801161721329740', '7', '430527');
INSERT INTO `hy_user_session` VALUES ('273235a618fc5c8e494f21eb0e4fb3cf2cc517704d62d14afbc73393399', '1516948037', '1801191145497962', '7', '0');
INSERT INTO `hy_user_session` VALUES ('436985a5fe026e7191353f8d0464c4ee5737ba408c95cf1b3b590661499', '1516837542', '1801161357353693', '4', '0');
INSERT INTO `hy_user_session` VALUES ('446015a5dd722a67e167cff9fcfde9f6561dc6a8067120d33f457245179', '1516704162', '1801161810285112', '7', '0');
INSERT INTO `hy_user_session` VALUES ('571405a5df5297e5af2b06a732e9ebad0fb5c61e193cdcf33b845986390', '1516711849', '18011612102278', '4', '0');
INSERT INTO `hy_user_session` VALUES ('602455a619ed655ccd2c2b5b59f809462ed548f371646d7cbe143661478', '1516951894', '1801171806056671', '3', '130304');
INSERT INTO `hy_user_session` VALUES ('661115a5f155e711bf56adc42b4a7476a0d0129026169f0dad671519311', '1516785630', '1801161217239537', '4', '0');
INSERT INTO `hy_user_session` VALUES ('706225a6169809765a63383ac997444fbb978668f4032add85d06365679', '1516938240', '1801191139053661', '7', '1');
INSERT INTO `hy_user_session` VALUES ('727505a5c839694ed25c31bae92c67c3134304a20d04a90565240863550', '1516617238', '17122720433916', '4', '0');
INSERT INTO `hy_user_session` VALUES ('750595a5f3a22c82709c83f4a10404d314000702cd7581ab38007924436', '1516795042', '1801171811127505', '7', '0');
INSERT INTO `hy_user_session` VALUES ('800895a5c98b91997f06301bbf984e6c99f48b4d21857ad775323283252', '1516622648', '17122911492615', '6', '0');
INSERT INTO `hy_user_session` VALUES ('807605a5de2e5ceff05c8ea00c7420dad02d255132d0e5593b791340053', '1516707173', '18011520163175', '4', '0');
INSERT INTO `hy_user_session` VALUES ('821605a5e032e52f436a439a4ebd4cee26f84f959e49568c2d707848170', '1516715438', '18011520114242', '6', '0');
INSERT INTO `hy_user_session` VALUES ('849925a5fec57f2b211bf573a12a83c359a82864b7d75e7fd6749471109', '1516840663', '1801162001235191', '7', '1');
INSERT INTO `hy_user_session` VALUES ('891585a5c6bc8d311b901fed26a1da69d807aea56bf0ef4e97160974711', '1516611144', '17122911545083', '6', '0');
INSERT INTO `hy_user_session` VALUES ('950305a5dc3f9095c06b5f5ad21c72e91836cfc70028ad5e11b16309767', '1516699256', '18011609462427', '7', '0');
INSERT INTO `hy_user_session` VALUES ('955845a5c6609cd5641494b0a6bf8db96d7d4156ee1b29df50219323496', '1516609673', '18010918094337', '7', '0');

-- ----------------------------
-- Table structure for hy_user_study
-- ----------------------------
DROP TABLE IF EXISTS `hy_user_study`;
CREATE TABLE `hy_user_study` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '学习ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '学习状态 默认0=正在学习 1=学习完成',
  `type` int(10) NOT NULL COMMENT '内容类型:101=两学一做 102=党建专题 103=视频 104=音频 105=电子书 106=读书 107=评测 108=相册',
  `content_id` int(20) NOT NULL COMMENT '学习内容ID',
  `read_think` varchar(255) NOT NULL COMMENT '读后感',
  `node` varchar(255) NOT NULL COMMENT '读取进度',
  `start_time` int(11) NOT NULL COMMENT '学习开始时间',
  `over_time` int(11) NOT NULL COMMENT '学习结束时间',
  `option_id` int(11) NOT NULL DEFAULT '0' COMMENT '任务ID 默认0=无任务',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hy_user_study
-- ----------------------------
INSERT INTO `hy_user_study` VALUES ('3', '0', '0', '101', '123', '', '', '1516607604', '0', '0');
INSERT INTO `hy_user_study` VALUES ('2', '0', '0', '101', '123', '', '', '1516607238', '0', '0');
INSERT INTO `hy_user_study` VALUES ('4', '123', '1', '101', '41', '', '', '1516607667', '1516608682', '0');
INSERT INTO `hy_user_study` VALUES ('5', '123', '1', '102', '42', '哈哈哈哈哈哈', '', '1516608728', '1516608830', '0');
INSERT INTO `hy_user_study` VALUES ('6', '123', '1', '102', '43', '哈哈哈哈哈哈', '', '1516609201', '1516609234', '0');
INSERT INTO `hy_user_study` VALUES ('7', '123', '0', '102', '44', '', '5555', '1516609240', '0', '0');
INSERT INTO `hy_user_study` VALUES ('8', '0', '0', '101', '123', '', '', '1516616431', '0', '0');
INSERT INTO `hy_user_study` VALUES ('9', '1801171806056671', '0', '105', '8', '', '1000100010002', '1516616431', '0', '8');

-- ----------------------------
-- Table structure for hy_video
-- ----------------------------
DROP TABLE IF EXISTS `hy_video`;
CREATE TABLE `hy_video` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `desc` varchar(500) NOT NULL DEFAULT '' COMMENT '简介',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '分类',
  `detail` text NOT NULL COMMENT '详细',
  `video_id` varchar(50) NOT NULL DEFAULT '' COMMENT '视频点播ID',
  `sort` int(11) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `image` varchar(200) NOT NULL DEFAULT '' COMMENT '图片',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态：1-显示，2-隐藏',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `ref_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '关联官方文章ID',
  `read_num` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '阅读次数',
  `collect_num` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `forward_num` mediumint(8) NOT NULL DEFAULT '0' COMMENT '收藏数量',
  `branch_id` int(11) NOT NULL COMMENT '支部ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='视频';

-- ----------------------------
-- Records of hy_video
-- ----------------------------
INSERT INTO `hy_video` VALUES ('13', '视频1', '哈哈', '101', '&lt;p&gt;视频1&lt;/p&gt;', '076f48ec2a124ed6ab6008958922ba65', '1', '', '1', '0', '1515652760', '0', '0', '0', '0', '1');
INSERT INTO `hy_video` VALUES ('14', 'sp1', 'sp1', '101', '&lt;p&gt;hahahaha&amp;nbsp;&lt;/p&gt;', '0711b9e6b8ab44cbb2e34d90cb3b2b5f', '1', 'http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/editor/1/20e6a229367f002999cfb55c660606b3.jpg', '1', '0', '1515652878', '0', '0', '0', '0', '1');
INSERT INTO `hy_video` VALUES ('15', '', '', '101', '', '', '100', '', '1', '0', '1515653361', '7', '0', '0', '0', '1');
INSERT INTO `hy_video` VALUES ('16', '', '', '101', '', '', '100', '', '1', '0', '1515653366', '6', '0', '0', '0', '1');
INSERT INTO `hy_video` VALUES ('17', '', '', '101', '', '', '100', '', '1', '0', '1515653481', '4', '0', '0', '0', '1');
INSERT INTO `hy_video` VALUES ('18', '视频1', '视频1test', '99', '&lt;p&gt;视频测试&lt;/p&gt;', '3acfc70b43bb42f4b6f506abd33cdece', '110', 'http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/editor5514cb9d9e49f22418815a5dba1b17d7.jpg', '1', '0', '1515655263', '0', '0', '0', '0', '4');
INSERT INTO `hy_video` VALUES ('19', '视频1', '视频1test', '99', '&lt;p&gt;视频测试&lt;/p&gt;', '3acfc70b43bb42f4b6f506abd33cdece', '1', 'http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/editord1935bbb3ef73c49f1938b99665071e2.jpg', '1', '0', '1515655270', '0', '0', '0', '0', '4');
INSERT INTO `hy_video` VALUES ('20', '1', '3', '99', '&lt;p&gt;4&lt;/p&gt;', 'dd2c5e68320e425b8ed35fe0f334cc8d', '2', '', '2', '0', '1515664087', '0', '0', '0', '0', '4');
INSERT INTO `hy_video` VALUES ('21', '1', '3', '119', '&lt;p&gt;4&lt;/p&gt;', '986f6167fa3e44ecafb654d27c456736', '2', 'http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/editor38a3732a6b947d1883ecf4208401ba3b.jpg', '1', '0', '1515664186', '0', '0', '0', '0', '4');
INSERT INTO `hy_video` VALUES ('22', '第一章', '', '101', '&lt;p&gt;第一章详情&lt;/p&gt;', '1c98f569c90b4c84a770de1851341929', '0', 'http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/editor/6/4c02b37af710fc6c6541332ebc73e11e.jpg', '1', '0', '1516088795', '0', '0', '0', '0', '6');
INSERT INTO `hy_video` VALUES ('23', '《意见》', '2017年5月23日施行', '101', '&lt;p&gt;&lt;span style=&quot;color: rgb(34, 34, 34); font-family: &amp;#39;Helvetica Neue&amp;#39;, Helvetica, Arial, sans-serif; font-size: 13px; line-height: 18.5714px; background-color: rgb(255, 255, 255);&quot;&gt;中办印发《意见》进一步加强党委联系服务专家工作&lt;/span&gt;&lt;/p&gt;', '4d77c5cd3e1c4cc2ab56d12909a9984c', '100', 'http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/editor/9980e203e980fa5eeaaff916df45348d.png', '1', '0', '0', '1', '0', '0', '0', '6');
INSERT INTO `hy_video` VALUES ('24', '《意见》', '2017年5月23日施行', '99', '&lt;p&gt;&lt;span style=&quot;color: rgb(34, 34, 34); font-family: &amp;#39;Helvetica Neue&amp;#39;, Helvetica, Arial, sans-serif; font-size: 13px; line-height: 18.5714px; background-color: rgb(255, 255, 255);&quot;&gt;中办印发《意见》进一步加强党委联系服务专家工作&lt;/span&gt;&lt;/p&gt;', '4d77c5cd3e1c4cc2ab56d12909a9984c', '100', 'http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/editor/9980e203e980fa5eeaaff916df45348d.png', '2', '0', '0', '1', '0', '0', '0', '4');
INSERT INTO `hy_video` VALUES ('25', '《意见》', '2017年5月23日施行', '138', '&lt;p&gt;&lt;span style=&quot;color: rgb(34, 34, 34); font-family: &amp;#39;Helvetica Neue&amp;#39;, Helvetica, Arial, sans-serif; font-size: 13px; line-height: 18.5714px; background-color: rgb(255, 255, 255);&quot;&gt;中办印发《意见》进一步加强党委联系服务专家工作&lt;/span&gt;&lt;/p&gt;', '4d77c5cd3e1c4cc2ab56d12909a9984c', '100', 'http://huiyi-xcx.oss-cn-beijing.aliyuncs.com/editor/9980e203e980fa5eeaaff916df45348d.png', '1', '0', '0', '1', '0', '0', '0', '3');
