/*
Navicat MySQL Data Transfer

Source Server         : brainsoftbd
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : brainsof_bd

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2011-11-17 14:44:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `equipolvbp`
-- ----------------------------
DROP TABLE IF EXISTS `equipolvbp`;
CREATE TABLE `equipolvbp` (
  `id_nombre_equipo_lvbp` varchar(25) NOT NULL,
  `ubicacion` varchar(20) NOT NULL,
  `estadio` varchar(30) NOT NULL,
  `fecha_fundacion` date NOT NULL,
  PRIMARY KEY (`id_nombre_equipo_lvbp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of equipolvbp
-- ----------------------------
