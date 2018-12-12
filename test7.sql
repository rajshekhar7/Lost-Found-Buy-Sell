-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 03, 2018 at 06:19 PM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test7`
--

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `likes` int(50) NOT NULL,
  `image` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `published` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `slug`, `views`, `likes`, `image`, `body`, `published`, `created_at`, `updated_at`) VALUES
(26, 22, 'Anurag asdd', 'anurag-asdd', 0, 0, 'Screenshot from 2018-11-30 03-13-07.png', '&lt;p&gt;AAAAAA&lt;/p&gt;\r\n\r\n&lt;p&gt;\\r\\nasas&lt;/p&gt;\r\n', 1, '2018-12-03 17:11:29', '2018-12-03 17:11:26'),
(27, 22, 'asdadasd', 'asdadasd', 0, 0, 'Screenshot from 2018-11-30 04-42-54.png', '&lt;p&gt;asdasd&lt;/p&gt;\r\n', 1, '2018-12-03 17:12:43', '2018-12-03 17:11:49'),
(28, 22, 'asASAaSAS', 'asasaasas', 0, 0, 'Screenshot from 2018-11-29 14-23-07.png', '&lt;p&gt;asdadas&lt;/p&gt;\r\n\r\n&lt;p&gt;\\r\\n\\r\\n&lt;/p&gt;\r\n\r\n&lt;p&gt;\\\\r\\\\n&lt;/p&gt;\r\n\r\n&lt;p&gt;\\r\\n&lt;/p&gt;\r\n', 1, '2018-12-03 17:12:43', '2018-12-03 17:12:40'),
(29, 23, 'Test1', 'test1', 0, 0, 'Screenshot from 2018-11-28 21-55-22.png', '&lt;p&gt;DDDDDDD&lt;/p&gt;\r\n', 1, '2018-12-03 17:14:14', '2018-12-03 17:14:12');

-- --------------------------------------------------------

--
-- Table structure for table `post_topic`
--

CREATE TABLE `post_topic` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post_topic`
--

INSERT INTO `post_topic` (`id`, `post_id`, `topic_id`) VALUES
(4, 26, 1),
(5, 27, 2),
(6, 28, 10),
(7, 29, 1);

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`id`, `name`, `slug`) VALUES
(1, 'Lost', 'Lost'),
(2, 'Sell ', 'Sell'),
(10, 'Found', 'Found');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` enum('Author','Admin') DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `role`, `password`, `created_at`, `updated_at`) VALUES
(17, 'jellybeans', 'anuragvns1111@gmail.com', NULL, '0cc175b9c0f1b6a831c399e269772661', '2018-12-03 15:35:07', '2018-12-03 15:35:07'),
(18, 'as', 'asrd@yopmail.com', NULL, '0cc175b9c0f1b6a831c399e269772661', '2018-12-03 15:36:06', '2018-12-03 15:36:06'),
(21, 'yash', 'yash.cs16@iitp.ac.in', 'Author', '912ec803b2ce49e4a541068d495ab570', '2018-12-03 16:01:33', '2018-12-03 16:01:33'),
(22, 'b', 'b@gmail.com', 'Author', '92eb5ffee6ae2fec3ad71c777531578f', '2018-12-03 16:05:29', '2018-12-03 16:05:29'),
(23, 'Test1', 'test@gmail.com', 'Author', '098f6bcd4621d373cade4e832627b4f6', '2018-12-03 17:13:56', '2018-12-03 17:13:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `post_topic`
--
ALTER TABLE `post_topic`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_id` (`post_id`),
  ADD KEY `topic_id` (`topic_id`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `post_topic`
--
ALTER TABLE `post_topic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `post_topic`
--
ALTER TABLE `post_topic`
  ADD CONSTRAINT `post_topic_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `post_topic_ibfk_2` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
