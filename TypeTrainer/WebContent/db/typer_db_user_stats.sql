-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: typer_db
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `user_stats`
--

DROP TABLE IF EXISTS `user_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `min_wpm` double DEFAULT NULL,
  `avg_wpm` double DEFAULT NULL,
  `max_wpm` double DEFAULT NULL,
  `min_accuracy` double DEFAULT NULL,
  `avg_accuracy` double DEFAULT NULL,
  `max_accuracy` double DEFAULT NULL,
  `num_sentences` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_stats`
--

LOCK TABLES `user_stats` WRITE;
/*!40000 ALTER TABLE `user_stats` DISABLE KEYS */;
INSERT INTO `user_stats` VALUES (1,1,1,1,1,75,75,75,1),(2,2,2,2,2,75,75,75,1),(3,3,3,3,3,75,75,75,1),(4,4,4,4,4,76,76,76,1),(5,5,5,5,5,77,77,77,1),(6,6,7,7,7,76,76,76,1),(7,7,8,8,8,78,78,78,1),(8,8,5,10,15,75,82.5,90,2),(9,9,0,0,0,0,0,0,0),(10,10,0,0,0,0,0,0,0),(11,11,0,0,0,0,0,0,0),(12,12,0,0,0,0,0,0,0),(13,13,0,0,0,0,0,0,0),(14,14,0,0,0,0,0,0,0),(15,15,0,0,0,0,0,0,0),(16,16,0,0,0,0,0,0,0),(17,17,0,0,0,0,0,0,0),(18,18,0,0,0,0,0,0,0),(19,19,0,0,0,0,0,0,0),(20,20,0,0,0,0,0,0,0),(21,21,0,0,0,0,0,0,0),(22,22,0,0,0,0,0,0,0),(23,23,0,0,0,0,0,0,0),(24,24,0,0,0,0,0,0,0),(25,25,0,0,0,0,0,0,0),(26,26,0,0,0,0,0,0,0),(27,27,0,0,0,0,0,0,0),(28,28,0,0,0,0,0,0,0),(29,29,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `user_stats` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-09 23:24:25
