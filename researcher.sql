-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2021 at 05:47 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `researcher`
--

-- --------------------------------------------------------

--
-- Table structure for table `complete_project`
--

CREATE TABLE `complete_project` (
  `proj_id` int(11) NOT NULL,
  `rid` varchar(11) NOT NULL,
  `proj_code` varchar(10) NOT NULL,
  `proj_name` varchar(30) NOT NULL,
  `proj_desc` varchar(300) NOT NULL,
  `skills_required` varchar(200) NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `estimate_budget` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `complete_project`
--

INSERT INTO `complete_project` (`proj_id`, `rid`, `proj_code`, `proj_name`, `proj_desc`, `skills_required`, `payment_method`, `estimate_budget`) VALUES
(1, 'U_112', 'P_001', 'Clothing', 'Project which contain details about cloths', 'HTML,CSS,JS,PHP', 'Fixed price', 25000),
(2, 'U_125', 'P_003', 'Lights', 'Details about lights', 'HTML,CSS,Node JS,React', 'cash', 41500),
(5, '745', '56', 'ahahjj', 'bjnkmk', 'cgghj', 'kkl,bh', 745),
(6, '745', '56', 'ahahjj', 'bjnkmk', 'cgghj', 'kkl,bh', 745);

-- --------------------------------------------------------

--
-- Table structure for table `innovetive_project`
--

CREATE TABLE `innovetive_project` (
  `proj_id` int(11) NOT NULL,
  `rid` varchar(20) NOT NULL,
  `proj_code` varchar(10) NOT NULL,
  `proj_name` varchar(30) NOT NULL,
  `proj_desc` varchar(300) NOT NULL,
  `skills_required` varchar(200) NOT NULL,
  `estimate_fund` double NOT NULL,
  `no_of_funds_made` int(100) NOT NULL,
  `amount_to_fund` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `innovetive_project`
--

INSERT INTO `innovetive_project` (`proj_id`, `rid`, `proj_code`, `proj_name`, `proj_desc`, `skills_required`, `estimate_fund`, `no_of_funds_made`, `amount_to_fund`) VALUES
(1, 'U_100', 'I_001', 'Retail', 'This is a project about clothing', 'HTML,CSS,JS,PHP,MYSQL', 12500, 2, 5500),
(6, '125', 'bjn', ' nm,', ' m , ', ' , ,,nknk', 112552, 2, 114);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `complete_project`
--
ALTER TABLE `complete_project`
  ADD PRIMARY KEY (`proj_id`);

--
-- Indexes for table `innovetive_project`
--
ALTER TABLE `innovetive_project`
  ADD PRIMARY KEY (`proj_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `complete_project`
--
ALTER TABLE `complete_project`
  MODIFY `proj_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `innovetive_project`
--
ALTER TABLE `innovetive_project`
  MODIFY `proj_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
