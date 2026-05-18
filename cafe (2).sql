-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 19, 2024 at 08:06 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cafe`
--

-- --------------------------------------------------------

--
-- Table structure for table `Categories`
--

CREATE TABLE `Categories` (
  `category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Categories`
--

INSERT INTO `Categories` (`category_name`) VALUES
('Drinks'),
('Pizza');

-- --------------------------------------------------------

--
-- Table structure for table `Customers`
--

CREATE TABLE `Customers` (
  `order_id` int(255) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `phone_number` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Customers`
--

INSERT INTO `Customers` (`order_id`, `customer_name`, `phone_number`) VALUES
(1, 'Jin', '8767687983'),
(2, 'tina', '1239856432'),
(3, 'tina', '8767687983'),
(5, 'sia', '8011911567'),
(6, 'jenny\r\n', '8011911590'),
(7, 'sam', '1239856432');

-- --------------------------------------------------------

--
-- Table structure for table `Menu`
--

CREATE TABLE `Menu` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_price` decimal(10,2) NOT NULL,
  `item_availability` varchar(300) NOT NULL,
  `category_name` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Menu`
--

INSERT INTO `Menu` (`item_id`, `item_name`, `item_price`, `item_availability`, `category_name`) VALUES
(1, 'Coffee', 20.00, 'Available', 'Drinks'),
(2, 'iced coffee', 20.00, 'Available', 'Drinks'),
(3, 'Latte', 30.00, 'Available', 'Drinks'),
(8, 'veg cheese pizza', 90.00, 'Available', 'Pizza');

-- --------------------------------------------------------

--
-- Table structure for table `OrderItems`
--

CREATE TABLE `OrderItems` (
  `order_item_id` int(255) NOT NULL,
  `order_id` int(255) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `item_total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `OrderItems`
--

INSERT INTO `OrderItems` (`order_item_id`, `order_id`, `item_id`, `item_name`, `item_price`, `quantity`, `item_total`) VALUES
(1, 1, 1, 'Coffee', 20.00, 3, 60.00),
(2, 1, 6, 'Non veg pasta', 100.00, 1, 100.00),
(3, 2, 1, 'Coffee', 20.00, 2, 40.00),
(4, 2, 8, 'veg cheese pizza', 90.00, 1, 90.00),
(5, 2, 3, 'Latte', 30.00, 1, 30.00),
(6, 3, 1, 'Coffee', 20.00, 1, 20.00),
(7, 3, 5, 'Veg cheese pasta', 70.00, 1, 70.00),
(10, 5, 3, 'Latte', 30.00, 2, 60.00),
(11, 5, 8, 'veg cheese pizza', 90.00, 1, 90.00),
(12, 6, 3, 'Latte', 30.00, 2, 60.00),
(13, 6, 8, 'veg cheese pizza', 90.00, 1, 90.00),
(14, 7, 1, 'Coffee', 20.00, 1, 20.00),
(15, 7, 8, 'veg cheese pizza', 90.00, 2, 180.00);

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `order_id` int(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `table_number` int(11) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Orders`
--

INSERT INTO `Orders` (`order_id`, `user_id`, `table_number`, `total_amount`, `payment_status`, `order_date`) VALUES
(1, 11, 3, 160.00, 'QR Scan', '2024-12-17 10:22:23'),
(2, 11, 5, 160.00, 'Cash', '2024-12-17 06:03:42'),
(3, 12, 1, 90.00, 'Credit/Debit', '2024-12-18 05:51:51'),
(5, 11, 4, 150.00, 'CASH', '2024-12-18 09:25:51'),
(6, 11, 4, 150.00, 'CASH', '2024-12-18 09:33:04'),
(7, 11, 6, 200.00, 'CASH', '2024-12-18 09:37:49');

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`user_id`, `username`, `password`) VALUES
(11, 'Rahul', 'admin123'),
(12, 'Sneha', 'pass123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Categories`
--
ALTER TABLE `Categories`
  ADD PRIMARY KEY (`category_name`);

--
-- Indexes for table `Customers`
--
ALTER TABLE `Customers`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `Menu`
--
ALTER TABLE `Menu`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `OrderItems`
--
ALTER TABLE `OrderItems`
  ADD PRIMARY KEY (`order_item_id`);

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Customers`
--
ALTER TABLE `Customers`
  MODIFY `order_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `OrderItems`
--
ALTER TABLE `OrderItems`
  MODIFY `order_item_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `Orders`
--
ALTER TABLE `Orders`
  MODIFY `order_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
