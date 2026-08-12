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
-- Table structure for table `Events`
--

DROP TABLE IF EXISTS `Events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Events` (
  `idEvent` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `startDateNTime` datetime NOT NULL,
  `endDateNTime` datetime NOT NULL,
  `eventLink` varchar(45) DEFAULT NULL,
  `eventType` varchar(45) DEFAULT NULL,
  `idConference` int DEFAULT NULL,
  PRIMARY KEY (`idEvent`),
  KEY `fk_Events_conference_idx` (`idConference`),
  CONSTRAINT `fk_Events_conference` FOREIGN KEY (`idConference`) REFERENCES `Conferences` (`idConference`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Events`
--

LOCK TABLES `Events` WRITE;
/*!40000 ALTER TABLE `Events` DISABLE KEYS */;
INSERT INTO `Events` VALUES (1,'Как сдать курсовую без стресса','2025-05-10 10:00:00','2025-05-10 11:30:00','/webinar/1','вебинар',NULL),(2,'Практикум по SQL запросам','2025-05-12 14:00:00','2025-05-12 16:00:00','/workshop/2','практикум',NULL),(3,'Будущее онлайн-образования','2025-05-15 12:00:00','2025-05-15 13:30:00','/roundtable/3','круглый стол',NULL),(4,'Q&A сессия: отвечаю на вопросы','2025-05-18 17:00:00','2025-05-18 18:00:00','/qa/4','сессия вопрос-ответ',NULL),(5,'Ключевой доклад: Тренды IT 2025','2025-05-20 10:00:00','2025-05-20 11:30:00','/conf/it2025/keynote','доклад',1),(6,'AI в образовании','2025-05-20 12:00:00','2025-05-20 13:00:00','/conf/it2025/ai','доклад',1),(7,'Безопасность баз данных','2025-05-20 13:30:00','2025-05-20 14:30:00','/conf/it2025/security','доклад',1),(8,'Облачные технологии 2025','2025-05-21 10:00:00','2025-05-21 11:00:00','/conf/it2025/cloud','доклад',1),(9,'DevOps для начинающих','2025-05-21 11:30:00','2025-05-21 12:30:00','/conf/it2025/devops','доклад',1),(10,'Круглый стол: Итоги конференции','2025-05-22 17:00:00','2025-05-22 18:30:00','/conf/it2025/roundtable','круглый стол',1),(11,'Таргет 2025: новые возможности','2025-06-10 10:00:00','2025-06-10 11:00:00','/conf/marketing2025/target','доклад',2),(12,'Контент-стратегия на 2025-2026','2025-06-10 11:30:00','2025-06-10 12:30:00','/conf/marketing2025/content','доклад',2),(13,'Аналитика для маркетолога','2025-06-10 13:00:00','2025-06-10 14:00:00','/conf/marketing2025/analytics','доклад',2),(14,'AI в маркетинге','2025-06-11 10:00:00','2025-06-11 11:00:00','/conf/marketing2025/ai','доклад',2),(15,'SMM 2025: тренды и кейсы','2025-06-11 11:30:00','2025-06-11 12:30:00','/conf/marketing2025/smm','доклад',2),(16,'Цифровая трансформация школы','2025-09-15 10:00:00','2025-09-15 11:30:00','/conf/edu2025/digital','доклад',3),(17,'Интерактивные доски и гаджеты','2025-09-15 12:00:00','2025-09-15 13:00:00','/conf/edu2025/gadgets','доклад',3),(18,'Онлайн-курсы: как не провалиться','2025-09-16 10:00:00','2025-09-16 11:00:00','/conf/edu2025/courses','доклад',3),(19,'Оценка знаний в дистанте','2025-09-16 11:30:00','2025-09-16 12:30:00','/conf/edu2025/assessment','доклад',3);
/*!40000 ALTER TABLE `Events` ENABLE KEYS */;
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
