-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 23, 2018 at 12:30 PM
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
  `TeamID` int(11) NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  `Role` varchar(70) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Members`
--

CREATE TABLE `Members` (
  `EmployeeID` int(11) NOT NULL,
  `Email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `First_Name` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `Surname` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `Department` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Job_Title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Level` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `Password_Hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Project`
--

CREATE TABLE `Project` (
  `ProjectID` int(11) NOT NULL,
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
  `TaskID` int(11) NOT NULL,
  `Description` text COLLATE utf8_unicode_ci NOT NULL,
  `Start_Time` datetime(6) NOT NULL,
  `End_Date` datetime(6) NOT NULL,
  `Status` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Next_TaskID` int(11) DEFAULT NULL,
  `ProjectID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Teams`
--

CREATE TABLE `Teams` (
  `TeamID` int(11) NOT NULL,
  `TeamName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Description` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Work_on`
--

CREATE TABLE `Work_on` (
  `EmployeeID` int(11) NOT NULL,
  `TaskID` int(11) NOT NULL
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
  ADD PRIMARY KEY (`EmployeeID`),
  ADD UNIQUE KEY `EmployeeID` (`EmployeeID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `Project`
--
ALTER TABLE `Project`
  ADD PRIMARY KEY (`ProjectID`),
  ADD UNIQUE KEY `ProjectID` (`ProjectID`);

--
-- Indexes for table `Task`
--
ALTER TABLE `Task`
  ADD PRIMARY KEY (`TaskID`),
  ADD UNIQUE KEY `TaskID` (`TaskID`),
  ADD KEY `Prev_TaskID` (`Next_TaskID`),
  ADD KEY `ProjectID` (`ProjectID`);

--
-- Indexes for table `Teams`
--
ALTER TABLE `Teams`
  ADD PRIMARY KEY (`TeamID`),
  ADD UNIQUE KEY `TeamID` (`TeamID`);

--
-- Indexes for table `Work_on`
--
ALTER TABLE `Work_on`
  ADD PRIMARY KEY (`EmployeeID`,`TaskID`),
  ADD KEY `TaskID` (`TaskID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Members`
--
ALTER TABLE `Members`
  MODIFY `EmployeeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Project`
--
ALTER TABLE `Project`
  MODIFY `ProjectID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Task`
--
ALTER TABLE `Task`
  MODIFY `TaskID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Teams`
--
ALTER TABLE `Teams`
  MODIFY `TeamID` int(11) NOT NULL AUTO_INCREMENT;

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
