-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Sep 30, 2015 at 02:13 AM
-- Server version: 5.5.42
-- PHP Version: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `golocalapp`
--
-- --------------------------------------------------------

--
-- Table structure for table `management`
--

CREATE TABLE `management` (
  `staffAgreement` varchar(21844) DEFAULT NULL,
  `employerAgreement` varchar(21844) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employer_job`
--

CREATE TABLE `employer_job` (
  `employerID` int(11) NOT NULL,
  `jobID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

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
  `piercings` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `registered_employer`
--

CREATE TABLE `registered_employer` (
  `employerID` int(11) NOT NULL,
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
  `accountLocked` BOOLEAN DEFAULT NULL,
  `forgotPasswordCode` int(11) DEFAULT NULL,
  `forgotPasswordRequests` int(5) DEFAULT '0',
  `loginRequests` int(5) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `registered_staff`
--

CREATE TABLE `registered_staff` (
  `staffID` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `hashEmail` varchar(255) DEFAULT NULL,
  `emailValidated` int(11) DEFAULT '0',
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
  `dateOfBirth` varchar(10) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` int(11) NOT NULL,
  `nativeLanguage` varchar(15) NOT NULL,
  `secondLanguage` varchar(15) NOT NULL,
  `thirdLanguage` varchar(15) NOT NULL,
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
  `accountLocked` BOOLEAN DEFAULT NULL,
  `forgotPasswordCode` int(11) DEFAULT NULL,
  `forgotPasswordRequests` int(5) DEFAULT '0',
  `loginRequests` int(5) DEFAULT '0',
  `imageName` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stafftype`
--

CREATE TABLE `staff_type` (
  `staffID`               int(11) NOT NULL DEFAULT '0',
  `brandAmbassador`       int(11) NOT NULL DEFAULT '0',
  `dancer`                int(11) NOT NULL DEFAULT '0',
  `fieldMarketingManager` int(11) NOT NULL DEFAULT '0',
  `flyerDistributor`      int(11) NOT NULL DEFAULT '0',
  `model`                 int(11) NOT NULL DEFAULT '0',
  `productionAssistant`   int(11) NOT NULL DEFAULT '0',
  `salesExecutive`        int(11) NOT NULL DEFAULT '0',
  `waiterWaitress`        int(11) NOT NULL DEFAULT '0',
  `dJ`                    int(11) NOT NULL DEFAULT '0',
  `dJDescription`         int(11) NOT NULL DEFAULT '0',
  `dJWebsite`             int(11) NOT NULL DEFAULT '0',
  `dJSocialMedia`         int(11) NOT NULL DEFAULT '0',
  `cateringCompany`       int(11) NOT NULL DEFAULT '0',
  `cateringCompanyDescription` int(11) NOT NULL DEFAULT '0',
  `cateringCompanyWebsite`     int(11) NOT NULL DEFAULT '0',
  `cateringCompanySocialMedia` int(11) NOT NULL DEFAULT '0',
  `liveBand`              int(11) NOT NULL DEFAULT '0',
  `liveBandDescription`   int(11) NOT NULL DEFAULT '0',
  `liveBandWebsite`       int(11) NOT NULL DEFAULT '0',
  `liveBandSocialMedia`   int(11) NOT NULL DEFAULT '0',
  `other`                 int(11) NOT NULL DEFAULT '0',
  `otherDescription`      int(11) NOT NULL DEFAULT '0',
  `otherwebsite`          int(11) NOT NULL DEFAULT '0',
  `othersocialMedia`      int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Indexes for table `employer_job`
--
ALTER TABLE `employer_job`
  ADD PRIMARY KEY (`employerID`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`jobID`);

--
-- Indexes for table `registered_employer`
--
ALTER TABLE `registered_employer`
  ADD PRIMARY KEY (`employerID`);

--
-- Indexes for table `registered_staff`
--
ALTER TABLE `registered_staff`
  ADD PRIMARY KEY (`staffID`);

--
-- Indexes for table `staff_type`
--
ALTER TABLE `staff_type`
  ADD PRIMARY KEY (`staffID`);


--
-- AUTO_INCREMENT for table `registered_employer`
--
ALTER TABLE `registered_employer`
  MODIFY `employerID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `registered_staff`
--
ALTER TABLE `registered_staff`
  MODIFY `staffID` int(11) NOT NULL AUTO_INCREMENT;