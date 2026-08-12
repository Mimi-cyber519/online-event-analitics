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
-- Table structure for table `CheckResponses`
--

DROP TABLE IF EXISTS `CheckResponses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CheckResponses` (
  `idResponse` int NOT NULL AUTO_INCREMENT,
  `idCheck` int NOT NULL,
  `idMember` int NOT NULL,
  `responded` tinyint(1) DEFAULT '0',
  `responseTime` datetime DEFAULT NULL,
  PRIMARY KEY (`idResponse`),
  KEY `idCheck` (`idCheck`),
  KEY `idMember` (`idMember`),
  CONSTRAINT `CheckResponses_ibfk_1` FOREIGN KEY (`idCheck`) REFERENCES `PresenceChecks` (`idCheck`),
  CONSTRAINT `CheckResponses_ibfk_2` FOREIGN KEY (`idMember`) REFERENCES `Members` (`idMember`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CheckResponses`
--

LOCK TABLES `CheckResponses` WRITE;
/*!40000 ALTER TABLE `CheckResponses` DISABLE KEYS */;
INSERT INTO `CheckResponses` VALUES (11,2,1,1,'2025-05-10 10:20:05'),(12,2,2,1,'2025-05-10 10:20:03'),(13,2,3,1,'2025-05-10 10:20:10'),(14,2,4,0,NULL),(15,2,5,1,'2025-05-10 10:20:08'),(16,3,1,1,'2025-05-10 10:50:02'),(17,3,2,0,NULL),(18,3,3,1,'2025-05-10 10:50:04'),(19,3,4,0,NULL),(20,3,5,1,'2025-05-10 10:50:01'),(21,4,1,1,'2025-05-20 10:30:03'),(22,4,2,1,'2025-05-20 10:30:05'),(23,4,3,1,'2025-05-20 10:30:02'),(24,4,4,0,NULL),(25,4,5,1,'2025-05-20 10:30:07'),(26,5,1,1,'2025-05-20 11:00:02'),(27,5,2,1,'2025-05-20 11:00:04'),(28,5,3,0,NULL),(29,5,4,0,NULL),(30,5,5,1,'2025-05-20 11:00:01');
/*!40000 ALTER TABLE `CheckResponses` ENABLE KEYS */;
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
