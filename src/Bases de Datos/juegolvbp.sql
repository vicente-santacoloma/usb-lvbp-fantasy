/*
Navicat MySQL Data Transfer

Source Server         : brainsoftbd
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : brainsof_bd

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2011-11-17 14:45:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `juegolvbp`
-- ----------------------------
DROP TABLE IF EXISTS `juegolvbp`;
CREATE TABLE `juegolvbp` (
  `casa_nombre_equipo_lvbp` varchar(25) NOT NULL,
  `visitante_nombre_equipo_lvbp` varchar(25) NOT NULL,
  `fecha` date NOT NULL,
  `carrera_eq_casa` int(11) NOT NULL,
  `carrera_eq_visitante` int(11) NOT NULL,
  `ref_nombre_temporada` varchar(9) NOT NULL,
  PRIMARY KEY (`casa_nombre_equipo_lvbp`,`visitante_nombre_equipo_lvbp`,`fecha`),
  KEY `temporada` (`ref_nombre_temporada`),
  KEY `visitantelvbp` (`visitante_nombre_equipo_lvbp`),
  KEY `casa_nombre_equipo_lvbp` (`casa_nombre_equipo_lvbp`),
  CONSTRAINT `casalvbp` FOREIGN KEY (`casa_nombre_equipo_lvbp`) REFERENCES `equipolvbp` (`id_nombre_equipo_lvbp`),
  CONSTRAINT `temporada` FOREIGN KEY (`ref_nombre_temporada`) REFERENCES `temporada` (`id_nombre_temporada`),
  CONSTRAINT `visitantelvbp` FOREIGN KEY (`visitante_nombre_equipo_lvbp`) REFERENCES `equipolvbp` (`id_nombre_equipo_lvbp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of juegolvbp
-- ----------------------------
