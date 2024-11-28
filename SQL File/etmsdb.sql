-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 20, 2024 at 04:34 PM
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
-- Database: `etmsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `ID` int(10) NOT NULL,
  `AdminName` varchar(120) DEFAULT NULL,
  `UserName` varchar(120) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Password` varchar(200) DEFAULT NULL,
  `AdminRegdate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`ID`, `AdminName`, `UserName`, `MobileNumber`, `Email`, `Password`, `AdminRegdate`) VALUES
(1, 'Admin', 'admin', 8979555558, 'admin@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2024-03-05 04:36:52');

-- --------------------------------------------------------

--
-- Table structure for table `tbldepartment`
--

CREATE TABLE `tbldepartment` (
  `ID` int(5) NOT NULL,
  `DepartmentName` varchar(250) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbldepartment`
--

INSERT INTO `tbldepartment` (`ID`, `DepartmentName`, `CreationDate`) VALUES
(1, 'HR', '2024-03-10 06:59:06'),
(2, 'Logistics', '2024-03-10 06:59:06'),
(3, 'Technical', '2024-03-10 06:59:06'),
(4, 'Accounts', '2024-03-10 06:59:06'),
(5, 'Testing', '2024-03-10 06:59:06'),
(6, 'Operations', '2024-03-10 06:59:06');

-- --------------------------------------------------------

--
-- Table structure for table `tblemployee`
--

CREATE TABLE `tblemployee` (
  `ID` int(5) NOT NULL,
  `DepartmentID` int(5) DEFAULT NULL,
  `EmpId` varchar(100) DEFAULT NULL,
  `EmpName` varchar(200) DEFAULT NULL,
  `EmpEmail` varchar(200) DEFAULT NULL,
  `EmpContactNumber` bigint(10) DEFAULT NULL,
  `Designation` varchar(200) DEFAULT NULL,
  `EmpDateofbirth` date DEFAULT NULL,
  `EmpAddress` varchar(250) DEFAULT NULL,
  `EmpDateofjoining` date DEFAULT NULL,
  `Description` mediumtext DEFAULT NULL,
  `Password` varchar(200) DEFAULT NULL,
  `ProfilePic` varchar(250) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblemployee`
--

INSERT INTO `tblemployee` (`ID`, `DepartmentID`, `EmpId`, `EmpName`, `EmpEmail`, `EmpContactNumber`, `Designation`, `EmpDateofbirth`, `EmpAddress`, `EmpDateofjoining`, `Description`, `Password`, `ProfilePic`, `CreationDate`, `UpdationDate`) VALUES
(1, 1, '10806121', 'Rahul Singh', 'rahul12@gmail.com', 1234567890, 'Head HR', '1996-01-01', 'NA', '2024-08-10', 'NA', 'f925916e2754e5e03f75dd58a5733251', 'ecf0de3fa05c0df7ef423ef15b8033191726585841.png', '2024-09-17 15:10:41', NULL),
(2, 3, '1452666', 'John Doe', 'johndoe1@t.com', 3213213210, 'Software Developer', '2002-01-01', 'NA', '2024-09-01', 'NA', 'f925916e2754e5e03f75dd58a5733251', 'ecf0de3fa05c0df7ef423ef15b8033191726796771.png', '2024-09-20 01:46:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblpage`
--

CREATE TABLE `tblpage` (
  `ID` int(10) NOT NULL,
  `PageType` varchar(200) DEFAULT NULL,
  `PageTitle` mediumtext DEFAULT NULL,
  `PageDescription` mediumtext DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `UpdationDate` date DEFAULT NULL,
  `Timing` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblpage`
--

INSERT INTO `tblpage` (`ID`, `PageType`, `PageTitle`, `PageDescription`, `Email`, `MobileNumber`, `UpdationDate`, `Timing`) VALUES
(1, 'aboutus', 'About Us', 'Employee Task Management System\r\nWelcome to about Us page', NULL, NULL, NULL, ''),
(2, 'contactus', 'Contact Us', '890,Sector 62, Gyan Sarovar, GAIL Noida(Delhi/NCR)', 'taskinfo@gmail.com', 7896541239, NULL, '10:30 am to 7:30 pm');

-- --------------------------------------------------------

--
-- Table structure for table `tbltask`
--

CREATE TABLE `tbltask` (
  `ID` int(5) NOT NULL,
  `DeptID` int(5) DEFAULT NULL,
  `AssignTaskto` int(5) DEFAULT NULL,
  `TaskPriority` varchar(100) DEFAULT NULL,
  `TaskTitle` varchar(250) DEFAULT NULL,
  `TaskDescription` mediumtext DEFAULT NULL,
  `TaskEnddate` date DEFAULT NULL,
  `TaskAssigndate` timestamp NULL DEFAULT current_timestamp(),
  `taskFile` varchar(255) DEFAULT NULL,
  `Status` varchar(200) DEFAULT NULL,
  `WorkCompleted` varchar(250) DEFAULT NULL,
  `Remark` varchar(250) DEFAULT NULL,
  `UpdationDate` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbltask`
--

INSERT INTO `tbltask` (`ID`, `DeptID`, `AssignTaskto`, `TaskPriority`, `TaskTitle`, `TaskDescription`, `TaskEnddate`, `TaskAssigndate`, `taskFile`, `Status`, `WorkCompleted`, `Remark`, `UpdationDate`) VALUES
(1, 1, 1, 'Normal', 'Hiring of New Android Developer', 'hire a new android developer with 5 year', '2024-09-30', '2024-09-17 15:25:16', 'a375fcfbcac4b897b4574fbd4003467d1726586716.pdf', 'Completed', '100', 'Android develop Hired', NULL),
(2, 3, 2, 'Medium', 'Change in the XYZ Software', 'Do the changes in the form1 and also provide the print facilty', '2024-09-25', '2024-09-20 01:47:21', NULL, 'Completed', '100', 'Task COmpleted', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbltasktracking`
--

CREATE TABLE `tbltasktracking` (
  `ID` int(10) NOT NULL,
  `TaskID` int(10) DEFAULT NULL,
  `Remark` varchar(250) DEFAULT NULL,
  `Status` varchar(100) DEFAULT NULL,
  `WorkCompleted` varchar(200) DEFAULT NULL,
  `UpdationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbltasktracking`
--

INSERT INTO `tbltasktracking` (`ID`, `TaskID`, `Remark`, `Status`, `WorkCompleted`, `UpdationDate`) VALUES
(1, 1, 'inteview started', 'Inprogress', '50', '2024-09-19 15:40:04'),
(2, 1, 'Android develop Hired', 'Completed', '100', '2024-09-20 01:41:07'),
(3, 2, 'Work Started', 'Inprogress', '10', '2024-09-20 01:48:16'),
(4, 2, 'Task COmpleted', 'Completed', '100', '2024-09-20 01:48:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbldepartment`
--
ALTER TABLE `tbldepartment`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblemployee`
--
ALTER TABLE `tblemployee`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblpage`
--
ALTER TABLE `tblpage`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbltask`
--
ALTER TABLE `tbltask`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbltasktracking`
--
ALTER TABLE `tbltasktracking`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbldepartment`
--
ALTER TABLE `tbldepartment`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tblemployee`
--
ALTER TABLE `tblemployee`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblpage`
--
ALTER TABLE `tblpage`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbltask`
--
ALTER TABLE `tbltask`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbltasktracking`
--
ALTER TABLE `tbltasktracking`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
