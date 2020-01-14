-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 14, 2020 at 05:19 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blogbase`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
CREATE TABLE IF NOT EXISTS `blog` (
  `title` varchar(120) NOT NULL,
  `description` varchar(60000) NOT NULL,
  `image` varchar(120) NOT NULL,
  `date` varchar(120) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`title`, `description`, `image`, `date`) VALUES
('Baby Yodaaa!', 'Finally i have been able to do the shit i have been trying to do from such a long time. Yaaaaaaaaaaaaaaaaaaayyyyy!!!!!!!!!!!!!!!!!!\r\nAnd baby yoda is the Cutest!!!', 'static/images/y8hi3rlepm', '14 January, 2020'),
('Milly Bobby Brown Everybody!', 'And this is now Milly Bobby Brown. She is the best.', 'static/images/iozb2rv6pm', '14 January, 2020'),
('heyyyy', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadddddddddddddd ddddddddddddddd dddddddddddddd ddddddddddd', 'static/images/1_b_v1ippm', '14 January, 2020');

-- --------------------------------------------------------

--
-- Table structure for table `user_signup`
--

DROP TABLE IF EXISTS `user_signup`;
CREATE TABLE IF NOT EXISTS `user_signup` (
  `name` varchar(120) NOT NULL,
  `email` varchar(120) NOT NULL,
  `username` varchar(120) NOT NULL,
  `password` varchar(120) NOT NULL,
  `profilepic` longblob
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_signup`
--

INSERT INTO `user_signup` (`name`, `email`, `username`, `password`, `profilepic`) VALUES
('Ajay', 'ajay.soni0312@gmail.com', 'ajay03', 'ajaysoni0312', 0x3132333534353436352e6a7067);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
