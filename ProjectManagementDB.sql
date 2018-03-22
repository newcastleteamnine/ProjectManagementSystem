-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 21, 2018 at 03:42 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ProjectManagementDB`
--

-- --------------------------------------------------------

--
-- Table structure for table `Assign`
--

CREATE TABLE `Assign` (
  `TeamID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `EmployeeID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Role` varchar(70) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Members`
--

CREATE TABLE `Members` (
  `EmployeeID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `First_Name` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `Surname` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `Department` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Job_Title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Level` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PasswordSalt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PasswordHashAlgor` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Project`
--

CREATE TABLE `Project` (
  `ProjectID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Status` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Start_Time` datetime(6) NOT NULL,
  `Deadline` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Task`
--

CREATE TABLE `Task` (
  `TaskID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Description` text COLLATE utf8_unicode_ci NOT NULL,
  `Start_Time` datetime(6) NOT NULL,
  `End_Date` datetime(6) NOT NULL,
  `Status` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Next_TaskID` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ProjectID` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Teams`
--

CREATE TABLE `Teams` (
  `TeamID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `TeamName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Description` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Work_on`
--

CREATE TABLE `Work_on` (
  `EmployeeID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `TaskID` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Assign`
--
ALTER TABLE `Assign`
  ADD PRIMARY KEY (`TeamID`,`EmployeeID`),
  ADD KEY `TeamID` (`TeamID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Indexes for table `Members`
--
ALTER TABLE `Members`
  ADD PRIMARY KEY (`EmployeeID`);

--
-- Indexes for table `Project`
--
ALTER TABLE `Project`
  ADD PRIMARY KEY (`ProjectID`);

--
-- Indexes for table `Task`
--
ALTER TABLE `Task`
  ADD PRIMARY KEY (`TaskID`),
  ADD KEY `Prev_TaskID` (`Next_TaskID`),
  ADD KEY `ProjectID` (`ProjectID`);

--
-- Indexes for table `Teams`
--
ALTER TABLE `Teams`
  ADD PRIMARY KEY (`TeamID`);

--
-- Indexes for table `Work_on`
--
ALTER TABLE `Work_on`
  ADD PRIMARY KEY (`EmployeeID`,`TaskID`),
  ADD KEY `TaskID` (`TaskID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Assign`
--
ALTER TABLE `Assign`
  ADD CONSTRAINT `Assign_ibfk_1` FOREIGN KEY (`TeamID`) REFERENCES `Teams` (`TeamID`),
  ADD CONSTRAINT `Assign_ibfk_2` FOREIGN KEY (`EmployeeID`) REFERENCES `Members` (`EmployeeID`);

--
-- Constraints for table `Task`
--
ALTER TABLE `Task`
  ADD CONSTRAINT `Task_ibfk_1` FOREIGN KEY (`Next_TaskID`) REFERENCES `Task` (`TaskID`),
  ADD CONSTRAINT `Task_ibfk_2` FOREIGN KEY (`ProjectID`) REFERENCES `Project` (`ProjectID`);

--
-- Constraints for table `Work_on`
--
ALTER TABLE `Work_on`
  ADD CONSTRAINT `Work_on_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `Members` (`EmployeeID`),
  ADD CONSTRAINT `Work_on_ibfk_2` FOREIGN KEY (`TaskID`) REFERENCES `Task` (`TaskID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
