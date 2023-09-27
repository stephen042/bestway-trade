-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3308
-- Generation Time: Sep 27, 2023 at 08:25 PM
-- Server version: 8.0.30
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `astromine`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int NOT NULL,
  `name` varchar(122) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `bwallet` varchar(122) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `pm` varchar(111) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `bwallet`, `pm`, `email`, `password`) VALUES
(1, 'Ashley', '1K6af99Qcj1sQzF6BNTq2iJAKbmcL3Fpcn', '', 'admin@mail.com', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `ai_plan`
--

CREATE TABLE `ai_plan` (
  `id` int NOT NULL,
  `plan` varchar(100) NOT NULL,
  `amount` varchar(100) NOT NULL,
  `win_rate` int NOT NULL,
  `duration` varchar(20) NOT NULL,
  `created_at` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ai_plan`
--

INSERT INTO `ai_plan` (`id`, `plan`, `amount`, `win_rate`, `duration`, `created_at`, `updated_at`) VALUES
(1, 'Roboforex', '1000', 61, '5 days', '2023-08-05 14:03:34.728314', '2023-08-05 14:03:34.728314'),
(2, 'IC Markets', '800', 80, '4 days', '2023-08-05 14:04:56.576850', '2023-08-05 14:04:56.576850'),
(3, 'Pepperstone Ai-', '650', 74, '3 days', '2023-08-05 14:05:48.179259', '2023-08-05 14:05:48.179259'),
(4, 'AvaTrade', '1000', 79, '5 days', '2023-08-05 14:06:45.786022', '2023-08-05 14:06:45.786022');

-- --------------------------------------------------------

--
-- Table structure for table `btc`
--

CREATE TABLE `btc` (
  `id` int NOT NULL,
  `usd` double NOT NULL,
  `method` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `proof` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `uto` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `date` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `btc`
--

INSERT INTO `btc` (`id`, `usd`, `method`, `email`, `status`, `proof`, `uto`, `date`) VALUES
(1, 1000, 'bitcoin', 'perryweb17@gmail.com', 'Completed', '64cb846c2e521.png', 'btbtbtbtbtbtb', '03 Aug,2023'),
(2, 100, 'bitcoin', 'perryweb17@gmail.com', 'Pending', '64cd100ed5909.png', 'btbtbtbtbtbtb', '04 Aug,2023');

-- --------------------------------------------------------

--
-- Table structure for table `package1`
--

CREATE TABLE `package1` (
  `id` int NOT NULL,
  `pname` varchar(122) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `increase` double NOT NULL,
  `bonus` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `duration` int NOT NULL,
  `froms` double NOT NULL,
  `tos` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `package1`
--

INSERT INTO `package1` (`id`, `pname`, `increase`, `bonus`, `duration`, `froms`, `tos`) VALUES
(5, 'STARTERS', 15, '0', 1, 300, 500),
(6, 'PREMIUM', 35, '0', 1, 1000, 10000),
(8, 'SILVER ', 32.5, '0', 2, 2000, 10000),
(9, 'GOLD ', 33.33, '0', 3, 3000, 50000),
(16, 'DIAMOND ', 33.35, '0', 2, 4000, 50000),
(18, 'GOLDEN ', 40, '', 2, 5000, 100000);

-- --------------------------------------------------------

--
-- Table structure for table `package_request`
--

CREATE TABLE `package_request` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `plan_id` int NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int NOT NULL,
  `sitename` varchar(255) NOT NULL,
  `siteurl` varchar(255) NOT NULL,
  `sitemail` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `sitename`, `siteurl`, `sitemail`) VALUES
(1, 'Bestway Trade', 'http://forextrade.test/app/', 'customerservice@nadex.online ');

-- --------------------------------------------------------

--
-- Table structure for table `signals`
--

CREATE TABLE `signals` (
  `id` int NOT NULL,
  `symbol` varchar(255) NOT NULL,
  `t_interval` varchar(255) NOT NULL,
  `unit` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `directions` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `signals`
--

INSERT INTO `signals` (`id`, `symbol`, `t_interval`, `unit`, `amount`, `directions`) VALUES
(24, 'BTCUSDT', '1', '1', '1000', 'buy'),
(26, 'AUDUSDT', '20 miunties', '2', '500', 'buy'),
(27, 'EURUSD', '3', '3', '2000', 'sell');

-- --------------------------------------------------------

--
-- Table structure for table `signal_plan`
--

CREATE TABLE `signal_plan` (
  `id` int NOT NULL,
  `plan` varchar(20) NOT NULL,
  `amount` varchar(20) NOT NULL,
  `duration` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `signal_plan`
--

INSERT INTO `signal_plan` (`id`, `plan`, `amount`, `duration`, `created_at`) VALUES
(1, 'RB V6 ', '25000', '7 days', '2023-08-05 14:12:04.039886'),
(2, 'CD V5', '3000', '7 days', '2023-08-05 14:12:37.902424'),
(3, 'R26-M', '1500', '4 days', '2023-08-05 14:14:02.012360');

-- --------------------------------------------------------

--
-- Table structure for table `stakes`
--

CREATE TABLE `stakes` (
  `id` int NOT NULL,
  `email` varchar(200) NOT NULL,
  `currency` varchar(111) NOT NULL,
  `increase` double NOT NULL,
  `duration` int NOT NULL,
  `pdate` varchar(111) NOT NULL,
  `froms` double NOT NULL,
  `activate` tinyint NOT NULL,
  `usd` double NOT NULL,
  `profit` double NOT NULL,
  `payday` varchar(100) NOT NULL,
  `lprofit` double NOT NULL,
  `status` varchar(50) NOT NULL,
  `end_date` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stakes`
--

INSERT INTO `stakes` (`id`, `email`, `currency`, `increase`, `duration`, `pdate`, `froms`, `activate`, `usd`, `profit`, `payday`, `lprofit`, `status`, `end_date`, `date`) VALUES
(1, 'perryweb17@gmail.com', 'bitcoin', 8.05, 3, '2023-08-03 12:56:21', 0, 0, 20, 4.83, '2023/09/26', 0, '', '2023-08-06 12:56:21', '2023-08-03 10:56:21');

-- --------------------------------------------------------

--
-- Table structure for table `subscribe`
--

CREATE TABLE `subscribe` (
  `id` int NOT NULL,
  `usd` varchar(255) NOT NULL,
  `method` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` varchar(200) NOT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `proof` varchar(255) NOT NULL,
  `uto` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `subscribe`
--

INSERT INTO `subscribe` (`id`, `usd`, `method`, `email`, `status`, `created_at`, `proof`, `uto`, `date`) VALUES
(1, '1000', 'bitcoin', 'perryweb17@gmail.com', 'Completed', '2023-08-04 14:58:14.056789', '64cd12060dc8a.png', 'btbtbtbtbtbtb', '04 Aug,2023');

-- --------------------------------------------------------

--
-- Table structure for table `sub_transaction`
--

CREATE TABLE `sub_transaction` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `plan` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `duration` varchar(255) NOT NULL,
  `plan_for` varchar(20) NOT NULL,
  `Date` varchar(63) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sub_transaction`
--

INSERT INTO `sub_transaction` (`id`, `email`, `plan`, `amount`, `duration`, `plan_for`, `Date`) VALUES
(1, 'perryweb17@gmail.com', 'Beginner', '1000', '3 days', '1', '04 Aug'),
(2, 'perryweb17@gmail.com', 'Beginner', '1000', '3 days', '1', '04 Aug,2023 16:12:44'),
(3, 'perryweb17@gmail.com', 'Tasana Pro', '100', '7 days', '2', '04 Aug,2023 16:26:34'),
(4, 'perryweb17@gmail.com', 'BRD-IRS USA', '300', '4 days', '2', '04 Aug,2023 16:27:16');

-- --------------------------------------------------------

--
-- Table structure for table `trade`
--

CREATE TABLE `trade` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `trade_type` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `symbol` varchar(255) NOT NULL,
  `units` varchar(255) NOT NULL,
  `trade_interval` varchar(255) NOT NULL,
  `market` varchar(255) NOT NULL,
  `profit` varchar(255) NOT NULL DEFAULT '0',
  `status` varchar(255) NOT NULL,
  `trade_exp` varchar(255) NOT NULL,
  `trade_set` varchar(255) NOT NULL,
  `win_loss` int NOT NULL,
  `credited` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `trade`
--

INSERT INTO `trade` (`id`, `email`, `trade_type`, `amount`, `symbol`, `units`, `trade_interval`, `market`, `profit`, `status`, `trade_exp`, `trade_set`, `win_loss`, `credited`) VALUES
(1, 'perryweb17@gmail.com', 'live', '3000', 'BTCEUR', '1', '1 minute', 'Buy', '2700', '3', '2023-08-03 23:48:53', '2023-08-03 23:47:53', 1, 1),
(2, 'perryweb17@gmail.com', 'live', '1000', 'BTCEUR', '1', '1 minute', 'Buy', '900', '3', '2023-08-03 23:51:17', '2023-08-03 23:50:17', 1, 1),
(3, 'perryweb17@gmail.com', 'live', '2000', 'BTCEUR', '1', '1 minute', 'Buy', '1800', '3', '2023-08-04 00:06:24', '2023-08-04 00:05:24', 1, 1),
(4, 'perryweb17@gmail.com', 'live', '1000', 'EURJPY', '1', '1 minute', 'Buy', '900', '3', '2023-08-04 00:34:51', '2023-08-04 00:33:51', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `fname` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `lname` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `country` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `balance` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `sub_balance` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `account_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'demo',
  `demo_balance` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '50000',
  `id_image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `verify` int NOT NULL DEFAULT '0',
  `p_bar_status` int DEFAULT '0',
  `2fa` int NOT NULL DEFAULT '1',
  `2fa_code` int NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fname`, `lname`, `email`, `password`, `phone`, `gender`, `country`, `balance`, `sub_balance`, `account_type`, `demo_balance`, `id_image`, `id_type`, `verify`, `p_bar_status`, `2fa`, `2fa_code`, `date`) VALUES
(1, 'bryte', 'david', 'brytedree@gmail.com', '123456', '123456', 'Male', 'Belgium', '0', '0', 'live', '50000', NULL, NULL, 0, 0, 1, 893724, '2023-05-03 10:59:30'),
(2, 'Arthur', 'Rougher', 'perryweb17@gmail.com', 'secret', '09024452025', 'Male', 'Nigeria', '5585.83', '4598', 'demo', '50000', '64cbba1e80c68.png', 'International Passport', 1, 60, 1, 948061, '2023-08-02 21:07:14'),
(3, 'Ani', 'Makuochukwu', 'garfieldbalfour1@gmail.com', 'secret', '09024452025', 'male', 'Argentina', '0', '0', 'live', '50000', '6513dcdf4f33c.png', 'International Passport', 2, 0, 1, 826073, '2023-09-26 13:48:53');

-- --------------------------------------------------------

--
-- Table structure for table `wallet`
--

CREATE TABLE `wallet` (
  `id` int NOT NULL,
  `btc` varchar(255) NOT NULL,
  `eth` varchar(255) NOT NULL,
  `bnb` varchar(255) NOT NULL,
  `ltc` varchar(255) NOT NULL,
  `usdt_erc` varchar(255) NOT NULL,
  `usdt_trc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `wallet`
--

INSERT INTO `wallet` (`id`, `btc`, `eth`, `bnb`, `ltc`, `usdt_erc`, `usdt_trc`) VALUES
(1, 'btbtbtbtbtbtb', 'ehththththth', 'bnbnbnbnbnbnbnbnbnb', 'ltltltltltltltltl', 'usususususususus', 'ususususuusus');

-- --------------------------------------------------------

--
-- Table structure for table `wbtc`
--

CREATE TABLE `wbtc` (
  `id` int NOT NULL,
  `moni` double NOT NULL,
  `email` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `wal` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `date` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `wbtc`
--

INSERT INTO `wbtc` (`id`, `moni`, `email`, `status`, `wal`, `date`) VALUES
(1, 4728, 'othow.anade@outlook.com', 'Pending', '1PGBq1e8BuYHMGnwVPXLEzVs2BBmdRX6Nb', '08 Mar,2023'),
(2, 12630, 'sammuelrainey@gmail.com', 'Pending', 'bc1q8wgfa32c4xkg9k8hp5j84zr2p4q43lal3360mv', '31 Mar,2023');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ai_plan`
--
ALTER TABLE `ai_plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `btc`
--
ALTER TABLE `btc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package1`
--
ALTER TABLE `package1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_request`
--
ALTER TABLE `package_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `signals`
--
ALTER TABLE `signals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `signal_plan`
--
ALTER TABLE `signal_plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stakes`
--
ALTER TABLE `stakes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribe`
--
ALTER TABLE `subscribe`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_transaction`
--
ALTER TABLE `sub_transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trade`
--
ALTER TABLE `trade`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet`
--
ALTER TABLE `wallet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wbtc`
--
ALTER TABLE `wbtc`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ai_plan`
--
ALTER TABLE `ai_plan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `btc`
--
ALTER TABLE `btc`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `package1`
--
ALTER TABLE `package1`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `package_request`
--
ALTER TABLE `package_request`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `signals`
--
ALTER TABLE `signals`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `signal_plan`
--
ALTER TABLE `signal_plan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stakes`
--
ALTER TABLE `stakes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subscribe`
--
ALTER TABLE `subscribe`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sub_transaction`
--
ALTER TABLE `sub_transaction`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `trade`
--
ALTER TABLE `trade`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wallet`
--
ALTER TABLE `wallet`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `wbtc`
--
ALTER TABLE `wbtc`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
