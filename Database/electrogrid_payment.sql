-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: electrogrid
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `PaymentID` int NOT NULL,
  `UserID` int DEFAULT NULL,
  `PowerSupplierID` int DEFAULT NULL,
  `Payment_Method` varchar(100) NOT NULL,
  `Payment_Date` datetime NOT NULL,
  `Amount` decimal(5,0) NOT NULL,
  `Type` varchar(45) NOT NULL,
  `Consumption_Unit` int DEFAULT NULL,
  `NoOfUnits` int DEFAULT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `FK_UserPayments` (`UserID`),
  KEY `FK_Payment1` (`PowerSupplierID`),
  CONSTRAINT `FK_Payment` FOREIGN KEY (`UserID`) REFERENCES `user` (`userID`),
  CONSTRAINT `FK_Payment1` FOREIGN KEY (`PowerSupplierID`) REFERENCES `supplier` (`PowerSupplierID`),
  CONSTRAINT `FK_UserPayments` FOREIGN KEY (`UserID`) REFERENCES `user` (`userID`),
  CONSTRAINT `type_constraint1` CHECK (((`Type` = _utf8mb4'User') or (`Type` = _utf8mb4'Supplier')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,0,5,'online','2011-10-15 00:00:00',196,'Supplier',38,0),(2,1,0,'online','2021-10-14 00:00:00',1575,'User',34,0),(3,5,0,'online','2021-05-07 00:00:00',1265,'User',25,0),(4,0,2,'cash','2021-12-14 00:00:00',2786,'Supplier',0,60),(5,0,1,'cash','2021-02-13 00:00:00',1575,'Supplier',0,34),(6,3,0,'online','2021-08-07 00:00:00',1265,'User',25,0),(7,0,3,'cash','2021-07-07 00:00:00',1376,'Supplier',0,47),(8,0,4,'cash','2021-06-09 00:00:00',1465,'Supplier',0,27),(9,4,0,'online','2021-05-07 00:00:00',1000,'User',18,0),(10,1,0,'cash','2020-01-20 00:00:00',25,'User',100,0),(11,0,7,'cash','2021-07-16 00:00:00',2354,'Supplier',0,52),(12,0,6,'cash','2021-11-07 00:00:00',1765,'Supplier',0,38),(13,6,0,'online','2021-03-07 00:00:00',1432,'User',30,0),(14,8,0,'cash','2021-09-27 00:00:00',856,'User',20,0),(15,0,3,'online','2021-07-17 00:00:00',982,'Supplier',0,20),(16,7,0,'cash','2021-07-21 00:00:00',877,'User',17,0),(18,6,0,'online','2021-08-07 00:00:00',168,'User',25,0);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-15 20:26:58
