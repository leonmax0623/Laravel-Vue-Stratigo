-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 26, 2021 at 04:17 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codewinner_startego`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_09_044534_create_roles_table', 1),
(10, '2019_12_09_082630_create_role_user_table', 1),
(11, '2019_12_09_094511_create_social_accounts_table', 1),
(12, '2019_12_27_065818_create_products_table', 1),
(13, '2019_12_27_070549_create_categories_table', 1),
(14, '2019_12_27_070603_create_tags_table', 1),
(15, '2020_01_08_113508_create_product_tag_pivot_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Starter Personal Access Client', 'yzIGi84wMFZfEDQcfa7HurJvbUvWjhfol94hAcCF', NULL, 'http://localhost', 1, 0, 0, '2021-10-04 02:29:35', '2021-10-04 02:29:35'),
(2, NULL, 'Laravel Starter Password Grant Client', '8RkqBANRRKPKpVDHrnLvNzZcQQfiWjekffhoJRg4', 'users', 'http://localhost', 0, 1, 0, '2021-10-04 02:29:35', '2021-10-04 02:29:35');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-10-04 02:29:35', '2021-10-04 02:29:35');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('ravi.rs.saini@gmail.com', '$2y$10$NBfQIuOaZbCNx.ZpeybYceF/pM4pNjk6.p5c1rfoGKm2I4/B7iUMa', '2021-10-06 02:21:19');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_accounts`
--

CREATE TABLE `social_accounts` (
  `user_id` int(11) NOT NULL,
  `provider_user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_team_status`
--

CREATE TABLE `tbl_team_status` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `unit_id` int(11) NOT NULL DEFAULT '0',
  `team_id` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '{1:On Track,2:At Risk,3:Off Track}',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_unit_status`
--

CREATE TABLE `tbl_unit_status` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `unit_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(5000) DEFAULT NULL,
  `status` int(11) NOT NULL COMMENT '{1:On Track,2:At Risk,3:Off Track}	',
  `custom_fields` varchar(5000) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_unit_status`
--

INSERT INTO `tbl_unit_status` (`id`, `user_id`, `unit_id`, `title`, `status`, `custom_fields`, `created_at`, `updated_at`) VALUES
(4, 0, 0, NULL, 1, NULL, '2021-10-26 08:33:51', '2021-10-26 08:33:51'),
(5, 0, 0, NULL, 1, NULL, '2021-10-26 08:39:46', '2021-10-26 08:39:46'),
(6, 2, 21, 'ASDas', 2, '[{\"id\":0,\"title\":\"Summary\",\"value\":\"zcxv\",\"type\":\"text\"},{\"id\":1,\"title\":\"What we\'ve accomplished\",\"value\":\"zxcv\",\"type\":\"text\"},{\"id\":2,\"title\":\"What\'s blocked\",\"value\":\"zxcv\",\"type\":\"text\"},{\"id\":3,\"title\":\"Next Steps\",\"value\":\"zxcvzx\",\"type\":\"text\"}]', '2021-10-26 08:44:24', '2021-10-26 08:44:24');

-- --------------------------------------------------------

--
-- Table structure for table `teammates`
--

CREATE TABLE `teammates` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0=planner,1=colleborator,2=teammate',
  `status` tinyint(1) NOT NULL COMMENT '{0:Inactive,1:Active}',
  `description` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teammates`
--

INSERT INTO `teammates` (`id`, `user_id`, `unit_id`, `team_id`, `type`, `status`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 21, 115, 0, 1, NULL, '2021-10-21 12:32:18', '2021-10-21 12:32:18'),
(2, 3, 21, 115, 1, 1, NULL, '2021-10-21 12:32:18', '2021-10-21 12:32:18'),
(3, 4, 21, 115, 0, 1, NULL, '2021-10-21 13:20:42', '2021-10-21 13:20:42'),
(4, 1, 21, 114, 0, 1, NULL, '2021-10-21 13:20:42', '2021-10-21 13:20:42'),
(6, 10, 21, 114, 0, 1, NULL, '2021-10-26 11:47:00', '2021-10-26 11:47:00');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `unit_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(400) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '{0:Inactive,1:Active}',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `user_id`, `unit_id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'Test', 1, '2021-10-08 07:33:16', '2021-10-08 07:33:16'),
(2, 2, 2, 'Test 1', 1, '2021-10-08 08:30:06', '2021-10-08 08:30:06'),
(3, 2, 3, 'Test 2', 1, '2021-10-08 08:31:26', '2021-10-08 08:31:26'),
(6, 2, 6, 'Test 5', 1, '2021-10-08 08:49:41', '2021-10-08 08:49:41'),
(7, 2, 6, 'Test 5', 1, '2021-10-08 08:49:41', '2021-10-08 08:49:41'),
(8, 2, 6, 'Test 5', 1, '2021-10-08 08:49:41', '2021-10-08 08:49:41'),
(9, 2, 6, 'Tes', 1, '2021-10-08 12:18:08', '2021-10-08 12:18:08'),
(10, 2, 6, 'Test', 1, '2021-10-08 12:21:31', '2021-10-08 12:21:31'),
(11, 2, 6, 'Team', 1, '2021-10-08 12:21:45', '2021-10-08 12:21:45'),
(12, 2, 6, 'D', 1, '2021-10-08 12:21:54', '2021-10-08 12:21:54'),
(13, 2, 6, 'D1', 1, '2021-10-08 12:24:50', '2021-10-08 12:24:50'),
(14, 2, 6, 'D2', 1, '2021-10-08 12:24:56', '2021-10-08 12:24:56'),
(15, 2, 6, 'D3', 1, '2021-10-08 12:25:03', '2021-10-08 12:25:03'),
(16, 2, 6, 'D4', 1, '2021-10-08 12:25:10', '2021-10-08 12:25:10'),
(19, 2, 7, 'Test', 1, '2021-10-10 06:41:35', '2021-10-10 06:41:35'),
(20, 2, 7, 'T3', 1, '2021-10-10 06:41:54', '2021-10-10 06:41:54'),
(21, 2, 7, 'T4', 1, '2021-10-10 06:42:03', '2021-10-10 06:42:03'),
(22, 2, 7, 'T5', 1, '2021-10-10 06:42:15', '2021-10-10 06:42:15'),
(23, 2, 7, 'T4', 1, '2021-10-10 06:51:00', '2021-10-10 06:51:00'),
(24, 2, 6, 'Test', 1, '2021-10-10 06:57:20', '2021-10-10 06:57:20'),
(25, 2, 1, 'Test', 1, '2021-10-10 09:26:38', '2021-10-10 09:26:38'),
(26, 2, 7, 'T3', 1, '2021-10-10 09:26:50', '2021-10-10 09:26:50'),
(27, 2, 6, 'T8', 1, '2021-10-10 09:27:02', '2021-10-10 09:27:02'),
(28, 2, 8, 'Test', 1, '2021-10-10 09:27:17', '2021-10-10 09:27:17'),
(30, 2, 6, 'T9', 1, '2021-10-10 09:33:53', '2021-10-10 09:33:53'),
(31, 2, 2, 'T2', 1, '2021-10-10 09:40:21', '2021-10-10 09:40:21'),
(34, 2, 6, 'Test 2323', 1, '2021-10-10 10:26:12', '2021-10-10 10:26:12'),
(35, 2, 13, 'Test 5', 1, '2021-10-11 08:12:34', '2021-10-11 08:12:34'),
(36, 2, 13, 'Test 5', 1, '2021-10-11 08:12:34', '2021-10-11 08:12:34'),
(37, 2, 13, 'Test 5', 1, '2021-10-11 08:12:34', '2021-10-11 08:12:34'),
(38, 2, 13, 'Tes', 1, '2021-10-11 08:12:34', '2021-10-11 08:12:34'),
(39, 2, 13, 'Test', 1, '2021-10-11 08:12:35', '2021-10-11 08:12:35'),
(40, 2, 13, 'Team', 1, '2021-10-11 08:12:35', '2021-10-11 08:12:35'),
(41, 2, 13, 'D', 1, '2021-10-11 08:12:35', '2021-10-11 08:12:35'),
(42, 2, 13, 'D1', 1, '2021-10-11 08:12:35', '2021-10-11 08:12:35'),
(43, 2, 13, 'D2', 1, '2021-10-11 08:12:35', '2021-10-11 08:12:35'),
(44, 2, 13, 'D3', 1, '2021-10-11 08:12:35', '2021-10-11 08:12:35'),
(45, 2, 13, 'D4', 1, '2021-10-11 08:12:35', '2021-10-11 08:12:35'),
(46, 2, 13, 'Test', 1, '2021-10-11 08:12:35', '2021-10-11 08:12:35'),
(47, 2, 13, 'T8', 1, '2021-10-11 08:12:35', '2021-10-11 08:12:35'),
(48, 2, 13, 'T9', 1, '2021-10-11 08:12:35', '2021-10-11 08:12:35'),
(49, 2, 13, 'Test 2323', 1, '2021-10-11 08:12:36', '2021-10-11 08:12:36'),
(50, 2, 14, 'Test 5', 1, '2021-10-11 08:13:33', '2021-10-11 08:13:33'),
(51, 2, 14, 'Test 5', 1, '2021-10-11 08:13:33', '2021-10-11 08:13:33'),
(52, 2, 14, 'Test 5', 1, '2021-10-11 08:13:34', '2021-10-11 08:13:34'),
(53, 2, 14, 'Tes', 1, '2021-10-11 08:13:34', '2021-10-11 08:13:34'),
(54, 2, 14, 'Test', 1, '2021-10-11 08:13:34', '2021-10-11 08:13:34'),
(55, 2, 14, 'Team', 1, '2021-10-11 08:13:34', '2021-10-11 08:13:34'),
(56, 2, 14, 'D', 1, '2021-10-11 08:13:34', '2021-10-11 08:13:34'),
(57, 2, 14, 'D1', 1, '2021-10-11 08:13:34', '2021-10-11 08:13:34'),
(58, 2, 14, 'D2', 1, '2021-10-11 08:13:34', '2021-10-11 08:13:34'),
(59, 2, 14, 'D3', 1, '2021-10-11 08:13:34', '2021-10-11 08:13:34'),
(60, 2, 14, 'D4', 1, '2021-10-11 08:13:35', '2021-10-11 08:13:35'),
(61, 2, 14, 'Test', 1, '2021-10-11 08:13:35', '2021-10-11 08:13:35'),
(62, 2, 14, 'T8', 1, '2021-10-11 08:13:35', '2021-10-11 08:13:35'),
(63, 2, 14, 'T9', 1, '2021-10-11 08:13:35', '2021-10-11 08:13:35'),
(64, 2, 14, 'Test 2323', 1, '2021-10-11 08:13:35', '2021-10-11 08:13:35'),
(80, 2, 16, 'Test 5', 1, '2021-10-11 08:21:05', '2021-10-11 08:21:05'),
(81, 2, 16, 'Test 5', 1, '2021-10-11 08:21:05', '2021-10-11 08:21:05'),
(82, 2, 16, 'Test 5', 1, '2021-10-11 08:21:05', '2021-10-11 08:21:05'),
(83, 2, 16, 'Tes', 1, '2021-10-11 08:21:06', '2021-10-11 08:21:06'),
(84, 2, 16, 'Test', 1, '2021-10-11 08:21:06', '2021-10-11 08:21:06'),
(85, 2, 16, 'Team', 1, '2021-10-11 08:21:06', '2021-10-11 08:21:06'),
(86, 2, 16, 'D', 1, '2021-10-11 08:21:06', '2021-10-11 08:21:06'),
(87, 2, 16, 'D1', 1, '2021-10-11 08:21:06', '2021-10-11 08:21:06'),
(88, 2, 16, 'D2', 1, '2021-10-11 08:21:06', '2021-10-11 08:21:06'),
(89, 2, 16, 'D3', 1, '2021-10-11 08:21:06', '2021-10-11 08:21:06'),
(90, 2, 16, 'D4', 1, '2021-10-11 08:21:06', '2021-10-11 08:21:06'),
(91, 2, 16, 'Test', 1, '2021-10-11 08:21:07', '2021-10-11 08:21:07'),
(92, 2, 16, 'T8', 1, '2021-10-11 08:21:07', '2021-10-11 08:21:07'),
(93, 2, 16, 'T9', 1, '2021-10-11 08:21:07', '2021-10-11 08:21:07'),
(94, 2, 16, 'Test 2323', 1, '2021-10-11 08:21:07', '2021-10-11 08:21:07'),
(110, 2, 12, '121', 1, '2021-10-11 09:11:19', '2021-10-11 09:11:19'),
(112, 6, 19, 'Team 1', 1, '2021-10-11 09:57:34', '2021-10-11 09:57:34'),
(113, 6, 20, 'Team 2', 1, '2021-10-11 09:57:56', '2021-10-11 09:57:56'),
(114, 2, 21, 'Test Team', 1, '2021-10-11 09:59:50', '2021-10-11 09:59:50'),
(115, 2, 21, 'Test Team 1', 1, '2021-10-11 10:00:09', '2021-10-11 10:00:09'),
(118, 7, 23, 'Team 1', 1, '2021-10-11 13:53:21', '2021-10-11 13:53:21'),
(119, 7, 24, 'Team 2', 1, '2021-10-11 13:53:37', '2021-10-11 13:53:37'),
(120, 7, 24, 'Test 3', 1, '2021-10-11 13:54:39', '2021-10-11 13:54:39');

-- --------------------------------------------------------

--
-- Table structure for table `team_members`
--

CREATE TABLE `team_members` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `unit_name` varchar(300) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '{0=>Inactive,1:Active}',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `user_id`, `unit_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 'Test 2', 1, '2021-10-08 07:33:15', '2021-10-11 08:38:06'),
(2, 2, 'Test 1', 1, '2021-10-08 08:30:06', '2021-10-08 08:30:06'),
(3, 2, 'Test 212', 1, '2021-10-08 08:31:26', '2021-10-11 07:34:17'),
(6, 2, 'Test 5', 1, '2021-10-08 08:49:41', '2021-10-08 08:49:41'),
(7, 2, 'T2', 1, '2021-10-10 06:41:35', '2021-10-10 06:41:35'),
(8, 2, 'Test', 1, '2021-10-10 09:27:16', '2021-10-10 09:27:16'),
(12, 2, 'Test 512', 1, '2021-10-11 08:11:56', '2021-10-11 09:11:29'),
(13, 2, 'Test 5', 1, '2021-10-11 08:12:33', '2021-10-11 08:12:33'),
(14, 2, 'Test 521', 1, '2021-10-11 08:13:33', '2021-10-11 08:13:33'),
(16, 2, 'Test 5212121', 1, '2021-10-11 08:21:05', '2021-10-11 08:21:05'),
(19, 6, 'Unit 1', 1, '2021-10-11 09:57:34', '2021-10-11 09:57:34'),
(20, 6, 'Unit 2', 1, '2021-10-11 09:57:55', '2021-10-11 09:57:55'),
(21, 2, 'Test Unit 1', 1, '2021-10-11 09:59:49', '2021-10-11 10:00:41'),
(23, 7, 'Unit 1', 1, '2021-10-11 13:53:20', '2021-10-11 13:53:20'),
(24, 7, 'Unit 21', 1, '2021-10-11 13:53:37', '2021-10-11 13:56:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('user','planner','collaborator','') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `type`, `email`, `email_verified_at`, `password`, `remember_token`, `role`, `created_at`, `updated_at`) VALUES
(1, 'John Doe', 'admin', 'admin@gmail.com', NULL, '$2y$10$wcHUSCk3eO/wHo6qW7ZQFuFQzsa3PhatHQAfEk.RanvjKD6SPPvPe', NULL, 'user', NULL, NULL),
(2, 'Ravi saini', 'admin', 'ravi.rs.saini@gmail.com', NULL, '$2y$10$56/f.GC58bjAHGZ9oObd2e90Hsbt7wi0BLqE0t1qbnY4AhV2ebqKG', NULL, 'user', '2021-10-04 02:51:34', '2021-10-04 02:51:34'),
(3, 'ravi saini', 'admin', 'ravi.rs.saini1@gmail.com', NULL, '$2y$10$prhxBdDlhHsxew66s6DoHu0KOJEMxSmBGrc2ksfxAYHwPmGFH9GAe', NULL, 'user', '2021-10-06 04:47:56', '2021-10-06 04:47:56'),
(4, 'ravi saini', 'admin', 'ravi.rs.saini2@gmail.com', NULL, '$2y$10$q4kke8amPRfJKHyqZaVLGey6O8V41boVHlNdZA86PTHXSCt9SShua', NULL, 'user', '2021-10-06 04:49:37', '2021-10-06 04:49:37'),
(5, 'Ravi Saini', 'admin', 'ravi@mail.com', NULL, '$2y$10$LS25g7DnPJa5GYQm5/V74.qIN/1v2IkUGDbC0366dWXMqhtjYfWIi', NULL, 'user', '2021-10-11 02:53:34', '2021-10-11 02:53:34'),
(6, 'Ravi Saini', 'admin', 'test@mail.com', NULL, '$2y$10$tQykwnBECu4cOByw8dPjBOIrGNPKDLm8OhNjBLbEso/7JV42MZKUy', NULL, 'user', '2021-10-11 04:27:12', '2021-10-11 04:27:12'),
(7, 'Testing Progress', 'admin', 'testing@mail.com', NULL, '$2y$10$280XatGYqAwrUWuuf.69dOT2gSodW9rw1eFn9U6vmKEqHpWVy9X8S', NULL, 'user', '2021-10-11 08:22:28', '2021-10-11 08:22:28'),
(10, 'sandy clay', 'user', 'sandy@mailinator.com', NULL, '$2y$10$XbmPPLAAemi4xYyEqzXOOe10RDmvPOz46g7fASZjcVnAsvoPhXpFm', NULL, 'user', '2021-10-26 06:17:00', '2021-10-26 06:17:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`(191));

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_team_status`
--
ALTER TABLE `tbl_team_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `unit_id` (`unit_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `user_id_2` (`user_id`);

--
-- Indexes for table `tbl_unit_status`
--
ALTER TABLE `tbl_unit_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `unit_id` (`unit_id`);

--
-- Indexes for table `teammates`
--
ALTER TABLE `teammates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unit_id` (`unit_id`);

--
-- Indexes for table `team_members`
--
ALTER TABLE `team_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_team_status`
--
ALTER TABLE `tbl_team_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_unit_status`
--
ALTER TABLE `tbl_unit_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `teammates`
--
ALTER TABLE `teammates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `team_members`
--
ALTER TABLE `team_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `teams_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
