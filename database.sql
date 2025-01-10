-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2024 at 11:22 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `p3_kasir`
--

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` double(18,2) NOT NULL,
  `gambar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `nama`, `harga`, `gambar`) VALUES
('cappucino', 'Cappuccino', 22000.00, 'cappuccinocoffee.jpg'),
('chickenburger', 'Chicken Burger', 25000.00, 'chickenburger.jpg'),
('chickennoodles', 'Mie Ayam', 20000.00, 'chickennoodles.jpg'),
('chocolatecake', 'Chocolate Cake', 30000.00, 'chocolatecake.jpg'),
('chocolatecoffe', 'Chocolate Coffe', 22000.00, 'chocolatecoffee.jpg'),
('coldcoffe', 'Cold Coffee', 20000.00, 'coldcoffee.jpg'),
('greentea', 'Green Tea', 18000.00, 'greentea.jpg'),
('mineralswater', 'Air Mineral', 5000.00, 'mineralswater.png'),
('nasgor1', 'Nasi Goreng Baso', 15000.00, 'nasgor1.jpeg'),
('orange_juice', 'Orange Juice', 10000.00, 'orange_juice.jpg'),
('rainbowcake', 'Rainbow Cake', 30000.00, 'rainbow.jpg'),
('strawberycake', 'Strawberry Cake', 30000.00, 'strawberrycake.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` varchar(100) NOT NULL,
  `tanggal` varchar(100) NOT NULL,
  `waktu` varchar(100) NOT NULL,
  `total_harga` decimal(18,2) NOT NULL,
  `jumlah_bayar` decimal(18,2) NOT NULL,
  `pajak` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `tanggal`, `waktu`, `total_harga`, `jumlah_bayar`, `pajak`) VALUES
('16254', '2024-01-07', '02:29:06 AM', '395000.00', '450000.00', '39500.00'),
('25692', '2024-01-07', '02:28:30 AM', '345000.00', '400000.00', '34500.00'),
('25785', '2024-01-07', '02:27:23 AM', '263000.00', '300000.00', '26300.00'),
('47188', '2024-01-07', '11:37:56 PM', '246000.00', '300000.00', '24600.00'),
('74090', '2024-01-07', '11:43:02 PM', '282000.00', '400000.00', '28200.00'),
('74176', '2024-01-06', '10:06:56 PM', '126000.00', '140000.00', '12600.00'),
('93025', '2024-01-06', '10:10:13 PM', '200000.00', '250000.00', '20000.00');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id_order` varchar(100) NOT NULL,
  `id_menu` varchar(100) NOT NULL,
  `nama_menu` varchar(100) NOT NULL,
  `harga_satuan` decimal(18,2) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id_order`, `id_menu`, `nama_menu`, `harga_satuan`, `qty`) VALUES
('16254', 'cappucino', 'Cappuccino', '22000.00', 1),
('16254', 'chickenburger', 'Chicken Burger', '25000.00', 2),
('16254', 'chickennoodles', 'Mie Ayam', '20000.00', 2),
('16254', 'chocolatecake', 'Chocolate Cake', '30000.00', 1),
('16254', 'chocolatecoffe', 'Chocolate Coffe', '22000.00', 1),
('16254', 'coldcoffe', 'Cold Coffee', '20000.00', 2),
('16254', 'greentea', 'Green Tea', '18000.00', 2),
('16254', 'mineralswater', 'Air Mineral', '5000.00', 3),
('16254', 'nasgor1', 'Nasi Goreng Baso', '15000.00', 4),
('16254', 'orange_juice', 'Orange Juice', '10000.00', 2),
('16254', 'rainbowcake', 'Rainbow Cake', '30000.00', 1),
('16254', 'strawberycake', 'Strawberry Cake', '30000.00', 1),
('25692', 'cappucino', 'Cappuccino', '22000.00', 1),
('25692', 'chickenburger', 'Chicken Burger', '25000.00', 2),
('25692', 'chickennoodles', 'Mie Ayam', '20000.00', 2),
('25692', 'chocolatecake', 'Chocolate Cake', '30000.00', 1),
('25692', 'chocolatecoffe', 'Chocolate Coffe', '22000.00', 1),
('25692', 'coldcoffe', 'Cold Coffee', '20000.00', 2),
('25692', 'greentea', 'Green Tea', '18000.00', 2),
('25692', 'mineralswater', 'Air Mineral', '5000.00', 3),
('25692', 'nasgor1', 'Nasi Goreng Baso', '15000.00', 4),
('25692', 'strawberycake', 'Strawberry Cake', '30000.00', 1),
('25785', 'cappucino', 'Cappuccino', '22000.00', 1),
('25785', 'chickenburger', 'Chicken Burger', '25000.00', 2),
('25785', 'chickennoodles', 'Mie Ayam', '20000.00', 2),
('25785', 'chocolatecake', 'Chocolate Cake', '30000.00', 1),
('25785', 'coldcoffe', 'Cold Coffee', '20000.00', 2),
('25785', 'greentea', 'Green Tea', '18000.00', 2),
('25785', 'mineralswater', 'Air Mineral', '5000.00', 1),
('25785', 'nasgor1', 'Nasi Goreng Baso', '15000.00', 2),
('25785', 'orange_juice', 'Orange Juice', '10000.00', 1),
('47188', 'chocolatecoffe', 'Chocolate Coffe', '22000.00', 3),
('47188', 'coldcoffe', 'Cold Coffee', '20000.00', 3),
('47188', 'rainbowcake', 'Rainbow Cake', '30000.00', 2),
('47188', 'strawberycake', 'Strawberry Cake', '30000.00', 2),
('74090', 'chocolatecoffe', 'Chocolate Coffe', '22000.00', 3),
('74090', 'coldcoffe', 'Cold Coffee', '20000.00', 3),
('74090', 'greentea', 'Green Tea', '18000.00', 2),
('74090', 'rainbowcake', 'Rainbow Cake', '30000.00', 2),
('74090', 'strawberycake', 'Strawberry Cake', '30000.00', 2),
('74176', 'cappucino', 'Cappuccino', '22000.00', 3),
('74176', 'chickenburger', 'Chicken Burger', '25000.00', 2),
('74176', 'mineralswater', 'Air Mineral', '5000.00', 2),
('93025', 'chocolatecake', 'Chocolate Cake', '30000.00', 1),
('93025', 'mineralswater', 'Air Mineral', '5000.00', 2),
('93025', 'nasgor1', 'Nasi Goreng Baso', '15000.00', 4),
('93025', 'orange_juice', 'Orange Juice', '10000.00', 4),
('93025', 'rainbowcake', 'Rainbow Cake', '30000.00', 1),
('93025', 'strawberycake', 'Strawberry Cake', '30000.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id_order`,`id_menu`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
