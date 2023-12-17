-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 28, 2022 at 08:07 AM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quizdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendencs`
--

DROP TABLE IF EXISTS `attendencs`;
CREATE TABLE IF NOT EXISTS `attendencs` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `topic_id` int(10) UNSIGNED NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_256_topic_topic_id_attendencs` (`topic_id`),
  KEY `fk_256_user_student_id_attendencs` (`student_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2016_11_22_155331_create_roles_table', 1),
(3, '2016_11_22_155331_create_users_table', 1),
(4, '2016_11_22_160943_create_questions_table', 1),
(5, '2016_11_22_161439_create_questions_options_table', 1),
(6, '2016_11_28_161439_create_tests_table', 1),
(7, '2020_05_18_110224_create_attendencs_1_table', 2),
(8, '2016_11_22_160552_create_topics_table', 3),
(9, '2016_11_22_155332_create_user_actions_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
CREATE TABLE IF NOT EXISTS `questions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `question_text` text COLLATE utf8_unicode_ci,
  `grade` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questions_deleted_at_index` (`deleted_at`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question_text`, `grade`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'What does PHP stand for?', 10, '2022-06-26 05:19:10', '2022-06-26 09:45:28', NULL),
(2, 'All variables in PHP start with which symbol?', 10, '2022-06-26 06:15:46', '2022-06-26 06:15:46', NULL),
(3, 'How do you write \"Hello World\" in PHP?', 10, '2022-06-26 09:50:15', '2022-06-26 09:50:15', NULL),
(4, 'When using the POST method, variables are displayed in the URL:', 10, '2022-06-26 09:52:10', '2022-06-26 09:52:10', NULL),
(5, 'In PHP you can use both single quotes ( \' \' ) and double quotes ( \" \" ) for strings:', 10, '2022-06-26 09:54:01', '2022-06-26 09:54:01', NULL),
(6, 'What is the correct way to create a function in PHP?', 10, '2022-06-26 09:56:16', '2022-06-26 09:56:16', NULL),
(7, 'What is the correct way to add 1 to the $count variable?', 10, '2022-06-26 10:00:58', '2022-06-26 10:00:58', NULL),
(8, 'PHP can be run on Microsoft Windows IIS(Internet Information Server):', 10, '2022-06-26 10:10:48', '2022-06-26 10:10:48', NULL),
(9, 'In PHP, the only way to output text is with echo.', 10, '2022-06-26 10:12:02', '2022-06-26 10:35:40', '2022-06-26 10:35:40'),
(10, 'The if statement is used to execute some code only if a specified condition is true', 10, '2022-06-26 10:13:01', '2022-06-26 10:13:01', NULL),
(11, 'In PHP, the only way to output text is with echo.', 10, '2022-06-26 10:36:37', '2022-06-26 10:36:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `questions_options`
--

DROP TABLE IF EXISTS `questions_options`;
CREATE TABLE IF NOT EXISTS `questions_options` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `question_id` int(10) UNSIGNED DEFAULT NULL,
  `option` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `correct` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_257_question_question_id_questions_option` (`question_id`),
  KEY `questions_options_deleted_at_index` (`deleted_at`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `questions_options`
--

INSERT INTO `questions_options` (`id`, `question_id`, `option`, `correct`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Private Home Page', 0, '2022-06-26 05:19:10', '2022-06-26 05:19:10', NULL),
(2, 1, 'Personal Hypertext Processor', 0, '2022-06-26 05:19:10', '2022-06-26 05:19:10', NULL),
(3, 1, 'PHP: Hypertext Preprocessor', 1, '2022-06-26 05:19:10', '2022-06-26 05:19:10', NULL),
(4, 1, 'Test Option second time', 0, '2022-06-26 05:36:10', '2022-06-26 05:37:47', '2022-06-26 05:37:47'),
(5, 1, 'Test Option', 1, '2022-06-26 06:13:48', '2022-06-26 10:37:18', '2022-06-26 10:37:18'),
(6, 2, '$', 1, '2022-06-26 06:15:46', '2022-06-26 06:15:46', NULL),
(7, 2, '!', 0, '2022-06-26 06:15:46', '2022-06-26 06:15:46', NULL),
(8, 2, '#', 0, '2022-06-26 06:15:46', '2022-06-26 06:15:46', NULL),
(9, 3, 'echo \"hello world\";', 1, '2022-06-26 09:50:15', '2022-06-26 09:50:15', NULL),
(10, 3, '\"hello world\";', 0, '2022-06-26 09:50:15', '2022-06-26 09:50:15', NULL),
(11, 3, 'document.write(\"hello world\");', 0, '2022-06-26 09:50:15', '2022-06-26 09:50:15', NULL),
(12, 4, 'false', 0, '2022-06-26 09:52:10', '2022-06-26 09:52:10', NULL),
(13, 4, 'true', 1, '2022-06-26 09:52:10', '2022-06-26 09:52:10', NULL),
(14, 5, 'true', 1, '2022-06-26 09:54:01', '2022-06-26 09:54:01', NULL),
(15, 5, 'false', 0, '2022-06-26 09:54:01', '2022-06-26 09:54:01', NULL),
(16, 6, 'function myFunction()', 1, '2022-06-26 09:56:16', '2022-06-26 09:56:16', NULL),
(17, 6, 'new_function myFunction()', 0, '2022-06-26 09:56:16', '2022-06-26 09:56:16', NULL),
(18, 6, 'create myFunction()', 0, '2022-06-26 09:56:16', '2022-06-26 09:56:16', NULL),
(19, 7, '++count', 0, '2022-06-26 10:00:58', '2022-06-26 10:00:58', NULL),
(20, 7, '$count=+1', 0, '2022-06-26 10:00:58', '2022-06-26 10:00:58', NULL),
(21, 7, 'count++;', 0, '2022-06-26 10:00:58', '2022-06-26 10:00:58', NULL),
(22, 7, '$count++;', 1, '2022-06-26 10:00:58', '2022-06-26 10:00:58', NULL),
(23, 8, 'true', 0, '2022-06-26 10:10:48', '2022-06-26 10:10:48', NULL),
(24, 8, 'false', 1, '2022-06-26 10:10:48', '2022-06-26 10:10:48', NULL),
(25, 9, 'true', 0, '2022-06-26 10:12:02', '2022-06-26 10:35:40', '2022-06-26 10:35:40'),
(26, 9, 'false', 1, '2022-06-26 10:12:02', '2022-06-26 10:35:40', '2022-06-26 10:35:40'),
(27, 10, 'true', 1, '2022-06-26 10:13:01', '2022-06-26 10:13:01', NULL),
(28, 10, 'false', 0, '2022-06-26 10:13:01', '2022-06-26 10:13:01', NULL),
(29, 11, 'true', 0, '2022-06-26 10:36:37', '2022-06-26 10:36:37', NULL),
(30, 11, 'false', 1, '2022-06-26 10:36:37', '2022-06-26 10:36:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roles_deleted_at_index` (`deleted_at`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Administrator (can create other users)', NULL, NULL, NULL),
(2, 'Student', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

DROP TABLE IF EXISTS `tests`;
CREATE TABLE IF NOT EXISTS `tests` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `result` text COLLATE utf8_unicode_ci,
  `mark` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tests_deleted_at_index` (`deleted_at`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tests`
--

INSERT INTO `tests` (`id`, `user_id`, `result`, `mark`, `created_at`, `updated_at`, `deleted_at`) VALUES
(17, 2, 'success', 100, '2022-06-26 10:15:15', '2022-06-26 10:15:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
CREATE TABLE IF NOT EXISTS `topics` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `teacher_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_256_user_teacher_id_topic` (`teacher_id`),
  KEY `topics_deleted_at_index` (`deleted_at`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_253_role_role_id_user` (`role_id`),
  KEY `users_deleted_at_index` (`deleted_at`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', 'admin@admin.com', '$2y$10$Eu8Ji9MMXiR3WH/iDC1tV.H5.jmYcqzGLo42r5El5ssPgdykphtWK', 1, 'n9exkSQHIPwEcOlliqnLPiNLa2tKRFQuJsLZrb3DjpdWvsjgZmgoP7KQ8bgj', NULL, NULL, NULL),
(2, 'safaa stud', 'safaa@gmail.com', '$2y$10$EOTNHK9WlLqlaLmIRvro5eonXMPgTqT9.6JQ0SB8jWKFWtMBUvpjm', 2, 'J0ilpZpsnVlRyUsplq05RmK4FVcVEwYmlPGvlvf2iKaPegogjQEaX8lcNyya', NULL, NULL, NULL),
(3, 'amal', 'amal@hotmail.com', '$2y$10$Qz7Ofppzot9CuvZ20hE0a.zazmR./nNKoVN6DMmCUdArWaCligcX.', 2, NULL, '2022-06-26 04:14:25', '2022-06-26 04:54:26', NULL),
(4, 'rami', 'ramiU@gmail.com', '$2y$10$C6UXtOTHz6292Z60jLbjLO48cyzEmq1u7rvIv/0VlY/E2kLXUe8qK', 2, NULL, '2022-06-26 04:45:19', '2022-06-26 04:57:26', NULL),
(5, 'reem', 'reem@hotmail.com', '$2y$10$0o0mE3l71BdQ7Wt1ME3FGOm.lAv3LNWbs1qIrBDrFm8jp5j8s8EHu', 2, 'xeqNcbLpPtp3LIngwLIBytL9cljZAQ3uPt4nYhU4PI1WndDZPdZgkKebaIQI', '2022-06-26 04:46:57', '2022-06-26 04:54:26', NULL),
(6, 'safaa khaled', 'safaaTest@hotmail.com', '$2y$10$7uf2B3FtOLcmbrdcmOZAS.0/8fLKl/8coKbx.5TkJiS71EneEAj2e', 2, 'AG4uxuzAqk3sKRBkVL3wuGGvdjojulP6Rhlk173a1HKq7fjrqSRvXcOnHBve', '2022-06-26 04:48:03', '2022-06-26 04:54:09', NULL),
(7, 'sam', 'sam@hotmail.com', '$2y$10$am37zDYcXalRDdt3ieZRhupoqt28mN/Iju6Q4MvcWbjIpbDtWgSyW', 2, '2UBxvF3hKKmqIc9d9Yi2z0j7TID0QcGlmp5ax5kAohvZKoQc3tk7ExQwjijn', '2022-06-26 05:05:02', '2022-06-26 05:05:02', NULL),
(8, 'akram', 'akramu@hotmail.com', '$2y$10$BAZGRJVmmikaiHKxOXl6quX0SgGHcwgKScL5/ORxM8Fbx8fCeTzVa', 2, 'hQqpznFBHmOS2gQvMmsdImBPlgER5BRaYiMSHU4JTr1iC5mPVLEo5le2GyDx', '2022-06-26 10:34:37', '2022-06-26 10:35:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_actions`
--

DROP TABLE IF EXISTS `user_actions`;
CREATE TABLE IF NOT EXISTS `user_actions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `action_model` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_254_user_user_id_user_action` (`user_id`),
  KEY `user_actions_deleted_at_index` (`deleted_at`)
) ENGINE=MyISAM AUTO_INCREMENT=130 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_actions`
--

INSERT INTO `user_actions` (`id`, `user_id`, `action`, `action_model`, `action_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'updated', 'users', 1, '2022-06-25 15:03:50', '2022-06-25 15:03:50', NULL),
(2, 1, 'updated', 'users', 1, '2022-06-26 03:16:53', '2022-06-26 03:16:53', NULL),
(3, 1, 'updated', 'users', 1, '2022-06-26 03:19:39', '2022-06-26 03:19:39', NULL),
(4, 1, 'updated', 'users', 1, '2022-06-26 03:20:32', '2022-06-26 03:20:32', NULL),
(5, 1, 'updated', 'users', 1, '2022-06-26 03:32:58', '2022-06-26 03:32:58', NULL),
(6, 2, 'updated', 'users', 2, '2022-06-26 03:38:47', '2022-06-26 03:38:47', NULL),
(7, 1, 'updated', 'users', 1, '2022-06-26 03:40:24', '2022-06-26 03:40:24', NULL),
(8, 1, 'updated', 'users', 1, '2022-06-26 03:41:24', '2022-06-26 03:41:24', NULL),
(9, 1, 'updated', 'users', 1, '2022-06-26 03:46:51', '2022-06-26 03:46:51', NULL),
(10, 2, 'updated', 'users', 2, '2022-06-26 03:56:27', '2022-06-26 03:56:27', NULL),
(11, 1, 'created', 'users', 3, '2022-06-26 04:14:25', '2022-06-26 04:14:25', NULL),
(12, 1, 'created', 'users', 4, '2022-06-26 04:45:19', '2022-06-26 04:45:19', NULL),
(13, 1, 'created', 'users', 5, '2022-06-26 04:46:57', '2022-06-26 04:46:57', NULL),
(14, 1, 'created', 'users', 6, '2022-06-26 04:48:03', '2022-06-26 04:48:03', NULL),
(15, 1, 'deleted', 'users', 6, '2022-06-26 04:54:09', '2022-06-26 04:54:09', NULL),
(16, 1, 'deleted', 'users', 3, '2022-06-26 04:54:26', '2022-06-26 04:54:26', NULL),
(17, 1, 'deleted', 'users', 5, '2022-06-26 04:54:26', '2022-06-26 04:54:26', NULL),
(18, 1, 'updated', 'users', 4, '2022-06-26 04:57:00', '2022-06-26 04:57:00', NULL),
(19, 1, 'updated', 'users', 4, '2022-06-26 04:57:26', '2022-06-26 04:57:26', NULL),
(20, 1, 'created', 'users', 7, '2022-06-26 05:05:02', '2022-06-26 05:05:02', NULL),
(21, 1, 'created', 'questions', 1, '2022-06-26 05:19:10', '2022-06-26 05:19:10', NULL),
(22, 1, 'created', 'questions_options', 1, '2022-06-26 05:19:10', '2022-06-26 05:19:10', NULL),
(23, 1, 'created', 'questions_options', 2, '2022-06-26 05:19:10', '2022-06-26 05:19:10', NULL),
(24, 1, 'created', 'questions_options', 3, '2022-06-26 05:19:10', '2022-06-26 05:19:10', NULL),
(25, 1, 'updated', 'questions', 1, '2022-06-26 05:19:10', '2022-06-26 05:19:10', NULL),
(26, 1, 'updated', 'questions', 1, '2022-06-26 05:30:38', '2022-06-26 05:30:38', NULL),
(27, 1, 'created', 'questions_options', 4, '2022-06-26 05:36:10', '2022-06-26 05:36:10', NULL),
(28, 1, 'updated', 'questions_options', 4, '2022-06-26 05:37:36', '2022-06-26 05:37:36', NULL),
(29, 1, 'deleted', 'questions_options', 4, '2022-06-26 05:37:47', '2022-06-26 05:37:47', NULL),
(30, 1, 'created', 'questions_options', 5, '2022-06-26 06:13:48', '2022-06-26 06:13:48', NULL),
(31, 1, 'created', 'questions', 2, '2022-06-26 06:15:46', '2022-06-26 06:15:46', NULL),
(32, 1, 'created', 'questions_options', 6, '2022-06-26 06:15:46', '2022-06-26 06:15:46', NULL),
(33, 1, 'created', 'questions_options', 7, '2022-06-26 06:15:46', '2022-06-26 06:15:46', NULL),
(34, 1, 'created', 'questions_options', 8, '2022-06-26 06:15:46', '2022-06-26 06:15:46', NULL),
(35, 1, 'updated', 'questions', 2, '2022-06-26 06:15:46', '2022-06-26 06:15:46', NULL),
(36, 1, 'updated', 'users', 1, '2022-06-26 06:34:49', '2022-06-26 06:34:49', NULL),
(37, 2, 'created', 'tests', 1, '2022-06-26 07:38:53', '2022-06-26 07:38:53', NULL),
(38, 2, 'created', 'tests', 2, '2022-06-26 07:52:08', '2022-06-26 07:52:08', NULL),
(39, 2, 'created', 'tests', 3, '2022-06-26 07:53:01', '2022-06-26 07:53:01', NULL),
(40, 2, 'created', 'tests', 4, '2022-06-26 07:58:19', '2022-06-26 07:58:19', NULL),
(41, 2, 'updated', 'users', 2, '2022-06-26 08:09:07', '2022-06-26 08:09:07', NULL),
(42, 2, 'created', 'tests', 5, '2022-06-26 08:09:53', '2022-06-26 08:09:53', NULL),
(43, 2, 'created', 'tests', 6, '2022-06-26 08:13:22', '2022-06-26 08:13:22', NULL),
(44, 2, 'created', 'tests', 7, '2022-06-26 08:23:57', '2022-06-26 08:23:57', NULL),
(45, 2, 'created', 'tests', 8, '2022-06-26 08:25:26', '2022-06-26 08:25:26', NULL),
(46, 2, 'created', 'tests', 9, '2022-06-26 08:28:58', '2022-06-26 08:28:58', NULL),
(47, 2, 'created', 'tests', 10, '2022-06-26 08:29:46', '2022-06-26 08:29:46', NULL),
(48, 2, 'created', 'tests', 11, '2022-06-26 08:39:12', '2022-06-26 08:39:12', NULL),
(49, 2, 'created', 'tests', 12, '2022-06-26 08:40:40', '2022-06-26 08:40:40', NULL),
(50, 2, 'created', 'tests', 13, '2022-06-26 08:46:42', '2022-06-26 08:46:42', NULL),
(51, 2, 'created', 'tests', 14, '2022-06-26 08:49:06', '2022-06-26 08:49:06', NULL),
(52, 2, 'created', 'tests', 15, '2022-06-26 09:09:41', '2022-06-26 09:09:41', NULL),
(53, 2, 'created', 'tests', 16, '2022-06-26 09:17:14', '2022-06-26 09:17:14', NULL),
(54, 2, 'updated', 'users', 2, '2022-06-26 09:28:46', '2022-06-26 09:28:46', NULL),
(55, 1, 'updated', 'questions', 1, '2022-06-26 09:45:28', '2022-06-26 09:45:28', NULL),
(56, 1, 'created', 'questions', 3, '2022-06-26 09:50:15', '2022-06-26 09:50:15', NULL),
(57, 1, 'created', 'questions_options', 9, '2022-06-26 09:50:15', '2022-06-26 09:50:15', NULL),
(58, 1, 'created', 'questions_options', 10, '2022-06-26 09:50:15', '2022-06-26 09:50:15', NULL),
(59, 1, 'created', 'questions_options', 11, '2022-06-26 09:50:15', '2022-06-26 09:50:15', NULL),
(60, 1, 'updated', 'questions', 3, '2022-06-26 09:50:15', '2022-06-26 09:50:15', NULL),
(61, 1, 'created', 'questions', 4, '2022-06-26 09:52:10', '2022-06-26 09:52:10', NULL),
(62, 1, 'created', 'questions_options', 12, '2022-06-26 09:52:10', '2022-06-26 09:52:10', NULL),
(63, 1, 'created', 'questions_options', 13, '2022-06-26 09:52:10', '2022-06-26 09:52:10', NULL),
(64, 1, 'updated', 'questions', 4, '2022-06-26 09:52:10', '2022-06-26 09:52:10', NULL),
(65, 1, 'created', 'questions', 5, '2022-06-26 09:54:01', '2022-06-26 09:54:01', NULL),
(66, 1, 'created', 'questions_options', 14, '2022-06-26 09:54:01', '2022-06-26 09:54:01', NULL),
(67, 1, 'created', 'questions_options', 15, '2022-06-26 09:54:01', '2022-06-26 09:54:01', NULL),
(68, 1, 'updated', 'questions', 5, '2022-06-26 09:54:01', '2022-06-26 09:54:01', NULL),
(69, 1, 'created', 'questions', 6, '2022-06-26 09:56:16', '2022-06-26 09:56:16', NULL),
(70, 1, 'created', 'questions_options', 16, '2022-06-26 09:56:16', '2022-06-26 09:56:16', NULL),
(71, 1, 'created', 'questions_options', 17, '2022-06-26 09:56:16', '2022-06-26 09:56:16', NULL),
(72, 1, 'created', 'questions_options', 18, '2022-06-26 09:56:16', '2022-06-26 09:56:16', NULL),
(73, 1, 'updated', 'questions', 6, '2022-06-26 09:56:16', '2022-06-26 09:56:16', NULL),
(74, 1, 'created', 'questions', 7, '2022-06-26 10:00:58', '2022-06-26 10:00:58', NULL),
(75, 1, 'created', 'questions_options', 19, '2022-06-26 10:00:58', '2022-06-26 10:00:58', NULL),
(76, 1, 'created', 'questions_options', 20, '2022-06-26 10:00:58', '2022-06-26 10:00:58', NULL),
(77, 1, 'created', 'questions_options', 21, '2022-06-26 10:00:58', '2022-06-26 10:00:58', NULL),
(78, 1, 'created', 'questions_options', 22, '2022-06-26 10:00:58', '2022-06-26 10:00:58', NULL),
(79, 1, 'updated', 'questions', 7, '2022-06-26 10:00:58', '2022-06-26 10:00:58', NULL),
(80, 1, 'created', 'questions', 8, '2022-06-26 10:10:48', '2022-06-26 10:10:48', NULL),
(81, 1, 'created', 'questions_options', 23, '2022-06-26 10:10:48', '2022-06-26 10:10:48', NULL),
(82, 1, 'created', 'questions_options', 24, '2022-06-26 10:10:48', '2022-06-26 10:10:48', NULL),
(83, 1, 'updated', 'questions', 8, '2022-06-26 10:10:48', '2022-06-26 10:10:48', NULL),
(84, 1, 'created', 'questions', 9, '2022-06-26 10:12:02', '2022-06-26 10:12:02', NULL),
(85, 1, 'created', 'questions_options', 25, '2022-06-26 10:12:02', '2022-06-26 10:12:02', NULL),
(86, 1, 'created', 'questions_options', 26, '2022-06-26 10:12:02', '2022-06-26 10:12:02', NULL),
(87, 1, 'updated', 'questions', 9, '2022-06-26 10:12:02', '2022-06-26 10:12:02', NULL),
(88, 1, 'created', 'questions', 10, '2022-06-26 10:13:01', '2022-06-26 10:13:01', NULL),
(89, 1, 'created', 'questions_options', 27, '2022-06-26 10:13:01', '2022-06-26 10:13:01', NULL),
(90, 1, 'created', 'questions_options', 28, '2022-06-26 10:13:01', '2022-06-26 10:13:01', NULL),
(91, 1, 'updated', 'questions', 10, '2022-06-26 10:13:01', '2022-06-26 10:13:01', NULL),
(92, 1, 'updated', 'users', 1, '2022-06-26 10:13:55', '2022-06-26 10:13:55', NULL),
(93, 2, 'created', 'tests', 17, '2022-06-26 10:15:15', '2022-06-26 10:15:15', NULL),
(94, 2, 'updated', 'users', 2, '2022-06-26 10:15:21', '2022-06-26 10:15:21', NULL),
(95, 6, 'created', 'tests', 18, '2022-06-26 10:16:30', '2022-06-26 10:16:30', NULL),
(96, 6, 'updated', 'users', 6, '2022-06-26 10:16:41', '2022-06-26 10:16:41', NULL),
(97, 7, 'created', 'tests', 19, '2022-06-26 10:18:03', '2022-06-26 10:18:03', NULL),
(98, 7, 'updated', 'users', 7, '2022-06-26 10:18:07', '2022-06-26 10:18:07', NULL),
(99, 1, 'updated', 'users', 1, '2022-06-26 10:33:49', '2022-06-26 10:33:49', NULL),
(100, 1, 'created', 'users', 8, '2022-06-26 10:34:37', '2022-06-26 10:34:37', NULL),
(101, 1, 'updated', 'users', 8, '2022-06-26 10:35:02', '2022-06-26 10:35:02', NULL),
(102, 1, 'deleted', 'questions', 9, '2022-06-26 10:35:40', '2022-06-26 10:35:40', NULL),
(103, 1, 'created', 'questions', 11, '2022-06-26 10:36:37', '2022-06-26 10:36:37', NULL),
(104, 1, 'created', 'questions_options', 29, '2022-06-26 10:36:37', '2022-06-26 10:36:37', NULL),
(105, 1, 'created', 'questions_options', 30, '2022-06-26 10:36:37', '2022-06-26 10:36:37', NULL),
(106, 1, 'updated', 'questions', 11, '2022-06-26 10:36:37', '2022-06-26 10:36:37', NULL),
(107, 1, 'deleted', 'questions_options', 5, '2022-06-26 10:37:18', '2022-06-26 10:37:18', NULL),
(108, 1, 'updated', 'users', 1, '2022-06-26 10:37:29', '2022-06-26 10:37:29', NULL),
(109, 8, 'created', 'tests', 20, '2022-06-26 10:38:43', '2022-06-26 10:38:43', NULL),
(110, 8, 'updated', 'users', 8, '2022-06-26 10:38:47', '2022-06-26 10:38:47', NULL),
(111, 1, 'updated', 'users', 1, '2022-06-27 05:02:03', '2022-06-27 05:02:03', NULL),
(112, 1, 'updated', 'users', 1, '2022-06-27 06:01:02', '2022-06-27 06:01:02', NULL),
(113, 1, 'updated', 'users', 1, '2022-06-27 06:48:39', '2022-06-27 06:48:39', NULL),
(114, 1, 'updated', 'users', 1, '2022-06-27 06:51:57', '2022-06-27 06:51:57', NULL),
(115, 2, 'updated', 'users', 2, '2022-06-27 06:52:55', '2022-06-27 06:52:55', NULL),
(116, 5, 'created', 'tests', 21, '2022-06-27 06:54:41', '2022-06-27 06:54:41', NULL),
(117, 5, 'updated', 'users', 5, '2022-06-27 06:57:02', '2022-06-27 06:57:02', NULL),
(118, 1, 'updated', 'users', 1, '2022-06-27 07:05:29', '2022-06-27 07:05:29', NULL),
(119, 2, 'updated', 'users', 2, '2022-06-27 07:35:37', '2022-06-27 07:35:37', NULL),
(120, 1, 'updated', 'users', 1, '2022-06-27 07:47:26', '2022-06-27 07:47:26', NULL),
(121, 2, 'updated', 'users', 2, '2022-06-27 07:49:33', '2022-06-27 07:49:33', NULL),
(122, 2, 'updated', 'users', 2, '2022-06-27 07:50:00', '2022-06-27 07:50:00', NULL),
(123, 1, 'updated', 'users', 1, '2022-06-27 07:54:56', '2022-06-27 07:54:56', NULL),
(124, 1, 'updated', 'users', 1, '2022-06-28 04:37:46', '2022-06-28 04:37:46', NULL),
(125, 2, 'updated', 'users', 2, '2022-06-28 04:38:06', '2022-06-28 04:38:06', NULL),
(126, 6, 'updated', 'users', 6, '2022-06-28 05:00:20', '2022-06-28 05:00:20', NULL),
(127, 6, 'created', 'tests', 22, '2022-06-28 05:06:07', '2022-06-28 05:06:07', NULL),
(128, 6, 'updated', 'users', 6, '2022-06-28 05:06:13', '2022-06-28 05:06:13', NULL),
(129, 1, 'updated', 'users', 1, '2022-06-28 05:06:53', '2022-06-28 05:06:53', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
