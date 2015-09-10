-- phpMyAdmin SQL Dump
-- version 4.2.7
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Sep 10, 2015 at 03:19 AM
-- Server version: 5.5.41-log
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `golocalapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE IF NOT EXISTS `company` (
  `companyID` int(11) NOT NULL,
  `companyName` varchar(30) NOT NULL,
  `typeOfCompany` varchar(30) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `address` varchar(255) NOT NULL,
  `insurance` int(11) NOT NULL,
  `insuranceDocuments` varchar(255) NOT NULL,
  `termsAndAgreements` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `company_job`
--

CREATE TABLE IF NOT EXISTS `company_job` (
  `companyID` int(11) NOT NULL,
  `jobID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE IF NOT EXISTS `jobs` (
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
-- Table structure for table `people`
--

CREATE TABLE IF NOT EXISTS `people` (
  `peopleID` int(11) NOT NULL,
  `companyID` int(11) NOT NULL,
  `staffType` int(11) NOT NULL,
  `firstName` varchar(30) NOT NULL,
  `middleInitial` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `nickname` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `profession` int(11) NOT NULL,
  `website` varchar(30) NOT NULL,
  `socialMedia` varchar(255) NOT NULL,
  `pictures` varchar(30) NOT NULL,
  `dateOfBirth` varchar(10) NOT NULL,
  `gender` int(11) NOT NULL,
  `languages` varchar(255) NOT NULL,
  `typeDL` int(11) NOT NULL,
  `ethnicity` int(11) NOT NULL,
  `height` decimal(6,6) NOT NULL,
  `weight` decimal(6,6) NOT NULL,
  `hairColor` varchar(30) NOT NULL,
  `eyeColor` varchar(30) NOT NULL,
  `shirtSize` int(11) NOT NULL,
  `pantSize` int(11) NOT NULL,
  `chestSize` int(11) NOT NULL,
  `waistSize` int(11) NOT NULL,
  `hipSize` int(11) NOT NULL,
  `dressSize` int(11) NOT NULL,
  `shoeSize` int(11) NOT NULL,
  `tattoos` int(11) NOT NULL,
  `piercings` int(11) NOT NULL,
  `desiredPayRate` int(11) NOT NULL,
  `ssnOrEin` varchar(30) NOT NULL,
  `travel` int(11) NOT NULL,
  `insurance` int(11) NOT NULL,
  `insuranceDocuments` varchar(30) NOT NULL,
  `bankRouting` varchar(30) NOT NULL,
  `accountNumber` varchar(30) NOT NULL,
  `resume` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `registeredcompany`
--

CREATE TABLE IF NOT EXISTS `registeredcompany` (
`companyID` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `emailValidated` int(11) DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `registeredstaff`
--

CREATE TABLE IF NOT EXISTS `registeredstaff` (
`peopleID` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `emailValidated` int(11) DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Table structure for table `stafftype`
--

CREATE TABLE IF NOT EXISTS `stafftype` (
  `staffID` int(11) NOT NULL,
  `jobTitle` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company`
--
ALTER TABLE `company`
 ADD PRIMARY KEY (`companyID`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
 ADD PRIMARY KEY (`jobID`);

--
-- Indexes for table `people`
--
ALTER TABLE `people`
 ADD PRIMARY KEY (`peopleID`);

--
-- Indexes for table `registeredcompany`
--
ALTER TABLE `registeredcompany`
 ADD PRIMARY KEY (`companyID`);

--
-- Indexes for table `registeredstaff`
--
ALTER TABLE `registeredstaff`
 ADD PRIMARY KEY (`peopleID`);

--
-- Indexes for table `stafftype`
--
ALTER TABLE `stafftype`
 ADD PRIMARY KEY (`staffID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `registeredcompany`
--
ALTER TABLE `registeredcompany`
MODIFY `companyID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `registeredstaff`
--
ALTER TABLE `registeredstaff`
MODIFY `peopleID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
