/*
Navicat MySQL Data Transfer

Source Server         : brainsoftbd
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : brainsof_bd

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2011-11-17 14:46:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `roster_pitcher`
-- ----------------------------
DROP TABLE IF EXISTS `roster_pitcher`;
CREATE TABLE `roster_pitcher` (
  `id_ref_nombre_equipo_lvbp` varchar(25) NOT NULL,
  `precio_compra` int(11) NOT NULL,
  PRIMARY KEY (`id_ref_nombre_equipo_lvbp`),
  CONSTRAINT `equipolvbp` FOREIGN KEY (`id_ref_nombre_equipo_lvbp`) REFERENCES `equipolvbp` (`id_nombre_equipo_lvbp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of roster_pitcher
-- ----------------------------
