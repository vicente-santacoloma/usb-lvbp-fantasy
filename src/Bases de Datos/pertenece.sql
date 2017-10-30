/*
Navicat MySQL Data Transfer

Source Server         : brainsoftbd
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : brainsof_bd

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2011-11-17 14:45:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `pertenece`
-- ----------------------------
DROP TABLE IF EXISTS `pertenece`;
CREATE TABLE `pertenece` (
  `id_ref_nombre_usuario` varchar(20) NOT NULL,
  `id_ref_nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`id_ref_nombre`,`id_ref_nombre_usuario`),
  KEY `usuario_pertenece_liga` (`id_ref_nombre_usuario`),
  CONSTRAINT `nombreliga` FOREIGN KEY (`id_ref_nombre`) REFERENCES `liga` (`id_nombre`),
  CONSTRAINT `usuario_pertenece_liga` FOREIGN KEY (`id_ref_nombre_usuario`) REFERENCES `manager` (`id_nombre_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pertenece
-- ----------------------------
