/*
Navicat MySQL Data Transfer

Source Server         : brainsoftbd
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : brainsof_bd

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2011-11-17 14:43:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `administrador`
-- ----------------------------
DROP TABLE IF EXISTS `administrador`;
CREATE TABLE `administrador` (
  `id_nombre_usuario` varchar(10) NOT NULL,
  `contrasena` char(8) NOT NULL,
  PRIMARY KEY (`id_nombre_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of administrador
-- ----------------------------
