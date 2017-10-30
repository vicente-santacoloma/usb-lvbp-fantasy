/*
Navicat MySQL Data Transfer

Source Server         : brainsoftbd
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : brainsof_bd

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2011-11-17 14:44:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `equipo_manager`
-- ----------------------------
DROP TABLE IF EXISTS `equipo_manager`;
CREATE TABLE `equipo_manager` (
  `id_nombre_equipo` varchar(10) NOT NULL,
  `ref_nombre_usuario` varchar(20) NOT NULL,
  `dinero` double NOT NULL,
  PRIMARY KEY (`id_nombre_equipo`),
  KEY `manager_eq` (`ref_nombre_usuario`),
  CONSTRAINT `manager_eq` FOREIGN KEY (`ref_nombre_usuario`) REFERENCES `manager` (`id_nombre_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of equipo_manager
-- ----------------------------
