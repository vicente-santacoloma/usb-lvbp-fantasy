/*
Navicat MySQL Data Transfer

Source Server         : brainsoftbd
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : brainsof_bd

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2011-11-17 14:45:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `pitcher`
-- ----------------------------
DROP TABLE IF EXISTS `pitcher`;
CREATE TABLE `pitcher` (
  `id_nro` int(11) NOT NULL,
  `id_ref_nombre_equipo_lvbp` varchar(25) NOT NULL,
  `nombre` varchar(10) NOT NULL,
  `carreras_limpias` int(11) NOT NULL,
  `imparables` int(11) NOT NULL,
  `ponches` int(11) NOT NULL,
  `base_por_bola` int(11) NOT NULL,
  `juegos_ganados` int(11) NOT NULL,
  `apellido` varchar(10) NOT NULL,
  `edad` int(11) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `lugar_nacimiento` varchar(10) NOT NULL,
  `entradas_lanzadas` int(11) NOT NULL,
  PRIMARY KEY (`id_nro`,`id_ref_nombre_equipo_lvbp`),
  KEY `eq_lvbp` (`id_ref_nombre_equipo_lvbp`),
  KEY `id_nro` (`id_nro`),
  CONSTRAINT `eq_lvbp` FOREIGN KEY (`id_ref_nombre_equipo_lvbp`) REFERENCES `equipolvbp` (`id_nombre_equipo_lvbp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pitcher
-- ----------------------------
