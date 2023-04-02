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
-- Table structure for table `category_info`
--

DROP TABLE IF EXISTS `category_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_info` (
  `category_info_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_info`
--

LOCK TABLES `category_info` WRITE;
/*!40000 ALTER TABLE `category_info` DISABLE KEYS */;
INSERT INTO `category_info` VALUES (1,'Main 1'),(2,'Main 2'),(3,'SETMENU 1'),(4,'SET MEMU 2'),(5,'Beverage 1'),(6,'DESSERT 1');
/*!40000 ALTER TABLE `category_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `order_detail_id` int NOT NULL AUTO_INCREMENT,
  `product_info_id` int NOT NULL,
  `order_info_id` int NOT NULL,
  `status` varchar(45) NOT NULL,
  `quantity` int NOT NULL,
  `price` double NOT NULL,
  `comment` text NOT NULL,
  `started_time` datetime NOT NULL,
  `last_updated_time` datetime DEFAULT NULL,
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
-- Table structure for table `order_info`
--

DROP TABLE IF EXISTS `order_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_info` (
  `order_info_id` int NOT NULL AUTO_INCREMENT,
  `table_info_id` varchar(45) NOT NULL,
  `receipt_json` text NOT NULL,
  `order_type` varchar(255) DEFAULT NULL,
  `status` varchar(45) NOT NULL,
  `amount` double DEFAULT NULL,
  `start_time` datetime NOT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  PRIMARY KEY (`order_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_info`
--

LOCK TABLES `order_info` WRITE;
/*!40000 ALTER TABLE `order_info` DISABLE KEYS */;
INSERT INTO `order_info` VALUES (1,'1','','Dine-In','Cook',20,'2023-03-29 00:00:00','2023-03-29 00:00:00');
/*!40000 ALTER TABLE `order_info` ENABLE KEYS */;
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
  `category_info_id` int DEFAULT NULL,
  `location_page` int DEFAULT NULL,
  `location_row` int DEFAULT NULL,
  `location_column` int DEFAULT NULL,
  `stock` int NOT NULL DEFAULT '0',
  `image_path` text,
  `is_available` tinyint DEFAULT '1',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (10,'Beef 50G',NULL,10,'main',1,1,1,1,10,'1127674.jpg',1),(11,'Beef 100G',NULL,10,'main',1,1,1,2,10,'download.png',1),(12,'Pork 50G',NULL,10,'main',1,2,1,1,10,'images.jpg',1),(13,'Pork 100G',NULL,10,'main',1,2,1,2,10,'line-stickers.png',1),(14,'Chicken 50G',NULL,10,'main',2,1,1,1,10,'maxresdefault.jpg',1),(15,'Chicken 100G',NULL,10,'main',2,1,1,2,10,'1127674.jpg',1),(16,'Vegetable 50G',NULL,10,'main',2,1,2,1,10,'download.png',1),(17,'Vegetable 100G',NULL,10,'main',2,1,2,2,10,'line-stickers.png',1),(18,'Ride 20G',NULL,10,'main',2,2,1,1,10,'maxresdefault.jpg',1),(19,'Ride 50G',NULL,10,'main',2,2,1,2,10,'1127674.jpg',1),(20,'Rice 100G',NULL,10,'main',2,2,2,1,10,'line-stickers.png',1),(21,'Set Menu Pork',NULL,10,'main',3,1,1,1,10,'1127674.jpg',1),(22,'Set Menu Chicken',NULL,10,'main',3,1,1,2,10,'maxresdefault.jpg',1),(23,'Set Menu Beef',NULL,10,'main',4,1,1,1,10,'download.png',1),(24,'Set Menu Premium',NULL,10,'main',4,2,2,1,10,'images.jpg',1),(25,'Coke',NULL,10,'main',5,2,1,1,10,'images.jpg',1),(26,'Dessert',NULL,10,'main',6,1,1,1,10,'images.jpg',1);
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
  `order_info_id` int NOT NULL,
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
-- Table structure for table `table_info`
--

DROP TABLE IF EXISTS `table_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_info` (
  `table_info_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`table_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_info`
--

LOCK TABLES `table_info` WRITE;
/*!40000 ALTER TABLE `table_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `table_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-02 10:57:47
