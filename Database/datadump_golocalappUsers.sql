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
INSERT INTO `management` 
VALUES ('start of staff agreement from server Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.  Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.  Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.   Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.   Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.                                                                              '
  ,'start of employer agreement from server Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.  Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.  Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.   Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.   Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.');
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
INSERT INTO `registered_employer` 
VALUES (1,'doromas','$2y$10$URhupNsNHGu4Vq1tNRTzF.ZbuchxiChTbN06dOJxdPtj5IjiVpKya','doram002@fiu.edu','42998cf32d552343bc8e460416382dca',0,'Los Sicarios','Party Events','David','','Oramas','3000 NE 151st Street','North Miami','33181','FL','7863662269',1935,1,1,'',NULL,NULL,0,0),
(2,'jbla','$2y$10$sULs1.RD7rCPblRmE5a8jODaA40MKmU41zMpWfrukOFGjgTXZKDDa','jorgblanc@gmail.com','63dc7ed1010d3c3b8269faf0ba7491d4',0,'','','Jorge','E','Blanco','','','','','3059155998',3935,1,0,'','',NULL,NULL,0,0),
(3,'asdf','$2y$10$R1nT2zv5..VJmvpezKqK/eXEcFRGaBdHQLGb3WfLb6NA2zt2zZ7Pu','asdf@gmail.com','006f52e9102a8d3be2fe5614f42ba989',0,'Asdf','Study','Alex','','Karpis','1101 Brickell Ave','Miami','33131','FL','7868799629',8501,1,0,'',NULL,NULL,0,0),
(4,'dmc','$2y$10$HtmIgnsNIppQehvq1hxqYeAzW8dOL0RrCL7X2wW9ky8lIC1/ldnfy','dmcruz3@yahoo.com','8e296a067a37563370ded05f5a3bf3ec',0,'Dmc events','Aerospace Meetings','Dariel','','Moreno','158 E 13st','Hialeah','33010','FL','3058019960',1611,1,0,'',NULL,NULL,0,0),
(5,'Herniris','$2y$10$grCs/Rmjnwatj2CNqCh64etY/d6X9XWvdKH2xkUvX8SmI8FHfmbCK','Herniris@me.com','15de21c670ae7c3f6f3f1f37029303c9',0,'Hern Events','Party','Iris','E','Hernandez','2710 W 64 PL','Miami','33016','FL','3059842956',9393,1,1,'',NULL,NULL,0,0),
(6,'jeffLib','$2y$10$FgAEtFd3U.spHcctpkfkm.HJAHMitQctJ.w7ft6fe8kqFPrPI2TQ.','jlib001@fiu.edu','43fa7f58b7eac7ac872209342e62e8f1',0,'Colombian parties','Party Planner','Jeff','','Libreros','1930 SW 145th Ave','Miramar','33027','FL','9546000618',3299,1,0,'',NULL,NULL,0,0),
(7,'kealp','$2y$10$xyMPYwVe.rW9Dsm/Ti4WK.x4Vb5J6QJjSIlgoMRpEgtdMeVsCoF/K','kealp@yahoo.com','ed265bc903a5a097f61d3ec064d96d2e',0,'Karen Events','Utilities Planning','Karen','','Aguilar','4461 NW 4st','Coconut Creek','33066','FL','9542587866',6572,1,0,'',NULL,NULL,0,0),
(8,'lchediak','$2y$10$oxbwisnGvQnnni/lj6DxN.mDnwCuwc82jYrmWruLRH2cBnFaFeJKy','lchediak@aol.com','f2fc990265c712c49d51a18a32b39f0c',0,'Great parties','Party Planner','Ligia','','Chediak','3760 18th Ave','Naples','34117','FL','7863554748',7661,1,1,'',NULL,NULL,0,0);

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
INSERT INTO `registered_staff`
('Lovesteph97','$2y$10$Vld5LbSDrenpdFsudWoaiuU/9Y2gvD/t/mqctzK9L/T/Uq0D7D0zi','Lovesteph97@aol.com','3c7781a36bcd6cf08c11a970fbe0e2a6',0,10,0,'Stephanie','','Chediak','','2680 37th Ave NE Naples FL 34120','Naples','34120','FL','2392486846',9103,1,'','09-27-1994',21,0,'English Spanish ',0,3,'Latino or Hispanic American','5\'2\"','130','Black','Brown','S','4',1,1,0,'1',10,0,0,25,2500,'4568789321','',25,0,'','12345678931','1234567896541','',NULL,NULL,0,0),
('Gcort005','$2y$10$NPa7SlzuYHh6r/wPDrkgresS8ytV0WaBb4CzyU9oj/nIad8pBGs32','Gcort005@fiu.edu','5878a7ab84fb43402106c575658472fa',0,11,0,'Gilma','','Cortez','','1310 NW 22nd Ave Miami FL 33125','Miami','33125','FL','3057739119',6570,1,'','02-18-1998',17,0,'English Spanish ',0,1,'Non-Hispanic White or Euro-American','5\'3\"','140','Black','Brown','M','6',1,1,0,'1',8,0,0,20,2700,'456789654','',25,0,'','','','',NULL,NULL,0,0),
('MilyAmay','$2y$10$bHM76dFP5Ja0QLsTRIu3qOfPz42mN/N9BiVWv8EODY3Dct46V51n6','MilyAmay@gmail.com','e7b24b112a44fdd9ee93bdf998c6ca0e',0,12,0,'Emily','','Amay','','620 E Las Olas Blvd Fort Lauderdale FL 33301','Fort Lauderdale','33301','FL','9548211487',5200,1,'','10-16-1988',27,0,'English Spanish French',0,3,'Latino or Hispanic American','5\'5\"','155','Black','Brown','S','4',1,1,0,'1',8,0,0,20,2900,'4567893258','',25,0,'','12258741','98563254781','',NULL,NULL,0,0),
('Asanz_19','$2y$10$HqfGPqP9M9KjW2yDQ3.seeqBnEAFLK0ffJNhvzTn8xb2/amktBhSW','Asanz_19@hotmail.com','7f6ffaa6bb0b408017b62254211691b5',0,13,0,'Andrea','','Castillo','','2394 SW 26 St Miami FL 33133','Miami','33133','FL','3057765855',7595,1,'','07-13-1979',36,0,'English Spanish ',0,3,'Latino or Hispanic American','5\'2\"','138','Black','Brown','S','6',1,1,0,'1',7,0,0,29,3100,'458721346','',0,0,'','','','','',NULL,NULL,0,0),
('Amorr037','$2y$10$kdxrLMKL/qRynhHoQCUavOiMz84xwOlMBA2zR3BNyS3D.EG.A7o0e','Mope03@gmail.com','e2c420d928d4bf8ce0ff2ec19b371514',0,14,0,'Ayme','','Morrina','','9060 NW 8 St Miami FL 33172','Miami','33172','FL','7865417226',3299,1,'','10-03-1988',27,0,'Spanish English ',0,3,'Latino or Hispanic American','5\'7\"','158','Black','Brown','S','2',1,1,0,'1',7,0,0,20,2400,'123546785','',0,0,'','','','','',NULL,NULL,0,0),
('BBKitty','$2y$10$oFDnnnUJ.WFjdz6M4VmgseEIpRxO9loLsHEq/cc1Z3dog5Bmz3TcC','HelloKitty@hotmail.com','9f53d83ec0691550f7d2507d57f4f5a2',0,15,0,'Brittany','','Blanco','','8495 Hammocks Blvd Kendall West FL 33193','Kendall West','33193','FL','7865142207',4406,1,'','10-21-1991',24,0,'English French ',0,1,'Non-Hispanic White or Euro-American','5\'4\"','134','Black','Brown','S','2',1,1,0,'1',7,0,0,29,2440,'123546875','',0,0,'','12846744','54248454845','',NULL,NULL,0,0),
('GuilleDipp','$2y$10$t7jfN3HVy3D/8ASnSAZjzeaGVXl.J6OagIUkulFUZzL.8o0BA75Mq','Guillermo.Dipp@gmail.com','2bb232c0b13c774965ef8558f0fbd615',0,16,0,'Guillermo','','Dipp','','7132 W 29th Ave Miami FL 33018','Miami','33018','FL','7863677785',1348,1,'','05-12-1987',28,1,'Spanish English ',0,3,'Latino or Hispanic American','5\'3\"','128','Black','Hazel','M','30',0,0,0,'',9,0,0,30,3200,'4281677','',0,1,'','32548794','6437548378484','',NULL,NULL,0,0),
('Ehern91','$2y$10$Tv9UNTY0K9w3gve6rtlJquSloyeffcHtpZeWU/UMqVETAqupfJQwu','Ehern22@yahoo.com','85d8ce590ad8981ca2c8286f79f59954',0,17,0,'Eduardo','','Hernandez','','2710 W 64 PL #21-5 Miami FL 33013','Miami','33013','FL','7863660027',4363,1,'','08-22-1991',24,1,'English  ',0,1,'Non-Hispanic White or Euro-American','5\'4\"','143','Black','Brown','M','32',0,0,0,'',8,0,0,15,2000,'125487964','',0,0,'','12548793','3958794211584','',NULL,NULL,0,0),
('Eaguilar221','$2y$10$Fhd5mMhxniqX5Cm4nLqpi.l5cMikWrragd9Q/8z0CrqZeIjSJ2jbm','Eaguilar221@gmail.com','47d1e990583c9c67424d369f3414728e',0,18,0,'Eda','','Aguilar','','7281 SE Pierre Circle Stuart FL 34997','Stuart','34997','FL','7723331050',5560,1,'','04-14-1988',27,0,'English Spanish ',0,3,'Latino or Hispanic American','5\'3\"','139','Black','Brown','S','4',1,1,0,'1',7,0,0,20,2700,'425786434','',0,0,'','','','',NULL,NULL,0,0),
('KHenriquez','$2y$10$NQKpQmjOhitBgcuh8kWCaeQr2ktWd9GegdmGC8zBXNtDPrqXIc7Ny','HenriquezK23@yahoo.com','6c524f9d5d7027454a783c841250ba71',0,19,0,'Kevin','','Henriquez','','2037 NW 4th St Miami FL 33125','Miami','33125','FL','7862696201',5145,1,'','03-22-1994',21,1,'English Spanish ',0,3,'Latino or Hispanic American','5\'4\"','139','Black','Brown','M','32',0,0,0,'',8,0,0,25,3100,'258963147','',0,0,'','','','',NULL,NULL,0,0),
('Mc7311','$2y$10$TwB7fcPsYS3VjjbkamNgWO8rXLnvGYQbZflLD9fAC/i0zYJOetOk.','Mc7311@gmail.com','8613985ec49eb8f757ae6439e879bb2a',0,20,0,'Maria','','Clara','','100 W Dania Beach Blvd Dania Beach FL 33004','Dania Beach','33004','FL','3056008735',8992,1,'','09-04-1987',28,0,'English Portuguese Spanish',0,3,'Latino or Hispanic American','5\'4\"','153','Black','Brown','M','8',2,2,0,'2',8,0,0,19,2700,'2518796','',25,0,'','','','',NULL,NULL,0,0);
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
