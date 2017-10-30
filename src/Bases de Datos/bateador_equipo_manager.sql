/*
Navicat MySQL Data Transfer

Source Server         : brainsoftbd
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : brainsof_bd

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2011-11-17 14:44:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bateador_equipo_manager`
-- ----------------------------
DROP TABLE IF EXISTS `bateador_equipo_manager`;
CREATE TABLE `bateador_equipo_manager` (
  `id_ref_numero` int(11) NOT NULL,
  `id_ref_nombre_equipo_lvbp` varchar(25) NOT NULL,
  `ref_nombre_equipo` varchar(20) NOT NULL,
  `precio_compra` int(11) NOT NULL,
  PRIMARY KEY (`id_ref_numero`,`id_ref_nombre_equipo_lvbp`,`ref_nombre_equipo`),
  KEY `bateq` (`id_ref_nombre_equipo_lvbp`),
  KEY `batmanager` (`ref_nombre_equipo`),
  CONSTRAINT `batmanager` FOREIGN KEY (`ref_nombre_equipo`) REFERENCES `equipo_manager` (`id_nombre_equipo`),
  CONSTRAINT `bateq` FOREIGN KEY (`id_ref_nombre_equipo_lvbp`) REFERENCES `bateador` (`id_ref_nombre_equipo_lvbp`),
  CONSTRAINT `batnumber` FOREIGN KEY (`id_ref_numero`) REFERENCES `bateador` (`id_numero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bateador_equipo_manager
-- ----------------------------
