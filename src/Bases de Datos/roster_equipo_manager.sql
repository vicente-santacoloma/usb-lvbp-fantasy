/*
Navicat MySQL Data Transfer

Source Server         : brainsoftbd
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : brainsof_bd

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2011-11-17 14:46:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `roster_equipo_manager`
-- ----------------------------
DROP TABLE IF EXISTS `roster_equipo_manager`;
CREATE TABLE `roster_equipo_manager` (
  `id_ref_nombre_equipo` varchar(20) NOT NULL,
  `id_ref_nombre_equipo_lvbp` varchar(25) NOT NULL,
  `precio_compra` double NOT NULL,
  PRIMARY KEY (`id_ref_nombre_equipo`,`id_ref_nombre_equipo_lvbp`),
  KEY `rostereqlvbp` (`id_ref_nombre_equipo_lvbp`),
  CONSTRAINT `rostereqlvbp` FOREIGN KEY (`id_ref_nombre_equipo_lvbp`) REFERENCES `roster_pitcher` (`id_ref_nombre_equipo_lvbp`),
  CONSTRAINT `rostermanager` FOREIGN KEY (`id_ref_nombre_equipo`) REFERENCES `equipo_manager` (`id_nombre_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of roster_equipo_manager
-- ----------------------------
