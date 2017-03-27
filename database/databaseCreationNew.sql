CREATE DATABASE  IF NOT EXISTS `java3` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `java3`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: java2
-- ------------------------------------------------------
-- Server version	5.7.17

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
-- Table structure for table `customers_list`
--

DROP TABLE IF EXISTS `customers_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers_list` (
  `customers_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'код клиента',
  `customers_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`customers_id`),
  UNIQUE KEY `customers_id_UNIQUE` (`customers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_list`
--

LOCK TABLES `customers_list` WRITE;
/*!40000 ALTER TABLE `customers_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factory_order_header`
--

DROP TABLE IF EXISTS `factory_order_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_order_header` (
  `factory_order_header_id` int(11) NOT NULL AUTO_INCREMENT,
  `factory_order_date` date NOT NULL,
  `factory_order_status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `factory_order_comment` tinyblob,
  PRIMARY KEY (`factory_order_header_id`),
  UNIQUE KEY `factory_order_header_id_UNIQUE` (`factory_order_header_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factory_order_header`
--

LOCK TABLES `factory_order_header` WRITE;
/*!40000 ALTER TABLE `factory_order_header` DISABLE KEYS */;
/*!40000 ALTER TABLE `factory_order_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factory_order_lines`
--

DROP TABLE IF EXISTS `factory_order_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_order_lines` (
  `factory_order_lines_id` int(11) NOT NULL AUTO_INCREMENT,
  `factory_order_header_id` int(11) DEFAULT NULL,
  `sales_order_header_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`factory_order_lines_id`),
  UNIQUE KEY `factory_order_lines_id_UNIQUE` (`factory_order_lines_id`),
  KEY `factory_order_header_FK_idx` (`factory_order_header_id`),
  KEY `sales_order_header_id_FK_idx` (`sales_order_header_id`),
  CONSTRAINT `factory_order_header_FK` FOREIGN KEY (`factory_order_header_id`) REFERENCES `factory_order_header` (`factory_order_header_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sales_order_header_id_FK` FOREIGN KEY (`sales_order_header_id`) REFERENCES `sales_order_header` (`sales_order_header_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factory_order_lines`
--

LOCK TABLES `factory_order_lines` WRITE;
/*!40000 ALTER TABLE `factory_order_lines` DISABLE KEYS */;
/*!40000 ALTER TABLE `factory_order_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items_formula`
--

DROP TABLE IF EXISTS `items_formula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items_formula` (
  `items_formula_id` int(11) NOT NULL AUTO_INCREMENT,
  ` items_id` int(11) NOT NULL,
  ` items_qty` int(11) NOT NULL,
  `materials_id` int(11) NOT NULL,
  `materials_qty` int(11) NOT NULL,
  PRIMARY KEY (`items_formula_id`),
  UNIQUE KEY `items_formula_id_UNIQUE` (`items_formula_id`),
  KEY `items_id_FK_idx` (` items_id`),
  KEY `materials_id_FK_idx` (`materials_id`),
  CONSTRAINT `items_id_FK` FOREIGN KEY (` items_id`) REFERENCES `items_list` (`items_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `materials_id_FK` FOREIGN KEY (`materials_id`) REFERENCES `materials_list` (`materials_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items_formula`
--

LOCK TABLES `items_formula` WRITE;
/*!40000 ALTER TABLE `items_formula` DISABLE KEYS */;
/*!40000 ALTER TABLE `items_formula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items_list`
--

DROP TABLE IF EXISTS `items_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items_list` (
  `items_id` int(11) NOT NULL COMMENT 'Код товара',
  `items_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Название товара',
  PRIMARY KEY (`items_id`),
  UNIQUE KEY `items_kod_UNIQUE` (`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items_list`
--

LOCK TABLES `items_list` WRITE;
/*!40000 ALTER TABLE `items_list` DISABLE KEYS */;
INSERT INTO `items_list` VALUES (1,'булка'),(2,'пончик');
/*!40000 ALTER TABLE `items_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materials_list`
--

DROP TABLE IF EXISTS `materials_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materials_list` (
  `materials_id` int(11) NOT NULL COMMENT 'код сырья',
  `materials_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`materials_id`),
  UNIQUE KEY `id_materials_UNIQUE` (`materials_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materials_list`
--

LOCK TABLES `materials_list` WRITE;
/*!40000 ALTER TABLE `materials_list` DISABLE KEYS */;
INSERT INTO `materials_list` VALUES (1,'творог'),(2,'изюм'),(3,'мясо'),(4,'тесто'),(5,'сахар');
/*!40000 ALTER TABLE `materials_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_header`
--

DROP TABLE IF EXISTS `sales_order_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_header` (
  `sales_order_header_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) DEFAULT NULL,
  `orders_data` date NOT NULL,
  `delivery_date` date DEFAULT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `route_number` int(3) DEFAULT NULL,
  PRIMARY KEY (`sales_order_header_id`),
  UNIQUE KEY `sales_order_header_id_UNIQUE` (`sales_order_header_id`),
  KEY `customers_id_FK_idx` (`customers_id`),
  CONSTRAINT `customers_id_FK` FOREIGN KEY (`customers_id`) REFERENCES `customers_list` (`customers_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_header`
--

LOCK TABLES `sales_order_header` WRITE;
/*!40000 ALTER TABLE `sales_order_header` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_lines`
--

DROP TABLE IF EXISTS `sales_order_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_lines` (
  `sales_order_lines_id` int(11) NOT NULL,
  `sales_order_header_id` int(11) NOT NULL,
  `items_id` int(11) NOT NULL,
  `items_qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`sales_order_lines_id`),
  UNIQUE KEY `sales_order_lines_id_UNIQUE` (`sales_order_lines_id`),
  KEY `sales_order_header_FK_idx` (`sales_order_header_id`),
  KEY `items_id_FK_idx` (`items_id`),
  KEY `sales_order_items_id_FK_idx` (`items_id`),
  CONSTRAINT `sales_order_header_FK` FOREIGN KEY (`sales_order_header_id`) REFERENCES `sales_order_header` (`sales_order_header_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sales_order_items_id_FK` FOREIGN KEY (`items_id`) REFERENCES `items_list` (`items_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_lines`
--

LOCK TABLES `sales_order_lines` WRITE;
/*!40000 ALTER TABLE `sales_order_lines` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `LastName` char(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'java2'
--

--
-- Dumping routines for database 'java2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-27 18:45:54
