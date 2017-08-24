/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50537
Source Host           : 127.0.0.1:3306
Source Database       : cbdcarsystem

Target Server Type    : MYSQL
Target Server Version : 50537
File Encoding         : 65001

Date: 2017-08-24 10:00:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for c3p0testtable
-- ----------------------------
DROP TABLE IF EXISTS `c3p0testtable`;
CREATE TABLE `c3p0testtable` (
  `a` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c3p0testtable
-- ----------------------------

-- ----------------------------
-- Table structure for manager_power
-- ----------------------------
DROP TABLE IF EXISTS `manager_power`;
CREATE TABLE `manager_power` (
  `manager_power` int(11) NOT NULL AUTO_INCREMENT,
  `manager_id` int(11) DEFAULT NULL,
  `power_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`manager_power`),
  KEY `FK_Reference_6` (`manager_id`),
  KEY `FK_Reference_7` (`power_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager_power
-- ----------------------------
INSERT INTO `manager_power` VALUES ('1', '1', '1');
INSERT INTO `manager_power` VALUES ('10', '2', '3');
INSERT INTO `manager_power` VALUES ('11', '2', '1');
INSERT INTO `manager_power` VALUES ('14', '0', '2');
INSERT INTO `manager_power` VALUES ('15', '0', '1');
INSERT INTO `manager_power` VALUES ('16', '0', '3');
INSERT INTO `manager_power` VALUES ('17', '0', '4');
INSERT INTO `manager_power` VALUES ('20', '3', '4');
INSERT INTO `manager_power` VALUES ('22', '0', '3');
INSERT INTO `manager_power` VALUES ('23', '0', '1');
INSERT INTO `manager_power` VALUES ('24', '11', '1');
INSERT INTO `manager_power` VALUES ('25', '11', '2');
INSERT INTO `manager_power` VALUES ('26', '11', '3');
INSERT INTO `manager_power` VALUES ('27', '11', '4');
INSERT INTO `manager_power` VALUES ('28', '11', '5');
INSERT INTO `manager_power` VALUES ('29', '3', '2');
INSERT INTO `manager_power` VALUES ('30', '0', '4');
INSERT INTO `manager_power` VALUES ('31', '12', '4');
INSERT INTO `manager_power` VALUES ('32', '0', '2');
INSERT INTO `manager_power` VALUES ('33', '0', '4');
INSERT INTO `manager_power` VALUES ('34', '13', '2');
INSERT INTO `manager_power` VALUES ('35', '13', '4');

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_account` varchar(20) DEFAULT NULL,
  `admin_pwd` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------

-- ----------------------------
-- Table structure for t_complaint
-- ----------------------------
DROP TABLE IF EXISTS `t_complaint`;
CREATE TABLE `t_complaint` (
  `complaint_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `t_u_user_id` int(11) DEFAULT NULL,
  `deal_id` int(11) DEFAULT NULL,
  `complaint_date` datetime DEFAULT NULL,
  `complaint_content` varchar(50) DEFAULT NULL,
  `complaint_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`complaint_id`),
  KEY `FK_Reference_4` (`user_id`),
  KEY `FK_Reference_5` (`t_u_user_id`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`t_u_user_id`) REFERENCES `t_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_complaint
-- ----------------------------
INSERT INTO `t_complaint` VALUES ('4', '3', '8', '9', '2017-08-23 19:25:55', '傻逼杂种啊啊啊', '2');

-- ----------------------------
-- Table structure for t_contract
-- ----------------------------
DROP TABLE IF EXISTS `t_contract`;
CREATE TABLE `t_contract` (
  `contract_id` int(11) NOT NULL AUTO_INCREMENT,
  `oldcontract_id` int(11) DEFAULT NULL,
  `contract_Name` varchar(20) DEFAULT NULL,
  `enterprise_id` int(11) DEFAULT NULL,
  `contract_startDate` datetime DEFAULT NULL,
  `contract_endDate` datetime DEFAULT NULL,
  `contract_picture` varchar(50) DEFAULT NULL,
  `contract_type` int(11) DEFAULT NULL,
  KEY `AK_Key_1` (`contract_id`),
  KEY `FK_Reference_8` (`enterprise_id`),
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`enterprise_id`) REFERENCES `t_enterprise` (`enterprise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_contract
-- ----------------------------
INSERT INTO `t_contract` VALUES ('1', '1', '随便', '3', '2017-08-02 17:22:05', '2017-08-02 17:22:11', '222222', '1');

-- ----------------------------
-- Table structure for t_deal
-- ----------------------------
DROP TABLE IF EXISTS `t_deal`;
CREATE TABLE `t_deal` (
  `deal_id` int(11) NOT NULL AUTO_INCREMENT,
  `rent_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `deal_price` decimal(7,2) DEFAULT NULL,
  `deal_type` int(255) DEFAULT NULL,
  PRIMARY KEY (`deal_id`),
  KEY `FK_Reference_2` (`user_id`),
  KEY `FK_Reference_3` (`rent_id`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`rent_id`) REFERENCES `t_rent` (`rent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_deal
-- ----------------------------
INSERT INTO `t_deal` VALUES ('9', '9', '3', '2017-08-01 00:00:00', '2018-08-02 00:00:00', '200.00', '1');

-- ----------------------------
-- Table structure for t_enterprise
-- ----------------------------
DROP TABLE IF EXISTS `t_enterprise`;
CREATE TABLE `t_enterprise` (
  `enterprise_id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_account` varchar(20) DEFAULT NULL,
  `enterprise_pwd` varchar(50) DEFAULT NULL,
  `enterprise_name` varchar(20) DEFAULT NULL,
  `enterprise_address` varchar(20) DEFAULT NULL,
  `enterprise_contact` varchar(10) DEFAULT NULL,
  `enterprise_phone` varchar(20) DEFAULT NULL,
  `enterprise_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`enterprise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_enterprise
-- ----------------------------
INSERT INTO `t_enterprise` VALUES ('2', '10001aa', '11111111', '腾讯', '深圳', '张天航', '13566778899', '0');
INSERT INTO `t_enterprise` VALUES ('3', '10002aa', 'f5bb0c8de146c67b44babbf4e6584cc0', '阿里巴巴', '浙江', '章丧偶', '13566778899', '1');
INSERT INTO `t_enterprise` VALUES ('13', '10003', '111111', '华为', '深圳', '张天航1', '13566778899', '1');
INSERT INTO `t_enterprise` VALUES ('14', '10004', '11111', '小米', '广州', '张天航', '13566778899', '1');
INSERT INTO `t_enterprise` VALUES ('15', '10005', '111111', '苹果', '美国', '六沟', '16666666666', '1');
INSERT INTO `t_enterprise` VALUES ('16', '10006', '111111', '努比亚', '广州', '气狗', '11111111111', '1');
INSERT INTO `t_enterprise` VALUES ('17', 'a123123', '123123123', '小苹果', '梁平', '唐二狗', '13555555555', '2');
INSERT INTO `t_enterprise` VALUES ('18', 'qqqqqq', '343b1c4a3ea721b2d640fc8700db0f36', '朗沃', 'æ¦å¡å¯è½', '哈哈哈哈大大', '13800000000', '2');
INSERT INTO `t_enterprise` VALUES ('19', 'wwwwww', 'd785c99d298a4e9e6e13fe99e602ef42', '猜猜', '擦卡可能', '哈哈哈哈大大', '13800000000', '0');

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_name` varchar(20) DEFAULT NULL,
  `log_date` datetime DEFAULT NULL,
  `log_event` varchar(100) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `log_level` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES ('1', '用户注销记录', '2017-08-21 13:35:36', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,退出了系统', '用户:冯伟', '注销日志');
INSERT INTO `t_log` VALUES ('2', '用户注销记录', '2017-08-21 14:59:51', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,退出了系统', '用户:冯伟', '注销日志');
INSERT INTO `t_log` VALUES ('3', '用户注销记录', '2017-08-21 15:06:58', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,退出了系统', '用户:冯伟', '注销日志');
INSERT INTO `t_log` VALUES ('4', '用户登陆记录', '2017-08-21 15:27:53', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('5', '注册或添加记录', '2017-08-21 15:28:09', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,调用了方法addComplaint上传了数据', '用户:冯伟', '添加日志');
INSERT INTO `t_log` VALUES ('6', '注册或添加记录', '2017-08-21 15:48:14', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,调用了方法addComplaint上传了数据', '用户:冯伟', '添加日志');
INSERT INTO `t_log` VALUES ('7', '用户注销记录', '2017-08-21 15:54:53', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,退出了系统', '用户:冯伟', '注销日志');
INSERT INTO `t_log` VALUES ('8', '注册或添加记录', '2017-08-21 16:36:02', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,调用了方法addComplaint上传了数据', '用户:冯伟', '添加日志');
INSERT INTO `t_log` VALUES ('9', '用户登陆记录', '2017-08-22 15:40:28', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('10', '用户登陆记录', '2017-08-22 16:20:51', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('11', '用户登陆记录', '2017-08-22 16:38:03', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('12', '用户登陆记录', '2017-08-22 16:47:58', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('13', '用户登陆记录', '2017-08-22 17:10:46', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('14', '用户登陆记录', '2017-08-22 22:13:09', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('15', '用户登陆记录', '2017-08-23 08:43:20', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('16', '用户登陆记录', '2017-08-23 08:45:21', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('17', '用户登陆记录', '2017-08-23 08:46:56', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('18', '用户登陆记录', '2017-08-23 08:55:58', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('19', '用户登陆记录', '2017-08-23 08:58:15', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('20', '用户登陆记录', '2017-08-23 08:59:22', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('21', '用户登陆记录', '2017-08-23 09:00:52', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('22', '用户登陆记录', '2017-08-23 09:08:28', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('23', '用户登陆记录', '2017-08-23 09:11:03', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('24', '用户登陆记录', '2017-08-23 10:10:20', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('25', '用户登陆记录', '2017-08-23 10:10:48', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('26', '用户登陆记录', '2017-08-23 10:12:07', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('27', '用户登陆记录', '2017-08-23 10:19:18', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('28', '用户登陆记录', '2017-08-23 10:23:25', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('29', '用户登陆记录', '2017-08-23 10:25:27', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('30', '用户登陆记录', '2017-08-23 10:26:49', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('31', '用户登陆记录', '2017-08-23 10:28:18', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('32', '用户登陆记录', '2017-08-23 10:30:03', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('33', '用户登陆记录', '2017-08-23 10:33:36', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('34', '用户登陆记录', '2017-08-23 10:36:34', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('35', '用户登陆记录', '2017-08-23 10:39:07', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('36', '用户登陆记录', '2017-08-23 10:42:48', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('37', '用户登陆记录', '2017-08-23 10:44:39', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('38', '用户登陆记录', '2017-08-23 11:17:52', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('39', '用户注销记录', '2017-08-23 11:18:24', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,退出了系统', '用户:冯伟', '注销日志');
INSERT INTO `t_log` VALUES ('40', '用户登陆记录', '2017-08-23 11:22:43', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('41', '用户登陆记录', '2017-08-23 11:25:38', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('42', '用户注销记录', '2017-08-23 11:48:24', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,退出了系统', '用户:冯伟', '注销日志');
INSERT INTO `t_log` VALUES ('43', '用户登陆记录', '2017-08-23 11:48:49', 'id为:4的用户:fengwei,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:小陈', '登录日志');
INSERT INTO `t_log` VALUES ('44', '用户注销记录', '2017-08-23 11:50:04', 'id为:4的用户:fengwei,在ip地址:0:0:0:0:0:0:0:1,退出了系统', '用户:小陈', '注销日志');
INSERT INTO `t_log` VALUES ('45', '用户登陆记录', '2017-08-23 11:50:18', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('46', '用户登陆记录', '2017-08-23 13:02:49', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('47', '用户登陆记录', '2017-08-23 13:10:11', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('48', '用户注销记录', '2017-08-23 13:14:00', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,退出了系统', '用户:冯伟', '注销日志');
INSERT INTO `t_log` VALUES ('49', '用户登陆记录', '2017-08-23 13:14:15', 'id为:4的用户:fengwei,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:小陈', '登录日志');
INSERT INTO `t_log` VALUES ('50', '用户注销记录', '2017-08-23 13:16:10', 'id为:4的用户:fengwei,在ip地址:0:0:0:0:0:0:0:1,退出了系统', '用户:小陈', '注销日志');
INSERT INTO `t_log` VALUES ('51', '用户登陆记录', '2017-08-23 13:16:25', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('52', '用户登陆记录', '2017-08-23 13:22:24', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('53', '用户登陆记录', '2017-08-23 13:29:58', 'id为:4的用户:fengwei,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:小陈', '登录日志');
INSERT INTO `t_log` VALUES ('54', '用户登陆记录', '2017-08-23 13:36:52', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('55', '用户登陆记录', '2017-08-23 13:38:04', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('56', '用户注销记录', '2017-08-23 13:43:52', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,退出了系统', '用户:冯伟', '注销日志');
INSERT INTO `t_log` VALUES ('57', '注册或添加记录', '2017-08-23 13:44:34', 'id为:8的用户:testman,在ip地址:null,调用了方法registUser上传了数据', '用户:测试人员', '添加日志');
INSERT INTO `t_log` VALUES ('58', '用户登陆记录', '2017-08-23 14:00:35', 'id为:8的用户:testman,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:测试人员', '登录日志');
INSERT INTO `t_log` VALUES ('59', '注册或添加记录', '2017-08-23 14:06:44', 'id为:8的用户:testman,在ip地址:0:0:0:0:0:0:0:1,调用了方法addRent上传了数据', '用户:测试人员', '添加日志');
INSERT INTO `t_log` VALUES ('60', '注册或添加记录', '2017-08-23 14:07:53', 'id为:8的用户:testman,在ip地址:0:0:0:0:0:0:0:1,调用了方法addRent上传了数据', '用户:测试人员', '添加日志');
INSERT INTO `t_log` VALUES ('61', '用户登陆记录', '2017-08-23 14:12:48', 'id为:8的用户:testman,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:测试人员', '登录日志');
INSERT INTO `t_log` VALUES ('62', '用户注销记录', '2017-08-23 14:16:41', 'id为:8的用户:testman,在ip地址:0:0:0:0:0:0:0:1,退出了系统', '用户:测试人员', '注销日志');
INSERT INTO `t_log` VALUES ('63', '用户登陆记录', '2017-08-23 14:16:56', 'id为:4的用户:fengwei,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:小陈', '登录日志');
INSERT INTO `t_log` VALUES ('64', '用户注销记录', '2017-08-23 14:20:44', 'id为:4的用户:fengwei,在ip地址:0:0:0:0:0:0:0:1,退出了系统', '用户:小陈', '注销日志');
INSERT INTO `t_log` VALUES ('65', '用户登陆记录', '2017-08-23 14:21:02', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('66', '用户登陆记录', '2017-08-23 14:37:52', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('67', '用户登陆记录', '2017-08-23 14:42:58', 'id为:8的用户:testman,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:测试人员', '登录日志');
INSERT INTO `t_log` VALUES ('68', '注册或添加记录', '2017-08-23 14:44:25', 'id为:8的用户:testman,在ip地址:0:0:0:0:0:0:0:1,调用了方法addWant上传了数据', '用户:测试人员', '添加日志');
INSERT INTO `t_log` VALUES ('69', '用户注销记录', '2017-08-23 14:44:30', 'id为:8的用户:testman,在ip地址:0:0:0:0:0:0:0:1,退出了系统', '用户:测试人员', '注销日志');
INSERT INTO `t_log` VALUES ('70', '用户登陆记录', '2017-08-23 14:44:47', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('71', '用户登陆记录', '2017-08-23 14:47:32', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:冯伟', '登录日志');
INSERT INTO `t_log` VALUES ('72', '用户登陆记录', '2017-08-23 15:43:08', 'id为:3的用户:10002aa,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:阿里巴巴', '登录日志');
INSERT INTO `t_log` VALUES ('73', '用户登陆记录', '2017-08-23 15:46:38', 'id为:3的用户:10002aa,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:阿里巴巴', '登录日志');
INSERT INTO `t_log` VALUES ('74', '用户登陆记录', '2017-08-23 15:47:46', 'id为:3的用户:10002aa,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:阿里巴巴', '登录日志');
INSERT INTO `t_log` VALUES ('75', '用户登陆记录', '2017-08-23 15:49:21', 'id为:3的用户:10002aa,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:阿里巴巴', '登录日志');
INSERT INTO `t_log` VALUES ('76', '用户登陆记录', '2017-08-23 15:53:32', 'id为:3的用户:10002aa,在ip地址:0:0:0:0:0:0:0:1,登录了系统', '用户:阿里巴巴', '登录日志');
INSERT INTO `t_log` VALUES ('77', '注册或添加记录', '2017-08-23 16:12:56', 'id为:8的用户:testman,在ip地址:0:0:0:0:0:0:0:1,调用了方法addRent上传了数据', '用户:测试人员', '添加日志');
INSERT INTO `t_log` VALUES ('78', '数据删除记录', '2017-08-23 16:41:42', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,调用了方法deleteMyRent删除了数据', '用户:冯伟', '删除日志');
INSERT INTO `t_log` VALUES ('79', '数据删除记录', '2017-08-23 16:41:45', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,调用了方法deleteMyRent删除了数据', '用户:冯伟', '删除日志');
INSERT INTO `t_log` VALUES ('80', '数据删除记录', '2017-08-23 16:41:48', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,调用了方法deleteMyRent删除了数据', '用户:冯伟', '删除日志');
INSERT INTO `t_log` VALUES ('81', '数据删除记录', '2017-08-23 16:41:58', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,调用了方法deleteMyRent删除了数据', '用户:冯伟', '删除日志');
INSERT INTO `t_log` VALUES ('82', '数据删除记录', '2017-08-23 16:42:02', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,调用了方法deleteMyRent删除了数据', '用户:冯伟', '删除日志');
INSERT INTO `t_log` VALUES ('83', '数据删除记录', '2017-08-23 16:42:06', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,调用了方法deleteMyRent删除了数据', '用户:冯伟', '删除日志');
INSERT INTO `t_log` VALUES ('84', '数据删除记录', '2017-08-23 16:42:09', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,调用了方法deleteMyRent删除了数据', '用户:冯伟', '删除日志');
INSERT INTO `t_log` VALUES ('85', '数据删除记录', '2017-08-23 16:42:13', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,调用了方法deleteMyRent删除了数据', '用户:冯伟', '删除日志');
INSERT INTO `t_log` VALUES ('86', '数据删除记录', '2017-08-23 16:42:16', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,调用了方法deleteMyRent删除了数据', '用户:冯伟', '删除日志');
INSERT INTO `t_log` VALUES ('87', '数据删除记录', '2017-08-23 16:42:19', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,调用了方法deleteMyRent删除了数据', '用户:冯伟', '删除日志');
INSERT INTO `t_log` VALUES ('88', '数据删除记录', '2017-08-23 16:42:22', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,调用了方法deleteMyRent删除了数据', '用户:冯伟', '删除日志');
INSERT INTO `t_log` VALUES ('89', '数据删除记录', '2017-08-23 16:42:26', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,调用了方法deleteMyRent删除了数据', '用户:冯伟', '删除日志');
INSERT INTO `t_log` VALUES ('90', '数据修改记录', '2017-08-23 19:09:09', 'id为:8的用户:testman,在ip地址:0:0:0:0:0:0:0:1,调用了方法updataMyRent修改了数据', '用户:测试人员', '修改日志');
INSERT INTO `t_log` VALUES ('91', '数据修改记录', '2017-08-23 19:09:26', 'id为:8的用户:testman,在ip地址:0:0:0:0:0:0:0:1,调用了方法updataMyRent修改了数据', '用户:测试人员', '修改日志');
INSERT INTO `t_log` VALUES ('92', '数据修改记录', '2017-08-23 19:09:38', 'id为:8的用户:testman,在ip地址:0:0:0:0:0:0:0:1,调用了方法updataMyRent修改了数据', '用户:测试人员', '修改日志');
INSERT INTO `t_log` VALUES ('93', '注册或添加记录', '2017-08-23 19:10:34', 'id为:8的用户:testman,在ip地址:0:0:0:0:0:0:0:1,调用了方法addRent上传了数据', '用户:测试人员', '添加日志');
INSERT INTO `t_log` VALUES ('94', '注册或添加记录', '2017-08-23 19:15:35', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,调用了方法addWant上传了数据', '用户:冯伟', '添加日志');
INSERT INTO `t_log` VALUES ('95', '注册或添加记录', '2017-08-23 19:24:20', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,调用了方法addDealInfo上传了数据', '用户:冯伟', '添加日志');
INSERT INTO `t_log` VALUES ('96', '注册或添加记录', '2017-08-23 19:25:55', 'id为:3的用户:fengwei123,在ip地址:0:0:0:0:0:0:0:1,调用了方法addComplaint上传了数据', '用户:冯伟', '添加日志');

-- ----------------------------
-- Table structure for t_manager
-- ----------------------------
DROP TABLE IF EXISTS `t_manager`;
CREATE TABLE `t_manager` (
  `manager_id` int(11) NOT NULL AUTO_INCREMENT,
  `manager_account` varchar(20) DEFAULT NULL,
  `manager_pwd` varchar(50) DEFAULT NULL,
  `manager_name` varchar(10) DEFAULT NULL,
  `manager_phone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_manager
-- ----------------------------
INSERT INTO `t_manager` VALUES ('1', 'admin1', '123456', 'admin', '13566996658');
INSERT INTO `t_manager` VALUES ('2', 'admin2', '123456', 'admin1', '13566996658');
INSERT INTO `t_manager` VALUES ('3', 'admin3', '123456', 'admin2', '13566996658');
INSERT INTO `t_manager` VALUES ('11', '6666', 'f379eaf3c831b04de153469d1bec345e', '呵呵呵', '13599899969');
INSERT INTO `t_manager` VALUES ('12', '1122', '96e79218965eb72c92a549dd5a330112', '哈哈哈', '13500000000');
INSERT INTO `t_manager` VALUES ('13', '7777', 'f63f4fbc9f8c85d409f2f59f2b9e12d5', '的萨达是', '13500000000');

-- ----------------------------
-- Table structure for t_outcontract
-- ----------------------------
DROP TABLE IF EXISTS `t_outcontract`;
CREATE TABLE `t_outcontract` (
  `outContract_id` int(11) NOT NULL AUTO_INCREMENT,
  `outContract_oldNo` varchar(50) DEFAULT NULL,
  `outContract_newNo` varchar(50) DEFAULT NULL,
  `outContract_company` varchar(50) DEFAULT NULL,
  `outContract_contact` varchar(50) DEFAULT NULL,
  `outContract_phone` varchar(50) DEFAULT NULL,
  `outContract_address` varchar(50) DEFAULT NULL,
  `outContract_startTime` date DEFAULT NULL,
  `outContract_endTime` date DEFAULT NULL,
  `outContract_copyImg` varchar(50) DEFAULT NULL,
  `outContract_carNo` varchar(50) DEFAULT NULL,
  `outContract_type` int(11) DEFAULT '1',
  PRIMARY KEY (`outContract_id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_outcontract
-- ----------------------------
INSERT INTO `t_outcontract` VALUES ('1', '', '2017080801', '成都朗沃培训机构', '张天航', '13509090909', '成都市武侯区红瓦寺共和村南街15号', '2017-08-08', '2018-08-31', '2.jpg', 'AP21', '1');
INSERT INTO `t_outcontract` VALUES ('2', '', '11', '11', '11', '11', '多福多寿', '2017-08-01', '2017-08-31', '11', '11', '0');
INSERT INTO `t_outcontract` VALUES ('3', '', '22', '22', '22', '22', '多福多寿', '2017-08-22', '2017-08-31', '22', '22', '1');
INSERT INTO `t_outcontract` VALUES ('4', '', '33', '33', '33', '33', '多福多寿', '2017-08-01', '2017-08-31', '33', '33', '1');
INSERT INTO `t_outcontract` VALUES ('5', '', '44', '44', '44', '44', '多福多寿', '2017-08-01', '2017-08-31', '44', '44', '0');
INSERT INTO `t_outcontract` VALUES ('6', '', '55', '55', '55', '55', '多福多寿', '2017-08-01', '2017-08-31', '55', '55', '1');
INSERT INTO `t_outcontract` VALUES ('7', '', '66', '66', '66', '66', '多福多寿', '2017-08-01', '2017-08-31', '66', '66', '0');
INSERT INTO `t_outcontract` VALUES ('8', '', '77', '77', '77', '77', '多福多寿', '2017-08-01', '2017-08-31', '77', '77', '0');
INSERT INTO `t_outcontract` VALUES ('30', '库', '让她', '让她', '让她', '13509090909', '王二', '2017-08-01', '2017-08-31', '2.jpg', '王二', '0');
INSERT INTO `t_outcontract` VALUES ('29', '路径', '库', '库', '库', '13509090909', '王二', '2017-08-01', '2017-08-31', '8.jpg', '王二', '0');
INSERT INTO `t_outcontract` VALUES ('28', '王二', '路径', '路径', '路径', '13509090909', '王二', '2017-08-01', '2017-08-02', '8.jpg', '王二', '0');
INSERT INTO `t_outcontract` VALUES ('27', '', '王二', '王二', '王二', '13509090909', '王二', '2017-08-01', '2017-08-31', '8.jpg', '王二', '0');
INSERT INTO `t_outcontract` VALUES ('24', '', '是的范德萨', '是的范德萨', '是的范德萨', '13509090909', '是的范德萨', '2017-08-01', '2017-08-31', '8.jpg', '是的范德萨', '0');
INSERT INTO `t_outcontract` VALUES ('25', '', '是的范德萨', '是的范德萨', '是的范德萨', '13509090909', '是的范德萨', '2017-08-01', '2017-08-31', '8.jpg', '是的范德萨', '0');
INSERT INTO `t_outcontract` VALUES ('26', '', '多福多寿', '多福多寿', '多福多寿', '13509090909', '多福多寿', '2017-08-01', '2017-08-31', '8.jpg', '多福多寿', '0');
INSERT INTO `t_outcontract` VALUES ('34', null, '99999', '答复', '范德萨发打发', '13533336666', '发的所发生的发送', '2017-08-23', '2017-08-23', 'abimg.jpg', 'addf132', '1');
INSERT INTO `t_outcontract` VALUES ('35', null, '978687', '答复1', '范德萨发打发', '13533336666', '发的所发生的发送1', '2017-08-25', '2017-08-31', 'bannbg.jpg', 'addf132', '0');
INSERT INTO `t_outcontract` VALUES ('36', '978687', '9786877', '答复11', '范德萨发打', '13533336667', '发的所发生的发送1', '2017-08-23', '2017-08-30', 'b6.png', 'addf132', '1');
INSERT INTO `t_outcontract` VALUES ('37', null, '22222', '啊啊啊啊', '张天爱', '13566778899', '啊啊啊啊啊', '2017-08-01', '2017-08-16', '7.jpg', 'ap21', '1');
INSERT INTO `t_outcontract` VALUES ('38', null, '2222222', '啊啊啊啊', '张三', '13566778899', '啊啊啊啊', '2017-08-02', '2017-08-31', '9.jpg', 'ap21', '0');
INSERT INTO `t_outcontract` VALUES ('39', '11', '111111', '啊啊啊啊', '张天爱', '13566778899', '多福多寿', '2017-08-07', '2017-08-15', '5.jpg', '11', '1');

-- ----------------------------
-- Table structure for t_park
-- ----------------------------
DROP TABLE IF EXISTS `t_park`;
CREATE TABLE `t_park` (
  `park_id` int(11) NOT NULL AUTO_INCREMENT,
  `park_address` varchar(30) DEFAULT NULL,
  `park_number` varchar(20) DEFAULT NULL,
  `park_contractId` int(11) DEFAULT NULL,
  `park_outContractId` int(11) DEFAULT NULL,
  `park_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`park_id`)
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_park
-- ----------------------------
INSERT INTO `t_park` VALUES ('1', '啊啊', 'cd1', '1', '39', '1');
INSERT INTO `t_park` VALUES ('2', '哪里', 'cd2', '1', '39', '1');
INSERT INTO `t_park` VALUES ('3', '哪里', 'cd2', '1', '3', '0');
INSERT INTO `t_park` VALUES ('4', 'aaaaa', 'cd2', '1', '8', '0');
INSERT INTO `t_park` VALUES ('5', 'aaaaa', 'cd2', '1', '39', '1');
INSERT INTO `t_park` VALUES ('6', null, 'cd5', '1', '6', '0');
INSERT INTO `t_park` VALUES ('7', null, 'cd6', '1', '7', '0');
INSERT INTO `t_park` VALUES ('8', null, 'cd7', '1', '8', '0');
INSERT INTO `t_park` VALUES ('239', 'fc', 'cf13', null, '1', '0');
INSERT INTO `t_park` VALUES ('240', 'fc', 'cf14', null, '1', '0');
INSERT INTO `t_park` VALUES ('241', 'fc', 'cf15', null, '1', '0');
INSERT INTO `t_park` VALUES ('242', 'fc', 'cf16', null, '1', '0');
INSERT INTO `t_park` VALUES ('243', 'fc', 'cf17', null, '1', '0');
INSERT INTO `t_park` VALUES ('244', 'fc', 'cf18', null, '1', '0');
INSERT INTO `t_park` VALUES ('245', 'fc', 'cf19', null, '1', '0');
INSERT INTO `t_park` VALUES ('246', 'fc', 'cf20', null, '1', '0');
INSERT INTO `t_park` VALUES ('247', '11', 'ggg', '1', null, '0');
INSERT INTO `t_park` VALUES ('248', '11', 'ggg', '1', null, '0');
INSERT INTO `t_park` VALUES ('249', '11', 'ggg', '1', null, '0');
INSERT INTO `t_park` VALUES ('250', '11', 'ggg', '1', null, '0');
INSERT INTO `t_park` VALUES ('251', '11', 'ggg', '1', null, '0');
INSERT INTO `t_park` VALUES ('252', '11', 'ggg', '1', null, '0');
INSERT INTO `t_park` VALUES ('253', '11', 'ggg', '1', null, '0');
INSERT INTO `t_park` VALUES ('254', 'ss', 'c1', null, '1', '0');
INSERT INTO `t_park` VALUES ('255', 'ss', 'c2', null, '1', '0');
INSERT INTO `t_park` VALUES ('256', 'ss', 'c3', null, '1', '0');
INSERT INTO `t_park` VALUES ('257', 'ss', 'c4', null, '1', '0');
INSERT INTO `t_park` VALUES ('258', 'ss', 'c5', null, '1', '0');
INSERT INTO `t_park` VALUES ('259', 'ss', 'c6', null, '1', '0');
INSERT INTO `t_park` VALUES ('260', 'ss', 'c7', null, '1', '0');
INSERT INTO `t_park` VALUES ('261', 'ss', 'c8', null, '1', '0');
INSERT INTO `t_park` VALUES ('262', 'ss', 'c9', null, '1', '0');
INSERT INTO `t_park` VALUES ('263', 'ss', 'c10', null, '1', '0');
INSERT INTO `t_park` VALUES ('264', 'ss', 'c11', null, '1', '0');
INSERT INTO `t_park` VALUES ('265', 'ss', 'c12', null, '1', '0');
INSERT INTO `t_park` VALUES ('266', 'ss', 'c13', null, '1', '0');
INSERT INTO `t_park` VALUES ('267', 'ss', 'c14', null, '1', '0');
INSERT INTO `t_park` VALUES ('268', 'ss', 'c15', null, '1', '0');
INSERT INTO `t_park` VALUES ('269', 'ss', 'c16', null, '1', '0');
INSERT INTO `t_park` VALUES ('270', 'ss', 'c17', null, '1', '0');
INSERT INTO `t_park` VALUES ('271', 'ss', 'c18', null, '1', '0');
INSERT INTO `t_park` VALUES ('272', 'ss', 'c19', null, '1', '0');
INSERT INTO `t_park` VALUES ('273', 'ss', 'c20', null, '1', '0');
INSERT INTO `t_park` VALUES ('274', 'ss', 'c21', null, '1', '0');
INSERT INTO `t_park` VALUES ('275', 'ss', 'c22', null, '1', '0');
INSERT INTO `t_park` VALUES ('276', 'dad', 'dd', null, '1', '0');
INSERT INTO `t_park` VALUES ('277', 'qqq', 'qq', null, '1', '0');
INSERT INTO `t_park` VALUES ('278', 'qqq', 'qq', null, '30', '0');
INSERT INTO `t_park` VALUES ('279', 'dd', 'dd5', null, '24', '0');
INSERT INTO `t_park` VALUES ('280', 'dd', 'dd6', null, '24', '0');
INSERT INTO `t_park` VALUES ('281', 'dd', 'dd7', null, '24', '0');
INSERT INTO `t_park` VALUES ('282', 'dd', 'dd8', null, '24', '0');
INSERT INTO `t_park` VALUES ('283', 'dd', 'dd9', null, '24', '0');
INSERT INTO `t_park` VALUES ('284', 'dd', 'dd10', null, '24', '0');
INSERT INTO `t_park` VALUES ('285', 'dd', 'dd11', null, '24', '0');
INSERT INTO `t_park` VALUES ('286', 'dd', 'dd12', null, '24', '0');
INSERT INTO `t_park` VALUES ('287', 'dd', 'dd13', null, '24', '0');
INSERT INTO `t_park` VALUES ('288', 'dd', 'dd14', null, '24', '0');
INSERT INTO `t_park` VALUES ('289', 'dd', 'dd15', null, '24', '0');
INSERT INTO `t_park` VALUES ('290', 'dd', 'dd16', null, '24', '0');
INSERT INTO `t_park` VALUES ('291', 'dd', 'dd17', null, '24', '0');
INSERT INTO `t_park` VALUES ('292', 'dd', 'dd18', null, '24', '0');
INSERT INTO `t_park` VALUES ('293', 'dd', 'dd19', null, '24', '0');
INSERT INTO `t_park` VALUES ('294', 'dd', 'dd20', null, '24', '0');
INSERT INTO `t_park` VALUES ('295', 'dd', 'dd21', null, '24', '0');
INSERT INTO `t_park` VALUES ('296', 'dd', 'dd22', null, '24', '0');
INSERT INTO `t_park` VALUES ('297', 'dd', 'dd23', null, '24', '0');
INSERT INTO `t_park` VALUES ('298', 'dd', 'dd24', null, '24', '0');
INSERT INTO `t_park` VALUES ('299', 'dd', 'dd25', null, '24', '0');
INSERT INTO `t_park` VALUES ('300', 'dad', 'fdf1', null, '1', '0');
INSERT INTO `t_park` VALUES ('301', 'dad', 'fdf2', null, '1', '0');
INSERT INTO `t_park` VALUES ('302', 'dad', 'fdf3', null, '1', '0');
INSERT INTO `t_park` VALUES ('303', 'dad', 'fdf4', null, '1', '0');
INSERT INTO `t_park` VALUES ('304', 'dad', 'fdf5', null, '1', '0');
INSERT INTO `t_park` VALUES ('305', 'dad', 'fdf6', null, '1', '0');
INSERT INTO `t_park` VALUES ('306', 'dad', 'fdf7', null, '1', '0');
INSERT INTO `t_park` VALUES ('307', 'dad', 'fdf8', null, '1', '0');
INSERT INTO `t_park` VALUES ('308', 'dad', 'fdf9', null, '1', '0');
INSERT INTO `t_park` VALUES ('309', 'dad', 'fdf10', null, '1', '0');
INSERT INTO `t_park` VALUES ('310', 'ff', 'ff', null, '4', '0');
INSERT INTO `t_park` VALUES ('311', 'aaa', 'aaa', null, '4', '0');
INSERT INTO `t_park` VALUES ('312', 'dddd', 'dd1', null, '26', '0');
INSERT INTO `t_park` VALUES ('313', 'dddd', 'dd2', null, '26', '0');
INSERT INTO `t_park` VALUES ('314', 'dddd', 'dd3', null, '26', '0');
INSERT INTO `t_park` VALUES ('315', 'dddd', 'dd4', null, '26', '0');
INSERT INTO `t_park` VALUES ('316', 'dddd', 'dd5', null, '26', '0');
INSERT INTO `t_park` VALUES ('317', 'dddd', 'dd6', null, '26', '0');
INSERT INTO `t_park` VALUES ('318', 'dddd', 'dd7', null, '26', '0');
INSERT INTO `t_park` VALUES ('319', 'dddd', 'dd8', null, '26', '0');
INSERT INTO `t_park` VALUES ('320', 'dddd', 'dd9', null, '26', '0');
INSERT INTO `t_park` VALUES ('321', 'dddd', 'dd10', null, '26', '0');
INSERT INTO `t_park` VALUES ('322', 'dddd', 'dd11', null, '26', '0');
INSERT INTO `t_park` VALUES ('323', 'dddd', 'dd12', null, '26', '0');
INSERT INTO `t_park` VALUES ('324', 'dddd', 'dd13', null, '26', '0');
INSERT INTO `t_park` VALUES ('325', 'dddd', 'dd14', null, '26', '0');
INSERT INTO `t_park` VALUES ('326', 'dddd', 'dd15', null, '26', '0');
INSERT INTO `t_park` VALUES ('327', 'dddd', 'dd16', null, '26', '0');
INSERT INTO `t_park` VALUES ('328', 'dddd', 'dd17', null, '26', '0');
INSERT INTO `t_park` VALUES ('329', 'dddd', 'dd18', null, '26', '0');
INSERT INTO `t_park` VALUES ('330', 'dddd', 'dd19', null, '26', '0');
INSERT INTO `t_park` VALUES ('331', 'dddd', 'dd20', null, '26', '0');
INSERT INTO `t_park` VALUES ('332', 'dddd', 'dd21', null, '26', '0');
INSERT INTO `t_park` VALUES ('333', '20', '185', null, '1', '0');
INSERT INTO `t_park` VALUES ('334', '成都路由器', 'cf11', null, '1', '0');
INSERT INTO `t_park` VALUES ('335', '成都路由器', 'cf11', null, '1', '0');
INSERT INTO `t_park` VALUES ('336', '成都路由器', 'cf11', null, '1', '0');
INSERT INTO `t_park` VALUES ('337', '成都路由器', 'cf11方法', null, '1', '0');
INSERT INTO `t_park` VALUES ('338', '山东', 'ff', null, '1', '0');
INSERT INTO `t_park` VALUES ('339', '山东', 'ff', null, '1', '0');
INSERT INTO `t_park` VALUES ('340', '山东', 'ff', null, '1', '0');
INSERT INTO `t_park` VALUES ('341', '1', 'cf', null, '1', '0');
INSERT INTO `t_park` VALUES ('342', '1', 'cf', null, '39', '0');
INSERT INTO `t_park` VALUES ('343', '1', 'cf', null, '3', '0');
INSERT INTO `t_park` VALUES ('344', '阿斯达所', '大', null, '1', '0');
INSERT INTO `t_park` VALUES ('345', '阿斯达所', '大大大大', null, '4', '0');
INSERT INTO `t_park` VALUES ('346', '大大大', '测试时', null, '1', '0');
INSERT INTO `t_park` VALUES ('347', '大厦大厦', '大大大大1', null, '1', '0');
INSERT INTO `t_park` VALUES ('348', '大厦大厦', '大大大大2', null, '1', '0');
INSERT INTO `t_park` VALUES ('349', '大厦大厦', '大大大大3', null, '1', '0');
INSERT INTO `t_park` VALUES ('350', '大厦大厦', '大大大大4', null, '1', '0');
INSERT INTO `t_park` VALUES ('351', '大厦大厦', '大大大大5', null, '1', '0');
INSERT INTO `t_park` VALUES ('352', '大厦大厦', '大大大大6', null, '1', '0');
INSERT INTO `t_park` VALUES ('353', '啊啊啊', 'cf12323', null, '1', '0');
INSERT INTO `t_park` VALUES ('354', '啊啊啊', 'cf12324', null, '1', '0');
INSERT INTO `t_park` VALUES ('355', '啊啊啊', 'cf12325', null, '1', '0');
INSERT INTO `t_park` VALUES ('356', '啊啊啊', 'cf12326', null, '1', '0');
INSERT INTO `t_park` VALUES ('357', '啊啊啊', 'cf12327', null, '1', '0');
INSERT INTO `t_park` VALUES ('358', '啊啊啊', 'cf12328', null, '1', '0');
INSERT INTO `t_park` VALUES ('359', '啊啊啊', 'cf12329', null, '1', '0');
INSERT INTO `t_park` VALUES ('360', '啊啊啊', 'cf12330', null, '1', '0');

-- ----------------------------
-- Table structure for t_power
-- ----------------------------
DROP TABLE IF EXISTS `t_power`;
CREATE TABLE `t_power` (
  `power_id` int(11) NOT NULL AUTO_INCREMENT,
  `power_name` varchar(20) DEFAULT NULL,
  `power_miaosu` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`power_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_power
-- ----------------------------
INSERT INTO `t_power` VALUES ('1', '/admin/', '用户管理员');
INSERT INTO `t_power` VALUES ('2', '/contract/', '合约管理员');
INSERT INTO `t_power` VALUES ('3', '/park/', '车位管理员');
INSERT INTO `t_power` VALUES ('4', '/complain/', '投诉管理员');
INSERT INTO `t_power` VALUES ('5', '/super/', '权限管理员');
INSERT INTO `t_power` VALUES ('6', '/vip/', '包租婆');

-- ----------------------------
-- Table structure for t_rent
-- ----------------------------
DROP TABLE IF EXISTS `t_rent`;
CREATE TABLE `t_rent` (
  `rent_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `rent_endDate` datetime DEFAULT NULL,
  `rent_startDate` datetime DEFAULT NULL,
  `rent_cnumber` varchar(50) DEFAULT NULL,
  `rent_address` varchar(50) DEFAULT NULL,
  `rent_number` varchar(20) DEFAULT NULL,
  `rent_picture` varchar(50) DEFAULT NULL,
  `rent_price` decimal(7,2) DEFAULT NULL,
  `rent_type` int(11) DEFAULT NULL,
  `rent_carPicture` varchar(50) DEFAULT NULL,
  `rent_message` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`rent_id`),
  KEY `FK_Reference_1` (`user_id`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_rent
-- ----------------------------
INSERT INTO `t_rent` VALUES ('9', '8', '2018-08-02 00:00:00', '2017-08-01 00:00:00', '22222', '成都市锦江区财富中心负一楼', 'cf234', '15034684047178.jpg', '200.00', '2', '15034684047177.jpg', '财富中心负一楼靠近春熙路牛逼的起飞');
INSERT INTO `t_rent` VALUES ('10', '8', '2018-08-02 00:00:00', '2017-08-01 00:00:00', '22222', '成都市锦江区财富中心负一楼', 'cf234', '15034684738908.jpg', '200.00', '1', '15034684738907.jpg', '财富中心负一楼靠近春熙路牛逼的起飞');
INSERT INTO `t_rent` VALUES ('11', '8', '2016-08-01 00:00:00', '2017-08-01 00:00:00', '222222', '成都市锦江区指挥街', '1122', '1503475976828f6.png', '180.00', '1', '1503475976828f1.jpg', '啊啊啊啊啊啊啊啊');
INSERT INTO `t_rent` VALUES ('12', '8', '2017-08-29 00:00:00', '2017-08-02 00:00:00', '333333', '成都市金牛区', '22222', '15034866339981.jpg', '220.00', '0', '15034866339987.jpg', '啊啊啊啊啊');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_account` varchar(20) DEFAULT NULL,
  `user_pwd` varchar(50) DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `user_address` varchar(50) DEFAULT NULL,
  `user_cardId` varchar(20) DEFAULT NULL,
  `user_phone` varchar(20) DEFAULT NULL,
  `user_work` varchar(20) DEFAULT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `user_type` int(11) DEFAULT NULL,
  `user_credit` int(11) DEFAULT NULL,
  `user_date` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('3', 'fengwei123', '8ddcff3a80f4189ca1c9d4d902c3c909', '冯伟', '南充市嘉陵区', '511304199209102619', '18890815162', '国务院', '1021978377@qq.com', '1', '100', '2017-08-11 16:22:16');
INSERT INTO `t_user` VALUES ('4', 'fengwei', '8ddcff3a80f4189ca1c9d4d902c3c909', '小陈', '南充市嘉陵区', '511304199209102619', '13555667788', '国务院', 'zhangsan@163.com', '0', '97', '2017-08-11 16:26:08');
INSERT INTO `t_user` VALUES ('5', 'fengwei1', 'e10adc3949ba59abbe56e057f20f883e', '冯伟', '南充市嘉陵区', '511304199209102619', '13544445555', '党中央', 'zhangsan@163.com', '0', '100', '2017-08-21 13:36:56');
INSERT INTO `t_user` VALUES ('6', 'fengwei2', 'e10adc3949ba59abbe56e057f20f883e', '冯伟', '南充市嘉陵区', '511304199209102619', '13555667788', '党中央', 'zhangsan@163.com', '0', '100', '2017-08-21 13:37:29');
INSERT INTO `t_user` VALUES ('7', 'fengwei3', 'e10adc3949ba59abbe56e057f20f883e', '小陈', '南充市嘉陵区', '511304199209102619', '13555667788', '党中央', 'zhangsan@163.com', '0', '100', '2017-08-21 13:42:46');
INSERT INTO `t_user` VALUES ('8', 'testman', '8ddcff3a80f4189ca1c9d4d902c3c909', '测试人员', '南充市嘉陵区', '510121098911223334', '13555667788', '国务院', 'zhangsan@163.com', '0', '99', '2017-08-23 13:44:34');

-- ----------------------------
-- Table structure for t_want
-- ----------------------------
DROP TABLE IF EXISTS `t_want`;
CREATE TABLE `t_want` (
  `want_id` int(11) NOT NULL AUTO_INCREMENT,
  `rent_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `want_message` varchar(50) DEFAULT NULL,
  `want_type` int(255) DEFAULT NULL,
  PRIMARY KEY (`want_id`),
  KEY `FK_Reference_10` (`rent_id`),
  KEY `FK_Reference_11` (`user_id`),
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`rent_id`) REFERENCES `t_rent` (`rent_id`),
  CONSTRAINT `FK_Reference_11` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_want
-- ----------------------------
INSERT INTO `t_want` VALUES ('12', '9', '3', '我要租车', '5');

-- ----------------------------
-- View structure for manager_power_view
-- ----------------------------
DROP VIEW IF EXISTS `manager_power_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `manager_power_view` AS SELECT m.manager_account,m.manager_pwd,m.manager_name,m.manager_phone,p.power_name,p.power_miaosu from t_manager m,t_power p,manager_power mp where m.manager_id = mp.manager_id and p.power_id = mp.power_id ;

-- ----------------------------
-- View structure for user_rent
-- ----------------------------
DROP VIEW IF EXISTS `user_rent`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `user_rent` AS SELECT u.user_account, u.user_address, u.user_cardId,u.user_credit,u.user_date,u.user_email,u.user_id,u.user_name,u.user_phone,u.user_work,u.user_type, r.rent_address,r.rent_cnumber,r.rent_endDate,r.rent_id,r.rent_message,r.rent_number,r.rent_price,r.rent_startDate,r.rent_type FROM t_user u, t_rent r WHERE r.user_id=u.user_id ;
