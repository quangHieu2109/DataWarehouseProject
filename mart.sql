-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: data_mart
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `daily_total`
--

DROP TABLE IF EXISTS `daily_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_total` (
  `id` int NOT NULL AUTO_INCREMENT,
  `total_discount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_total`
--

LOCK TABLES `daily_total` WRITE;
/*!40000 ALTER TABLE `daily_total` DISABLE KEYS */;
INSERT INTO `daily_total` VALUES (3,0.00,'2024-10-01'),(4,0.00,'2024-10-01'),(5,0.00,'2024-10-01'),(6,0.00,'2024-11-03'),(7,0.00,'9999-12-30'),(8,-15.00,'9999-12-30'),(9,0.00,'9999-12-30'),(10,-13.00,'9999-12-30');
/*!40000 ALTER TABLE `daily_total` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `log_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `message` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,'2024-12-03 05:25:20','thêm thành công'),(2,'2024-12-03 05:25:14','thêm thành công'),(3,'2024-12-03 06:32:01','Total income for 2024-10-01 is 0.00'),(4,'2024-12-04 03:11:35','Total income for 2024-10-01 is 0.00'),(5,'2024-12-04 03:11:37','Total income for 2024-10-01 is 0.00'),(6,'2024-12-04 03:12:43','Total income for 2024-10-01 is 0.00'),(7,'2024-12-07 13:32:33','Total income for 2024-11-03 is 0.00'),(8,'2024-12-07 13:38:12','Total income for 9999-12-30 is 0.00'),(9,'2024-12-07 13:39:37','Total income for 9999-12-30 is -15.00'),(10,'2024-12-07 14:04:45','Total income for 9999-12-30 is 0.00'),(11,'2024-12-07 14:05:48','Total income for 9999-12-30 is -13.00');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-07 21:36:16
