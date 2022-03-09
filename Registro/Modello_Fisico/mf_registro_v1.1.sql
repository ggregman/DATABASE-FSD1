CREATE DATABASE  IF NOT EXISTS `registro` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `registro`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: registro
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_docente`
--

DROP TABLE IF EXISTS `tbl_docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_docente` (
  `CF_docente` char(16) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cognome` varchar(100) NOT NULL,
  `data_di_nascita` varchar(100) NOT NULL,
  PRIMARY KEY (`CF_docente`),
  UNIQUE KEY `CF_docente_UNIQUE` (`CF_docente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_docente`
--

LOCK TABLES `tbl_docente` WRITE;
/*!40000 ALTER TABLE `tbl_docente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_firma`
--

DROP TABLE IF EXISTS `tbl_firma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_firma` (
  `firma` blob,
  `data` date NOT NULL,
  `a_p` tinyint NOT NULL,
  `m_p` tinyint NOT NULL,
  `CF_studente` char(16) NOT NULL,
  `ID_corso` char(10) NOT NULL,
  PRIMARY KEY (`data`,`a_p`,`CF_studente`,`ID_corso`,`m_p`),
  UNIQUE KEY `CF_studente_UNIQUE` (`CF_studente`),
  UNIQUE KEY `ID_corso_UNIQUE` (`ID_corso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_firma`
--

LOCK TABLES `tbl_firma` WRITE;
/*!40000 ALTER TABLE `tbl_firma` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_firma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_lezione`
--

DROP TABLE IF EXISTS `tbl_lezione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_lezione` (
  `orario` time NOT NULL,
  `materia` varchar(100) DEFAULT NULL,
  `argomento` varchar(100) DEFAULT NULL,
  `tipologia` enum('TEORIA','ESERCITAZIONE','ACCOMPAGNAMENTO','ORIENTAMENTO') DEFAULT NULL,
  `CF_docente` char(16) NOT NULL,
  `ID_corso` char(10) NOT NULL,
  PRIMARY KEY (`orario`),
  UNIQUE KEY `CF_docente_UNIQUE` (`CF_docente`),
  UNIQUE KEY `ID_corso_UNIQUE` (`ID_corso`),
  UNIQUE KEY `orario_UNIQUE` (`orario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_lezione`
--

LOCK TABLES `tbl_lezione` WRITE;
/*!40000 ALTER TABLE `tbl_lezione` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_lezione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_presenza`
--

DROP TABLE IF EXISTS `tbl_presenza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_presenza` (
  `data` date NOT NULL,
  `ID_corso` char(10) NOT NULL,
  PRIMARY KEY (`data`,`ID_corso`),
  UNIQUE KEY `ID_corso_UNIQUE` (`ID_corso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_presenza`
--

LOCK TABLES `tbl_presenza` WRITE;
/*!40000 ALTER TABLE `tbl_presenza` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_presenza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_registro`
--

DROP TABLE IF EXISTS `tbl_registro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_registro` (
  `ID_corso` char(10) NOT NULL,
  `classe` varchar(100) NOT NULL,
  `ente` varchar(100) NOT NULL,
  `figura_professionale` varchar(100) DEFAULT NULL,
  `sede_corso` varchar(100) NOT NULL,
  `indirizzo` varchar(100) NOT NULL,
  `data_inizio` date NOT NULL,
  `data_termine` date NOT NULL,
  `durata_corso` smallint unsigned NOT NULL,
  PRIMARY KEY (`ID_corso`),
  UNIQUE KEY `ID_corso_UNIQUE` (`ID_corso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_registro`
--

LOCK TABLES `tbl_registro` WRITE;
/*!40000 ALTER TABLE `tbl_registro` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_registro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_studente`
--

DROP TABLE IF EXISTS `tbl_studente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_studente` (
  `CF_studente` char(16) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cognome` varchar(100) NOT NULL,
  `data_di_nascita` date NOT NULL,
  PRIMARY KEY (`CF_studente`),
  UNIQUE KEY `CF_studente_UNIQUE` (`CF_studente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_studente`
--

LOCK TABLES `tbl_studente` WRITE;
/*!40000 ALTER TABLE `tbl_studente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_studente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-09 15:38:05
