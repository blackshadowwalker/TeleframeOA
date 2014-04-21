/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50513
Source Host           : 127.0.0.1:3306
Source Database       : vlpr

Target Server Type    : MYSQL
Target Server Version : 50513
File Encoding         : 65001

Date: 2014-04-14 21:31:07
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `result_car`
-- ----------------------------
DROP TABLE IF EXISTS `result_car`;
CREATE TABLE `result_car` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_code` int(11) DEFAULT '0',
  `plate` varchar(16) DEFAULT '' COMMENT '车牌',
  `longitude` varchar(16) DEFAULT NULL COMMENT '经度',
  `latitude` varchar(16) DEFAULT NULL COMMENT '纬度',
  `device_id` int(11) DEFAULT NULL COMMENT '设备id',
  `confidence` float unsigned DEFAULT '0' COMMENT '可信度',
  `plate_type` varchar(16) DEFAULT '' COMMENT '车牌类型',
  `plate_color` varchar(16) DEFAULT NULL COMMENT '车牌颜色',
  `plate_rect` varchar(32) DEFAULT '0,0;0,0' COMMENT '车牌坐标（left,top;width,height）',
  `car_color` varchar(16) DEFAULT NULL COMMENT '车辆颜色',
  `car_color_type` varchar(16) DEFAULT NULL COMMENT '车辆颜色深浅',
  `car_type` varchar(16) DEFAULT NULL COMMENT '车辆类型 大中小',
  `car_logo` varchar(16) DEFAULT NULL COMMENT '车标',
  `speed` int(4) DEFAULT '0' COMMENT '速度',
  `car_time` timestamp NULL DEFAULT NULL COMMENT '抓拍绝对时间',
  `direction` varchar(8) DEFAULT NULL COMMENT '方向(上下左右)',
  `car_illegal` int(1) DEFAULT '0' COMMENT '是否违规',
  `illegal_reason` varchar(16) DEFAULT NULL COMMENT '违规原因(闯红灯等)',
  `car_image` varchar(512) DEFAULT NULL COMMENT '抓拍图片',
  `md5` varchar(32) DEFAULT NULL COMMENT 'image md5',
  `sha1` varchar(40) DEFAULT NULL COMMENT 'image sha1',
  `device_path` varchar(128) DEFAULT NULL COMMENT '设备位置全路径(永存)',
  `user_id` int(11) DEFAULT '0' COMMENT '上传警员id',
  `user_code` varchar(64) DEFAULT NULL COMMENT '上传警员编号',
  `user_name` varchar(64) DEFAULT NULL COMMENT '上传警员姓名',
  `ip` varchar(64) DEFAULT NULL,
  `last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间',
  `status` int(1) DEFAULT '1' COMMENT '0删除 1存活',
  `result_type` int(1) DEFAULT '0' COMMENT '1黑车 2套牌 3疑似套牌',
  `ref_id` int(11) DEFAULT '0' COMMENT '黑车-black_car; 套牌car_local|car_ext; 疑似套牌result_id;',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=536 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of result_car
-- ----------------------------
INSERT INTO result_car VALUES ('1', '1396492300', '湘M22052', '112.9313850403', '28.2502596218', '12', '89', '蓝牌小汽车', '蓝色', '986,1928,1143,1967', '蓝', '浅', '轿车', '丰田', '0', '2012-10-19 09:28:32', '未知', '0', '', '/root/test/2012_10_19/{C8125480-B8DC-409B-B588-466B429301A6}@1@20121019095832707.jpg', '', '', '/root/test', '0', 'admin', '超级管理员', '', '2014-04-14 21:28:46', '1', '0', '0');
INSERT INTO result_car VALUES ('2', '1396492300', '湘M22052', '112.9223728180', '28.2373299941', '12', '89', '蓝牌小汽车', '蓝色', '203,205,360,244', '蓝', '浅', '轿车', '丰田', '0', '2012-10-19 09:35:01', '未知', '0', '', '/root/test/2012_10_19/{C8125480-B8DC-409B-B588-466B429301A6}@4@20121019095832707.jpg', '', '', '/root/test', '0', 'admin', '超级管理员', '', '2014-04-14 21:28:56', '1', '0', '0');
INSERT INTO result_car VALUES ('3', '1396492849', '湘M22052', '112.9341316223', '28.2346077676', '12', '89', '蓝牌小汽车', '蓝色', '986,1928,1143,1967', '蓝', '浅', '轿车', '丰田', '0', '2012-10-19 09:39:25', '未知', '0', '', '/root/test/2012_10_19/{C8125480-B8DC-409B-B588-466B429301A6}@1@20121019095832707.jpg', '', '', '/root/test', '0', 'admin', '超级管理员', '', '2014-04-14 21:30:50', '1', '0', '0');
INSERT INTO result_car VALUES ('4', '1396492849', '湘M22052', '112.9350757599', '28.2174410171', '12', '89', '蓝牌小汽车', '蓝色', '203,205,360,244', '蓝', '浅', '轿车', '丰田', '0', '2012-10-19 09:42:09', '未知', '0', '', '/root/test/2012_10_19/{C8125480-B8DC-409B-B588-466B429301A6}@4@20121019095832707.jpg', '', '', '/root/test', '0', 'admin', '超级管理员', '', '2014-04-14 21:30:46', '1', '0', '0');
INSERT INTO result_car VALUES ('5', '1396502714', '湘M22052', '112.9296684265', '28.2048856108', '12', '89', '蓝牌小汽车', '蓝色', '986,1928,1143,1967', '蓝', '浅', '轿车', '丰田', '0', '2012-10-19 09:46:21', '未知', '0', '', '/root/test/2012_10_19/{C8125480-B8DC-409B-B588-466B429301A6}@1@20121019095832707.jpg', '', '', '/root/test', '1', 'admin', '超级管理员', '', '2014-04-14 21:29:30', '1', '0', '0');
INSERT INTO result_car VALUES ('6', '1396502714', '湘M22052', '112.9296684266', '28.2048856118', '12', '89', '蓝牌小汽车', '蓝色', '203,205,360,244', '蓝', '浅', '轿车', '丰田', '0', '2012-10-19 09:55:12', '未知', '0', '', '/root/test/2012_10_19/{C8125480-B8DC-409B-B588-466B429301A6}@4@20121019095832707.jpg', '', '', '/root/test', '1', 'admin', '超级管理员', '', '2014-04-14 21:29:40', '1', '0', '0');
