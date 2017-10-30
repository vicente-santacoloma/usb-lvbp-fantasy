-- MySQL dump 10.13  Distrib 5.1.56, for pfk-linux-gnu (i686)
--
-- Host: localhost    Database: brainsof_bd
-- ------------------------------------------------------
-- Server version	5.1.56-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bateador`
--

DROP TABLE IF EXISTS `bateador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bateador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `equipolvbp` int(11) NOT NULL,
  `numero` int(11) NOT NULL DEFAULT '0',
  `nombre` char(10) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `carreras_anotadas` int(11) NOT NULL DEFAULT '0',
  `bases_alcanzadas` int(11) NOT NULL DEFAULT '0',
  `carreras_impulsadas` int(11) NOT NULL DEFAULT '0',
  `bases_robadas` int(11) NOT NULL DEFAULT '0',
  `bases_por_bola` int(11) NOT NULL DEFAULT '0',
  `cant_ponches` int(11) NOT NULL DEFAULT '0',
  `cant_errores` int(11) NOT NULL DEFAULT '0',
  `apellido` char(20) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `edad` int(11) NOT NULL DEFAULT '0',
  `fecha_nacimiento` date NOT NULL DEFAULT '0000-00-00',
  `lugar_nacimiento` char(10) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `posicion` char(10) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `precio_valor` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `equipolvbp-numero` (`equipolvbp`, `numero`),
  CONSTRAINT `bateador-equipolvbp` FOREIGN KEY (`equipolvbp`) REFERENCES `equipolvbp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bateador`
--

LOCK TABLES `bateador` WRITE;
/*!40000 ALTER TABLE `bateador` DISABLE KEYS */;
/*!40000 ALTER TABLE `bateador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bateador_equipo_manager`
--

DROP TABLE IF EXISTS `bateador_equipo_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bateador_equipo_manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `equipo_manager` int(11) NOT NULL,
  `bateador` int(11) NOT NULL,
  `precio_compra` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `equipo_manager-bateador` (`equipo_manager`, `bateador`),
  KEY `bateador` (`bateador`),
  CONSTRAINT `bateador_equipo_manager-equipo_manager` FOREIGN KEY (`equipo_manager`) REFERENCES `equipo_manager` (`id`),
  CONSTRAINT `bateador_equipo_manager-bateador` FOREIGN KEY (`bateador`) REFERENCES `bateador` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bateador_equipo_manager`
--

LOCK TABLES `bateador_equipo_manager` WRITE;
/*!40000 ALTER TABLE `bateador_equipo_manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `bateador_equipo_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipo_manager`
--

DROP TABLE IF EXISTS `equipo_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipo_manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_equipo` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `manager` int(11) NOT NULL,
  `dinero` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_equipo` (`nombre_equipo`),
  KEY `manager` (`manager`),
  CONSTRAINT `equipo_manager-manager` FOREIGN KEY (`manager`) REFERENCES `manager` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo_manager`
--

LOCK TABLES `equipo_manager` WRITE;
/*!40000 ALTER TABLE `equipo_manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipo_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipolvbp`
--

DROP TABLE IF EXISTS `equipolvbp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipolvbp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_equipo_lvbp` char(25) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `ubicacion` char(20) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `estadio` char(30) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `fecha_fundacion` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_equipo_lvbp` (`nombre_equipo_lvbp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipolvbp`
--

LOCK TABLES `equipolvbp` WRITE;
/*!40000 ALTER TABLE `equipolvbp` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipolvbp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadistica_bateador`
--

DROP TABLE IF EXISTS `estadistica_bateador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estadistica_bateador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bateador` int(11) NOT NULL,
  `carreras_anotadas_juego` int(11) NOT NULL DEFAULT '0',
  `bases_alcanzadas_juego` int(11) NOT NULL DEFAULT '0',
  `carreras_impulsadas_juego` int(11) NOT NULL DEFAULT '0',
  `bases_robadas_juego` int(11) NOT NULL DEFAULT '0',
  `bases_por_bola_uego` int(11) NOT NULL DEFAULT '0',
  `cant_ponches_juego` int(11) NOT NULL DEFAULT '0',
  `cant_errores` int(11) NOT NULL DEFAULT '0',
  `juegolvbp_casa` int(11) NOT NULL DEFAULT '0',
  `juegolvbp_visitante` int(11) NOT NULL DEFAULT '0',
  `fecha` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `bateador` (`bateador`),
  KEY `juegolvbp_casa` (`juegolvbp_casa`),
  KEY `juegolvbp_visitante` (`juegolvbp_visitante`),
  CONSTRAINT `estadistica_bateador-bateador` FOREIGN KEY (`bateador`) REFERENCES `bateador` (`id`),
  CONSTRAINT `estadistica_bateador-juegolvbp_casa` FOREIGN KEY (`juegolvbp_casa`) REFERENCES `juegolvbp` (`id`),
  CONSTRAINT `estadistica_bateador-juegolvbp_visitante` FOREIGN KEY (`juegolvbp_visitante`) REFERENCES `juegolvbp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadistica_bateador`
--

LOCK TABLES `estadistica_bateador` WRITE;
/*!40000 ALTER TABLE `estadistica_bateador` DISABLE KEYS */;
/*!40000 ALTER TABLE `estadistica_bateador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadistica_pitcher`
--

DROP TABLE IF EXISTS `estadistica_pitcher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estadistica_pitcher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pitcher` int(11) NOT NULL,
  `entradas_lanzadas_juego` int(11) NOT NULL DEFAULT '0',
  `carreras_limpias_juego` int(11) NOT NULL DEFAULT '0',
  `imparables_juego` int(11) NOT NULL DEFAULT '0',
  `ponches_juego` int(11) NOT NULL DEFAULT '0',
  `bases_por_bola_juego` int(11) NOT NULL DEFAULT '0',
  `juegos_ganados_juego` int(11) NOT NULL DEFAULT '0',
  `juegolvbp_casa` int(11) NOT NULL,
  `juegolvbp_visitante` int(11) NOT NULL,
  `fecha` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pitcher` (`pitcher`),
  KEY `juegolvbp_casa` (`juegolvbp_casa`),
  KEY `juegolvbp_visitante` (`juegolvbp_visitante`),
  CONSTRAINT `estadistica_pitcher-pitcher` FOREIGN KEY (`pitcher`) REFERENCES `pitcher` (`id`),
  CONSTRAINT `estadistica_pitcher-juegolvbp_casa` FOREIGN KEY (`juegolvbp_casa`) REFERENCES `juegolvbp` (`id`),
  CONSTRAINT `estadistica_pitcher-juegolvbp_visitante` FOREIGN KEY (`juegolvbp_visitante`) REFERENCES `juegolvbp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadistica_pitcher`
--

LOCK TABLES `estadistica_pitcher` WRITE;
/*!40000 ALTER TABLE `estadistica_pitcher` DISABLE KEYS */;
/*!40000 ALTER TABLE `estadistica_pitcher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invitacion_liga`
--

DROP TABLE IF EXISTS `invitacion_liga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invitacion_liga` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` char(20) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `liga` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `liga` (`liga`),
  CONSTRAINT `invitacion_liga-liga` FOREIGN KEY (`liga`) REFERENCES `liga` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invitacion_liga`
--

LOCK TABLES `invitacion_liga` WRITE;
/*!40000 ALTER TABLE `invitacion_liga` DISABLE KEYS */;
/*!40000 ALTER TABLE `invitacion_liga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juegolvbp`
--

DROP TABLE IF EXISTS `juegolvbp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `juegolvbp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `equipolvbp_casa` int(11) NOT NULL,
  `equipolvbp_visitante` int(11) NOT NULL,
  `fecha` date NOT NULL DEFAULT '0000-00-00',
  `carrera_eq_casa` int(11) NOT NULL,
  `carrera_eq_visitante` int(11) NOT NULL,
  `temporada` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `equipolvbp_casa-equipolvbp_visitante-fecha` (`equipolvbp_casa`, `equipolvbp_visitante`, `fecha`),
  KEY `equipolvbp_visitante` (`equipolvbp_visitante`),
  KEY `temporada` (`temporada`),
  CONSTRAINT `juegolvbp-equipolvbp_casa` FOREIGN KEY (`equipolvbp_casa`) REFERENCES `equipolvbp` (`id`),
  CONSTRAINT `juegolvbp-equipolvbp_visitante` FOREIGN KEY (`equipolvbp_visitante`) REFERENCES `equipolvbp` (`id`),
  CONSTRAINT `juegolvbp-temporada` FOREIGN KEY (`temporada`) REFERENCES `temporada` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juegolvbp`
--

LOCK TABLES `juegolvbp` WRITE;
/*!40000 ALTER TABLE `juegolvbp` DISABLE KEYS */;
/*!40000 ALTER TABLE `juegolvbp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liga`
--

DROP TABLE IF EXISTS `liga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liga` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(20) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `es_privada` bit(1) NOT NULL DEFAULT b'0',
  `manager` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre-es_privada` (`nombre`, `es_privada`),
  KEY `manager` (`manager`),
  CONSTRAINT `liga-manager` FOREIGN KEY (`manager`) REFERENCES `manager` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liga`
--

LOCK TABLES `liga` WRITE;
/*!40000 ALTER TABLE `liga` DISABLE KEYS */;
/*!40000 ALTER TABLE `liga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_usuario` char(10) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `contrasena` char(50) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `nombre` char(20) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `apellido` char(20) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `fecha_nacimiento` date NOT NULL DEFAULT '0000-00-00',
  `genero` enum('---', 'Masculino', 'Femeninio') NOT NULL,
  `email` char(30) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `equipo_manager` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`nombre_usuario`),
  KEY `equipo_manager` (`equipo_manager`),
  CONSTRAINT `manager-equipo_manager` FOREIGN KEY (`equipo_manager`) REFERENCES `equipo_manager` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pertenece`
--

DROP TABLE IF EXISTS `pertenece`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pertenece` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manager` int(11) NOT NULL,
  `liga` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `manager-liga` (`manager`, `liga`),
  KEY `liga` (`liga`),
  CONSTRAINT `pertenece-manager` FOREIGN KEY (`manager`) REFERENCES `manager` (`id`),
  CONSTRAINT `pertenece-liga` FOREIGN KEY (`liga`) REFERENCES `liga` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pertenece`
--

LOCK TABLES `pertenece` WRITE;
/*!40000 ALTER TABLE `pertenece` DISABLE KEYS */;
/*!40000 ALTER TABLE `pertenece` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peticiones`
--

DROP TABLE IF EXISTS `peticiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peticiones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manager_remitente` int(11) NOT NULL,
  `manager_receptor` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `manager_remitente-manager_receptor` (`manager_remitente`, `manager_receptor`),
  KEY `manager_receptor` (`manager_receptor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peticiones`
--

LOCK TABLES `peticiones` WRITE;
/*!40000 ALTER TABLE `peticiones` DISABLE KEYS */;
/*!40000 ALTER TABLE `peticiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pitcher`
--

DROP TABLE IF EXISTS `pitcher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pitcher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `equipolvbp` int(11) NOT NULL,
  `numero` int(11) NOT NULL DEFAULT '0',
  `nombre` char(20) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `apellido` char(20) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `carreras_limpias` int(11) NOT NULL DEFAULT '0',
  `imparables` int(11) NOT NULL DEFAULT '0',
  `ponches` int(11) NOT NULL DEFAULT '0',
  `base_por_bola` int(11) NOT NULL DEFAULT '0',
  `juegos_ganados` int(11) NOT NULL DEFAULT '0',
  `edad` int(11) NOT NULL DEFAULT '0',
  `fecha_nacimiento` date NOT NULL DEFAULT '0000-00-00',
  `lugar_nacimiento` char(30) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `entradas_lanzadas` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `equipolvbp-numero` (`equipolvbp`, `numero`),
  CONSTRAINT `pitcher-equipolvbp` FOREIGN KEY (`equipolvbp`) REFERENCES `equipolvbp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pitcher`
--

LOCK TABLES `pitcher` WRITE;
/*!40000 ALTER TABLE `pitcher` DISABLE KEYS */;
/*!40000 ALTER TABLE `pitcher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recibe`
--

DROP TABLE IF EXISTS `recibe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recibe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manager` int(11) NOT NULL,
  `invitacion_liga` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `manager-invitacion_liga` (`manager`,`invitacion_liga`),
  KEY `invitacion_liga` (`invitacion_liga`),
  CONSTRAINT `recibe-manager` FOREIGN KEY (`manager`) REFERENCES `manager` (`id`),
  CONSTRAINT `recibe-invitacion_liga` FOREIGN KEY (`invitacion_liga`) REFERENCES `invitacion_liga` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recibe`
--

LOCK TABLES `recibe` WRITE;
/*!40000 ALTER TABLE `recibe` DISABLE KEYS */;
/*!40000 ALTER TABLE `recibe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roster_equipo_manager`
--

DROP TABLE IF EXISTS `roster_equipo_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roster_equipo_manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `equipo_manager` int(11) NOT NULL,
  `roster_pitcher` int(11) NOT NULL,
  `precio_compra` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `equipo_manager-roster_pitcher` (`equipo_manager`,`roster_pitcher`),
  KEY `roster_pitcher` (`roster_pitcher`),
  CONSTRAINT `roster_equipo_manager-roster_pitcher` FOREIGN KEY (`roster_pitcher`) REFERENCES `roster_pitcher` (`id`),
  CONSTRAINT `roster_equipo_manager-equipo_manager` FOREIGN KEY (`equipo_manager`) REFERENCES `equipo_manager` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roster_equipo_manager`
--

LOCK TABLES `roster_equipo_manager` WRITE;
/*!40000 ALTER TABLE `roster_equipo_manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `roster_equipo_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roster_pitcher`
--

DROP TABLE IF EXISTS `roster_pitcher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roster_pitcher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `equipolvbp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `equipolvbp` (`equipolvbp`),
  CONSTRAINT `roster_pitcher-equipolvbp` FOREIGN KEY (`equipolvbp`) REFERENCES `equipolvbp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roster_pitcher`
--

LOCK TABLES `roster_pitcher` WRITE;
/*!40000 ALTER TABLE `roster_pitcher` DISABLE KEYS */;
/*!40000 ALTER TABLE `roster_pitcher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temporada`
--

DROP TABLE IF EXISTS `temporada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temporada` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(9) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temporada`
--

LOCK TABLES `temporada` WRITE;
/*!40000 ALTER TABLE `temporada` DISABLE KEYS */;
/*!40000 ALTER TABLE `temporada` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-11-17 19:47:32
