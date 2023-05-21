-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2023 at 01:25 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `centre`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Id_admin` int(11) NOT NULL,
  `id` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`Id_admin`, `id`, `username`, `password`) VALUES
(1, NULL, 'admin1', 'password1'),
(2, NULL, 'admin2', 'password2'),
(3, NULL, 'admin3', 'password3');

-- --------------------------------------------------------

--
-- Table structure for table `apprenant`
--

CREATE TABLE `apprenant` (
  `Id_apprenant` int(11) NOT NULL,
  `id` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `age` varchar(50) DEFAULT NULL,
  `Id_Validation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `consulté`
--

CREATE TABLE `consulté` (
  `Id_Session` int(11) NOT NULL,
  `Id_Formateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `efectuer`
--

CREATE TABLE `efectuer` (
  `Id_Session` int(11) NOT NULL,
  `Id_Validation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `formateur`
--

CREATE TABLE `formateur` (
  `Id_Formateur` int(11) NOT NULL,
  `id` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `formateur`
--

INSERT INTO `formateur` (`Id_Formateur`, `id`, `name`, `password`, `role`) VALUES
(1, NULL, 'John Doe', 'password1', 'teacher'),
(2, NULL, 'Jane Smith', 'password2', 'teacher'),
(3, NULL, 'Bob Johnson', 'password3', 'teacher');

-- --------------------------------------------------------

--
-- Table structure for table `gére`
--

CREATE TABLE `gére` (
  `Id_admin` int(11) NOT NULL,
  `Id_Session` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `Id_Session` int(11) NOT NULL,
  `id` varchar(50) DEFAULT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Duration` varchar(50) DEFAULT NULL,
  `date_of_start` date DEFAULT NULL,
  `date_of_end` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `validation`
--

CREATE TABLE `validation` (
  `Id_Validation` int(11) NOT NULL,
  `id` varchar(50) DEFAULT NULL,
  `id_session` varchar(50) DEFAULT NULL,
  `validation_date` varchar(50) DEFAULT NULL,
  `expirition_date` varchar(50) DEFAULT NULL,
  `cancelation_date` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Id_admin`);

--
-- Indexes for table `apprenant`
--
ALTER TABLE `apprenant`
  ADD PRIMARY KEY (`Id_apprenant`),
  ADD KEY `Id_Validation` (`Id_Validation`);

--
-- Indexes for table `consulté`
--
ALTER TABLE `consulté`
  ADD PRIMARY KEY (`Id_Session`,`Id_Formateur`),
  ADD KEY `Id_Formateur` (`Id_Formateur`);

--
-- Indexes for table `efectuer`
--
ALTER TABLE `efectuer`
  ADD PRIMARY KEY (`Id_Session`,`Id_Validation`),
  ADD KEY `Id_Validation` (`Id_Validation`);

--
-- Indexes for table `formateur`
--
ALTER TABLE `formateur`
  ADD PRIMARY KEY (`Id_Formateur`);

--
-- Indexes for table `gére`
--
ALTER TABLE `gére`
  ADD PRIMARY KEY (`Id_admin`,`Id_Session`),
  ADD KEY `Id_Session` (`Id_Session`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`Id_Session`);

--
-- Indexes for table `validation`
--
ALTER TABLE `validation`
  ADD PRIMARY KEY (`Id_Validation`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `Id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `apprenant`
--
ALTER TABLE `apprenant`
  MODIFY `Id_apprenant` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `formateur`
--
ALTER TABLE `formateur`
  MODIFY `Id_Formateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
  MODIFY `Id_Session` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `validation`
--
ALTER TABLE `validation`
  MODIFY `Id_Validation` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `apprenant`
--
ALTER TABLE `apprenant`
  ADD CONSTRAINT `apprenant_ibfk_1` FOREIGN KEY (`Id_Validation`) REFERENCES `validation` (`Id_Validation`);

--
-- Constraints for table `consulté`
--
ALTER TABLE `consulté`
  ADD CONSTRAINT `consulté_ibfk_1` FOREIGN KEY (`Id_Session`) REFERENCES `session` (`Id_Session`),
  ADD CONSTRAINT `consulté_ibfk_2` FOREIGN KEY (`Id_Formateur`) REFERENCES `formateur` (`Id_Formateur`);

--
-- Constraints for table `efectuer`
--
ALTER TABLE `efectuer`
  ADD CONSTRAINT `efectuer_ibfk_1` FOREIGN KEY (`Id_Session`) REFERENCES `session` (`Id_Session`),
  ADD CONSTRAINT `efectuer_ibfk_2` FOREIGN KEY (`Id_Validation`) REFERENCES `validation` (`Id_Validation`);

--
-- Constraints for table `gére`
--
ALTER TABLE `gére`
  ADD CONSTRAINT `gére_ibfk_1` FOREIGN KEY (`Id_admin`) REFERENCES `admin` (`Id_admin`),
  ADD CONSTRAINT `gére_ibfk_2` FOREIGN KEY (`Id_Session`) REFERENCES `session` (`Id_Session`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
