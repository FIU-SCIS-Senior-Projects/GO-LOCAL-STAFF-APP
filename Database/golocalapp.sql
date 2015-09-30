-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Sep 30, 2015 at 01:59 AM
-- Server version: 5.5.42
-- PHP Version: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `golocalapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

CREATE TABLE `people` (
  `peopleID` int(11) NOT NULL,
  `companyID` int(11) DEFAULT NULL,
  `staffType` int(11) NOT NULL,
  `firstName` varchar(30) NOT NULL,
  `middleInitial` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `nickname` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `phoneCode` int(11) DEFAULT NULL,
  `phoneValidated` int(11) DEFAULT NULL,
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
  `resume` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`peopleID`);