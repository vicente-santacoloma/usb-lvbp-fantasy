/*
Navicat MySQL Data Transfer

Source Server         : brainsoftbd
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : brainsof_bd

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2011-11-14 16:27:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `administrador`
-- ----------------------------
DROP TABLE IF EXISTS `administrador`;
CREATE TABLE `administrador` (
  `id_nombre_usuario` varchar(10) NOT NULL,
  `contrasena` char(8) NOT NULL,
  PRIMARY KEY (`id_nombre_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of administrador
-- ----------------------------

/*
Navicat MySQL Data Transfer

Source Server         : brainsoftbd
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : brainsof_bd

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2011-11-14 16:27:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bateador`
-- ----------------------------
DROP TABLE IF EXISTS `bateador`;
CREATE TABLE `bateador` (
  `id_nombre_equipo` varchar(20) NOT NULL,
  `id_numero` int(11) NOT NULL,
  `posicion` varchar(10) NOT NULL,
  `carreras_anotadas` int(11) NOT NULL,
  `bases_alcanzadas` int(11) NOT NULL,
  `carreras_impulsadas` int(11) NOT NULL,
  `bases_robadas` int(11) NOT NULL,
  `bases_por_bola` int(11) NOT NULL,
  `cant_ponches` int(11) NOT NULL,
  `cant_errores` int(11) NOT NULL,
  `nombre` varchar(10) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `edad` int(11) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `lugar_nacimiento` varchar(10) NOT NULL,
  PRIMARY KEY (`id_nombre_equipo`,`id_numero`),
  CONSTRAINT `bateador_ibfk_1` FOREIGN KEY (`id_nombre_equipo`) REFERENCES `equipolvbp` (`id_nombre_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bateador
-- ----------------------------

/*
Navicat MySQL Data Transfer

Source Server         : brainsoftbd
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : brainsof_bd

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2011-11-14 16:27:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bateador_equipo_manager`
-- ----------------------------
DROP TABLE IF EXISTS `bateador_equipo_manager`;
CREATE TABLE `bateador_equipo_manager` (
  `id_nro_jugador` int(11) NOT NULL,
  `id_nombre_equipo` varchar(20) NOT NULL,
  `nombre_eq_manager` varchar(20) NOT NULL,
  `precio_compra` int(11) NOT NULL,
  PRIMARY KEY (`id_nro_jugador`,`id_nombre_equipo`),
  KEY `bateador_equipomanager` (`id_nombre_equipo`,`id_nro_jugador`),
  CONSTRAINT `bateador_equipo_manager_ibfk_2` FOREIGN KEY (`id_nombre_equipo`) REFERENCES `equipo_manager` (`id_nombre_equipo`),
  CONSTRAINT `bateador_equipo_manager_ibfk_1` FOREIGN KEY (`id_nombre_equipo`, `id_nro_jugador`) REFERENCES `bateador` (`id_nombre_equipo`, `id_numero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bateador_equipo_manager
-- ----------------------------

/*
Navicat MySQL Data Transfer

Source Server         : brainsoftbd
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : brainsof_bd

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2011-11-14 16:27:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `equipo_manager`
-- ----------------------------
DROP TABLE IF EXISTS `equipo_manager`;
CREATE TABLE `equipo_manager` (
  `id_nombre_equipo` varchar(10) NOT NULL,
  `id_nombre_usuario` varchar(20) NOT NULL,
  `dinero` double NOT NULL,
  `nombre_eq_roster` varchar(20) NOT NULL,
  PRIMARY KEY (`id_nombre_equipo`,`id_nombre_usuario`),
  KEY `id_nombre_equipo` (`id_nombre_equipo`),
  KEY `usuario_equipo` (`id_nombre_usuario`),
  KEY `equipomanager_roster` (`nombre_eq_roster`),
  CONSTRAINT `equipo_manager_ibfk_1` FOREIGN KEY (`id_nombre_usuario`) REFERENCES `manager` (`id_nombre_usuario`),
  CONSTRAINT `equipo_manager_ibfk_2` FOREIGN KEY (`nombre_eq_roster`) REFERENCES `roster_pitcher` (`id_nombre_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of equipo_manager
-- ----------------------------

/*
Navicat MySQL Data Transfer

Source Server         : brainsoftbd
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : brainsof_bd

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2011-11-14 16:28:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `equipolvbp`
-- ----------------------------
DROP TABLE IF EXISTS `equipolvbp`;
CREATE TABLE `equipolvbp` (
  `id_nombre_equipo` varchar(20) NOT NULL,
  `ubicacion` varchar(20) NOT NULL,
  `estadio` varchar(30) NOT NULL,
  `fecha_fundacion` date NOT NULL,
  PRIMARY KEY (`id_nombre_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of equipolvbp
-- ----------------------------

/*
Navicat MySQL Data Transfer

Source Server         : brainsoftbd
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : brainsof_bd

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2011-11-14 16:28:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `estadistica_bateador`
-- ----------------------------
DROP TABLE IF EXISTS `estadistica_bateador`;
CREATE TABLE `estadistica_bateador` (
  `id_nro_jugador` int(11) NOT NULL,
  `id_nombre_equipo` varchar(20) NOT NULL,
  `carreras_anotadas_juego` int(11) NOT NULL,
  `bases_alcanzadas_juego` int(11) NOT NULL,
  `carreras_impulsadas_juego` int(11) NOT NULL,
  `bases_robadas_juego` int(11) NOT NULL,
  `bases_por_bola_uego` int(11) NOT NULL,
  `cant_ponches_juego` int(11) NOT NULL,
  `cant_errores` int(11) NOT NULL,
  `equipo_casa` varchar(20) NOT NULL,
  `equipo_visitante` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_nombre_equipo`,`id_nro_jugador`),
  KEY `estadisticas_juego` (`equipo_casa`,`equipo_visitante`,`fecha`),
  CONSTRAINT `estadistica_bateador_ibfk_2` FOREIGN KEY (`equipo_casa`, `equipo_visitante`, `fecha`) REFERENCES `juegolvbp` (`id_nombre_e_casa`, `id_nombre_e_visitante`, `fecha`),
  CONSTRAINT `estadistica_bateador_ibfk_1` FOREIGN KEY (`id_nombre_equipo`, `id_nro_jugador`) REFERENCES `bateador` (`id_nombre_equipo`, `id_numero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of estadistica_bateador
-- ----------------------------

/*
Navicat MySQL Data Transfer

Source Server         : brainsoftbd
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : brainsof_bd

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2011-11-14 16:28:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `estadistica_pitcher`
-- ----------------------------
DROP TABLE IF EXISTS `estadistica_pitcher`;
CREATE TABLE `estadistica_pitcher` (
  `id_nro_jugador` int(11) NOT NULL,
  `id_nombre_equipo` varchar(20) NOT NULL,
  `entradas_lanzadas_juego` int(11) NOT NULL,
  `carreras_limpias_juego` int(11) NOT NULL,
  `imparables_juego` int(11) NOT NULL,
  `ponches_juego` int(11) NOT NULL,
  `bases_por_bola_juego` int(11) NOT NULL,
  `juegos_ganados_juego` int(11) NOT NULL,
  `equipo_casa` varchar(20) NOT NULL,
  `equipo_visitante` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_nro_jugador`,`id_nombre_equipo`),
  KEY `pitcher_estadisticas` (`id_nombre_equipo`,`id_nro_jugador`),
  KEY `estadisticaspitcher_juego` (`equipo_casa`,`equipo_visitante`,`fecha`),
  CONSTRAINT `estadistica_pitcher_ibfk_2` FOREIGN KEY (`equipo_casa`, `equipo_visitante`, `fecha`) REFERENCES `juegolvbp` (`id_nombre_e_casa`, `id_nombre_e_visitante`, `fecha`),
  CONSTRAINT `estadistica_pitcher_ibfk_1` FOREIGN KEY (`id_nombre_equipo`, `id_nro_jugador`) REFERENCES `pitcher` (`id_nombre_equipo`, `id_nro`),
  CONSTRAINT `pitcher_estadisticas` FOREIGN KEY (`id_nro_jugador`, `id_nombre_equipo`) REFERENCES `pitcher` (`id_nro`, `id_nombre_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of estadistica_pitcher
-- ----------------------------

/*
Navicat MySQL Data Transfer

Source Server         : brainsoftbd
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : brainsof_bd

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2011-11-14 16:28:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `invitacion_liga`
-- ----------------------------
DROP TABLE IF EXISTS `invitacion_liga`;
CREATE TABLE `invitacion_liga` (
  `id_invitacion` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(20) NOT NULL,
  `id_liga` int(11) NOT NULL,
  PRIMARY KEY (`id_invitacion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;


/*
Navicat MySQL Data Transfer

Source Server         : brainsoftbd
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : brainsof_bd

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2011-11-14 16:29:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `juegolvbp`
-- ----------------------------
DROP TABLE IF EXISTS `juegolvbp`;
CREATE TABLE `juegolvbp` (
  `id_nombre_e_casa` varchar(20) NOT NULL,
  `id_nombre_e_visitante` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  `carrera_eq_casa` int(11) NOT NULL,
  `carrera_eq_visitante` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  PRIMARY KEY (`id_nombre_e_casa`,`id_nombre_e_visitante`,`fecha`),
  KEY `equipos_participantes_juego` (`id_nombre_e_visitante`),
  KEY `temporada_juego` (`fecha_inicio`,`fecha_fin`),
  CONSTRAINT `juegolvbp_ibfk_3` FOREIGN KEY (`fecha_inicio`, `fecha_fin`) REFERENCES `temporada` (`id_fecha_inicio`, `id_fecha_fin`),
  CONSTRAINT `juegolvbp_ibfk_1` FOREIGN KEY (`id_nombre_e_casa`) REFERENCES `equipolvbp` (`id_nombre_equipo`),
  CONSTRAINT `juegolvbp_ibfk_2` FOREIGN KEY (`id_nombre_e_visitante`) REFERENCES `equipolvbp` (`id_nombre_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of juegolvbp
-- ----------------------------

/*
Navicat MySQL Data Transfer

Source Server         : brainsoftbd
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : brainsof_bd

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2011-11-14 16:29:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `liga`
-- ----------------------------
DROP TABLE IF EXISTS `liga`;
CREATE TABLE `liga` (
  `id_liga` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `es_privada` char(2) NOT NULL,
  `nombre_usuario` varchar(10) NOT NULL,
  PRIMARY KEY (`id_liga`),
  CONSTRAINT `invliga` FOREIGN KEY (`id_liga`) REFERENCES `liga` (`id_liga`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of liga
-- ----------------------------

/*
Navicat MySQL Data Transfer

Source Server         : brainsoftbd
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : brainsof_bd

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2011-11-14 16:29:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `pertenece`
-- ----------------------------
DROP TABLE IF EXISTS `pertenece`;
CREATE TABLE `pertenece` (
  `id_nombre_usuario` varchar(10) NOT NULL,
  `nombre_liga` varchar(10) NOT NULL,
  PRIMARY KEY (`nombre_liga`,`id_nombre_usuario`),
  KEY `FK_PERTENECEMANAGER` (`id_nombre_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pertenece
-- ----------------------------

/*
Navicat MySQL Data Transfer

Source Server         : brainsoftbd
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : brainsof_bd

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2011-11-14 16:29:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `peticiones`
-- ----------------------------
DROP TABLE IF EXISTS `peticiones`;
CREATE TABLE `peticiones` (
  `id_usuario_remitente` varchar(20) NOT NULL,
  `id_liga` int(11) NOT NULL,
  `id_usuario_receptor` varchar(20) NOT NULL,
  PRIMARY KEY (`id_usuario_receptor`,`id_liga`,`id_usuario_remitente`),
  KEY `peticionesmanager` (`id_usuario_remitente`),
  KEY `ligapeticion` (`id_liga`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of peticiones
-- ----------------------------

/*
Navicat MySQL Data Transfer

Source Server         : brainsoftbd
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : brainsof_bd

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2011-11-14 16:30:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `pitcher`
-- ----------------------------
DROP TABLE IF EXISTS `pitcher`;
CREATE TABLE `pitcher` (
  `id_nro` int(11) NOT NULL,
  `id_nombre_equipo` varchar(20) NOT NULL,
  `entradas_lanzadas` int(11) NOT NULL,
  `carreras_limpias` int(11) NOT NULL,
  `imparables` int(11) NOT NULL,
  `ponches` int(11) NOT NULL,
  `base_por_bola` int(11) NOT NULL,
  `juegos_ganados` int(11) NOT NULL,
  `nombre` varchar(10) NOT NULL,
  `apellido` varchar(10) NOT NULL,
  `edad` int(11) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `lugar_nacimiento` varchar(10) NOT NULL,
  PRIMARY KEY (`id_nro`,`id_nombre_equipo`),
  KEY `pitcher_equipo` (`id_nombre_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pitcher
-- ----------------------------

/*
Navicat MySQL Data Transfer

Source Server         : brainsoftbd
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : brainsof_bd

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2011-11-14 16:30:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `recibe`
-- ----------------------------
DROP TABLE IF EXISTS `recibe`;
CREATE TABLE `recibe` (
  `id_invitacion` int(11) NOT NULL AUTO_INCREMENT,
  `id_nombre_usuario` varchar(10) NOT NULL,
  PRIMARY KEY (`id_invitacion`,`id_nombre_usuario`),
  KEY `id_nombre_usuario` (`id_nombre_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of recibe
-- ----------------------------

/*
Navicat MySQL Data Transfer

Source Server         : brainsoftbd
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : brainsof_bd

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2011-11-14 16:30:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `roster_equipo_manager`
-- ----------------------------
DROP TABLE IF EXISTS `roster_equipo_manager`;
CREATE TABLE `roster_equipo_manager` (
  `id_nombre_equipo` varchar(20) NOT NULL,
  `id_nombre_usuario` varchar(20) NOT NULL,
  `id_nombre_eq_manager` varchar(20) NOT NULL,
  `precio_compra` double NOT NULL,
  PRIMARY KEY (`id_nombre_equipo`,`id_nombre_eq_manager`,`id_nombre_usuario`),
  KEY `roster_usuario` (`id_nombre_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of roster_equipo_manager
-- ----------------------------

/*
Navicat MySQL Data Transfer

Source Server         : brainsoftbd
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : brainsof_bd

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2011-11-14 16:30:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `roster_pitcher`
-- ----------------------------
DROP TABLE IF EXISTS `roster_pitcher`;
CREATE TABLE `roster_pitcher` (
  `id_nombre_equipo` varchar(20) NOT NULL,
  `precio_compra` int(11) NOT NULL,
  PRIMARY KEY (`id_nombre_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of roster_pitcher
-- ----------------------------

/*
Navicat MySQL Data Transfer

Source Server         : brainsoftbd
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : brainsof_bd

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2011-11-14 16:30:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `temporada`
-- ----------------------------
DROP TABLE IF EXISTS `temporada`;
CREATE TABLE `temporada` (
  `id_fecha_inicio` date NOT NULL,
  `id_fecha_fin` date NOT NULL,
  PRIMARY KEY (`id_fecha_inicio`,`id_fecha_fin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of temporada
-- ----------------------------
