-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2020 at 09:33 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `paf`
--

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
CREATE TABLE `patients` (
  `patientID` int(12) NOT NULL,
  `patientName` varchar(30) CHARACTER SET latin1 NOT NULL,
  `patientAge` int(3) NOT NULL,
  `patientAddress` varchar(80) CHARACTER SET latin1 NOT NULL,
  `patientPhone` int(12) NOT NULL,
  `patientGender` varchar(6) CHARACTER SET latin1 NOT NULL,
  `patientNotes` varchar(100) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patientID`, `patientName`, `patientAge`, `patientAddress`, `patientPhone`, `patientGender`, `patientNotes`) VALUES
(1, 'Shashoda Kalindu', 21, '120/3A,Makandana,Madapatha', 776543538, 'Male', 'Drug Addicted'),
(9, 'Sapthaka Godage', 23, 'Mahanuwara', 112833009, 'Male', 'Fever'),
(14, 'mahela', 21, 'gampaha', 112729729, 'male', 'Cough'),
(15, 'Oshi', 21, 'Panadura', 763953661, 'Female', 'Cold');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patientID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `patientID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
