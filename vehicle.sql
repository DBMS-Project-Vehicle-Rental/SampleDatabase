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
  `Start_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
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
INSERT INTO `Employee` VALUES ('Emp01','Ram','ram@email.com',8754863254,'Jaynagar','ramkapassword','BANKOR0002'),('Emp02','Shyam','shyam@email.com',7854896532,'KR Puram','shyamkapassword','BANMAR0001');
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
  PRIMARY KEY (`G_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Garage`
--

LOCK TABLES `Garage` WRITE;
/*!40000 ALTER TABLE `Garage` DISABLE KEYS */;
INSERT INTO `Garage` VALUES ('BANKOR0002','Kormangala Garage','Kormangala'),('BANMAR0001','Marathalli Garage','Marathalli');
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
INSERT INTO `Payment` VALUES ('1','Devansh',NULL,NULL,6000,'Wallet',0),('2','Devansh',NULL,NULL,3000,'Wallet',1),('3','Devansh',NULL,NULL,6000,'Cash',1);
/*!40000 ALTER TABLE `Payment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`devansh`@`localhost`*/ /*!50003 TRIGGER perf_pay
BEFORE INSERT ON Payment
FOR EACH ROW
BEGIN
IF NEW.Method = 'Wallet' THEN
CALL check_balance(NEW.Amount, NEW.User_ID);
ELSE
SET @poss = 1;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
  `Wallet` int(11) DEFAULT NULL,
  PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES ('Ayush','Ayush Agarawal','ayush@email.com',9875425632,'Kormangala','ayushkapassword',3000),('Devansh','Devansh Sharma','devansh@email.com',9875546322,'Bellandur','devanshkapassword',5000);
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
INSERT INTO `VehicleDetails` VALUES ('KA03FG4578','Pulsar 150','Silver','BANKOR0002'),('KA03NH2546','Swift','Red','BANMAR0001'),('KA04MK2566','Grand i10','Grey','BANKOR0002'),('KA04ML6822','Pulsar 150','Blue','BANKOR0002'),('KA05LK6986','Scorpio','Black','BANMAR0001'),('KA05MJ5795','Swift','Blue','BANMAR0001');
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
  `Cost` int(11) DEFAULT NULL,
  PRIMARY KEY (`Model_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vehicles`
--

LOCK TABLES `Vehicles` WRITE;
/*!40000 ALTER TABLE `Vehicles` DISABLE KEYS */;
INSERT INTO `Vehicles` VALUES ('Classic 500','Royal Enfield','Bike','Cruiser',1,0,2500),('Grand i10','Hyundai','Car','Hatchback',4,1,4500),('Pulsar 150','Bajaj','Bike','Standard',2,2,1500),('Scorpio','Mahindra','Car','SUV',8,1,6000),('Swift','Maruti Suzuki','Car','Hatchback',4,2,4000);
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

-- Dump completed on 2017-11-12 22:21:18
