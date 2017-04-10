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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `f_name` varchar(45) DEFAULT NULL,
  `l_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `user_type` varchar(45) DEFAULT NULL,
  `user_lang` varchar(45) DEFAULT NULL,
  `join_date` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'sigl0003','6368bb2c5c4e974b9b377ceacd184e5e','James','Sigler','jamussigler@algonquinlive.com','admin','english',NULL,NULL),(2,'rice0061','317c22ba7cb17d9a721190a3ad92d90e','Cameron','Rice','rice0061@algonquinlive.com','admin','english',NULL,NULL),(3,'attf0006','5184ee6c419bba0370ceab5b0aa99afa','Gary','Attfield','attf0006@algonquinlive.com','admin','english',NULL,NULL),(4,'testuser1','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake@email.com','user','english',NULL,NULL),(5,'testuser2','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake1@email.com','user','english',NULL,NULL),(6,'testuser3','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake2@email.com','user','english',NULL,NULL),(7,'testuser4','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake3@email.com','user','english',NULL,NULL),(8,'testuser5','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake4@email.com','user','english',NULL,NULL),(9,'testuser6','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake5@email.com','user','english',NULL,NULL),(10,'testuser7','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake6@email.com','user','english',NULL,NULL),(11,'testuser8','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake7@email.com','user','english',NULL,NULL),(12,'testuser9','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake8@email.com','user','english',NULL,NULL),(13,'testuser10','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake9@email.com','user','english',NULL,NULL),(14,'testuser11','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake10@email.com','user','english',NULL,NULL),(15,'testuser12','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake11@email.com','user','english',NULL,NULL),(16,'testuser13','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake12@email.com','user','english',NULL,NULL),(17,'testuser14','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake13@email.com','user','english',NULL,NULL),(18,'testuser15','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake14@email.com','user','english',NULL,NULL),(19,'testuser16','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake15@email.com','user','english',NULL,NULL),(20,'testuser17','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake16@email.com','user','english',NULL,NULL),(21,'testuser18','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake17@email.com','user','english',NULL,NULL),(22,'testuser19','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake18@email.com','user','english',NULL,NULL),(23,'testuser20','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake19@email.com','user','english',NULL,NULL),(24,'testuser21','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake20@email.com','user','english',NULL,NULL),(25,'testuser22','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake21@email.com','user','english',NULL,NULL),(26,'testuser23','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake22@email.com','user','english',NULL,NULL),(27,'testuser24','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake23@email.com','user','english',NULL,NULL),(28,'testuser25','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake24@email.com','user','english',NULL,NULL),(29,'testuser26','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake25@email.com','user','english',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
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
