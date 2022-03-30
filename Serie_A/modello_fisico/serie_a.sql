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
-- Table structure for table `campionato`
--

DROP TABLE IF EXISTS `campionato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campionato` (
  `nome_campionato` varchar(50) NOT NULL,
  `stagione` char(9) NOT NULL,
  PRIMARY KEY (`nome_campionato`,`stagione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campionato`
--

LOCK TABLES `campionato` WRITE;
/*!40000 ALTER TABLE `campionato` DISABLE KEYS */;
INSERT INTO `campionato` VALUES ('Serie A','2021-2022');
/*!40000 ALTER TABLE `campionato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giocatore`
--

DROP TABLE IF EXISTS `giocatore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giocatore` (
  `nome_campionato` varchar(50) NOT NULL,
  `stagione` char(9) NOT NULL,
  `id_squadra` varchar(11) NOT NULL,
  `id_giocatore` varchar(50) NOT NULL,
  `cognome_giocatore` varchar(30) NOT NULL,
  `nome_giocatore` varchar(30) NOT NULL,
  `numero_maglia_giocatore` int unsigned NOT NULL,
  `gol_segnati` smallint unsigned NOT NULL,
  PRIMARY KEY (`id_giocatore`),
  KEY `fk_squadra_giocatore` (`id_squadra`),
  KEY `fk_campionato_giocatore` (`nome_campionato`,`stagione`),
  CONSTRAINT `fk_campionato_giocatore` FOREIGN KEY (`nome_campionato`, `stagione`) REFERENCES `campionato` (`nome_campionato`, `stagione`),
  CONSTRAINT `fk_squadra_giocatore` FOREIGN KEY (`id_squadra`) REFERENCES `squadra` (`id_squadra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giocatore`
--

LOCK TABLES `giocatore` WRITE;
/*!40000 ALTER TABLE `giocatore` DISABLE KEYS */;
INSERT INTO `giocatore` VALUES ('Serie A','2021-2022','Sassuolo','Ayhan_Kaan_5','Ayhan','Kaan',5,0),('Serie A','2021-2022','Sassuolo','Berardi_Domenico_25','Berardi','Domenico',25,14),('Serie A','2021-2022','Sassuolo','Scamacca_Gianluca_91','Scamacca','Gianluca',91,13),('Serie A','2021-2022','Spezia','Verde_Daniele_10','Verde','Daniele',10,6);
/*!40000 ALTER TABLE `giocatore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gol`
--

DROP TABLE IF EXISTS `gol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gol` (
  `nome_campionato` varchar(50) NOT NULL,
  `stagione` char(9) NOT NULL,
  `id_partita` varchar(21) NOT NULL,
  `id_squadra` varchar(11) NOT NULL,
  `id_giocatore` varchar(50) NOT NULL,
  `id_gol` int NOT NULL,
  `minuto` int NOT NULL,
  PRIMARY KEY (`id_gol`),
  KEY `fk_partita_gol` (`id_partita`),
  KEY `fk_giocatore_gol` (`id_giocatore`),
  KEY `fk_campionato_gol` (`nome_campionato`,`stagione`),
  KEY `fk_squadra_gol` (`id_squadra`),
  CONSTRAINT `fk_campionato_gol` FOREIGN KEY (`nome_campionato`, `stagione`) REFERENCES `campionato` (`nome_campionato`, `stagione`),
  CONSTRAINT `fk_giocatore_gol` FOREIGN KEY (`id_giocatore`) REFERENCES `giocatore` (`id_giocatore`),
  CONSTRAINT `fk_partita_gol` FOREIGN KEY (`id_partita`) REFERENCES `partita` (`id_partita`),
  CONSTRAINT `fk_squadra_gol` FOREIGN KEY (`id_squadra`) REFERENCES `squadra` (`id_squadra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gol`
--

LOCK TABLES `gol` WRITE;
/*!40000 ALTER TABLE `gol` DISABLE KEYS */;
INSERT INTO `gol` VALUES ('Serie A','2021-2022','1_SSL-SPZ','Sassuolo','Berardi_Domenico_25',1,17),('Serie A','2021-2022','1_SSL-SPZ','Spezia','Verde_Daniele_10',2,36),('Serie A','2021-2022','1_SSL-SPZ','Sassuolo','Berardi_Domenico_25',3,48),('Serie A','2021-2022','1_SSL-SPZ','Sassuolo','Ayhan_Kaan_5',4,78),('Serie A','2021-2022','1_SSL-SPZ','Sassuolo','Scamacca_Gianluca_91',5,81);
/*!40000 ALTER TABLE `gol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partita`
--

DROP TABLE IF EXISTS `partita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partita` (
  `nome_campionato` varchar(50) NOT NULL,
  `stagione` char(9) NOT NULL,
  `id_partita` varchar(21) NOT NULL,
  `numero_giornata` int NOT NULL,
  `data_partita` date NOT NULL,
  `id_squadra_casa` varchar(11) NOT NULL,
  `id_squadra_trasferta` varchar(11) NOT NULL,
  `punteggio_squadra_casa` int unsigned NOT NULL,
  `punteggio_squadra_trasferta` int unsigned NOT NULL,
  `stadio_partita` varchar(50) NOT NULL,
  PRIMARY KEY (`id_partita`),
  KEY `fk_campionato_partita` (`nome_campionato`,`stagione`),
  KEY `fk_squadra_casa_partita` (`id_squadra_casa`),
  KEY `fk_squadra_trasferta_partita` (`id_squadra_trasferta`),
  CONSTRAINT `fk_campionato_partita` FOREIGN KEY (`nome_campionato`, `stagione`) REFERENCES `campionato` (`nome_campionato`, `stagione`),
  CONSTRAINT `fk_squadra_casa_partita` FOREIGN KEY (`id_squadra_casa`) REFERENCES `squadra` (`id_squadra`),
  CONSTRAINT `fk_squadra_trasferta_partita` FOREIGN KEY (`id_squadra_trasferta`) REFERENCES `squadra` (`id_squadra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partita`
--

LOCK TABLES `partita` WRITE;
/*!40000 ALTER TABLE `partita` DISABLE KEYS */;
INSERT INTO `partita` VALUES ('Serie A','2021-2022','1_SSL-SPZ',30,'2022-03-18','Sassuolo','Spezia',4,1,'Mapei');
/*!40000 ALTER TABLE `partita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `squadra`
--

DROP TABLE IF EXISTS `squadra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `squadra` (
  `nome_campionato` varchar(50) NOT NULL,
  `stagione` char(9) NOT NULL,
  `id_squadra` varchar(11) NOT NULL,
  `nome_squadra` varchar(100) NOT NULL,
  `partite_giocate` tinyint unsigned NOT NULL,
  `vittorie` tinyint unsigned NOT NULL,
  `sconfitte` tinyint unsigned NOT NULL,
  `pareggi` tinyint unsigned NOT NULL,
  `gol_fatti_totali` tinyint unsigned NOT NULL,
  `gol_subiti_totali` tinyint unsigned NOT NULL,
  `differenza_gol_totale` tinyint NOT NULL,
  `punteggio` tinyint unsigned NOT NULL,
  `ultime_cinque_partite` char(5) NOT NULL,
  PRIMARY KEY (`id_squadra`),
  KEY `fk_campionato_squadra_idx` (`nome_campionato`,`stagione`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_campionato_squadra` FOREIGN KEY (`nome_campionato`, `stagione`) REFERENCES `campionato` (`nome_campionato`, `stagione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `squadra`
--

LOCK TABLES `squadra` WRITE;
/*!40000 ALTER TABLE `squadra` DISABLE KEYS */;
INSERT INTO `squadra` VALUES ('Serie A','2021-2022','Sassuolo','Unione Sportiva Sassuolo Calcio',30,11,10,9,55,49,6,43,'VPVVV'),('Serie A','2021-2022','Spezia','Spezia Calcio',30,8,5,17,31,54,-23,29,'SVSSS');
/*!40000 ALTER TABLE `squadra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statistiche`
--

DROP TABLE IF EXISTS `statistiche`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statistiche` (
  `nome_campionato` varchar(50) NOT NULL,
  `stagione` char(9) NOT NULL,
  `id_partita` char(9) NOT NULL,
  `id_squadra` varchar(11) NOT NULL,
  `id_statistiche` smallint NOT NULL,
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
  KEY `fk_campionato_statistiche` (`nome_campionato`,`stagione`),
  KEY `fk_partita_statistiche` (`id_partita`),
  KEY `fk_squadra_statistiche` (`id_squadra`),
  CONSTRAINT `fk_campionato_statistiche` FOREIGN KEY (`nome_campionato`, `stagione`) REFERENCES `campionato` (`nome_campionato`, `stagione`),
  CONSTRAINT `fk_partita_statistiche` FOREIGN KEY (`id_partita`) REFERENCES `partita` (`id_partita`),
  CONSTRAINT `fk_squadra_statistiche` FOREIGN KEY (`id_squadra`) REFERENCES `squadra` (`id_squadra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statistiche`
--

LOCK TABLES `statistiche` WRITE;
/*!40000 ALTER TABLE `statistiche` DISABLE KEYS */;
INSERT INTO `statistiche` VALUES ('Serie A','2021-2022','1_SSL-SPZ','Sassuolo',1,'C',4,16,7,59,535,85,14,2,0,1,6,'V','3'),('Serie A','2021-2022','1_SSL-SPZ','Spezia',2,'T',1,5,1,41,389,79,16,3,0,1,2,'S','0');
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

-- Dump completed on 2022-03-29 14:21:26
