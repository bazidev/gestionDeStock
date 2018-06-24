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
-- Database: `gvente`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrateur`
--

CREATE TABLE `administrateur` (
  `codeadmin` int(25) NOT NULL,
  `loginadmin` varchar(20) NOT NULL,
  `passadmin` varchar(20) NOT NULL,
  `nomadmin` varchar(100) NOT NULL,
  `adradmin` varchar(100) NOT NULL,
  `emailadmin` varchar(100) NOT NULL,
  `teladmin` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `administrateur`
--

INSERT INTO `administrateur` (`codeadmin`, `loginadmin`, `passadmin`, `nomadmin`, `adradmin`, `emailadmin`, `teladmin`) VALUES
(1, 'user', 'pass', 'El Ouahabi Wail', 'Av halouan no 8 Touabel 2 tétouan', 'wailelouahabi@gmail.com', '0618209965');

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `codeart` int(25) NOT NULL,
  `nomart` varchar(20) NOT NULL,
  `descart` varchar(200) NOT NULL,
  `prixart` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`codeart`, `nomart`, `descart`, `prixart`) VALUES
(1, 'Article 1', ' Description 1', 100),
(3, 'Article 2', 'Description 2', 150),
(8, 'articlo no 8', 'description 8', 100),
(9, 'artice no 9', 'description no 9 ', 100),
(10, 'article no 10', 'descrription 10', 70);

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `codeclient` int(11) NOT NULL,
  `loginc` varchar(25) NOT NULL,
  `passc` varchar(25) NOT NULL,
  `nomc` varchar(50) NOT NULL,
  `addrclient` varchar(100) NOT NULL,
  `emailclient` varchar(100) NOT NULL,
  `telclient` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`codeclient`, `loginc`, `passc`, `nomc`, `addrclient`, `emailclient`, `telclient`) VALUES
(1, 'user', 'pass', 'Laasri Youssef', 'addresse Tetouan', 'email@exp.com', '0600998877'),
(2, 'u_c513Esq', 'p_c51Eis2', 'Wail El Ouahabi', 'Av ha tetouan', 'wailelouahabi@gmail.com', '0618209965'),
(16, 'U41uHwH4', 'P19bWqOT', 'Merghad Hicham', 'Av etc ', 'hicham@gmail.com', '098272622'),
(17, 'U4dQDjr', 'P49ua9aE', 'El Bazi mustafa', 'Av etc Martil ', 'bazi@email.exp', '0292827265');

-- --------------------------------------------------------

--
-- Table structure for table `commande`
--

CREATE TABLE `commande` (
  `codecmd` int(25) NOT NULL,
  `client` varchar(20) NOT NULL,
  `codeArt` int(11) NOT NULL,
  `qtecmd` int(25) NOT NULL,
  `total` double NOT NULL,
  `datecmd` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `commande`
--

INSERT INTO `commande` (`codecmd`, `client`, `codeArt`, `qtecmd`, `total`, `datecmd`) VALUES
(4, 'Laasri Youssef', 3, 5, 0, '2018-06-19'),
(5, 'Merghad Hicham', 8, 4, 0, '0000-00-00'),
(6, 'Merghad Hicham', 8, 100, 0, '2016-06-19'),
(7, 'Merghad Hicham', 8, 20, 0, '2018-06-14'),
(8, 'Merghad Hicham', 8, 5, 0, '2018-06-15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrateur`
--
ALTER TABLE `administrateur`
  ADD PRIMARY KEY (`codeadmin`);

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`codeart`),
  ADD UNIQUE KEY `nomart_2` (`nomart`),
  ADD KEY `nomart` (`nomart`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`codeclient`),
  ADD KEY `nomc` (`nomc`);

--
-- Indexes for table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`codecmd`),
  ADD KEY `client` (`client`),
  ADD KEY `codearti` (`codeArt`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `codeart` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `codeclient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `commande`
--
ALTER TABLE `commande`
  MODIFY `codecmd` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_2` FOREIGN KEY (`client`) REFERENCES `client` (`nomc`) ON DELETE CASCADE,
  ADD CONSTRAINT `commande_ibfk_3` FOREIGN KEY (`codeArt`) REFERENCES `article` (`codeart`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
