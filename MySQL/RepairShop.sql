-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: REDACTED    Database: REDACTED
-- ------------------------------------------------------
-- Server version	8.0.23

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `pa_customers`
--

DROP TABLE IF EXISTS `pa_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pa_customers` (
  `customerId` mediumint NOT NULL AUTO_INCREMENT,
  `firstName` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `lastName` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `zip` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phoneNumber` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `military` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`customerId`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_customers`
--

LOCK TABLES `pa_customers` WRITE;
/*!40000 ALTER TABLE `pa_customers` DISABLE KEYS */;
INSERT INTO `pa_customers` VALUES (1,'Stephanie ','Webb','93812','kirsten98@gmail.com','915-667-8124','Y'),(2,'Melvin ','Floyd','93827','jessy39@hotmail.com','573-996-4872','N'),(3,'Simon','Pierce',NULL,'maurice27@yahoo.com','713-394-6594','Y'),(4,'Hugo','Bennett',NULL,'josianne.schaefer@yahoo.com','901-330-9165','N'),(5,'Garrett','Maldonado',NULL,'tomasa55@hotmail.com','815-654-0618','Y'),(6,'Salvador','Gibbs','90210','jackson_balistreri5@gmail.com','315-582-7705','N'),(18,'santa ','north','92111','santa@northpole.com','121-121-1223','Y'),(19,'santa','guy','90210','santaguy@northpole.org','209-218-3686','N'),(20,'testy','mctester','90210','testymc@test.com','209-220-9691','Y'),(22,'juan','doe',NULL,'juan@hotmail.com','121321231','Y'),(23,'testing','test',NULL,'test@test.com','999-999-9999','N');
/*!40000 ALTER TABLE `pa_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pa_products`
--

DROP TABLE IF EXISTS `pa_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pa_products` (
  `productId` mediumint NOT NULL AUTO_INCREMENT,
  `productName` varchar(25) NOT NULL,
  `productType` varchar(25) NOT NULL,
  `productBrand` varchar(25) NOT NULL,
  PRIMARY KEY (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_products`
--

LOCK TABLES `pa_products` WRITE;
/*!40000 ALTER TABLE `pa_products` DISABLE KEYS */;
INSERT INTO `pa_products` VALUES (1,'ipad','tablet','Apple'),(2,'iphone','phone','Apple'),(3,'iwatch','watch','Apple'),(4,'ipadPro','tablet','Apple'),(5,'ipadMini','tablet','Apple'),(6,'ipadAir','tablet','Apple'),(7,'macbook','laptop','Apple'),(8,'macbookPro','laptop','Apple'),(9,'imac','desktop','Apple'),(10,'macStudio','desktop','Apple'),(11,'macPro','desktop','Apple'),(12,'macMini','desktop','Apple'),(20,'alienware','desktop','Alienware');
/*!40000 ALTER TABLE `pa_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pa_requests`
--

DROP TABLE IF EXISTS `pa_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pa_requests` (
  `requestId` mediumint NOT NULL AUTO_INCREMENT,
  `productId` mediumint NOT NULL,
  `customerId` mediumint NOT NULL,
  `timeRequested` date NOT NULL,
  `timeFilled` date DEFAULT NULL,
  `technicianId` mediumint NOT NULL,
  `description` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `repair` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`requestId`),
  KEY `customerId_idx` (`customerId`),
  KEY `productId_idx` (`productId`),
  KEY `technicianId_idx` (`technicianId`),
  CONSTRAINT `customerId` FOREIGN KEY (`customerId`) REFERENCES `pa_customers` (`customerId`),
  CONSTRAINT `productId` FOREIGN KEY (`productId`) REFERENCES `pa_products` (`productId`),
  CONSTRAINT `technicianId` FOREIGN KEY (`technicianId`) REFERENCES `pa_technicians` (`technicianId`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_requests`
--

LOCK TABLES `pa_requests` WRITE;
/*!40000 ALTER TABLE `pa_requests` DISABLE KEYS */;
INSERT INTO `pa_requests` VALUES (1,4,1,'2022-08-01','0000-00-00',3,'Cracked Screen',''),(2,5,2,'2022-07-26','2022-08-03',1,'Chipped button','Replaced with 3rd party button'),(3,3,4,'2022-09-02',NULL,1,'Not Charging',''),(4,6,1,'2012-06-01','2022-08-07',2,'Not working','Repaired circuit board'),(6,5,6,'2022-08-03','0000-00-00',2,'screen black',''),(8,9,4,'2022-08-02',NULL,4,'Water damage',''),(9,20,19,'2022-08-10',NULL,3,'',''),(10,20,19,'2022-08-10',NULL,3,'',''),(11,12,4,'2022-08-10',NULL,4,'',''),(12,12,4,'2022-08-10',NULL,4,'',''),(13,12,4,'2022-08-10',NULL,4,'',''),(14,12,4,'2022-08-10',NULL,4,'',''),(15,12,4,'2022-08-10',NULL,4,'',''),(16,12,4,'2022-08-10',NULL,4,'',''),(17,12,4,'2022-08-10',NULL,4,'',''),(18,12,4,'2022-08-10',NULL,4,'',''),(19,12,4,'2022-08-10','0000-00-00',4,'','more notes.'),(20,11,19,'2022-08-10',NULL,3,'',''),(21,11,19,'2022-08-10','2022-08-11',3,'','Removed Bigmac'),(22,11,19,'2022-08-10',NULL,3,'',''),(23,11,19,'2022-08-10',NULL,3,'',''),(24,20,6,'2022-08-10',NULL,7,'',''),(25,10,4,'2022-08-11',NULL,10,'overheat',''),(26,9,4,'2022-08-12','2022-08-11',6,'Bigmac hit my imac','Removed Bigmac'),(27,9,22,'2022-08-12',NULL,6,'blah','');
/*!40000 ALTER TABLE `pa_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pa_technicians`
--

DROP TABLE IF EXISTS `pa_technicians`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pa_technicians` (
  `technicianId` mediumint NOT NULL AUTO_INCREMENT,
  `firstName` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lastName` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `zip` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phoneNumber` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `military` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`technicianId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_technicians`
--

LOCK TABLES `pa_technicians` WRITE;
/*!40000 ALTER TABLE `pa_technicians` DISABLE KEYS */;
INSERT INTO `pa_technicians` VALUES (1,'Walter','White','11791','29sgkk0@asifboot.com','209-200-2516','Y'),(2,'Jesse','Pinkman','45140','cal38jr@cuedigy.com','209-202-3916','N'),(3,'Joe','Flowers','52001','juju100gata@aenikaufa.com','209-205-6101','N'),(4,'Dominik','Joash','06611','mariaa@buzzcol.com','209-207-1786','Y'),(6,'Tiberius','Benton','06405','nastyano@thecirchotelhollywood.com','209-210-3287','N'),(7,'Waldemar','Emrik','43040','galawad@aenikaufa.com','209-213-2432','Y'),(10,'test','test','94949','test@test.com','333-333-2221','N'),(11,'test','test','93939','test@test.com','888-888-2222','Y'),(12,'test','test','93939','test@test.com','888-888-2222','Y'),(13,'test2','test2','00000','test@test.com','555-555-5555','N');
/*!40000 ALTER TABLE `pa_technicians` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pa_users`
--

DROP TABLE IF EXISTS `pa_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pa_users` (
  `userId` tinyint NOT NULL AUTO_INCREMENT,
  `username` varchar(8) NOT NULL,
  `password` varchar(72) NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_users`
--

LOCK TABLES `pa_users` WRITE;
/*!40000 ALTER TABLE `pa_users` DISABLE KEYS */;
INSERT INTO `pa_users` VALUES (1,'otter','$2a$10$SbvffEG5PNef.EUJF7Hc5uJw.v09MKHx/27d63B38bP971s3RAbBC'),(2,'justin','$2a$12$Q5CYF3r8LsHgIHSe1MEjVOvj1vX3/4XGV7vs/HvOj6mpi6YsGVXnO'),(3,'David','$2a$12$pauhc1giZhNdDXTCG1n6duMVM1HqpsMccUz78/.7wlOBKGie1Lg6i'),(4,'ryan','$2a$12$nTnGIHRSx9TZs2J3SkVx4./fgP4ozKtUadxUJgU1mtXxrFyXUq.Hu'),(5,'anna','$2a$12$A.QA06SUNh37QNK/pYs46OH9hnir8yyjvG/Yy.nh/4FK6zMvT/3zu'),(19,'test333','$2b$10$UtX5KrITwlimv3qzArtvfe0AwrEwp1bOIubFAWfaBtB6WAx8zdf5O'),(20,'','$2b$10$8.5bXxseTVOtEThv1hqcu.vNmrV4xSRYx1TL6YAt1XTlR4wGN9s3u'),(21,'parker','$2b$10$5jPrYLTIDOPkWjMHQ7kFuuaKdo7MKfslhr0kD4mCC/koJepj9Umiq'),(22,'1234','$2b$10$7hSG50Xy16rcrHK/wuaPLu7IpHVnmeQrj.FJhjGgmixw2PJlclhUO');
/*!40000 ALTER TABLE `pa_users` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-11 21:30:21
