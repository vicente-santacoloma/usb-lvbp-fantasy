/*
Navicat MySQL Data Transfer

Source Server         : brainsoftbd
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : brainsof_bd

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2011-11-17 14:45:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `liga`
-- ----------------------------
DROP TABLE IF EXISTS `liga`;
CREATE TABLE `liga` (
  `id_nombre` varchar(20) NOT NULL,
  `es_privada` decimal(1,0) NOT NULL,
  `ref_nombre_usuario` varchar(20) NOT NULL,
  PRIMARY KEY (`id_nombre`,`es_privada`),
  KEY `id_nombre` (`id_nombre`),
  KEY `nombre_usuario` (`ref_nombre_usuario`),
  CONSTRAINT `nombre_usuario` FOREIGN KEY (`ref_nombre_usuario`) REFERENCES `manager` (`id_nombre_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of liga
-- ----------------------------
