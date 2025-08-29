-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: jahed
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `curtain`
--

DROP TABLE IF EXISTS `curtain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curtain` (
  `CurtainID` int NOT NULL,
  `Type` varchar(50) NOT NULL,
  `Color` varchar(50) NOT NULL,
  `Material` varchar(50) NOT NULL,
  `Dimensions` varchar(100) NOT NULL,
  `Price` bigint NOT NULL,
  PRIMARY KEY (`CurtainID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curtain`
--

LOCK TABLES `curtain` WRITE;
/*!40000 ALTER TABLE `curtain` DISABLE KEYS */;
INSERT INTO `curtain` VALUES (12,'کرکره ای','قرمز','یشمی','4 در 3',240),(58,'پارچه ای','سیاه','کنافی','4 در 2',120),(78,'زبرا','سبز','کاغذی','4 در 5',200);
/*!40000 ALTER TABLE `curtain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustomerID` int NOT NULL,
  `Address` varchar(255) NOT NULL,
  `JoinDate` date NOT NULL,
  PRIMARY KEY (`CustomerID`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `person` (`PersonID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (899900,'قاین - میدان شیرازیز','2025-01-03'),(878289235,'قاین- دانشگاه بزرگمهر','2025-01-01');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `EmployeeID` int NOT NULL,
  `Role` varchar(50) NOT NULL,
  `Salary` bigint NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `person` (`PersonID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (74234,'مدیر',2500),(524800,'فروشنده',1500);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `OrderID` int NOT NULL,
  `CustomerID` int NOT NULL,
  `EmployeeID` int NOT NULL,
  `PeymentID` int NOT NULL,
  `OrderDate` date NOT NULL,
  `Status` varchar(50) NOT NULL,
  PRIMARY KEY (`OrderID`),
  UNIQUE KEY `PeymentID_UNIQUE` (`PeymentID`),
  KEY `employee order_idx` (`EmployeeID`),
  KEY `orders_ibfk_1` (`CustomerID`),
  KEY `peyment order_idx` (`PeymentID`),
  CONSTRAINT `employee order` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `peyment order` FOREIGN KEY (`PeymentID`) REFERENCES `peyment` (`PeymentID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (7782,899900,74234,7800,'2025-01-04','موفق'),(9890,878289235,524800,2802,'2025-01-30','درحال پردازش');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_curtain`
--

DROP TABLE IF EXISTS `order_curtain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_curtain` (
  `OrderID` int NOT NULL,
  `CurtainID` int NOT NULL,
  PRIMARY KEY (`OrderID`,`CurtainID`),
  KEY `CURTAIN_idx` (`CurtainID`),
  CONSTRAINT `CURTAIN` FOREIGN KEY (`CurtainID`) REFERENCES `curtain` (`CurtainID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ORDER` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_curtain`
--

LOCK TABLES `order_curtain` WRITE;
/*!40000 ALTER TABLE `order_curtain` DISABLE KEYS */;
INSERT INTO `order_curtain` VALUES (9890,12),(7782,58),(9890,58),(7782,78);
/*!40000 ALTER TABLE `order_curtain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `PersonID` int NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `PhoneNumber` varchar(15) NOT NULL,
  `Email` varchar(100) NOT NULL,
  PRIMARY KEY (`PersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (74234,'احسان','رحیمی','0910123124','ehshh@gmail.com'),(524800,'محمد','غفاری','09153620082','1sst@gmail.com'),(899900,'نیما','سهرابی','091327642','ffafasf@gamil.com'),(878289235,'رضا','غلامی','0910003234','hfhshf@gmail.com');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peyment`
--

DROP TABLE IF EXISTS `peyment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `peyment` (
  `PeymentID` int NOT NULL,
  `Type` varchar(45) NOT NULL,
  `Amount` bigint NOT NULL,
  `Description` varchar(250) NOT NULL,
  PRIMARY KEY (`PeymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peyment`
--

LOCK TABLES `peyment` WRITE;
/*!40000 ALTER TABLE `peyment` DISABLE KEYS */;
INSERT INTO `peyment` VALUES (2802,'حضوری',1600,'حضوری'),(7800,'اینترنتی',2500,'اینترنتی');
/*!40000 ALTER TABLE `peyment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-15 15:45:29
