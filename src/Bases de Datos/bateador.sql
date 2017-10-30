/*
Navicat MySQL Data Transfer

Source Server         : brainsoftbd
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : brainsof_bd

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2011-11-17 14:43:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bateador`
-- ----------------------------
DROP TABLE IF EXISTS `bateador`;
CREATE TABLE `bateador` (
  `id_numero` int(11) NOT NULL,
  `id_ref_nombre_equipo_lvbp` varchar(25) NOT NULL,
  `nombre` varchar(10) NOT NULL,
  `carreras_anotadas` int(11) NOT NULL,
  `bases_alcanzadas` int(11) NOT NULL,
  `carreras_impulsadas` int(11) NOT NULL,
  `bases_robadas` int(11) NOT NULL,
  `bases_por_bola` int(11) NOT NULL,
  `cant_ponches` int(11) NOT NULL,
  `cant_errores` int(11) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `edad` int(11) NOT NULL,
  `precio` int(11) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `lugar_nacimiento` varchar(10) NOT NULL,
  `posicion` varchar(10) NOT NULL,
  PRIMARY KEY (`id_ref_nombre_equipo_lvbp`,`id_numero`),
  KEY `id_numero` (`id_numero`),
  KEY `id_ref_nombre_equipo_lvbp` (`id_ref_nombre_equipo_lvbp`),
  CONSTRAINT `eqlvbp` FOREIGN KEY (`id_ref_nombre_equipo_lvbp`) REFERENCES `equipolvbp` (`id_nombre_equipo_lvbp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bateador
-- ----------------------------
