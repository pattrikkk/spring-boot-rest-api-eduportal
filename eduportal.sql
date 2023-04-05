-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hostiteľ: 127.0.0.1
-- Čas generovania: St 05.Apr 2023, 17:18
-- Verzia serveru: 10.4.27-MariaDB
-- Verzia PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáza: `eduportal`
--
CREATE DATABASE IF NOT EXISTS `eduportal` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `eduportal`;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `course`
--

INSERT INTO `course` (`id`, `name`, `description`) VALUES
(1, 'Introduction to Python', 'This course provides an introduction to the Python programming language.'),
(2, 'Data Analysis with Pandas', 'This course covers data analysis with the Pandas library in Python.'),
(3, 'Web Development with Flask', 'This course teaches web development with the Flask framework in Python.'),
(4, 'Machine Learning with Scikit-Learn', 'This course covers machine learning with the Scikit-Learn library in Python.'),
(5, 'Database Design and SQL', 'This course covers database design and SQL programming.'),
(6, 'Java Fundamentals', 'This course provides an introduction to Java programming.'),
(7, 'Object-Oriented Programming in C++', 'This course covers object-oriented programming in C++.'),
(8, 'Mobile App Development with React Native', 'This course teaches mobile app development with React Native.'),
(9, 'Introduction to Artificial Intelligence', 'This course provides an introduction to artificial intelligence and machine learning.'),
(10, 'Full-Stack Web Development with Node.js', 'This course teaches full-stack web development with Node.js.');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `course_student`
--

CREATE TABLE `course_student` (
  `id` int(11) NOT NULL,
  `Course_id` int(11) NOT NULL,
  `Student_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `course_student`
--

INSERT INTO `course_student` (`id`, `Course_id`, `Student_id`) VALUES
(1, 1, 2),
(2, 3, 4),
(3, 2, 5),
(4, 4, 1),
(5, 5, 3);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `birth_date` date NOT NULL,
  `gender` varchar(16) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(32) NOT NULL,
  `credit` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `student`
--

INSERT INTO `student` (`id`, `first_name`, `last_name`, `birth_date`, `gender`, `email`, `phone`, `credit`) VALUES
(1, 'John', 'Doe', '1998-06-15', 'Male', 'johndoe@example.com', '555-1234', 24),
(2, 'Jane', 'Smith', '1999-02-28', 'Female', 'janesmith@example.com', '555-5678', 30),
(3, 'Bob', 'Johnson', '1997-09-12', 'Male', 'bobjohnson@example.com', '555-2468', 18),
(4, 'Emily', 'Davis', '2000-11-01', 'Female', 'emilydavis@example.com', '555-3698', 27),
(5, 'Michael', 'Brown', '1996-04-22', 'Male', 'michaelbrown@example.com', '555-1357', 21),
(6, 'Samantha', 'Lee', '1998-12-07', 'Female', 'samanthalee@example.com', '555-7890', 15),
(7, 'David', 'Wilson', '2001-08-18', 'Male', 'davidwilson@example.com', '555-1111', 12),
(8, 'Amanda', 'Garcia', '1999-01-03', 'Female', 'amandagarcia@example.com', '555-2222', 9),
(9, 'Matthew', 'Lopez', '1997-05-16', 'Male', 'matthewlopez@example.com', '555-3333', 36),
(10, 'Lauren', 'Nguyen', '2000-10-29', 'Female', 'laurennguyen@example.com', '555-4444', 42);

--
-- Kľúče pre exportované tabuľky
--

--
-- Indexy pre tabuľku `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `course_student`
--
ALTER TABLE `course_student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKlmj50qx9k98b7li5li74nnylb` (`Course_id`),
  ADD KEY `FK4xxxkt1m6afc9vxp3ryb0xfhi` (`Student_id`);

--
-- Indexy pre tabuľku `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pre exportované tabuľky
--

--
-- AUTO_INCREMENT pre tabuľku `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pre tabuľku `course_student`
--
ALTER TABLE `course_student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pre tabuľku `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Obmedzenie pre exportované tabuľky
--

--
-- Obmedzenie pre tabuľku `course_student`
--
ALTER TABLE `course_student`
  ADD CONSTRAINT `FK4xxxkt1m6afc9vxp3ryb0xfhi` FOREIGN KEY (`Student_id`) REFERENCES `student` (`id`),
  ADD CONSTRAINT `FKlmj50qx9k98b7li5li74nnylb` FOREIGN KEY (`Course_id`) REFERENCES `course` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
