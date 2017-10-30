/*
Navicat MySQL Data Transfer

Source Server         : brainsoftbd
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : brainsof_bd

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2011-11-17 14:45:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `manager`
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `id_nombre_usuario` varchar(10) NOT NULL,
  `contrasena` varchar(10) NOT NULL,
  `nombre` varchar(10) DEFAULT NULL,
  `apellido` varchar(20) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `nombre_eq_manager` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_nombre_usuario`),
  KEY `eq_manager` (`nombre_eq_manager`),
  CONSTRAINT `eq_manager` FOREIGN KEY (`nombre_eq_manager`) REFERENCES `equipo_manager` (`id_nombre_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of manager
-- ----------------------------
