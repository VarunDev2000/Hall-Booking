-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2020 at 09:24 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hall_booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(200) NOT NULL,
  `staff_id1` int(11) NOT NULL,
  `staff_id2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `course_name`, `staff_id1`, `staff_id2`) VALUES
(1, 'Integrated Programming', 1, 3),
(2, 'Mobile Computing', 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `course_enrolled`
--

CREATE TABLE `course_enrolled` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course_enrolled`
--

INSERT INTO `course_enrolled` (`id`, `student_id`, `course_id`, `staff_id`) VALUES
(1, 3, 1, 1),
(2, 3, 2, 4),
(3, 4, 1, 3),
(4, 4, 2, 2),
(10, 22, 1, 1),
(11, 22, 2, 2),
(14, 10, 1, 1),
(15, 10, 2, 4),
(18, 8, 1, 3),
(19, 8, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(250) NOT NULL,
  `name` varchar(100) NOT NULL,
  `u_name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `name`, `u_name`, `password`) VALUES
(1, 'e', 'e', 'e'),
(2, 'Staff2', 'staff_2', 'staff2_pass'),
(3, 'Staff3', 'staff_3', 's3_pass'),
(4, 'Staff4', 'staff_4', 's4_pass');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` int(250) NOT NULL,
  `name` varchar(100) NOT NULL,
  `u_name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `name`, `u_name`, `password`) VALUES
(3, 'Student1', 'stu_1', 'stu1_pass'),
(4, 'Student2', 'stu_2', 'stu2_pass'),
(5, 'varun', 'varun', 'varun'),
(8, 'fg', 'fg', 'fg'),
(10, 'v', 'v', 'v'),
(11, 's', 's', 's'),
(22, 'd', 'd', 'd'),
(96, 'e', 'e', 'e');

-- --------------------------------------------------------

--
-- Table structure for table `timetable`
--

CREATE TABLE `timetable` (
  `day` int(11) NOT NULL,
  `hour` int(11) NOT NULL,
  `hall_no` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `timetable`
--

INSERT INTO `timetable` (`day`, `hour`, `hall_no`, `course_id`, `staff_id`, `type`) VALUES
(1, 3, 1, 1, 1, 'Exam'),
(1, 4, 1, 1, 1, 'Exam'),
(2, 1, 1, 2, 4, 'Exam'),
(2, 3, 3, 1, 1, 'Lecture'),
(2, 4, 3, 2, 2, 'Exam'),
(3, 1, 4, 2, 4, 'Exam'),
(5, 3, 3, 1, 3, 'Lecture');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `staff_id1` (`staff_id1`),
  ADD KEY `staff_id2` (`staff_id2`);

--
-- Indexes for table `course_enrolled`
--
ALTER TABLE `course_enrolled`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `teacher_id` (`staff_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `u_name` (`u_name`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `u_name` (`u_name`);

--
-- Indexes for table `timetable`
--
ALTER TABLE `timetable`
  ADD UNIQUE KEY `day` (`day`,`hour`,`hall_no`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `course_enrolled`
--
ALTER TABLE `course_enrolled`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `student_id` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`staff_id1`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `course_ibfk_2` FOREIGN KEY (`staff_id2`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `course_enrolled`
--
ALTER TABLE `course_enrolled`
  ADD CONSTRAINT `course_enrolled_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `course_enrolled_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `course_enrolled_ibfk_3` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `timetable`
--
ALTER TABLE `timetable`
  ADD CONSTRAINT `timetable_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `timetable_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
