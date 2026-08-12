-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: localhost    Database: OnlineEvent
-- ------------------------------------------------------
-- Server version	8.0.45-0ubuntu0.24.04.1

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
-- Table structure for table `EventRegistration`
--

DROP TABLE IF EXISTS `EventRegistration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EventRegistration` (
  `idEventRegistration` int NOT NULL AUTO_INCREMENT,
  `idMember` int NOT NULL,
  `idEvent` int NOT NULL,
  `registrationDate` datetime NOT NULL,
  `registrationStatus` enum('confirmed','rejected') NOT NULL,
  PRIMARY KEY (`idEventRegistration`),
  KEY `idMember_idx` (`idMember`),
  KEY `idEvent_idx` (`idEvent`),
  CONSTRAINT `fk_event_registration_events` FOREIGN KEY (`idEvent`) REFERENCES `Events` (`idEvent`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_event_registration_members` FOREIGN KEY (`idMember`) REFERENCES `Members` (`idMember`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EventRegistration`
--

LOCK TABLES `EventRegistration` WRITE;
/*!40000 ALTER TABLE `EventRegistration` DISABLE KEYS */;
INSERT INTO `EventRegistration` VALUES (1,1,1,'2025-05-01 10:00:00','confirmed'),(2,2,1,'2025-05-01 11:00:00','confirmed'),(3,3,1,'2025-05-02 09:00:00','confirmed'),(4,4,1,'2025-05-02 14:00:00','confirmed'),(5,5,1,'2025-05-03 10:00:00','confirmed'),(6,6,1,'2025-05-03 12:00:00','confirmed'),(7,7,1,'2025-05-04 09:30:00','confirmed'),(8,8,1,'2025-05-04 15:00:00','confirmed'),(9,9,1,'2025-05-05 11:00:00','confirmed'),(10,10,1,'2025-05-05 16:00:00','confirmed'),(11,11,1,'2025-05-06 08:00:00','confirmed'),(12,12,1,'2025-05-06 13:00:00','confirmed'),(13,13,1,'2025-05-07 10:00:00','confirmed'),(14,14,1,'2025-05-07 14:30:00','confirmed'),(15,15,1,'2025-05-08 09:00:00','confirmed'),(16,16,1,'2025-05-08 11:00:00','confirmed'),(17,17,1,'2025-05-08 15:00:00','confirmed'),(18,18,1,'2025-05-09 10:00:00','confirmed'),(19,19,1,'2025-05-09 12:00:00','confirmed'),(20,20,1,'2025-05-09 14:00:00','confirmed'),(21,1,2,'2025-05-05 10:00:00','confirmed'),(22,2,2,'2025-05-06 14:00:00','confirmed'),(23,3,2,'2025-05-07 09:00:00','confirmed'),(24,4,2,'2025-05-07 16:00:00','confirmed'),(25,5,2,'2025-05-08 11:00:00','confirmed'),(26,6,2,'2025-05-08 13:00:00','confirmed'),(27,7,2,'2025-05-09 10:00:00','confirmed'),(28,8,2,'2025-05-09 15:00:00','confirmed'),(29,9,2,'2025-05-10 09:00:00','confirmed'),(30,10,2,'2025-05-10 12:00:00','confirmed'),(31,11,2,'2025-05-11 14:00:00','rejected'),(32,12,2,'2025-05-11 10:00:00','confirmed'),(33,1,5,'2025-05-15 08:00:00','confirmed'),(34,2,5,'2025-05-15 09:00:00','confirmed'),(35,3,5,'2025-05-15 10:00:00','confirmed'),(36,4,5,'2025-05-16 08:00:00','confirmed'),(37,5,5,'2025-05-16 09:00:00','confirmed'),(38,6,5,'2025-05-16 10:00:00','confirmed'),(39,7,5,'2025-05-17 08:00:00','confirmed'),(40,8,5,'2025-05-17 09:00:00','confirmed'),(41,9,5,'2025-05-17 10:00:00','confirmed'),(42,10,5,'2025-05-18 08:00:00','confirmed'),(43,11,5,'2025-05-18 09:00:00','confirmed'),(44,12,5,'2025-05-18 10:00:00','confirmed'),(45,13,5,'2025-05-19 08:00:00','confirmed'),(46,14,5,'2025-05-19 09:00:00','confirmed'),(47,15,5,'2025-05-19 10:00:00','confirmed'),(48,16,5,'2025-05-20 07:00:00','confirmed'),(49,17,5,'2025-05-20 08:00:00','confirmed'),(50,18,5,'2025-05-20 09:00:00','confirmed'),(51,19,5,'2025-05-20 10:00:00','confirmed'),(52,20,5,'2025-05-20 11:00:00','confirmed'),(53,1,6,'2025-05-18 10:00:00','confirmed'),(54,3,6,'2025-05-18 12:00:00','confirmed'),(55,5,6,'2025-05-19 09:00:00','confirmed'),(56,7,6,'2025-05-19 14:00:00','confirmed'),(57,9,6,'2025-05-19 16:00:00','confirmed'),(58,11,6,'2025-05-20 08:00:00','confirmed'),(59,13,6,'2025-05-20 10:00:00','confirmed'),(60,15,6,'2025-05-20 11:00:00','confirmed'),(61,17,6,'2025-05-20 12:00:00','confirmed'),(62,19,6,'2025-05-20 13:00:00','confirmed'),(63,2,7,'2025-05-18 11:00:00','confirmed'),(64,4,7,'2025-05-18 13:00:00','confirmed'),(65,6,7,'2025-05-19 10:00:00','confirmed'),(66,8,7,'2025-05-19 15:00:00','confirmed'),(67,10,7,'2025-05-20 09:00:00','confirmed'),(68,12,7,'2025-05-20 10:00:00','confirmed'),(69,14,7,'2025-05-20 11:00:00','confirmed'),(70,16,7,'2025-05-20 12:00:00','confirmed'),(71,18,7,'2025-05-20 13:00:00','confirmed'),(72,20,7,'2025-05-20 14:00:00','confirmed'),(73,1,8,'2025-05-19 10:00:00','confirmed'),(74,3,8,'2025-05-19 11:00:00','confirmed'),(75,5,8,'2025-05-19 12:00:00','confirmed'),(76,7,8,'2025-05-20 08:00:00','confirmed'),(77,9,8,'2025-05-20 09:00:00','confirmed'),(78,11,8,'2025-05-20 10:00:00','confirmed'),(79,13,8,'2025-05-20 11:00:00','confirmed'),(80,15,8,'2025-05-20 12:00:00','confirmed'),(81,17,8,'2025-05-20 13:00:00','confirmed'),(82,19,8,'2025-05-20 14:00:00','confirmed');
/*!40000 ALTER TABLE `EventRegistration` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-31 16:23:57
