/*
Navicat MySQL Data Transfer

Source Server         : brainsoftbd
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : brainsof_bd

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2011-11-17 14:45:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `peticiones`
-- ----------------------------
DROP TABLE IF EXISTS `peticiones`;
CREATE TABLE `peticiones` (
  `id_usuario_remitente` varchar(20) NOT NULL,
  `id_usuario_receptor` varchar(20) NOT NULL,
  PRIMARY KEY (`id_usuario_receptor`),
  KEY `peticionesmanager` (`id_usuario_remitente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of peticiones
-- ----------------------------
