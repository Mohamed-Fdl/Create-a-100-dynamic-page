-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 08, 2021 at 10:55 AM
-- Server version: 8.0.18
-- PHP Version: 7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pagedynamique_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Jeux vidéos', 'jeux-videos', '2021-09-07 10:58:18', '2021-09-07 10:58:18'),
(2, 'Caméras', 'cameras', '2021-09-07 10:58:05', '2021-09-07 10:58:05'),
(6, 'Cartes graphiques', 'cartes-graphiques', '2021-09-07 10:58:29', '2021-09-07 10:58:29');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(15, '2014_10_12_000000_create_users_table', 1),
(16, '2014_10_12_100000_create_password_resets_table', 1),
(17, '2019_08_19_000000_create_failed_jobs_table', 1),
(18, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(19, '2021_09_07_100713_create_products_table', 1),
(20, '2021_09_07_100814_create_categories_table', 1),
(21, '2021_09_07_100833_create_product_imgs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_category_id_foreign` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `slug`, `subtitle`, `description`, `price`, `rating`, `stock`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'premier', 'premier', 'premier beau', 'premier beaupremier beaupremier beaupremier beaupremier beau', 10, 1, 10, 'avatars/IPozSDXBbqsVcGjxMCTieAGW1OVNqyU56l8LI8nl.png', '2021-09-07 10:28:39', '2021-09-07 10:28:39'),
(2, 2, 'ps5', 'ps5', '555555555555555', 'bbbrthrknbnfjkvbbdkhghdbvdvbkb', 10, 1, 2, 'avatars/aCLoJymLWs5Tn6TrOo9ct8zJngXm9uGZFk4WLN14.png', '2021-09-07 10:32:24', '2021-09-07 10:32:24'),
(3, 6, 'ASUS TUF GAMING B550-PLUS WIFI', 'asus-tuf-gaming-b550-plus-wifi', 'Marque 	ASUS Socket du CPU 	Socket AM4 Technologie de mémoire RAM 	DDR4 Processeurs compatibles 	Socket AMD AM4: Pronto per i processori AMD Ryzen™ di terza generazione', 'Socket Intel LGA 1200 : Compatible avec les processeurs Intel Core de 10e et 11e gén. Gérabilité WOL par PME, PXE\r\nAlimentation optimisée : 8+1 phases d’alimentation DrMOS, circuit imprimé sur 6 couches, sockets ProCool, composants TUF ultra-robustes et Digi+ VRM une meilleure durabilité\r\nRefroidissement complet : radiateur VRM, radiateur PCH sans ventilateur, radiateur M.2, connecteurs hybrides pour ventilateurs et utilitaire FanXpert 4\r\nConnectivité 2.0 : M.2 PCIe 4.0, USB 3.2 Gén. 2 Type-A et Type-C, USB 3.2 Gén 1 Type-C à l’avant et compatibilité Thunderbolt 4\r\nConçue pour le gaming : Intel Wi-Fi 6, Ethernet Realtek 2.5Gb, TUF LANGuard, et Turbo LAN\r\nTwo-way AI Noise Cancelation : technologie réduisant les bruits parasites du microphone et de la sortie audio pour des communications plus claires lorsque vous jouez ou que vous êtes en visioconférence', 623, 4, 10, 'avatars/aApzYPE2NeR5rvlrn20P0xSh9TMImxHnF8bqnkEd.jpg', '2021-09-07 12:05:55', '2021-09-07 12:05:55');

-- --------------------------------------------------------

--
-- Table structure for table `product_imgs`
--

DROP TABLE IF EXISTS `product_imgs`;
CREATE TABLE IF NOT EXISTS `product_imgs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_imgs`
--

INSERT INTO `product_imgs` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'avatars/mSGcpZ9BPVfPhxStIq3MhXHlx0NYl5BWzxDZv4H2.png', NULL, NULL),
(2, 1, 'avatars/8AMUhOp2Gr7bDA7LK50O7QaloTmS9K4KGZNk8LXA.png', NULL, NULL),
(3, 2, 'avatars/jZ9bDfIYpmr2BiwY4Y30tWO5yTGzG6NswAAAs18I.png', NULL, NULL),
(4, 2, 'avatars/zyiITVOqLImsosGgmzIEemVnrtMhl0rVucPXUQeo.png', NULL, NULL),
(5, 3, 'avatars/5fHy0thOovaLNt1Lp1XMhjW7Rbisd9uKMBktFYz9.jpg', NULL, NULL),
(6, 3, 'avatars/rBt3KjFT45jea1isE4hxIMGgd5sW0osvTK7hzuOj.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
