/*
Navicat MySQL Data Transfer

Source Server         : brainsoftbd
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : brainsof_bd

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2011-11-17 14:44:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `invitacion_liga`
-- ----------------------------
DROP TABLE IF EXISTS `invitacion_liga`;
CREATE TABLE `invitacion_liga` (
  `id_invitacion` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(20) NOT NULL,
  `ref_nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`id_invitacion`),
  KEY `nombre_liga` (`ref_nombre`),
  CONSTRAINT `nombre_liga` FOREIGN KEY (`ref_nombre`) REFERENCES `liga` (`id_nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of invitacion_liga
-- ----------------------------
