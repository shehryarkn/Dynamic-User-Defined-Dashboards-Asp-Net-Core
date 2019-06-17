-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 17, 2019 at 06:49 PM
-- Server version: 10.1.39-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Dashboard_Tutorial`
--

-- --------------------------------------------------------

--
-- Table structure for table `DashboardLinkedElements`
--

CREATE TABLE `DashboardLinkedElements` (
  `Id` int(11) NOT NULL,
  `DashboardId` int(11) NOT NULL,
  `ElementId` int(11) NOT NULL,
  `Placement` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `DashboardLinkedElements`
--

INSERT INTO `DashboardLinkedElements` (`Id`, `DashboardId`, `ElementId`, `Placement`) VALUES
(34, 8, 1, '1'),
(35, 8, 4, '2');

-- --------------------------------------------------------

--
-- Table structure for table `Dashboards_Info`
--

CREATE TABLE `Dashboards_Info` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `TemplateId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Dashboards_Info`
--

INSERT INTO `Dashboards_Info` (`Id`, `Name`, `TemplateId`) VALUES
(8, 'First Dashboard', 3);

-- --------------------------------------------------------

--
-- Table structure for table `Elements`
--

CREATE TABLE `Elements` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Elements`
--

INSERT INTO `Elements` (`Id`, `Name`) VALUES
(1, 'Element1'),
(2, 'Element2'),
(3, 'Element3'),
(4, 'Element4'),
(5, 'Element5');

-- --------------------------------------------------------

--
-- Table structure for table `Templates`
--

CREATE TABLE `Templates` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `ElementsCount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Templates`
--

INSERT INTO `Templates` (`Id`, `Name`, `ElementsCount`) VALUES
(1, 'Template1', 1),
(2, 'Template2', 2),
(3, 'Template3', 2),
(4, 'Template4', 3),
(5, 'Template5', 3),
(6, 'Template6', 4),
(7, 'Template7', 4),
(8, 'Template8', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `DashboardLinkedElements`
--
ALTER TABLE `DashboardLinkedElements`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `DashboardId` (`DashboardId`),
  ADD KEY `ElementId` (`ElementId`);

--
-- Indexes for table `Dashboards_Info`
--
ALTER TABLE `Dashboards_Info`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `TemplateId` (`TemplateId`);

--
-- Indexes for table `Elements`
--
ALTER TABLE `Elements`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `Templates`
--
ALTER TABLE `Templates`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `DashboardLinkedElements`
--
ALTER TABLE `DashboardLinkedElements`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `Dashboards_Info`
--
ALTER TABLE `Dashboards_Info`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `Elements`
--
ALTER TABLE `Elements`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Templates`
--
ALTER TABLE `Templates`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `DashboardLinkedElements`
--
ALTER TABLE `DashboardLinkedElements`
  ADD CONSTRAINT `DashboardLinkedElements_ibfk_1` FOREIGN KEY (`DashboardId`) REFERENCES `Dashboards_Info` (`Id`),
  ADD CONSTRAINT `DashboardLinkedElements_ibfk_2` FOREIGN KEY (`ElementId`) REFERENCES `Elements` (`Id`);

--
-- Constraints for table `Dashboards_Info`
--
ALTER TABLE `Dashboards_Info`
  ADD CONSTRAINT `Dashboards_Info_ibfk_1` FOREIGN KEY (`TemplateId`) REFERENCES `Templates` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
