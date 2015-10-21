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
  `termsAndAgreements` varchar(255) NOT NULL,
  `accountLocked` tinyint(1) DEFAULT NULL,
  `forgotPasswordCode` int(11) DEFAULT NULL,
  `forgotPasswordRequests` int(5) DEFAULT '0',
  `loginRequests` int(5) DEFAULT '0',
  PRIMARY KEY (`employerID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registered_employer`
--

LOCK TABLES `registered_employer` WRITE;
/*!40000 ALTER TABLE `registered_employer` DISABLE KEYS */;
INSERT INTO `registered_employer` 
VALUES (01,'doromas','$2y$10$URhupNsNHGu4Vq1tNRTzF.ZbuchxiChTbN06dOJxdPtj5IjiVpKya','doram002@fiu.edu','42998cf32d552343bc8e460416382dca',0,'Los Sicarios','Party Events','David','','Oramas','3000 NE 151st Street','North Miami','33181','FL','7863662269',1935,1,1,'','',NULL,NULL,0,0),
       (02,'jbla','$2y$10$sULs1.RD7rCPblRmE5a8jODaA40MKmU41zMpWfrukOFGjgTXZKDDa','jorgblanc@gmail.com','63dc7ed1010d3c3b8269faf0ba7491d4',0,'','','Jorge','E','Blanco','','','','','3059155998',3935,1,0,'','',NULL,NULL,0,0),
       (03,'asdf','$2y$10$R1nT2zv5..VJmvpezKqK/eXEcFRGaBdHQLGb3WfLb6NA2zt2zZ7Pu','asdf@gmail.com','006f52e9102a8d3be2fe5614f42ba989',0,'Asdf','Study','Alex','','Karpis','1101 Brickell Ave','Miami','33131','FL','7868799629',8501,1,0,'','',NULL,NULL,0,0),
       (04,'dmc','$2y$10$HtmIgnsNIppQehvq1hxqYeAzW8dOL0RrCL7X2wW9ky8lIC1/ldnfy','dmcruz3@yahoo.com','8e296a067a37563370ded05f5a3bf3ec',0,'Dmc events','Aerospace Meetings','Dariel','','Moreno','158 E 13st','Hialeah','33010','FL','3058019960',1611,1,0,'','',NULL,NULL,0,0),
       (05,'Herniris','$2y$10$grCs/Rmjnwatj2CNqCh64etY/d6X9XWvdKH2xkUvX8SmI8FHfmbCK','Herniris@me.com','15de21c670ae7c3f6f3f1f37029303c9',0,'Hern Events','Party','Iris','E','Hernandez','2710 W 64 PL','Miami','33016','FL','3059842956',9393,1,1,'','',NULL,NULL,0,0),
       (06,'jeffLib','$2y$10$FgAEtFd3U.spHcctpkfkm.HJAHMitQctJ.w7ft6fe8kqFPrPI2TQ.','jlib001@fiu.edu','43fa7f58b7eac7ac872209342e62e8f1',0,'Colombian parties','Party Planner','Jeff','','Libreros','1930 SW 145th Ave','Miramar','33027','FL','9546000618',3299,1,0,'','',NULL,NULL,0,0),
       (07,'kealp','$2y$10$xyMPYwVe.rW9Dsm/Ti4WK.x4Vb5J6QJjSIlgoMRpEgtdMeVsCoF/K','kealp@yahoo.com','ed265bc903a5a097f61d3ec064d96d2e',0,'Karen Events','Utilities Planning','Karen','','Aguilar','4461 NW 4st','Coconut Creek','33066','FL','9542587866',6572,1,0,'','',NULL,NULL,0,0),
       (08,'lchediak','$2y$10$oxbwisnGvQnnni/lj6DxN.mDnwCuwc82jYrmWruLRH2cBnFaFeJKy','lchediak@aol.com','f2fc990265c712c49d51a18a32b39f0c',0,'Great parties','Party Planner','Ligia','','Chediak','3760 18th Ave','Naples','34117','FL','7863554748',7661,1,1,'','',NULL,NULL,0,0);
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
  `height` decimal(6,6) NOT NULL,
  `weight` decimal(6,6) NOT NULL,
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
  `TermsAndAgreements` varchar(255) NOT NULL,
  `accountLocked` tinyint(1) DEFAULT NULL,
  `forgotPasswordCode` int(11) DEFAULT NULL,
  `forgotPasswordRequests` int(5) DEFAULT '0',
  `loginRequests` int(5) DEFAULT '0',
  PRIMARY KEY (`staffID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registered_staff`
--

LOCK TABLES `registered_staff` WRITE;
/*!40000 ALTER TABLE `registered_staff` DISABLE KEYS */;
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

-- Dump completed on 2015-10-20 19:22:47
