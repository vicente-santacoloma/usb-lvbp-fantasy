/*
Navicat MySQL Data Transfer

Source Server         : brainsoftbd
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : brainsof_bd

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2011-11-17 14:44:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `estadistica_bateador`
-- ----------------------------
DROP TABLE IF EXISTS `estadistica_bateador`;
CREATE TABLE `estadistica_bateador` (
  `id_ref_numero` int(11) NOT NULL,
  `id_ref_nombre_equipo_lvbp` varchar(25) NOT NULL,
  `carreras_anotadas_juego` int(11) NOT NULL,
  `bases_alcanzadas_juego` int(11) NOT NULL,
  `carreras_impulsadas_juego` int(11) NOT NULL,
  `bases_robadas_juego` int(11) NOT NULL,
  `bases_por_bola_uego` int(11) NOT NULL,
  `cant_ponches_juego` int(11) NOT NULL,
  `cant_errores` int(11) NOT NULL,
  `casa_nombre_equipo_lvbp` varchar(25) NOT NULL,
  `visitante_nombre_equipo_lvbp` varchar(25) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_ref_nombre_equipo_lvbp`,`id_ref_numero`),
  KEY `nrobateador` (`id_ref_numero`),
  KEY `casaplay` (`casa_nombre_equipo_lvbp`),
  KEY `visitplay` (`visitante_nombre_equipo_lvbp`),
  CONSTRAINT `visitplay` FOREIGN KEY (`visitante_nombre_equipo_lvbp`) REFERENCES `juegolvbp` (`visitante_nombre_equipo_lvbp`),
  CONSTRAINT `casaplay` FOREIGN KEY (`casa_nombre_equipo_lvbp`) REFERENCES `juegolvbp` (`casa_nombre_equipo_lvbp`),
  CONSTRAINT `eqbateador` FOREIGN KEY (`id_ref_nombre_equipo_lvbp`) REFERENCES `bateador` (`id_ref_nombre_equipo_lvbp`),
  CONSTRAINT `nrobateador` FOREIGN KEY (`id_ref_numero`) REFERENCES `bateador` (`id_numero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of estadistica_bateador
-- ----------------------------
