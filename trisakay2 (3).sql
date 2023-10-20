-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2023 at 04:15 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trisakay2`
--

-- --------------------------------------------------------

--
-- Table structure for table `baliuag`
--

CREATE TABLE `baliuag` (
  `placeid` int(11) NOT NULL,
  `border` mediumtext NOT NULL,
  `place` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `baliuag`
--

INSERT INTO `baliuag` (`placeid`, `border`, `place`, `status`) VALUES
(1, '{\"type\":\"polygon\",\"latlngs\":[[{\"lat\":14.95017509152946,\"lng\":120.8639430999756},{\"lat\":14.935579731023546,\"lng\":120.86866378784181},{\"lat\":14.940555533575113,\"lng\":120.88514328002931},{\"lat\":14.952248215648293,\"lng\":120.88119506835939}]]}', 'Baliuag', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `BookingID` int(11) NOT NULL,
  `CommuterID` int(255) NOT NULL,
  `BodyNumber` varchar(255) NOT NULL,
  `Toda` varchar(255) NOT NULL,
  `Status` varchar(20) NOT NULL,
  `PickupPoint` varchar(255) NOT NULL,
  `PickupAddress` varchar(255) NOT NULL,
  `DropoffPoint` varchar(255) NOT NULL,
  `DropoffAddress` varchar(255) NOT NULL,
  `PickupTime` datetime DEFAULT NULL,
  `DropoffTime` datetime DEFAULT NULL,
  `PassengerCount` int(1) NOT NULL,
  `Fare` float NOT NULL,
  `ConvenienceFee` float NOT NULL,
  `Distance` float NOT NULL,
  `Rating` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commuter`
--

CREATE TABLE `commuter` (
  `CommuterID` int(11) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `MobileNumber` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `NoShow` int(255) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `IP` varchar(255) NOT NULL,
  `OTP` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `commuter`
--

INSERT INTO `commuter` (`CommuterID`, `Email`, `MobileNumber`, `Password`, `FirstName`, `LastName`, `NoShow`, `Status`, `IP`, `OTP`) VALUES
(1, 'dnkrtdev@gmail.com', '09505887362', '7d9184cfbd6260dcf352090c04779de4429f4ea623768e6109e18fd39d68004e729c7e80a33355e5682765a6a498b88a4bb2f57a6d24abbd15bc1b7f3fc1d2e4', 'Dan', 'Salazar', NULL, NULL, 'ac2f0877f8f0c656e5ba6f6a43d4ff78492a75f98715c156833292efcdb9f6aa4271ceb312ae6b5a87bfcd7f259a78f05fed1a0814e3fb3a37ed223378c93cef', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dispatcher`
--

CREATE TABLE `dispatcher` (
  `DispatcherID` int(11) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `TODA` varchar(255) NOT NULL,
  `DateCreated` datetime NOT NULL,
  `Status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dispatcher`
--

INSERT INTO `dispatcher` (`DispatcherID`, `Email`, `Password`, `FirstName`, `LastName`, `TODA`, `DateCreated`, `Status`) VALUES
(1, 'vannadoggo@gmail.com', '7d9184cfbd6260dcf352090c04779de4429f4ea623768e6109e18fd39d68004e729c7e80a33355e5682765a6a498b88a4bb2f57a6d24abbd15bc1b7f3fc1d2e4', 'Savanna', 'Salazar', 'Piel', '2023-10-02 15:56:06', '');

-- --------------------------------------------------------

--
-- Table structure for table `farematrix`
--

CREATE TABLE `farematrix` (
  `FareMatrixID` int(11) NOT NULL,
  `BaseFare` float NOT NULL,
  `PerKM` float NOT NULL,
  `NightDiff` float NOT NULL,
  `FarePerPassenger` float NOT NULL,
  `DateCreated` datetime NOT NULL,
  `DateDepreciated` datetime DEFAULT NULL,
  `Status` varchar(255) NOT NULL,
  `AdminID` int(255) NOT NULL,
  `AdminIP` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `farematrix`
--

INSERT INTO `farematrix` (`FareMatrixID`, `BaseFare`, `PerKM`, `NightDiff`, `FarePerPassenger`, `DateCreated`, `DateDepreciated`, `Status`, `AdminID`, `AdminIP`) VALUES
(1, 30, 10, 3, 5, '2023-10-11 12:41:57', NULL, 'active', 1, 'ac2f0877f8f0c656e5ba6f6a43d4ff78492a75f98715c156833292efcdb9f6aa4271ceb312ae6b5a87bfcd7f259a78f05fed1a0814e3fb3a37ed223378c93cef');

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `RouteID` int(11) NOT NULL,
  `Toda` varchar(255) NOT NULL,
  `Borders` varchar(1000) NOT NULL,
  `Creator` varchar(255) NOT NULL,
  `DateCreated` datetime NOT NULL,
  `DateDeprecated` datetime DEFAULT NULL,
  `Status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`RouteID`, `Toda`, `Borders`, `Creator`, `DateCreated`, `DateDeprecated`, `Status`) VALUES
(7, 'Piel', '{\"type\":\"polygon\",\"latlngs\":[[{\"lat\":14.952932342211593,\"lng\":120.89951992034914},{\"lat\":14.956663903242273,\"lng\":120.89782476425172},{\"lat\":14.954259126903922,\"lng\":120.89065790176393},{\"lat\":14.949677538760437,\"lng\":120.89271783828737}]]}', 'DevDan', '2023-10-11 02:59:15', NULL, 'active'),
(8, 'SJDD', '{\"type\":\"polygon\",\"latlngs\":[[{\"lat\":14.957244362456944,\"lng\":120.89997053146364},{\"lat\":14.954238395956223,\"lng\":120.90179443359376},{\"lat\":14.956912671669501,\"lng\":120.90466976165773},{\"lat\":14.959047922135378,\"lng\":120.9020733833313}]]}', 'DevDan', '2023-10-11 03:11:52', NULL, 'active'),
(10, 'Sabang', '{\"type\":\"polygon\",\"latlngs\":[[{\"lat\":14.96153556576685,\"lng\":120.89758872985841},{\"lat\":14.95778335889249,\"lng\":120.89954137802125},{\"lat\":14.959213765941996,\"lng\":120.90181589126588},{\"lat\":14.959939331087892,\"lng\":120.90248107910158},{\"lat\":14.963048868190059,\"lng\":120.90007781982423}]]}', 'DevDan', '2023-10-11 03:59:59', NULL, 'active'),
(11, 'St. Barbara', '{\"type\":\"polygon\",\"latlngs\":[[{\"lat\":14.958799156184948,\"lng\":120.8934259414673},{\"lat\":14.956539518920463,\"lng\":120.89441299438477},{\"lat\":14.955109094035068,\"lng\":120.89059352874757},{\"lat\":14.956850479589745,\"lng\":120.89044332504274}]]}', 'DevDan', '2023-10-11 04:01:12', NULL, 'active'),
(20, '', '{\"type\":\"polygon\",\"latlngs\":[[{\"lat\":14.957804089497555,\"lng\":120.86823463439941},{\"lat\":14.9592552268736,\"lng\":120.87213993072511},{\"lat\":14.955896865441948,\"lng\":120.8723545074463},{\"lat\":14.954404243481813,\"lng\":120.86905002593996}]]}', '', '2023-10-20 12:46:19', NULL, 'active'),
(21, '', '{\"type\":\"polygon\",\"latlngs\":[[{\"lat\":14.968832487231943,\"lng\":120.8708953857422},{\"lat\":14.965018218361,\"lng\":120.87209701538087},{\"lat\":14.965681574345016,\"lng\":120.87844848632814},{\"lat\":14.968500814372751,\"lng\":120.87707519531251}]]}', '', '2023-10-20 12:49:16', NULL, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `todalocation`
--

CREATE TABLE `todalocation` (
  `TodaID` int(11) NOT NULL,
  `Toda` varchar(255) NOT NULL,
  `Terminal` varchar(2000) NOT NULL,
  `DateCreated` datetime NOT NULL,
  `DateDepreciated` datetime DEFAULT NULL,
  `AdminID` int(11) NOT NULL,
  `AdminIP` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `todalocation`
--

INSERT INTO `todalocation` (`TodaID`, `Toda`, `Terminal`, `DateCreated`, `DateDepreciated`, `AdminID`, `AdminIP`) VALUES
(1, 'Piel', '{\"type\":\"marker\",\"latlng\":{\"lat\":14.952606079606278,\"lng\":120.89787847559734}}', '2023-10-11 03:13:42', NULL, 12312, 'dasdad'),
(2, 'SJDD', '{\"type\":\"marker\",\"latlng\":{\"lat\":14.956319116713315,\"lng\":120.90238940371549}}', '2023-10-11 03:16:18', NULL, 123123, 'dasdasd'),
(3, 'Sabang', '{\"type\":\"marker\",\"latlng\":{\"lat\":14.961114144732555,\"lng\":120.90076314356054}}', '2023-10-11 03:59:13', NULL, 23132, 'dasdasd'),
(4, 'St. Barbara', '{\"type\":\"marker\",\"latlng\":{\"lat\":14.956882119229656,\"lng\":120.89181723907254}}', '2023-10-11 04:02:06', NULL, 12312, 'sdadd');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `baliuag`
--
ALTER TABLE `baliuag`
  ADD PRIMARY KEY (`placeid`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`BookingID`);

--
-- Indexes for table `commuter`
--
ALTER TABLE `commuter`
  ADD PRIMARY KEY (`CommuterID`);

--
-- Indexes for table `dispatcher`
--
ALTER TABLE `dispatcher`
  ADD PRIMARY KEY (`DispatcherID`);

--
-- Indexes for table `farematrix`
--
ALTER TABLE `farematrix`
  ADD PRIMARY KEY (`FareMatrixID`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`RouteID`);

--
-- Indexes for table `todalocation`
--
ALTER TABLE `todalocation`
  ADD PRIMARY KEY (`TodaID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `baliuag`
--
ALTER TABLE `baliuag`
  MODIFY `placeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `BookingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `commuter`
--
ALTER TABLE `commuter`
  MODIFY `CommuterID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dispatcher`
--
ALTER TABLE `dispatcher`
  MODIFY `DispatcherID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `farematrix`
--
ALTER TABLE `farematrix`
  MODIFY `FareMatrixID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `route`
--
ALTER TABLE `route`
  MODIFY `RouteID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `todalocation`
--
ALTER TABLE `todalocation`
  MODIFY `TodaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
