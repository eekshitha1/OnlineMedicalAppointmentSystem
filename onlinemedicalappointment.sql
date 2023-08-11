-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2022 at 04:32 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlinemedicalappointment`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_uname` varchar(6) NOT NULL,
  `admin_pwd` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_uname`, `admin_pwd`) VALUES
('arun', 'arun1234'),
('harsh', 'harsh1234'),
('keerth', 'keerthi1234'),
('sai', 'sai1234'),
('vyshu', 'vyshu1234');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `a_id` int(11) NOT NULL,
  `a_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `a_bookingdate` date DEFAULT NULL,
  `a_status` varchar(200) DEFAULT NULL,
  `a_desc` varchar(200) DEFAULT NULL,
  `p_uname` varchar(60) DEFAULT NULL,
  `doc_uname` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`a_id`, `a_date`, `a_bookingdate`, `a_status`, `a_desc`, `p_uname`, `doc_uname`) VALUES
(1, '2022-11-26 01:34:43', '2022-04-22', 'Accepted', 'pimples', 'eekshi', 'srija'),
(2, '2022-11-27 02:29:53', '2022-04-22', 'Accepted', 'cold', 'pinky', 'meghana'),
(3, '2022-04-22 05:00:00', '2022-04-22', 'pending', 'nerve pain', 'nishmith', 'rishika'),
(4, '2022-11-27 19:58:49', '2022-11-27', 'Accepted', 'PCOD', 'eekshi', 'srija'),
(5, '2022-11-30 00:51:30', '2022-11-27', 'pending', 'PCOD', 'eekshi', 'srija');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doc_uname` varchar(60) NOT NULL,
  `doc_pwd` varchar(60) DEFAULT NULL,
  `doc_fname` varchar(60) DEFAULT NULL,
  `doc_lname` varchar(60) DEFAULT NULL,
  `doc_phnno` varchar(12) DEFAULT NULL,
  `doc_email` varchar(60) DEFAULT NULL,
  `doc_address` varchar(100) DEFAULT NULL,
  `illness_type_id` int(11) DEFAULT NULL,
  `doc_utype` varchar(40) DEFAULT NULL,
  `doc_info` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doc_uname`, `doc_pwd`, `doc_fname`, `doc_lname`, `doc_phnno`, `doc_email`, `doc_address`, `illness_type_id`, `doc_utype`, `doc_info`) VALUES
('meghana', 'meghana1234', 'doctor meghana', 'koduri', '6666666666', 'meghana@gmail.com', 'denton', 1, 'Doctor', 'MD'),
('niki1', 'niki1234', 'niki', 'thota', '5544336677', 'nikithathota20@gmail.com', 'ramky enclaves', 4, 'Doctor', 'MD'),
('rishika', 'rishika1234', 'doctor rishika', 'pakala', '7777777777', 'rishika@gmail.com', 'denton', 4, 'Doctor', 'MBBS'),
('srija', 'srija1234', 'doctor srija', 'vemula', '8888888888', 'srija@gmail.com', 'denton', 5, 'Doctor', 'PHD');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_leaves`
--

CREATE TABLE `doctor_leaves` (
  `leave_id` int(11) NOT NULL,
  `start_date` varchar(40) DEFAULT NULL,
  `end_date` varchar(40) DEFAULT NULL,
  `leave_res` varchar(250) DEFAULT NULL,
  `leave_status` varchar(40) DEFAULT NULL,
  `doc_uname` varchar(60) DEFAULT NULL,
  `admin_uname` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor_leaves`
--

INSERT INTO `doctor_leaves` (`leave_id`, `start_date`, `end_date`, `leave_res`, `leave_status`, `doc_uname`, `admin_uname`) VALUES
(1, '2022-11-03', '2022-11-30', 'vacation', 'Rejected', 'srija', 'arun'),
(3, '2022-12-25', '2022-12-29', 'marriage', 'Accepted', 'rishika', 'harsh'),
(5, '25/Nov/2022', '28/Nov/2022', 'out of town', 'Accepted', 'srija', NULL),
(7, '25/Nov/2022', '28/Nov/2022', 'out of town', 'Accepted', 'srija', NULL),
(9, '28/Nov/2022', '30/Nov/2022', 'fever', 'Accepted', 'srija', NULL),
(11, '2/Nov/2023', '2/Nov/2023', 'vacation', 'Rejected', 'srija', NULL),
(13, '29/Nov/2022', '30/Nov/2022', 'out of town', 'Accepted', 'niki1', NULL),
(15, '25/Nov/2022', '30/Nov/2022', 'out of town', 'pending', 'srija', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `frequentquestion`
--

CREATE TABLE `frequentquestion` (
  `faq_id` int(11) NOT NULL,
  `faq_question` varchar(300) DEFAULT NULL,
  `faq_answer` varchar(300) DEFAULT NULL,
  `admin_uname` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `frequentquestion`
--

INSERT INTO `frequentquestion` (`faq_id`, `faq_question`, `faq_answer`, `admin_uname`) VALUES
(1, 'how to book apt', 'login, then go to diseases, select a disease and click', 'vyshu'),
(2, 'how to add faq', 'admin login, click on faq, then add faq', 'harsh'),
(3, 'what are the different categories avaliable', 'general, ent, cardiology and neurology', 'arun'),
(4, 'how to check prescriptions', 'go to view appointments in patient login', 'sai');

-- --------------------------------------------------------

--
-- Table structure for table `illness`
--

CREATE TABLE `illness` (
  `i_id` int(11) NOT NULL,
  `i_name` varchar(200) DEFAULT NULL,
  `illness_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `illness`
--

INSERT INTO `illness` (`i_id`, `i_name`, `illness_type_id`) VALUES
(1, 'fever', 1),
(2, 'cold', 1),
(3, 'ear pain', 2),
(4, 'chest pain', 3),
(5, 'heart', 3),
(6, 'nerve pain', 4),
(7, 'pimples', 5);

-- --------------------------------------------------------

--
-- Table structure for table `illness_type`
--

CREATE TABLE `illness_type` (
  `illness_type_id` int(11) NOT NULL,
  `illness_type_name` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `illness_type`
--

INSERT INTO `illness_type` (`illness_type_id`, `illness_type_name`) VALUES
(1, 'General'),
(2, 'ENT'),
(3, 'Cardiology'),
(4, 'Neurology'),
(5, 'Gynecology');

-- --------------------------------------------------------

--
-- Table structure for table `joining`
--

CREATE TABLE `joining` (
  `join_presc_id` int(11) NOT NULL,
  `join_desc` varchar(200) DEFAULT NULL,
  `approx_days` int(11) DEFAULT NULL,
  `a_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `joining`
--

INSERT INTO `joining` (`join_presc_id`, `join_desc`, `approx_days`, `a_id`) VALUES
(1, 'general ward', 10, 1),
(2, 'ICU', 7, 2),
(3, 'hospital', 3, 3),
(4, 'home', 6, 2),
(5, 'Hospital', 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `laboratoty`
--

CREATE TABLE `laboratoty` (
  `lab_id` int(11) NOT NULL,
  `lab_name` varchar(200) DEFAULT NULL,
  `lab_loc` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laboratoty`
--

INSERT INTO `laboratoty` (`lab_id`, `lab_name`, `lab_loc`) VALUES
(1, 'vijaya lab', 'denton'),
(2, 'geno lab', 'irving'),
(3, 'pvr lab', 'plano'),
(4, 'apolo lab', 'dallas'),
(5, 'vbr lab', 'frisco');

-- --------------------------------------------------------

--
-- Table structure for table `lab_bill`
--

CREATE TABLE `lab_bill` (
  `lab_bill_id` int(11) NOT NULL,
  `lab_totcost` decimal(6,2) DEFAULT NULL,
  `lab_pres_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lab_bill`
--

INSERT INTO `lab_bill` (`lab_bill_id`, `lab_totcost`, `lab_pres_id`) VALUES
(1, '51.00', 1),
(2, '20.00', 2),
(3, '10.00', 3),
(4, '40.00', 4),
(5, '39.00', 5);

-- --------------------------------------------------------

--
-- Table structure for table `lab_prescription`
--

CREATE TABLE `lab_prescription` (
  `lab_pres_id` int(11) NOT NULL,
  `a_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lab_prescription`
--

INSERT INTO `lab_prescription` (`lab_pres_id`, `a_id`) VALUES
(1, 1),
(4, 1),
(2, 2),
(5, 2),
(3, 3),
(6, 3),
(7, 4);

-- --------------------------------------------------------

--
-- Table structure for table `lab_prescription_service`
--

CREATE TABLE `lab_prescription_service` (
  `lab_pres_serv_id` int(11) NOT NULL,
  `lab_pres_id` int(11) DEFAULT NULL,
  `lab_serv_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lab_prescription_service`
--

INSERT INTO `lab_prescription_service` (`lab_pres_serv_id`, `lab_pres_id`, `lab_serv_id`) VALUES
(1, 1, 4),
(2, 2, 3),
(3, 3, 5),
(4, 4, 1),
(5, 5, 2),
(6, 7, 1),
(7, 7, 2);

-- --------------------------------------------------------

--
-- Table structure for table `lab_service`
--

CREATE TABLE `lab_service` (
  `lab_serv_id` int(11) NOT NULL,
  `lab_serv_name` varchar(200) DEFAULT NULL,
  `lab_serv_cost` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lab_service`
--

INSERT INTO `lab_service` (`lab_serv_id`, `lab_serv_name`, `lab_serv_cost`) VALUES
(1, 'MRA', '40.00'),
(2, 'MRI', '39.00'),
(3, 'Urine Test', '20.00'),
(4, 'X-Ray', '51.00'),
(5, 'Blood Test', '10.00');

-- --------------------------------------------------------

--
-- Table structure for table `lab_service_laboratory`
--

CREATE TABLE `lab_service_laboratory` (
  `lab_serv_laboratory_id` int(11) NOT NULL,
  `lab_serv_id` int(11) DEFAULT NULL,
  `lab_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lab_service_laboratory`
--

INSERT INTO `lab_service_laboratory` (`lab_serv_laboratory_id`, `lab_serv_id`, `lab_id`) VALUES
(1, 1, 5),
(2, 5, 4),
(3, 4, 3),
(4, 3, 2),
(5, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `medical_bill`
--

CREATE TABLE `medical_bill` (
  `med_bill_id` int(11) NOT NULL,
  `med_tot_cost` decimal(6,2) DEFAULT NULL,
  `pres_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `medical_bill`
--

INSERT INTO `medical_bill` (`med_bill_id`, `med_tot_cost`, `pres_id`) VALUES
(1, '34.00', 1),
(2, '17.00', 2),
(3, '9.00', 3),
(4, '9.00', 4),
(5, '8.00', 5);

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `med_id` int(11) NOT NULL,
  `med_name` varchar(200) DEFAULT NULL,
  `med_cost` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`med_id`, `med_name`, `med_cost`) VALUES
(1, 'stodil', '15.00'),
(2, 'crocin', '8.00'),
(3, 'dolo', '9.00'),
(4, 'citrigin', '10.00'),
(5, 'aspirin', '9.00');

-- --------------------------------------------------------

--
-- Table structure for table `medicine_pharmacy`
--

CREATE TABLE `medicine_pharmacy` (
  `med_phar_id` int(11) NOT NULL,
  `med_id` int(11) DEFAULT NULL,
  `phar_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `medicine_pharmacy`
--

INSERT INTO `medicine_pharmacy` (`med_phar_id`, `med_id`, `phar_id`) VALUES
(1, 1, 1),
(2, 2, 3),
(3, 3, 2),
(4, 4, 4),
(5, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `p_uname` varchar(60) NOT NULL,
  `p_pwd` varchar(60) DEFAULT NULL,
  `p_gender` varchar(10) DEFAULT NULL,
  `p_phnno` varchar(20) DEFAULT NULL,
  `p_email` varchar(60) DEFAULT NULL,
  `p_address` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`p_uname`, `p_pwd`, `p_gender`, `p_phnno`, `p_email`, `p_address`) VALUES
('aishu', 'aishu', 'female', '3333333333', 'aishu@gmail.com', 'Fry st'),
('eekshi', 'eekshi', 'female', '1111111111', 'eekshi@gmail.com', 'Neff st'),
('eeshu', 'eeshu14', 'Female', '8877665544', 'eeshu@gmail.com', 'Nreff St'),
('keerthi', 'keerthi', 'Female', '8888888888', 'keerthi@gmail.com', 'hanamkonda'),
('kushul', 'kushul', 'male', '1234560987', 'kushul@gmail.com', 'Neff st'),
('neha', 'neha123', 'Female', '5555555555', 'neha@gmail.com', 'neff st'),
('nikitha1', 'nikitha123', 'Female', '7755443388', 'nikitha@gmail.com', 'irving'),
('nishmith', 'nishmith', 'male', '1234567890', 'nishmith@gmail.com', 'Louise st'),
('pinky', 'pinky', 'female', '2222222222', 'pinky@gmail.com', 'Irving');

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy`
--

CREATE TABLE `pharmacy` (
  `phar_id` int(11) NOT NULL,
  `phar_name` varchar(200) DEFAULT NULL,
  `phar_loc` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pharmacy`
--

INSERT INTO `pharmacy` (`phar_id`, `phar_name`, `phar_loc`) VALUES
(1, 'pvr', 'irving'),
(2, '24*7', 'plano'),
(3, 'walmart', 'dallas'),
(4, 'torchys', 'denton'),
(5, 'costco', 'frisco');

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `pres_id` int(11) NOT NULL,
  `a_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`pres_id`, `a_id`) VALUES
(1, 1),
(4, 1),
(2, 2),
(5, 2),
(3, 3),
(6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `prescription_medicine`
--

CREATE TABLE `prescription_medicine` (
  `pres_med_id` int(11) NOT NULL,
  `pres_id` int(11) DEFAULT NULL,
  `med_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prescription_medicine`
--

INSERT INTO `prescription_medicine` (`pres_med_id`, `pres_id`, `med_id`) VALUES
(1, 1, 1),
(2, 1, 3),
(3, 1, 4),
(4, 2, 3),
(5, 2, 2),
(6, 3, 3),
(7, 4, 5),
(8, 5, 2),
(9, 6, 2),
(10, 6, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_uname`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`a_id`),
  ADD KEY `patient_fk` (`p_uname`),
  ADD KEY `doctor_fk` (`doc_uname`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doc_uname`),
  ADD KEY `fk_illness_type_d` (`illness_type_id`);

--
-- Indexes for table `doctor_leaves`
--
ALTER TABLE `doctor_leaves`
  ADD PRIMARY KEY (`leave_id`),
  ADD KEY `admin_fk` (`admin_uname`),
  ADD KEY `doc_fk1` (`doc_uname`);

--
-- Indexes for table `frequentquestion`
--
ALTER TABLE `frequentquestion`
  ADD PRIMARY KEY (`faq_id`),
  ADD KEY `admin_faq_fk` (`admin_uname`);

--
-- Indexes for table `illness`
--
ALTER TABLE `illness`
  ADD PRIMARY KEY (`i_id`),
  ADD KEY `illness_type_fk` (`illness_type_id`);

--
-- Indexes for table `illness_type`
--
ALTER TABLE `illness_type`
  ADD PRIMARY KEY (`illness_type_id`);

--
-- Indexes for table `joining`
--
ALTER TABLE `joining`
  ADD PRIMARY KEY (`join_presc_id`),
  ADD KEY `appointment_fk3` (`a_id`);

--
-- Indexes for table `laboratoty`
--
ALTER TABLE `laboratoty`
  ADD PRIMARY KEY (`lab_id`);

--
-- Indexes for table `lab_bill`
--
ALTER TABLE `lab_bill`
  ADD PRIMARY KEY (`lab_bill_id`),
  ADD KEY `lab_prescription_fk2` (`lab_pres_id`);

--
-- Indexes for table `lab_prescription`
--
ALTER TABLE `lab_prescription`
  ADD PRIMARY KEY (`lab_pres_id`),
  ADD KEY `appointment_fk2` (`a_id`);

--
-- Indexes for table `lab_prescription_service`
--
ALTER TABLE `lab_prescription_service`
  ADD PRIMARY KEY (`lab_pres_serv_id`),
  ADD KEY `lab_prescription_fk` (`lab_pres_id`),
  ADD KEY `lab_service_fk` (`lab_serv_id`);

--
-- Indexes for table `lab_service`
--
ALTER TABLE `lab_service`
  ADD PRIMARY KEY (`lab_serv_id`);

--
-- Indexes for table `lab_service_laboratory`
--
ALTER TABLE `lab_service_laboratory`
  ADD PRIMARY KEY (`lab_serv_laboratory_id`),
  ADD KEY `lab_service_fk2` (`lab_serv_id`),
  ADD KEY `lab_fk` (`lab_id`);

--
-- Indexes for table `medical_bill`
--
ALTER TABLE `medical_bill`
  ADD PRIMARY KEY (`med_bill_id`),
  ADD KEY `pres_fk2` (`pres_id`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`med_id`);

--
-- Indexes for table `medicine_pharmacy`
--
ALTER TABLE `medicine_pharmacy`
  ADD PRIMARY KEY (`med_phar_id`),
  ADD KEY `med_fk2` (`med_id`),
  ADD KEY `phar_fk` (`phar_id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`p_uname`);

--
-- Indexes for table `pharmacy`
--
ALTER TABLE `pharmacy`
  ADD PRIMARY KEY (`phar_id`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`pres_id`),
  ADD KEY `appointment_fk` (`a_id`);

--
-- Indexes for table `prescription_medicine`
--
ALTER TABLE `prescription_medicine`
  ADD PRIMARY KEY (`pres_med_id`),
  ADD KEY `pres_fk` (`pres_id`),
  ADD KEY `med_fk` (`med_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `pres_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `doctor_fk` FOREIGN KEY (`doc_uname`) REFERENCES `doctor` (`doc_uname`),
  ADD CONSTRAINT `patient_fk` FOREIGN KEY (`p_uname`) REFERENCES `patient` (`p_uname`);

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `fk_illness_type_d` FOREIGN KEY (`illness_type_id`) REFERENCES `illness_type` (`illness_type_id`);

--
-- Constraints for table `doctor_leaves`
--
ALTER TABLE `doctor_leaves`
  ADD CONSTRAINT `admin_fk` FOREIGN KEY (`admin_uname`) REFERENCES `admin` (`admin_uname`),
  ADD CONSTRAINT `doc_fk1` FOREIGN KEY (`doc_uname`) REFERENCES `doctor` (`doc_uname`);

--
-- Constraints for table `frequentquestion`
--
ALTER TABLE `frequentquestion`
  ADD CONSTRAINT `admin_faq_fk` FOREIGN KEY (`admin_uname`) REFERENCES `admin` (`admin_uname`);

--
-- Constraints for table `illness`
--
ALTER TABLE `illness`
  ADD CONSTRAINT `illness_type_fk` FOREIGN KEY (`illness_type_id`) REFERENCES `illness_type` (`illness_type_id`);

--
-- Constraints for table `joining`
--
ALTER TABLE `joining`
  ADD CONSTRAINT `appointment_fk3` FOREIGN KEY (`a_id`) REFERENCES `appointment` (`a_id`);

--
-- Constraints for table `lab_bill`
--
ALTER TABLE `lab_bill`
  ADD CONSTRAINT `lab_prescription_fk2` FOREIGN KEY (`lab_pres_id`) REFERENCES `lab_prescription` (`lab_pres_id`);

--
-- Constraints for table `lab_prescription`
--
ALTER TABLE `lab_prescription`
  ADD CONSTRAINT `appointment_fk2` FOREIGN KEY (`a_id`) REFERENCES `appointment` (`a_id`);

--
-- Constraints for table `lab_prescription_service`
--
ALTER TABLE `lab_prescription_service`
  ADD CONSTRAINT `lab_prescription_fk` FOREIGN KEY (`lab_pres_id`) REFERENCES `lab_prescription` (`lab_pres_id`),
  ADD CONSTRAINT `lab_service_fk` FOREIGN KEY (`lab_serv_id`) REFERENCES `lab_service` (`lab_serv_id`);

--
-- Constraints for table `lab_service_laboratory`
--
ALTER TABLE `lab_service_laboratory`
  ADD CONSTRAINT `lab_fk` FOREIGN KEY (`lab_id`) REFERENCES `laboratoty` (`lab_id`),
  ADD CONSTRAINT `lab_service_fk2` FOREIGN KEY (`lab_serv_id`) REFERENCES `lab_service` (`lab_serv_id`);

--
-- Constraints for table `medical_bill`
--
ALTER TABLE `medical_bill`
  ADD CONSTRAINT `pres_fk2` FOREIGN KEY (`pres_id`) REFERENCES `prescription` (`pres_id`);

--
-- Constraints for table `medicine_pharmacy`
--
ALTER TABLE `medicine_pharmacy`
  ADD CONSTRAINT `med_fk2` FOREIGN KEY (`med_id`) REFERENCES `medicine` (`med_id`),
  ADD CONSTRAINT `phar_fk` FOREIGN KEY (`phar_id`) REFERENCES `pharmacy` (`phar_id`);

--
-- Constraints for table `prescription`
--
ALTER TABLE `prescription`
  ADD CONSTRAINT `appointment_fk` FOREIGN KEY (`a_id`) REFERENCES `appointment` (`a_id`);

--
-- Constraints for table `prescription_medicine`
--
ALTER TABLE `prescription_medicine`
  ADD CONSTRAINT `med_fk` FOREIGN KEY (`med_id`) REFERENCES `medicine` (`med_id`),
  ADD CONSTRAINT `pres_fk` FOREIGN KEY (`pres_id`) REFERENCES `prescription` (`pres_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
