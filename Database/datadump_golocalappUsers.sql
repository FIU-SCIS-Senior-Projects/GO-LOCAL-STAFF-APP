-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: golocalapp
-- ------------------------------------------------------
-- Server version	5.5.44-0ubuntu0.14.04.1

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
-- Table structure for table `employer_job`
--

DROP TABLE IF EXISTS `employer_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employer_job` (
  `employerID` int(11) NOT NULL,
  `jobID` int(11) NOT NULL,
  PRIMARY KEY (`employerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employer_job`
--

LOCK TABLES `employer_job` WRITE;
/*!40000 ALTER TABLE `employer_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `employer_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `jobID` int(11) NOT NULL,
  `jobTitle` varchar(255) NOT NULL,
  `desiredStaff` int(11) NOT NULL,
  `nameOfEvent` varchar(255) NOT NULL,
  `duties` varchar(255) NOT NULL,
  `rate` decimal(6,6) NOT NULL,
  `date` varchar(30) NOT NULL,
  `time` varchar(30) NOT NULL,
  `location` varchar(255) NOT NULL,
  `gender` int(11) NOT NULL,
  `languagesNeeded` varchar(255) NOT NULL,
  `tattoos` int(11) NOT NULL,
  `piercings` int(11) NOT NULL,
  PRIMARY KEY (`jobID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `management`
--

DROP TABLE IF EXISTS `management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `management` (
  `staffAgreement` varchar(21844) DEFAULT NULL,
  `employerAgreement` varchar(21844) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `management`
--

LOCK TABLES `management` WRITE;
/*!40000 ALTER TABLE `management` DISABLE KEYS */;
INSERT INTO `management` VALUES ('start of staff agreement from server Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.  Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.  Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.   Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.   Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.                                                                              ','start of employer agreement from server Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.  Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.  Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.   Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.   Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.');
/*!40000 ALTER TABLE `management` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registered_employer`
--

DROP TABLE IF EXISTS `registered_employer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registered_employer` (
  `employerID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `hashEmail` varchar(255) DEFAULT NULL,
  `emailValidated` int(11) DEFAULT '0',
  `employerName` varchar(30) NOT NULL,
  `typeOfEmployer` varchar(30) NOT NULL,
  `firstName` varchar(30) NOT NULL,
  `middleInitial` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `phoneCode` int(11) DEFAULT NULL,
  `phoneValidated` int(11) DEFAULT NULL,
  `insurance` int(11) NOT NULL,
  `insuranceDocuments` varchar(255) NOT NULL,
  `accountLocked` tinyint(1) DEFAULT NULL,
  `forgotPasswordCode` int(11) DEFAULT NULL,
  `forgotPasswordRequests` int(5) DEFAULT '0',
  `loginRequests` int(5) DEFAULT '0',
  PRIMARY KEY (`employerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registered_employer`
--

LOCK TABLES `registered_employer` WRITE;
/*!40000 ALTER TABLE `registered_employer` DISABLE KEYS */;
/*!40000 ALTER TABLE `registered_employer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registered_staff`
--

DROP TABLE IF EXISTS `registered_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registered_staff` (
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `hashEmail` varchar(255) DEFAULT NULL,
  `emailValidated` int(11) DEFAULT '0',
  `staffID` int(11) NOT NULL AUTO_INCREMENT,
  `staffType` int(11) NOT NULL,
  `firstName` varchar(30) NOT NULL,
  `middleInitial` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `nickname` varchar(30) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `phoneCode` int(11) DEFAULT NULL,
  `phoneValidated` int(11) DEFAULT NULL,
  `pictures` varchar(30) NOT NULL,
  `dateOfBirth` varchar(10) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` int(11) NOT NULL,
  `languages` varchar(255) NOT NULL,
  `typeDL` int(11) NOT NULL,
  `ethnicityCode` int(11) NOT NULL,
  `ethnicity` varchar(255) NOT NULL,
  `height` varchar(11) NOT NULL,
  `weight` varchar(11) NOT NULL,
  `hairColor` varchar(30) NOT NULL,
  `eyeColor` varchar(30) NOT NULL,
  `shirtSize` varchar(30) NOT NULL,
  `pantSize` varchar(30) NOT NULL,
  `chestSize` int(11) NOT NULL,
  `waistSize` int(11) NOT NULL,
  `hipSize` int(11) NOT NULL,
  `dressSize` varchar(30) NOT NULL,
  `shoeSize` int(11) NOT NULL,
  `tattoos` int(11) NOT NULL,
  `piercings` int(11) NOT NULL,
  `desiredHourlyRate` int(11) DEFAULT NULL,
  `desiredWeeklyRate` int(11) DEFAULT NULL,
  `ssnOrEin` varchar(30) NOT NULL,
  `businessName` varchar(255) DEFAULT NULL,
  `travel` int(11) NOT NULL,
  `insurance` int(11) NOT NULL,
  `insuranceDocuments` varchar(30) NOT NULL,
  `bankRouting` varchar(30) NOT NULL,
  `accountNumber` varchar(30) NOT NULL,
  `resume` varchar(30) NOT NULL,
  `accountLocked` tinyint(1) DEFAULT NULL,
  `forgotPasswordCode` int(11) DEFAULT NULL,
  `forgotPasswordRequests` int(5) DEFAULT '0',
  `loginRequests` int(5) DEFAULT '0',
  PRIMARY KEY (`staffID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registered_staff`
--

LOCK TABLES `registered_staff` WRITE;
/*!40000 ALTER TABLE `registered_staff` DISABLE KEYS */;
INSERT INTO `registered_staff` VALUES ('Luandre','$2y$10$n32dYuLWYtM2xrZQJr03mON544lA.5at325HTYbe4h9v/vLR3QY4.','Lu@me.com','49c9adb18e44be0711a94e827042f630',0,7,0,'Luis','','castillo','','2710 W 64 PL Miami FL 33016','Miami','33016','FL','3056099250',6458,1,'','10-22-1994',21,1,'English Spanish Arabic',0,3,'Latino or Hispanic American','5\'4\"','150','Black','Brown','M','30',0,0,0,' ',8,0,0,20,2700,'12547896',' ',25,0,'',' ',' ','',NULL,NULL,0,0);
/*!40000 ALTER TABLE `registered_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_type`
--

DROP TABLE IF EXISTS `staff_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_type` (
  `staffID` int(11) NOT NULL,
  `jobTitle` varchar(255) NOT NULL,
  `website` varchar(30) NOT NULL,
  `socialMedia` varchar(255) NOT NULL,
  PRIMARY KEY (`staffID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_type`
--

LOCK TABLES `staff_type` WRITE;
/*!40000 ALTER TABLE `staff_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-22 19:00:35
