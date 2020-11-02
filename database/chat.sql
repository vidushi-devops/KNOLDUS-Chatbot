-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: NOV 1, 2020 at 02:10 AM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chat`
--

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `input` varchar(1000) NOT NULL,
  `output` varchar(1000) NOT NULL,
  `time` datetime NOT NULL,
  `id` int(100) NOT NULL,
  `title` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`input`, `output`, `time`, `id`, `title`) VALUES

('hi', 'Hello. How Can I Help You?', '2020-11-04 14:37:00', 1, NULL),
('blog','Knoldus Blogs\r\n\r\nhttps://blog.knoldus.com/', '2020-11-04 00:00:00', '0', 'Blogs'),
('technology' , 'https://www.knoldus.com/work/technologies' , '2020-11-04 00:00:00', '0','Technology')
('help', 'HelpLine: 8171073907 Or \r\n\r\nhttps://www.knoldus.com/connect/contact-us\r\n\r\n', '2020-11-04 12:15:57', 4, 'Help'),
('thanks', 'You are most welcome. How Can I Help You?', '2020-11-04 20:52:07', 21, NULL),
('ok', 'Ok', '2020-11-04 22:32:23', 24, NULL),
('hey', 'Hello! ', '2017-08-24 00:21:01', 25, NULL),
('website', 'https://www.knoldus.com/home', '2020-11-04 20:05:43', 26, 'Website'),
('hello', 'Hi. How Can I Help You ?', '2020-11-04 12:24:55', 27, NULL),

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
