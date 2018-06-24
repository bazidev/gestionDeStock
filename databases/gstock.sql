-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2018 at 01:27 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gstock`
--

-- --------------------------------------------------------

--
-- Table structure for table `achats`
--

CREATE TABLE `achats` (
  `codeAchat` int(11) NOT NULL,
  `codeArt` int(11) NOT NULL,
  `qteAchete` int(11) NOT NULL,
  `dateReception` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `achats`
--

INSERT INTO `achats` (`codeAchat`, `codeArt`, `qteAchete`, `dateReception`) VALUES
(1, 1, 12120, '2018-06-12'),
(2, 1, 41, '2018-06-21'),
(4, 1, 10, '2016-10-12'),
(5, 1, 10, '2016-11-01'),
(9, 10, 21011, '0019-12-09'),
(10, 8, 440, '2018-12-10'),
(11, 9, 77777, '2010-12-09'),
(12, 1, 77777, '0011-12-09'),
(13, 8, 500, '0031-12-09'),
(14, 9, 202, '2018-06-04');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `inventaire`
--

CREATE TABLE `inventaire` (
  `codeInv` int(11) NOT NULL,
  `codeArt` int(11) NOT NULL,
  `qteArt` int(11) NOT NULL,
  `descInv` varchar(200) NOT NULL,
  `dateInv` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventaire`
--

INSERT INTO `inventaire` (`codeInv`, `codeArt`, `qteArt`, `descInv`, `dateInv`) VALUES
(1, 8, 44, 'kkkk', '2018-05-30'),
(2, 3, 30, 'description', '2012-04-02'),
(3, 8, 40, '', '2018-06-12'),
(6, 8, 20, 'description', '2018-06-22'),
(7, 8, 20, 'description', '2018-06-22'),
(8, 8, 20, 'description', '2018-06-22'),
(9, 8, 777, 'test description', '0018-12-09'),
(10, 3, 222, 'test description wa', '0018-12-09'),
(11, 9, 222, 'test description wa', '0013-12-09'),
(12, 8, 222, 'test description wa', '0018-12-09'),
(13, 8, 12, 'des', '0010-12-09'),
(15, 10, 707, '', '0017-12-09'),
(17, 3, 0, '', '0018-12-09'),
(18, 8, 777, '', '2018-06-11'),
(19, 3, 5, '', '2018-12-06'),
(20, 3, 55, 'dddd', '2018-06-23'),
(22, 8, 55, 'dddd', '2018-06-23'),
(23, 3, 60, '', '2012-04-02'),
(24, 3, 60, '', '2012-04-02'),
(25, 8, 12, '', '2018-06-04'),
(26, 8, 145, '', '2018-05-29'),
(27, 3, 120, '', '2018-05-30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `achats`
--
ALTER TABLE `achats`
  ADD PRIMARY KEY (`codeAchat`),
  ADD KEY `codeArt` (`codeArt`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `inventaire`
--
ALTER TABLE `inventaire`
  ADD PRIMARY KEY (`codeInv`),
  ADD KEY `codeArt` (`codeArt`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `achats`
--
ALTER TABLE `achats`
  MODIFY `codeAchat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `inventaire`
--
ALTER TABLE `inventaire`
  MODIFY `codeInv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `achats`
--
ALTER TABLE `achats`
  ADD CONSTRAINT `achats_ibfk_1` FOREIGN KEY (`codeArt`) REFERENCES `gvente`.`article` (`codeart`);

--
-- Constraints for table `inventaire`
--
ALTER TABLE `inventaire`
  ADD CONSTRAINT `inventaire_ibfk_1` FOREIGN KEY (`codeArt`) REFERENCES `gvente`.`article` (`codeart`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
