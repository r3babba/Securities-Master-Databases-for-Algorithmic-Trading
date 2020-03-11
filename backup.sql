-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: securities_master_db
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `daily_price`
--

DROP TABLE IF EXISTS `daily_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_price` (
  `id` int(11) NOT NULL,
  `Open` decimal(10,0) DEFAULT NULL,
  `High` decimal(10,0) DEFAULT NULL,
  `Low` decimal(10,0) DEFAULT NULL,
  `Close` decimal(10,0) DEFAULT NULL,
  `Adj_Close` decimal(10,0) DEFAULT NULL,
  `Volume` int(11) DEFAULT NULL,
  `price_date` date DEFAULT NULL,
  `ticker` varchar(32) NOT NULL,
  `data_vendor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `data_vendor_id` (`data_vendor_id`),
  KEY `ticker` (`ticker`),
  CONSTRAINT `daily_price_ibfk_1` FOREIGN KEY (`data_vendor_id`) REFERENCES `data_vendor` (`id`),
  CONSTRAINT `daily_price_ibfk_2` FOREIGN KEY (`ticker`) REFERENCES `symbol` (`ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_price`
--

LOCK TABLES `daily_price` WRITE;
/*!40000 ALTER TABLE `daily_price` DISABLE KEYS */;
INSERT INTO `daily_price` VALUES (1,209,209,207,207,202,2121700,'0000-00-00',' MMM',1),(2,107,108,107,108,106,3295800,'0000-00-00',' AXP',1),(3,174,175,173,173,171,28215400,'0000-00-00','AAPL',1),(4,439,441,437,440,432,5063100,'0000-00-00',' BA',1),(5,139,139,137,137,133,4024000,'0000-00-00',' CAT',1),(6,120,120,118,120,116,6406500,'0000-00-00',' CVX',1),(7,52,52,51,52,50,30708500,'0000-00-00','CSCO',1),(8,45,46,45,45,44,22533900,'0000-00-00',' KO',1),(9,79,80,79,79,76,14597900,'0000-00-00',' XOM',1),(10,198,198,196,197,194,2964300,'0000-00-00',' GS',1),(11,184,185,183,185,180,8060600,'0000-00-00',' HD',1),(12,139,139,138,138,133,3457800,'0000-00-00',' IBM',1),(13,53,53,53,53,52,18388800,'0000-00-00','INTC',1),(14,136,138,136,137,134,10133200,'0000-00-00',' JNJ',1),(15,105,105,104,104,101,15156900,'0000-00-00',' JPM',1),(16,182,184,182,184,181,3297900,'0000-00-00',' MCD',1),(17,81,82,81,81,79,11057600,'0000-00-00',' MRK',1),(18,112,113,112,112,111,29083900,'0000-00-00','MSFT',1),(19,86,86,86,86,85,4988100,'0000-00-00',' NKE',1),(20,43,44,43,43,42,37004200,'0000-00-00',' PFE',1),(21,99,99,98,99,96,10575400,'0000-00-00',' PG',1),(22,133,133,132,133,130,1739700,'0000-00-00',' TRV',1),(23,250,252,239,242,238,11034300,'0000-00-00',' UNH',1),(24,127,127,126,126,124,4416200,'0000-00-00',' UTX',1),(25,57,58,57,57,55,15743000,'0000-00-00',' VZ',1),(26,147,149,147,148,147,6250200,'0000-00-00',' V',1),(27,98,99,98,99,97,11375900,'0000-00-00',' WMT',1),(28,71,72,71,71,69,7775000,'0000-00-00','WBA',1),(29,113,113,113,113,111,6716700,'0000-00-00',' DIS',1);
/*!40000 ALTER TABLE `daily_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_vendor`
--

DROP TABLE IF EXISTS `data_vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_vendor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `website_url` varchar(255) DEFAULT NULL,
  `support_email` varchar(255) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `last_updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_vendor`
--

LOCK TABLES `data_vendor` WRITE;
/*!40000 ALTER TABLE `data_vendor` DISABLE KEYS */;
INSERT INTO `data_vendor` VALUES (1,'Yahoo Finance','https://finance.yahoo.com/','','2020-02-03 11:45:44','2020-02-03 11:45:44');
/*!40000 ALTER TABLE `data_vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exchange`
--

DROP TABLE IF EXISTS `exchange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exchange` (
  `id` int(11) NOT NULL,
  `abbrev` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `currency` varchar(64) DEFAULT NULL,
  `timezone_offset` time DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `last_updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exchange`
--

LOCK TABLES `exchange` WRITE;
/*!40000 ALTER TABLE `exchange` DISABLE KEYS */;
INSERT INTO `exchange` VALUES (1,'NYSE','New York Stock Exchange','New York City','US','USD','04:00:00','2020-02-03 11:42:09','2020-02-03 11:42:09'),(2,'NASDAQ','National Association of Securities Dealers Automated Quotations','New York City','US','USD','04:00:00','2020-02-03 11:42:20','2020-02-03 11:42:20');
/*!40000 ALTER TABLE `exchange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `symbol`
--

DROP TABLE IF EXISTS `symbol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `symbol` (
  `id` int(11) NOT NULL,
  `exchange_id` int(11) DEFAULT NULL,
  `ticker` varchar(32) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sector` varchar(255) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `last_updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exchange_id` (`exchange_id`),
  KEY `ticker` (`ticker`),
  CONSTRAINT `symbol_ibfk_1` FOREIGN KEY (`exchange_id`) REFERENCES `exchange` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `symbol`
--

LOCK TABLES `symbol` WRITE;
/*!40000 ALTER TABLE `symbol` DISABLE KEYS */;
INSERT INTO `symbol` VALUES (1,1,' MMM','3M','Conglomerate','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,1,' AXP','American Express','Financial services','0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,2,'AAPL','Apple Inc.','Information technology','0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,1,' BA','Boeing','Aerospace manufacturer and Arms industry','0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,1,' CAT','Caterpillar Inc.','Construction and Mining','0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,1,' CVX','Chevron Corporation','Petroleum industry','0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,2,'CSCO','Cisco Systems','Information technology','0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,1,' KO','The Coca-Cola Company','Food industry','0000-00-00 00:00:00','0000-00-00 00:00:00'),(9,1,' DOW','Dow Inc.','Chemical industry','0000-00-00 00:00:00','0000-00-00 00:00:00'),(10,1,' XOM','ExxonMobil','Petroleum industry','0000-00-00 00:00:00','0000-00-00 00:00:00'),(11,1,' GS','Goldman Sachs','Financial services','0000-00-00 00:00:00','0000-00-00 00:00:00'),(12,1,' HD','The Home Depot','Retailing','0000-00-00 00:00:00','0000-00-00 00:00:00'),(13,1,' IBM','IBM','Information technology','0000-00-00 00:00:00','0000-00-00 00:00:00'),(14,2,'INTC','Intel','Information technology','0000-00-00 00:00:00','0000-00-00 00:00:00'),(15,1,' JNJ','Johnson & Johnson','Pharmaceutical industry','0000-00-00 00:00:00','0000-00-00 00:00:00'),(16,1,' JPM','JPMorgan Chase','Financial services','0000-00-00 00:00:00','0000-00-00 00:00:00'),(17,1,' MCD','McDonald\'s','Food industry','0000-00-00 00:00:00','0000-00-00 00:00:00'),(18,1,' MRK','Merck & Co.','Pharmaceutical industry','0000-00-00 00:00:00','0000-00-00 00:00:00'),(19,2,'MSFT','Microsoft','Information technology','0000-00-00 00:00:00','0000-00-00 00:00:00'),(20,1,' NKE','Nike','Apparel','0000-00-00 00:00:00','0000-00-00 00:00:00'),(21,1,' PFE','Pfizer','Pharmaceutical industry','0000-00-00 00:00:00','0000-00-00 00:00:00'),(22,1,' PG','Procter & Gamble','Fast moving consumer goods','0000-00-00 00:00:00','0000-00-00 00:00:00'),(23,1,' TRV','The Travelers Companies','Financial services','0000-00-00 00:00:00','0000-00-00 00:00:00'),(24,1,' UNH','UnitedHealth Group','Managed health care','0000-00-00 00:00:00','0000-00-00 00:00:00'),(25,1,' UTX','United Technologies','Conglomerate','0000-00-00 00:00:00','0000-00-00 00:00:00'),(26,1,' VZ','Verizon','Telecommunication','0000-00-00 00:00:00','0000-00-00 00:00:00'),(27,1,' V','Visa Inc.','Financial services','0000-00-00 00:00:00','0000-00-00 00:00:00'),(28,1,' WMT','Walmart','Retailing','0000-00-00 00:00:00','0000-00-00 00:00:00'),(29,2,'WBA','Walgreens Boots Alliance','Retailing','0000-00-00 00:00:00','0000-00-00 00:00:00'),(30,1,' DIS','The Walt Disney Company','Broadcasting and entertainment','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `symbol` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-03 22:29:36
