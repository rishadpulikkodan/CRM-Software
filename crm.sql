-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 10, 2020 at 08:58 AM
-- Server version: 8.0.18
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crm`
--

-- --------------------------------------------------------

--
-- Table structure for table `assign`
--

CREATE TABLE `assign` (
  `id` int(11) NOT NULL,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `req_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `aby` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `assign`
--

INSERT INTO `assign` (`id`, `type`, `req_id`, `staff_id`, `status`, `aby`) VALUES
(10, 'package', 6, 90, 'Compleated', 89);

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `req_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cus_id` int(11) NOT NULL,
  `cus_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `total` int(25) NOT NULL,
  `invo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `date`, `cus_id`, `cus_name`, `total`, `invo_id`) VALUES
(7, '2020-02-18 07:24:58', 88, 'customer', 100, 314),
(8, '2020-02-19 12:07:25', 88, 'customer', 12, 320);

-- --------------------------------------------------------

--
-- Table structure for table `invoices_details`
--

CREATE TABLE `invoices_details` (
  `id` int(11) NOT NULL,
  `cus_id` int(11) NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `price` int(25) NOT NULL,
  `invo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoices_details`
--

INSERT INTO `invoices_details` (`id`, `cus_id`, `type`, `name`, `price`, `invo_id`) VALUES
(206, 0, 'package', 'washing pkg', 200, 314),
(207, 0, 'package', 'cleaning pkg', 100, 314),
(208, 88, 'service', 'cleaning', 100, 318),
(210, 88, 'service', 'cleaning', 12, 320),
(212, 0, 'package', 'cleaning pkg', 65496, 320),
(214, 88, 'package', 'cleaning pkg', 200, 325),
(215, 88, 'package', 'cleaning pkg', 9, 327),
(216, 88, 'service', 'cleaning', 1123, 327),
(217, 88, 'package', 'cleaning pkg', 123, 331),
(218, 88, 'package', 'cleaning pkg', 123, 334),
(219, 88, 'package', 'plumbing pkg', 123, 335);

-- --------------------------------------------------------

--
-- Table structure for table `invo_count`
--

CREATE TABLE `invo_count` (
  `count` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invo_count`
--

INSERT INTO `invo_count` (`count`) VALUES
(339);

-- --------------------------------------------------------

--
-- Table structure for table `packagereq`
--

CREATE TABLE `packagereq` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `custid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `package` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `packagereq`
--

INSERT INTO `packagereq` (`id`, `date`, `customer`, `custid`, `pid`, `package`, `status`) VALUES
(6, '2020-02-18 12:52:18', 'customer', 88, 4, 'plumbing pkg', 'assigned'),
(7, '2020-03-06 14:50:47', 'customer', 88, 1, 'cleaning pkg', 'requested');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `validity` date NOT NULL,
  `number` int(50) NOT NULL,
  `info` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `service` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `validity`, `number`, `info`, `price`, `service`) VALUES
(1, 'cleaning pkg', '2020-01-26', 3, 'info', 300, 'cleaning'),
(2, 'washing pkg', '2020-01-31', 2, 'txt', 100, 'washing'),
(4, 'plumbing pkg', '2020-01-30', 2, 'pp', 1000, 'plumbing');

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_and_time` datetime(6) NOT NULL,
  `staff_name` varchar(50) NOT NULL,
  `staff_id` int(50) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `customer_id` int(50) NOT NULL,
  `contact` varchar(50) NOT NULL,
  `location` varchar(250) NOT NULL,
  `work_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `note` text NOT NULL,
  `status` varchar(50) NOT NULL,
  `aby` varchar(50) NOT NULL,
  `reason` varchar(100) NOT NULL,
  `vby` varchar(50) NOT NULL,
  `rreason` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`id`, `date_and_time`, `staff_name`, `staff_id`, `customer_name`, `customer_id`, `contact`, `location`, `work_id`, `note`, `status`, `aby`, `reason`, `vby`, `rreason`) VALUES
(9, '0000-00-00 00:00:00.000000', 'staff', 90, 'customer', 88, '111111111111', 'https://cus', '10', 'complreated', 'Submitted', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `servicereq`
--

CREATE TABLE `servicereq` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `custid` int(50) NOT NULL,
  `service_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `servicereq`
--

INSERT INTO `servicereq` (`id`, `date`, `customer`, `custid`, `service_id`, `status`) VALUES
(12, '2020-03-06 09:46:53', 'customer', 88, '1', 'requested');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `price`) VALUES
(1, 'cleaning', 100),
(2, 'washing', 50),
(3, 'catering', 450),
(4, 'plumbing', 500);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `age` int(11) NOT NULL,
  `address` text NOT NULL,
  `contact` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `privilage` int(3) NOT NULL,
  `location` varchar(250) NOT NULL,
  `cby` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `gender`, `age`, `address`, `contact`, `email`, `username`, `password`, `privilage`, `location`, `cby`) VALUES
(73, 'admin', 'Male', 22, 'admin', '0123456789', 'admin@admin', 'admin', '$2y$10$eH7vvwZP89X.x.vRxCj6u..JboaQm9LhJLDm1X1EOJdKiILEgPwsq', 829, '', 'Admin'),
(88, 'customer', 'Male', 18, 'customer', '111111111111', 'customer@customer', 'customer', '$2y$10$OkHfUIuUM84AmCCbj/iibODQQ4F7H.uzcSplvtucBWaQE/otCDZfW', 852, 'https://cus', 'Admin'),
(89, 'accexe', 'Male', 18, 'accexe', '111111111111', 'accexe@accexe', 'accexe', '$2y$10$c8zbxBrplN74gIeph625QukmuK7ZuLArOTltIjZ1bl8Wb/ko.OPhy', 951, '', 'Admin'),
(90, 'staff', 'Male', 18, 'staff', '111111111111', 'staff@staff', 'staff', '$2y$10$xhkHth4yaZXoC6M2YUf5YObuzI7M1hVuPjoKH.aX6cRCOctVakwRC', 357, '', 'Admin'),
(91, 'manager', 'Male', 18, 'manager', '111111111111', 'manager@manager', 'manager', '$2y$10$MZsDywKlY28IYIllQNpVEuiSowop3GBjEttSv8cm6jyQjfxY64.sW', 298, '', 'Admin'),
(92, 'cus2', 'Male', 18, 'cus', '111111111111', 'cus@cus', 'cus2', '$2y$10$TFi4PTx4THUT1R2KDNKw2evddj.MSQqC3/t4cyfooxFvu3Kw5ym7W', 852, 'https://cus', 'Admin'),
(93, 'staff2', 'Male', 18, 'staff', '222222222222', 'staff@staff', 'staff2', '$2y$10$hlIOpOk7W6nou9jgiAoWZ.i4nKWG1Xzn8KQFtL9aD598l2RSEW7gu', 357, '', 'Admin'),
(94, 'staff3', 'Male', 18, 'staff3', '222222222222', 'staff@staff', 'staff3', '$2y$10$nueGUrwHCGA5neNeVC12aO4tyRZUiL2nReZH0N3qtnjQr4HwDcVna', 357, '', 'Admin'),
(95, 'cus3', 'Male', 18, 'cus3', '111111111111', 'cus3@cus', 'cus3', '$2y$10$fHaI6ZWg14qkfeP.gJwlBunJu8ZzVDwSW5.wsPutzF0z3P/0q8rM6', 852, 'https://cus3', 'Admin'),
(96, 'staff4', 'Male', 18, 'staff4', '222222222222', 'staff4@staff', 'staff4', '$2y$10$Dyh/02ZNtxNDQopVr78sMetJsAbstso5h7kDJonhc4nKcupv8vy/W', 357, '', 'Admin'),
(97, 'cus4', 'Male', 18, 'cus4', '111111111111', 'cus4@cus', 'cus4', '$2y$10$ckkG7OZp3e/q4V9SmuG9vOLfpynTHNZy0zIBC2SQ7GXcwwRJOBw9e', 852, 'https://cus4', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `usersbin`
--

CREATE TABLE `usersbin` (
  `id` int(11) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `age` int(11) NOT NULL,
  `address` text NOT NULL,
  `contact` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `privilage` int(3) NOT NULL,
  `location` varchar(250) NOT NULL,
  `cby` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assign`
--
ALTER TABLE `assign`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices_details`
--
ALTER TABLE `invoices_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packagereq`
--
ALTER TABLE `packagereq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `servicereq`
--
ALTER TABLE `servicereq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assign`
--
ALTER TABLE `assign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `invoices_details`
--
ALTER TABLE `invoices_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

--
-- AUTO_INCREMENT for table `packagereq`
--
ALTER TABLE `packagereq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `servicereq`
--
ALTER TABLE `servicereq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
