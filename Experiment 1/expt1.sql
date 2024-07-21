-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 14, 2024 at 07:41 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `expt1`
--
CREATE DATABASE IF NOT EXISTS `expt1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `expt1`;

-- --------------------------------------------------------

--
-- Table structure for table `Dept`
--

CREATE TABLE `Dept` (
  `Deptno` int(11) NOT NULL,
  `dname` varchar(25) NOT NULL,
  `location` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Dept`
--

INSERT INTO `Dept` (`Deptno`, `dname`, `location`) VALUES
(1, 'Accounting', 'Vancouver'),
(5, 'Sales', 'Bengaluru'),
(10, 'Research', 'Dublin'),
(20, 'HR', 'London'),
(30, 'Marketing', 'Hyderabad');

-- --------------------------------------------------------

--
-- Table structure for table `Employee`
--

CREATE TABLE `Employee` (
  `Empno` int(11) NOT NULL,
  `Empname` varchar(25) NOT NULL,
  `Gender` varchar(1) DEFAULT NULL,
  `job` varchar(25) DEFAULT NULL,
  `managerno` int(11) DEFAULT NULL,
  `hiredate` date DEFAULT NULL,
  `salary` float(12,2) DEFAULT NULL,
  `commision` float(10,2) DEFAULT NULL,
  `deptno` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Employee`
--

INSERT INTO `Employee` (`Empno`, `Empname`, `Gender`, `job`, `managerno`, `hiredate`, `salary`, `commision`, `deptno`) VALUES
(2, 'Angelo', 'M', 'Clerk', 300, '2023-01-09', 40000.00, 30000.00, 5),
(4, 'Annie', 'F', 'Analyst', 120, '2022-03-08', 21000.00, NULL, 20),
(5, 'Brandon', 'M', 'President', 150, '2023-10-05', 24000.00, NULL, 30),
(6, 'Bunni', 'F', 'HR', 180, '2020-05-05', 35000.00, NULL, 5),
(7, 'Stella', 'F', 'receptionist', 400, '2022-06-18', 38000.00, 50000.00, 5),
(8, 'Maria', 'F', 'Clerk', 450, '2022-07-22', 40000.00, 3000.00, 30),
(9, 'Max', 'M', 'Engineer', 500, '2022-11-05', 45000.00, NULL, 10),
(10, 'Lya', 'F', 'Analyst', 600, '2023-06-04', 42000.00, NULL, 20),
(11, 'Valery', 'M', 'Manager', 700, '2023-04-22', 50000.00, NULL, 5),
(12, 'Nikki', 'F', 'Clerk', 800, '2024-02-11', 37000.00, 10000.00, 5),
(13, 'Theodore', 'M', 'Technician', 900, '2021-03-01', 33000.00, 5000.00, 10),
(14, 'Alice', 'F', 'Consultant', 1000, '2022-01-19', 53000.00, NULL, 1),
(15, 'Elliot', 'M', 'Developer', 1100, '2024-02-24', 48000.00, NULL, 20);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Dept`
--
ALTER TABLE `Dept`
  ADD PRIMARY KEY (`Deptno`);

--
-- Indexes for table `Employee`
--
ALTER TABLE `Employee`
  ADD PRIMARY KEY (`Empno`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
