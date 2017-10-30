/*
Navicat MySQL Data Transfer

Source Server         : brainsoftbd
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : brainsof_bd

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2011-11-17 14:45:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `recibe`
-- ----------------------------
DROP TABLE IF EXISTS `recibe`;
CREATE TABLE `recibe` (
  `id_ref_invitacion` int(11) NOT NULL AUTO_INCREMENT,
  `id_ref_nombre_usuario` varchar(10) NOT NULL,
  PRIMARY KEY (`id_ref_invitacion`,`id_ref_nombre_usuario`),
  KEY `id_nombre_usuario` (`id_ref_nombre_usuario`),
  CONSTRAINT `usuario` FOREIGN KEY (`id_ref_nombre_usuario`) REFERENCES `manager` (`id_nombre_usuario`),
  CONSTRAINT `invitacion_liga` FOREIGN KEY (`id_ref_invitacion`) REFERENCES `invitacion_liga` (`id_invitacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of recibe
-- ----------------------------
