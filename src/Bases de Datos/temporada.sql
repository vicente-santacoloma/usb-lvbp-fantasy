/*
Navicat MySQL Data Transfer

Source Server         : brainsoftbd
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : brainsof_bd

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2011-11-17 14:46:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `temporada`
-- ----------------------------
DROP TABLE IF EXISTS `temporada`;
CREATE TABLE `temporada` (
  `id_nombre_temporada` varchar(9) NOT NULL,
  PRIMARY KEY (`id_nombre_temporada`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of temporada
-- ----------------------------
