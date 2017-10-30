/*
Navicat MySQL Data Transfer

Source Server         : brainsoftbd
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : brainsof_bd

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2011-11-17 14:44:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `estadistica_pitcher`
-- ----------------------------
DROP TABLE IF EXISTS `estadistica_pitcher`;
CREATE TABLE `estadistica_pitcher` (
  `id_ref_nro` int(11) NOT NULL,
  `id_ref_nombre_equipo_lvbp` varchar(25) NOT NULL,
  `entradas_lanzadas_juego` int(11) NOT NULL,
  `carreras_limpias_juego` int(11) NOT NULL,
  `imparables_juego` int(11) NOT NULL,
  `ponches_juego` int(11) NOT NULL,
  `bases_por_bola_juego` int(11) NOT NULL,
  `juegos_ganados_juego` int(11) NOT NULL,
  `casa_nombre_equipo_lvbp` varchar(25) NOT NULL,
  `visitante_nombre_equipo_lvbp` varchar(25) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_ref_nro`,`id_ref_nombre_equipo_lvbp`),
  KEY `eqpitcher` (`id_ref_nombre_equipo_lvbp`),
  KEY `juegocasa` (`casa_nombre_equipo_lvbp`),
  KEY `juegovis` (`visitante_nombre_equipo_lvbp`),
  CONSTRAINT `juegovis` FOREIGN KEY (`visitante_nombre_equipo_lvbp`) REFERENCES `juegolvbp` (`visitante_nombre_equipo_lvbp`),
  CONSTRAINT `eqpitcher` FOREIGN KEY (`id_ref_nombre_equipo_lvbp`) REFERENCES `pitcher` (`id_ref_nombre_equipo_lvbp`),
  CONSTRAINT `juegocasa` FOREIGN KEY (`casa_nombre_equipo_lvbp`) REFERENCES `juegolvbp` (`casa_nombre_equipo_lvbp`),
  CONSTRAINT `nropitcher` FOREIGN KEY (`id_ref_nro`) REFERENCES `pitcher` (`id_nro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of estadistica_pitcher
-- ----------------------------
