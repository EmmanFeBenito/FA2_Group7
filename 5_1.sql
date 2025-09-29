-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 29, 2025 at 02:44 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `5.1`
--

-- --------------------------------------------------------

--
-- Table structure for table `dim_author`
--

CREATE TABLE `dim_author` (
  `author_id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dim_book`
--

CREATE TABLE `dim_book` (
  `book_id` varchar(20) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `category_desc` varchar(100) DEFAULT NULL,
  `publisher_id` int(11) DEFAULT NULL,
  `publisher_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dim_store`
--

CREATE TABLE `dim_store` (
  `store_id` int(11) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `suburb` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dim_time`
--

CREATE TABLE `dim_time` (
  `time_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `sales_id` int(11) NOT NULL,
  `time_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `book_id` varchar(20) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `total_price` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dim_author`
--
ALTER TABLE `dim_author`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `dim_book`
--
ALTER TABLE `dim_book`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `dim_store`
--
ALTER TABLE `dim_store`
  ADD PRIMARY KEY (`store_id`);

--
-- Indexes for table `dim_time`
--
ALTER TABLE `dim_time`
  ADD PRIMARY KEY (`time_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sales_id`),
  ADD KEY `time_id` (`time_id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `author_id` (`author_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`time_id`) REFERENCES `dim_time` (`time_id`),
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `dim_store` (`store_id`),
  ADD CONSTRAINT `sales_ibfk_3` FOREIGN KEY (`book_id`) REFERENCES `dim_book` (`book_id`),
  ADD CONSTRAINT `sales_ibfk_4` FOREIGN KEY (`author_id`) REFERENCES `dim_author` (`author_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
