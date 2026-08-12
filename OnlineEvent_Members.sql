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
-- Table structure for table `Members`
--

DROP TABLE IF EXISTS `Members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Members` (
  `idMember` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `registrationDate` datetime NOT NULL,
  `role` enum('listener','speaker') DEFAULT 'listener',
  PRIMARY KEY (`idMember`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Members`
--

LOCK TABLES `Members` WRITE;
/*!40000 ALTER TABLE `Members` DISABLE KEYS */;
INSERT INTO `Members` VALUES (1,'Анна Иванова','anna@example.com','2025-01-15 10:00:00','listener'),(2,'Дмитрий Петров','dmitry@example.com','2025-01-20 14:30:00','listener'),(3,'Елена Смирнова','elena@example.com','2025-02-01 09:15:00','listener'),(4,'Максим Сидоров','maxim@example.com','2025-02-10 16:45:00','listener'),(5,'Ольга Кузнецова','olga@example.com','2025-03-05 11:20:00','listener'),(6,'Павел Новиков','pavel@example.com','2025-03-12 13:00:00','listener'),(7,'Татьяна Морозова','tatyana@example.com','2025-03-20 10:30:00','listener'),(8,'Илья Фёдоров','ilya@example.com','2025-04-01 12:00:00','listener'),(9,'Наталья Васильева','natalia@example.com','2025-04-10 15:00:00','listener'),(10,'Сергей Козлов','sergey@example.com','2025-04-15 09:00:00','listener'),(11,'Юлия Мороз','yulia@example.com','2025-04-20 11:30:00','listener'),(12,'Алексей Воробьёв','alexey@example.com','2025-05-01 14:00:00','listener'),(13,'Мария Соколова','maria@example.com','2025-05-05 10:00:00','listener'),(14,'Константин Лебедев','konstantin@example.com','2025-05-10 12:00:00','listener'),(15,'Ирина Павлова','irina@example.com','2025-05-12 09:30:00','listener'),(16,'Артём Егоров','artem@example.com','2025-05-15 16:00:00','listener'),(17,'Светлана Иванова','svetlana@example.com','2025-05-18 13:00:00','listener'),(18,'Роман Зайцев','roman@example.com','2025-05-20 11:00:00','listener'),(19,'Анастасия Тихонова','anastasia@example.com','2025-05-22 14:30:00','listener'),(20,'Владимир Кузьмин','vladimir@example.com','2025-05-25 10:00:00','listener'),(21,'Денис Смирнов','denis.smirnov@speaker.com','2025-01-10 08:00:00','speaker'),(22,'Екатерина Воронцова','ekaterina@speaker.com','2025-01-12 09:00:00','speaker'),(23,'Михаил Громов','mikhail@speaker.com','2025-02-01 10:00:00','speaker'),(24,'Антон Лавров','anton@speaker.com','2025-02-05 11:00:00','speaker'),(25,'Ольга Тихомирова','olga.t@speaker.com','2025-03-01 12:00:00','speaker');
/*!40000 ALTER TABLE `Members` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-31 16:23:56
