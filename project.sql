-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: localhost    Database: PROJECT
-- ------------------------------------------------------
-- Server version	5.7.19-0ubuntu0.16.04.1

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
-- Table structure for table `BikeDetails`
--

DROP TABLE IF EXISTS `BikeDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BikeDetails` (
  `Plate_No` varchar(10) NOT NULL,
  `Company` varchar(20) DEFAULT NULL,
  `Model` varchar(20) DEFAULT NULL,
  `Color` varchar(10) DEFAULT NULL,
  `Type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Plate_No`),
  CONSTRAINT `BikeDetails_ibfk_1` FOREIGN KEY (`Plate_No`) REFERENCES `Vehicle` (`Plate_No`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BikeDetails`
--

LOCK TABLES `BikeDetails` WRITE;
/*!40000 ALTER TABLE `BikeDetails` DISABLE KEYS */;
INSERT INTO `BikeDetails` VALUES ('KA05DE6587','Kawasaki','Ninja H2R','Green','Sports');
/*!40000 ALTER TABLE `BikeDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Booking`
--

DROP TABLE IF EXISTS `Booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Booking` (
  `User_ID` varchar(20) DEFAULT NULL,
  `Plate_No` varchar(10) DEFAULT NULL,
  `Book_ID` varchar(10) NOT NULL,
  `Pay_ID` varchar(10) DEFAULT NULL,
  `Book_Date` date DEFAULT NULL,
  `No_of_Days` int(11) DEFAULT NULL,
  PRIMARY KEY (`Book_ID`),
  KEY `Plate_No` (`Plate_No`),
  CONSTRAINT `Booking_ibfk_1` FOREIGN KEY (`Plate_No`) REFERENCES `Vehicle` (`Plate_No`) ON DELETE CASCADE ON UPDATE CASCADE
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
-- Table structure for table `CarDetails`
--

DROP TABLE IF EXISTS `CarDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CarDetails` (
  `Plate_No` varchar(10) NOT NULL,
  `Company` varchar(20) DEFAULT NULL,
  `Model` varchar(20) DEFAULT NULL,
  `Color` varchar(10) DEFAULT NULL,
  `Type` varchar(10) DEFAULT NULL,
  `Seats` int(11) DEFAULT NULL,
  PRIMARY KEY (`Plate_No`),
  CONSTRAINT `CarDetails_ibfk_1` FOREIGN KEY (`Plate_No`) REFERENCES `Vehicle` (`Plate_No`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CarDetails`
--

LOCK TABLES `CarDetails` WRITE;
/*!40000 ALTER TABLE `CarDetails` DISABLE KEYS */;
INSERT INTO `CarDetails` VALUES ('KA08SK9283','Hennessey','Venom GT','Black','Sports',4);
/*!40000 ALTER TABLE `CarDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee` (
  `Emp_ID` varchar(10) NOT NULL,
  `Emp_Name` varchar(20) DEFAULT NULL,
  `Email_ID` varchar(30) DEFAULT NULL,
  `Phone_No` bigint(20) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  `G_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Emp_ID`),
  KEY `G_ID` (`G_ID`),
  CONSTRAINT `Employee_ibfk_1` FOREIGN KEY (`G_ID`) REFERENCES `Garage` (`G_ID`) ON DELETE CASCADE ON UPDATE CASCADE
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
  `Location` varchar(20) DEFAULT NULL,
  `Book_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`G_ID`),
  KEY `Book_ID` (`Book_ID`),
  CONSTRAINT `Garage_ibfk_1` FOREIGN KEY (`Book_ID`) REFERENCES `Booking` (`Book_ID`) ON DELETE CASCADE ON UPDATE CASCADE
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
  `Pay_Date` date DEFAULT NULL,
  `Amount` int(11) DEFAULT NULL,
  `Type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Pay_ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `Payment_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `User` (`User_ID`) ON DELETE CASCADE ON UPDATE CASCADE
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
  `Email_ID` varchar(30) DEFAULT NULL,
  `Phone_No` bigint(20) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES ('ABC123','User1','user1@email.com',9875546254,'Random_Location_1','best_password_1'),('DEF456','User2','user2@email.com',8745526698,'Random_Location_2','best_password_2');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vehicle`
--

DROP TABLE IF EXISTS `Vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vehicle` (
  `Plate_No` varchar(10) NOT NULL,
  `Type` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`Plate_No`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vehicle`
--

LOCK TABLES `Vehicle` WRITE;
/*!40000 ALTER TABLE `Vehicle` DISABLE KEYS */;
INSERT INTO `Vehicle` VALUES ('KA05DE6587','Bike'),('KA08SK9283','Car');
/*!40000 ALTER TABLE `Vehicle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-23 21:12:13
