-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: smooth_yakiniku
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `table_id` int NOT NULL,
  `receipt` json NOT NULL,
  `amount` float NOT NULL DEFAULT '0',
  `order_type` varchar(255) NOT NULL DEFAULT 'Dine-In',
  `start_time` datetime NOT NULL,
  `status` varchar(45) NOT NULL,
  `last_updated_time` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `order_detail_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `order_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` double NOT NULL,
  `comment` text NOT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  `order_at` datetime DEFAULT NULL,
  PRIMARY KEY (`order_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `price` float NOT NULL DEFAULT '0',
  `food_type` varchar(255) NOT NULL DEFAULT 'main',
  `category_id` int DEFAULT '1',
  `location_page` int DEFAULT '0',
  `location_row` int DEFAULT '0',
  `location_column` int DEFAULT '0',
  `imge_path` text,
  `stock` int NOT NULL DEFAULT '0',
  `is_available` tinyint DEFAULT '1',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Beef 50G',NULL,10,'main',1,0,0,0,NULL,10,1),(2,'Beef 100G',NULL,10,'main',1,0,0,0,NULL,10,1),(3,'Beef 150G',NULL,10,'main',1,0,0,0,NULL,10,1),(4,'Rice 50G',NULL,10,'main',1,0,0,0,NULL,10,1),(5,'Rice 100G',NULL,10,'main',1,0,0,0,NULL,10,1),(6,'Rice 150G',NULL,10,'main',1,0,0,0,NULL,10,1),(7,'Set Menu 1',NULL,10,'set_menu',1,0,0,0,NULL,10,1),(8,'Set Menu 1',NULL,10,'set_menu',1,0,0,0,NULL,10,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_current_state`
--

DROP TABLE IF EXISTS `table_current_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_current_state` (
  `table_current_state_id` int NOT NULL AUTO_INCREMENT,
  `name` int NOT NULL,
  `status` varchar(45) NOT NULL,
  `order_id` int NOT NULL,
  PRIMARY KEY (`table_current_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_current_state`
--

LOCK TABLES `table_current_state` WRITE;
/*!40000 ALTER TABLE `table_current_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `table_current_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_detail`
--

DROP TABLE IF EXISTS `table_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_detail` (
  `table_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_detail`
--

LOCK TABLES `table_detail` WRITE;
/*!40000 ALTER TABLE `table_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `table_detail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-19 23:26:48
