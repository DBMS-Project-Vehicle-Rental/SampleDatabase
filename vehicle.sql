-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: VEHICLE_RENTAL
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.16.04.1-log

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
-- Table structure for table `Booking`
--

DROP TABLE IF EXISTS `Booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Booking` (
  `Book_ID` varchar(10) NOT NULL,
  `User_ID` varchar(20) DEFAULT NULL,
  `Plate_No` varchar(10) DEFAULT NULL,
  `Book_Date` date DEFAULT NULL,
  `No_of_Days` int(11) DEFAULT NULL,
  PRIMARY KEY (`Book_ID`),
  KEY `User_ID` (`User_ID`),
  KEY `Plate_No` (`Plate_No`),
  CONSTRAINT `Booking_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `User` (`User_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Booking_ibfk_2` FOREIGN KEY (`Plate_No`) REFERENCES `VehicleDetails` (`Plate_No`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Booking`
--

LOCK TABLES `Booking` WRITE;
/*!40000 ALTER TABLE `Booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `Booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee` (
  `User_ID` varchar(20) NOT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `Email` varchar(20) DEFAULT NULL,
  `Phone_No` bigint(20) DEFAULT NULL,
  `Address` varchar(20) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  `G_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`User_ID`),
  KEY `G_ID` (`G_ID`),
  CONSTRAINT `Employee_ibfk_1` FOREIGN KEY (`G_ID`) REFERENCES `Garage` (`G_ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Garage`
--

DROP TABLE IF EXISTS `Garage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Garage` (
  `G_ID` varchar(10) NOT NULL,
  `G_Name` varchar(20) DEFAULT NULL,
  `LOCATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`G_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Garage`
--

LOCK TABLES `Garage` WRITE;
/*!40000 ALTER TABLE `Garage` DISABLE KEYS */;
/*!40000 ALTER TABLE `Garage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment`
--

DROP TABLE IF EXISTS `Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Payment` (
  `Pay_ID` varchar(10) NOT NULL,
  `User_ID` varchar(20) DEFAULT NULL,
  `Book_ID` varchar(10) DEFAULT NULL,
  `Pay_Date` date DEFAULT NULL,
  `Amount` int(11) DEFAULT NULL,
  `Method` varchar(10) DEFAULT NULL,
  `Success` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Pay_ID`),
  KEY `User_ID` (`User_ID`),
  KEY `Book_ID` (`Book_ID`),
  CONSTRAINT `Payment_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `User` (`User_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Payment_ibfk_2` FOREIGN KEY (`Book_ID`) REFERENCES `Booking` (`Book_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment`
--

LOCK TABLES `Payment` WRITE;
/*!40000 ALTER TABLE `Payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `User_ID` varchar(20) NOT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `Email` varchar(20) DEFAULT NULL,
  `Phone_No` bigint(20) DEFAULT NULL,
  `Address` varchar(20) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VehicleDetails`
--

DROP TABLE IF EXISTS `VehicleDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VehicleDetails` (
  `Plate_No` varchar(10) NOT NULL,
  `Model_Name` varchar(20) DEFAULT NULL,
  `Color` varchar(10) DEFAULT NULL,
  `G_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Plate_No`),
  KEY `Model_Name` (`Model_Name`),
  KEY `G_ID` (`G_ID`),
  CONSTRAINT `VehicleDetails_ibfk_1` FOREIGN KEY (`Model_Name`) REFERENCES `Vehicles` (`Model_Name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `VehicleDetails_ibfk_2` FOREIGN KEY (`G_ID`) REFERENCES `Garage` (`G_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VehicleDetails`
--

LOCK TABLES `VehicleDetails` WRITE;
/*!40000 ALTER TABLE `VehicleDetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `VehicleDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vehicles`
--

DROP TABLE IF EXISTS `Vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vehicles` (
  `Model_Name` varchar(20) NOT NULL,
  `Company` varchar(20) DEFAULT NULL,
  `V_Type` varchar(4) DEFAULT NULL,
  `Type` varchar(10) DEFAULT NULL,
  `Seats` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`Model_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vehicles`
--

LOCK TABLES `Vehicles` WRITE;
/*!40000 ALTER TABLE `Vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `Vehicles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-02  0:24:14
