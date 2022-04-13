CREATE DATABASE  IF NOT EXISTS `serie_a` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `serie_a`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: serie_a
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
-- Table structure for table `classifica`
--

DROP TABLE IF EXISTS `classifica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classifica` (
  `stagione` char(9) NOT NULL,
  `id_squadra` varchar(11) NOT NULL,
  `partite_giocate` tinyint unsigned NOT NULL,
  `vittorie` tinyint unsigned NOT NULL,
  `sconfitte` tinyint unsigned NOT NULL,
  `pareggi` tinyint unsigned NOT NULL,
  `punteggio` tinyint unsigned NOT NULL,
  PRIMARY KEY (`stagione`,`id_squadra`),
  KEY `fk_squadra_classifica_idx` (`id_squadra`),
  CONSTRAINT `fk_squadra_classifica` FOREIGN KEY (`id_squadra`) REFERENCES `squadra` (`id_squadra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classifica`
--

LOCK TABLES `classifica` WRITE;
/*!40000 ALTER TABLE `classifica` DISABLE KEYS */;
INSERT INTO `classifica` VALUES ('2021/2022','Sassuolo',31,11,10,10,43),('2021/2022','Spezia',31,9,17,5,32);
/*!40000 ALTER TABLE `classifica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giocatore`
--

DROP TABLE IF EXISTS `giocatore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giocatore` (
  `id_squadra` varchar(11) NOT NULL,
  `id_giocatore` varchar(50) NOT NULL,
  `cognome_giocatore` varchar(30) NOT NULL,
  `nome_giocatore` varchar(30) NOT NULL,
  `numero_maglia_giocatore` int unsigned NOT NULL,
  PRIMARY KEY (`id_giocatore`),
  KEY `fk_squadra_giocatore` (`id_squadra`),
  CONSTRAINT `fk_squadra_giocatore` FOREIGN KEY (`id_squadra`) REFERENCES `squadra` (`id_squadra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giocatore`
--

LOCK TABLES `giocatore` WRITE;
/*!40000 ALTER TABLE `giocatore` DISABLE KEYS */;
INSERT INTO `giocatore` VALUES ('Sassuolo','Ayhan_Kaan_5','Ayhan','Kaan',5),('Sassuolo','Berardi_Domenico_25','Berardi','Domenico',25),('Milan','Ibrahimovic_Zlatan_11','Ibrahimovic','Zlatan',11),('Inter','Martinez_Lautaro_10','Martinez','Lautaro',10),('Sassuolo','Scamacca_Gianluca_91','Scamacca','Gianluca',91),('Spezia','Verde_Daniele_10','Verde','Daniele',10);
/*!40000 ALTER TABLE `giocatore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gol`
--

DROP TABLE IF EXISTS `gol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gol` (
  `stagione` char(9) NOT NULL,
  `id_partita` smallint NOT NULL AUTO_INCREMENT,
  `id_squadra` varchar(11) NOT NULL,
  `id_giocatore` varchar(50) NOT NULL,
  `id_gol` int unsigned NOT NULL,
  `minuto` int NOT NULL,
  PRIMARY KEY (`id_gol`),
  KEY `fk_giocatore_gol` (`id_giocatore`),
  KEY `fk_squadra_gol` (`id_squadra`),
  KEY `fk_partita_gol_idx` (`id_partita`),
  CONSTRAINT `fk_giocatore_gol` FOREIGN KEY (`id_giocatore`) REFERENCES `giocatore` (`id_giocatore`),
  CONSTRAINT `fk_partita_gol` FOREIGN KEY (`id_partita`) REFERENCES `partita` (`id_partita`),
  CONSTRAINT `fk_squadra_gol` FOREIGN KEY (`id_squadra`) REFERENCES `squadra` (`id_squadra`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gol`
--

LOCK TABLES `gol` WRITE;
/*!40000 ALTER TABLE `gol` DISABLE KEYS */;
INSERT INTO `gol` VALUES ('2021-2022',1,'Sassuolo','Berardi_Domenico_25',1,17),('2021-2022',1,'Spezia','Verde_Daniele_10',2,36),('2021-2022',1,'Sassuolo','Berardi_Domenico_25',3,48),('2021-2022',1,'Sassuolo','Ayhan_Kaan_5',4,78),('2021-2022',1,'Sassuolo','Scamacca_Gianluca_91',5,81),('2021-2022',2,'Inter','Martinez_Lautaro_10',6,11),('2021-2022',2,'Milan','Ibrahimovic_Zlatan_11',7,17);
/*!40000 ALTER TABLE `gol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partita`
--

DROP TABLE IF EXISTS `partita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partita` (
  `stagione` char(9) NOT NULL,
  `id_partita` smallint NOT NULL AUTO_INCREMENT,
  `numero_giornata` int NOT NULL,
  `data_partita` date NOT NULL,
  `id_squadra_casa` varchar(11) NOT NULL,
  `id_squadra_trasferta` varchar(11) NOT NULL,
  PRIMARY KEY (`id_partita`),
  KEY `fk_squadra_casa_partita` (`id_squadra_casa`),
  KEY `fk_squadra_trasferta_partita` (`id_squadra_trasferta`),
  KEY `idx_data_partita` (`data_partita`),
  CONSTRAINT `fk_squadra_casa_partita` FOREIGN KEY (`id_squadra_casa`) REFERENCES `squadra` (`id_squadra`),
  CONSTRAINT `fk_squadra_trasferta_partita` FOREIGN KEY (`id_squadra_trasferta`) REFERENCES `squadra` (`id_squadra`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partita`
--

LOCK TABLES `partita` WRITE;
/*!40000 ALTER TABLE `partita` DISABLE KEYS */;
INSERT INTO `partita` VALUES ('2021-2022',1,30,'2022-03-18','Sassuolo','Spezia'),('2021-2022',2,31,'2022-03-26','Inter','Milan'),('2021-2022',3,1,'2021-08-23','Sampdoria','Milan'),('2021-2022',4,2,'2021-08-28','Juventus','Empoli'),('2021-2022',5,3,'2021-09-13','Bologna','Verona'),('2021-2022',6,4,'2021-09-19','Lazio','Cagliari'),('2021-2022',7,5,'2021-09-21','Fiorentina','Inter'),('2021-2022',8,6,'2021-09-24','Udinese','Juventus'),('2021-2022',9,7,'2021-09-29','Venezia','Torino'),('2021-2022',10,8,'2021-10-12','Milan','Genoa'),('2021-2022',11,9,'2021-10-17','Spezia','Genoa'),('2021-2022',12,10,'2021-10-21','Roma','Inter');
/*!40000 ALTER TABLE `partita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `squadra`
--

DROP TABLE IF EXISTS `squadra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `squadra` (
  `id_squadra` varchar(11) NOT NULL,
  `nome_squadra` varchar(100) NOT NULL,
  PRIMARY KEY (`id_squadra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `squadra`
--

LOCK TABLES `squadra` WRITE;
/*!40000 ALTER TABLE `squadra` DISABLE KEYS */;
INSERT INTO `squadra` VALUES ('Atalanta','Atalanta Bergamasca Calcio'),('Bologna','Bologna Football Club 1909'),('Cagliari','Cagliari Calcio'),('Empoli','Empoli Football Club'),('Fiorentina','ACF Fiorentina'),('Genoa','Genoa Cricket and Football Club'),('Inter','Internazionale'),('Juventus','Juventus Football Club'),('Lazio','Società Sportiva Calcio'),('Milan','Associazione Milan Calcio'),('Napoli','Società Sportiva Calcio Napoli'),('Roma','Associazione Sportiva Roma'),('Salernitana','Unione Sportiva Salernitana 1919'),('Sampdoria','Unione Calcio Sampdoria'),('Sassuolo','Unione Sportiva Sassuolo Calcio'),('Spezia','Spezia Calcio'),('Torino','Torino Football Club'),('Udinese','Udinese Calcio'),('Venezia','Venezia Football Club'),('Verona','Hellas Verona Football Club');
/*!40000 ALTER TABLE `squadra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statistiche`
--

DROP TABLE IF EXISTS `statistiche`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statistiche` (
  `stagione` char(9) NOT NULL,
  `id_partita` smallint NOT NULL AUTO_INCREMENT,
  `id_squadra` varchar(11) NOT NULL,
  `id_statistiche` int NOT NULL,
  `casa_trasferta` enum('C','T') NOT NULL,
  `gol_segnati` tinyint unsigned NOT NULL,
  `tiri_totali` smallint unsigned NOT NULL,
  `tiri_porta` smallint unsigned NOT NULL,
  `possesso_palla` int unsigned NOT NULL,
  `passaggi` smallint unsigned NOT NULL,
  `precisione` int unsigned NOT NULL,
  `falli` smallint unsigned NOT NULL,
  `ammonizioni` smallint unsigned NOT NULL,
  `espulsioni` smallint unsigned NOT NULL,
  `fuorigioco` smallint unsigned NOT NULL,
  `calci_angolo` smallint unsigned NOT NULL,
  `esito` enum('V','S','P') NOT NULL,
  `punti_ottenuti` enum('0','1','3') NOT NULL,
  PRIMARY KEY (`id_statistiche`),
  KEY `fk_squadra_statistiche` (`id_squadra`),
  KEY `fk_partita_statistiche_idx` (`id_partita`),
  CONSTRAINT `fk_partita_statistiche` FOREIGN KEY (`id_partita`) REFERENCES `partita` (`id_partita`),
  CONSTRAINT `fk_squadra_statistiche` FOREIGN KEY (`id_squadra`) REFERENCES `squadra` (`id_squadra`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statistiche`
--

LOCK TABLES `statistiche` WRITE;
/*!40000 ALTER TABLE `statistiche` DISABLE KEYS */;
INSERT INTO `statistiche` VALUES ('2021-2022',1,'Sassuolo',1,'C',4,16,7,59,535,85,14,2,0,1,6,'V','3'),('2021-2022',1,'Spezia',2,'T',1,5,1,41,389,79,16,3,0,1,2,'S','0'),('2021-2022',2,'Inter',3,'C',1,13,3,49,384,79,11,0,0,1,8,'P','1'),('2021-2022',2,'Milan',4,'T',1,20,4,51,402,83,16,1,0,0,4,'P','1'),('2021-2022',3,'Sampdoria',5,'C',0,16,3,49,395,78,17,3,0,3,8,'S','0'),('2021-2022',3,'Milan',6,'T',1,11,4,51,409,79,15,1,0,3,3,'V','3'),('2021-2022',4,'Juventus',7,'C',0,18,5,56,412,83,10,2,0,1,8,'S','0'),('2021-2022',4,'Empoli',8,'T',1,11,3,44,342,75,6,3,0,3,9,'V','3'),('2021-2022',5,'Bologna',9,'C',1,15,3,41,318,73,14,1,0,0,6,'V','3'),('2021-2022',5,'Verona',10,'T',0,5,0,59,454,81,21,3,0,2,2,'S','0'),('2021-2022',6,'Lazio',11,'C',2,28,10,74,686,88,3,1,0,1,10,'P','1'),('2021-2022',6,'Cagliari',12,'T',2,10,3,26,256,65,11,1,1,4,1,'P','1'),('2021-2022',7,'Fiorentina',13,'C',1,14,6,53,497,87,11,0,1,1,4,'S','0'),('2021-2022',7,'Inter',14,'T',3,17,5,47,429,85,15,3,0,1,8,'V','3'),('2021-2022',8,'Udinese',15,'C',1,12,2,52,505,86,22,2,1,1,6,'V','3'),('2021-2022',8,'Juventus',16,'T',0,8,3,48,469,83,8,1,0,2,6,'S','0'),('2021-2022',9,'Venezia',17,'C',1,7,1,43,360,74,9,1,0,2,4,'P','1'),('2021-2022',9,'Torino',18,'T',1,8,3,57,474,81,18,2,1,1,1,'P','1'),('2021-2022',10,'Milan',19,'C',1,10,4,49,368,78,15,2,0,0,9,'V','3'),('2021-2022',10,'Genoa',20,'T',0,18,3,51,383,80,18,17,0,0,9,'S','0'),('2021-2022',11,'Spezia',21,'C',2,18,5,58,443,77,13,2,0,5,10,'V','3'),('2021-2022',11,'Genoa',22,'T',1,15,4,42,327,69,15,3,0,2,2,'S','0'),('2021-2022',12,'Roma',23,'C',3,19,8,53,565,92,13,3,1,0,7,'V','3'),('2021-2022',12,'Inter',24,'T',1,12,4,47,503,86,12,6,0,0,3,'S','0');
/*!40000 ALTER TABLE `statistiche` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-13 13:27:34
