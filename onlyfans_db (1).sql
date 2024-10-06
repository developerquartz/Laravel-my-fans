-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 06, 2021 at 11:51 PM
-- Server version: 5.7.35
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlyfans_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `banned`
--

CREATE TABLE `banned` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `icon`) VALUES
(1, 'Instagramer', NULL),
(2, 'Youtubers', NULL),
(3, 'Financial Tipper ', NULL),
(4, 'Others', NULL),
(6, 'Influencers', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `commentable_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `commentable_id` bigint(20) UNSIGNED NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `is_approved` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `commentable_type`, `commentable_id`, `comment`, `is_approved`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'App\\Post', 39, 'test', 1, 24, '2021-08-25 19:14:24', '2021-08-25 19:14:24'),
(3, 'App\\Post', 34, 'ok', 1, 24, '2021-08-25 21:36:11', '2021-08-25 21:36:11'),
(4, 'App\\Post', 41, 'test message', 1, 24, '2021-08-26 15:58:04', '2021-08-26 15:58:04'),
(5, 'App\\Post', 35, 'hi', 1, 22, '2021-08-27 16:12:03', '2021-08-27 16:12:03');

-- --------------------------------------------------------

--
-- Table structure for table `creator_profiles`
--

CREATE TABLE `creator_profiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `username` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creating` text COLLATE utf8_unicode_ci,
  `profilePic` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coverPic` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isVerified` enum('No','Pending','Yes','Rejected') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `isFeatured` enum('No','Yes') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `fbUrl` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twUrl` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ytUrl` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitchUrl` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instaUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `monthlyFee` double(10,2) DEFAULT NULL,
  `discountedFee` double(10,2) DEFAULT NULL,
  `minTip` double(10,2) DEFAULT NULL,
  `user_meta` text COLLATE utf8_unicode_ci,
  `popularity` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payout_gateway` enum('None','PayPal','Bank Transfer') COLLATE utf8_unicode_ci DEFAULT 'None',
  `payout_details` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `creator_profiles`
--

INSERT INTO `creator_profiles` (`id`, `user_id`, `category_id`, `username`, `name`, `creating`, `profilePic`, `coverPic`, `isVerified`, `isFeatured`, `fbUrl`, `twUrl`, `ytUrl`, `twitchUrl`, `instaUrl`, `monthlyFee`, `discountedFee`, `minTip`, `user_meta`, `popularity`, `created_at`, `updated_at`, `payout_gateway`, `payout_details`) VALUES
(10, 22, 4, 'theadmin', 'Site Admin', 'Patron of this website', 'profilePics/kozzK1ZOFSTtL6hvJ7hvGpzAGx9NpHUM2O2pXEz5.png', 'coverPics/mClJ4fK1zcOqld3wXlolA85wNfuKPdYbZtLtqc74.jpeg', 'Yes', 'No', NULL, NULL, NULL, NULL, NULL, 10.00, NULL, 4.00, '{\"country\":\"United States\",\"city\":\"New York\",\"address\":\"NYC, New York\",\"id\":\"verification\\/gZbFPbF0sYuf312lbLkfO32Fk8dpy1tXI1BtZuzZ.png\"}', 4, '2020-12-04 18:49:47', '2021-08-27 15:18:18', 'Bank Transfer', 'ttt'),
(12, 24, 1, 'testuser124', 'Test User', NULL, 'profilePics/0FbXyhA1sXyosB5AAngWe6vKT1KTl2ObuUlWcq20.png', 'coverPics/JzJXVy8uFCNskjTGPqBdqkjsyFfMgHjrMP4isnVY.jpeg', 'Yes', 'No', NULL, NULL, NULL, NULL, NULL, 30.00, NULL, 1.99, '{\"country\":\"India\",\"city\":\"Mohali\",\"address\":\"#abcde\",\"id\":\"verification\\/ax2OAGeOE3DDrsccO1BnaROWJh5Rm8XzLaUzf1fI.jpeg\",\"verificationDisk\":\"public\"}', 11, '2021-08-25 11:05:42', '2021-08-27 16:12:03', 'None', NULL),
(13, 25, 1, 'testuser125', 'testuser1', 'a', 'profilePics/PvKZE6FyoWWq21hdHZWTwwsShCaRgNOxQ5iRfruJ.png', 'coverPics/qdfagCppNaEsGX5dMuEyWAGIfYpknrntiNxr8r7E.jpeg', 'Yes', 'No', NULL, NULL, NULL, NULL, NULL, 30.00, NULL, 1.99, NULL, 7, '2021-08-25 15:05:15', '2021-09-07 02:42:19', 'None', NULL),
(14, 26, 1, 'testuser226', 'testuser2', NULL, 'profilePics/iek8ir4cMeETq5awa0uZwgAsLa0gnGgd3KnP3Pu1.png', 'coverPics/twsWP6zv9PhwGZbo1TuvffQAhDMC8mwo4qEHHzbD.jpeg', 'Yes', 'No', NULL, NULL, NULL, NULL, NULL, 30.00, NULL, 1.99, NULL, 2, '2021-08-25 15:54:17', '2021-08-27 14:58:24', 'None', NULL),
(15, 27, 1, 'testuser327', 'testuser3', NULL, 'profilePics/XnJafdpr5OITUr6Sa2g1lu6e0HfmxTe387BStjFn.png', 'coverPics/RQpQBo1J4Zk3LguOs5HY56RxhBQYxiJaqvh48xjD.jpeg', 'Yes', 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"country\":\"India\",\"city\":\"Mohali\",\"address\":\"#Test Address\",\"id\":\"verification\\/2ZKFYtHGixf8l2rhjdjGqCUNo9Foa5sHa0jjoA5o.png\",\"verificationDisk\":\"public\"}', 0, '2021-08-25 15:55:30', '2021-08-26 21:58:32', 'None', NULL),
(16, 28, 1, 'testuser428', 'testuser4', NULL, 'profilePics/NFgnlqQRK7V66JZ5c0zO8X3jkikPJHDgaOkVNiCf.png', 'coverPics/UueIavXlqEjiXQ6rQVnadU1rkHQHb71nNccIc8Rn.jpeg', 'No', 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-08-25 15:57:51', '2021-08-26 14:58:12', 'None', NULL),
(17, 29, 1, 'testuser529', 'testuser5', NULL, 'profilePics/xGEUuLwIjgLtANXuosG3tzNUK8gsLy3RxgezZLTP.png', 'coverPics/Jt6oAMXrhsFdXuouOZ2DQwqYkJzImQh5cxOEK59u.jpeg', 'Yes', 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"country\":\"India\",\"city\":\"Mohali\",\"address\":\"#test addres\",\"id\":\"verification\\/FEZdStvXivw8GcxCky32pOMLlDjyeQl8CpVfDiyY.jpeg\",\"verificationDisk\":\"public\"}', 1, '2021-08-25 15:58:16', '2021-08-27 15:29:45', 'None', NULL),
(18, 30, 1, 'testuser630', 'testuser6', NULL, 'profilePics/xqZi1yrQv6UikFMMrJYFv14wJSiuj6rDSQxDUxe3.jpeg', 'coverPics/cxPnpoUxDuCC8oN3007ayGuDYEvGlhFTCqmTJY1B.jpeg', 'No', 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-08-25 15:58:49', '2021-08-26 15:04:56', 'None', NULL),
(19, 31, 1, 'testuser731', 'testuser7', NULL, 'profilePics/cXLKjjZx0izQSbjokmFmAGUjrB2QTiCrrS8jKwsu.jpeg', 'coverPics/ahMpa2J4CVzfDUPV3W1ESHs87Eq22yZ73CsWLYLz.jpeg', 'No', 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-08-25 15:59:29', '2021-08-26 15:08:25', 'None', NULL),
(20, 32, 1, 'testuser832', 'testuser8', NULL, 'profilePics/6rGOMtsOJ5xGC43stXSVDPF35gtwE3ECoMgy5W0b.png', NULL, 'No', 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-08-25 17:45:54', '2021-08-25 17:48:41', 'None', NULL),
(21, 33, 1, 'eze33', 'eze', NULL, 'profilePics/default-profile-pic.png', NULL, 'No', 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-08-25 21:38:08', '2021-08-25 21:38:08', 'None', NULL),
(22, 34, 1, 'okay34', 'Okay', NULL, 'profilePics/default-profile-pic.png', NULL, 'No', 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-08-25 22:23:55', '2021-08-25 22:23:55', 'None', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `subscription_id` int(11) NOT NULL,
  `amount` double(10,2) NOT NULL,
  `payment_status` enum('Paid','Action Required','Created') COLLATE utf8_unicode_ci NOT NULL,
  `invoice_url` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT 'user_id',
  `likeable_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `likeable_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `likeable_type`, `likeable_id`, `created_at`, `updated_at`) VALUES
(1, 24, 'App\\Post', 39, '2021-08-25 19:14:14', '2021-08-25 19:14:14'),
(5, 24, 'App\\Post', 41, '2021-08-26 15:57:53', '2021-08-26 15:57:53'),
(6, 24, 'App\\Post', 38, '2021-08-26 15:58:44', '2021-08-26 15:58:44'),
(7, 22, 'App\\Post', 86, '2021-08-27 14:31:47', '2021-08-27 14:31:47'),
(8, 24, 'App\\Post', 53, '2021-08-27 15:29:45', '2021-08-27 15:29:45'),
(9, 22, 'App\\Post', 34, '2021-08-27 16:11:54', '2021-08-27 16:11:54');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `from_id` int(10) UNSIGNED NOT NULL,
  `to_id` int(11) NOT NULL,
  `message` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` enum('No','Yes') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `message_media`
--

CREATE TABLE `message_media` (
  `id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `media_content` varchar(255) DEFAULT 'Image',
  `media_type` enum('Image','Video','Audio','ZIP') DEFAULT NULL,
  `disk` varchar(255) DEFAULT NULL,
  `lock_type` enum('Free','Paid') DEFAULT 'Free',
  `lock_price` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_01_01_000000-create_options_table', 1),
(4, '2016_01_01_000000_add_voyager_user_fields', 2),
(5, '2016_01_01_000000_create_data_types_table', 2),
(6, '2016_05_19_173453_create_menu_table', 2),
(7, '2016_10_21_190000_create_roles_table', 2),
(8, '2016_10_21_190000_create_settings_table', 2),
(9, '2016_11_30_135954_create_permission_table', 2),
(10, '2016_11_30_141208_create_permission_role_table', 2),
(11, '2016_12_26_201236_data_types__add__server_side', 2),
(12, '2017_01_13_000000_add_route_to_menu_items_table', 2),
(13, '2017_01_14_005015_create_translations_table', 2),
(14, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 2),
(15, '2017_03_06_000000_add_controller_to_data_types_table', 2),
(16, '2017_04_21_000000_add_order_to_data_rows_table', 2),
(17, '2017_07_05_210000_add_policyname_to_data_types_table', 2),
(18, '2017_08_05_000000_add_group_to_settings_table', 2),
(19, '2017_11_26_013050_add_user_role_relationship', 2),
(20, '2017_11_26_015000_create_user_roles_table', 2),
(21, '2018_03_11_000000_add_user_settings', 2),
(22, '2018_03_14_000000_add_details_to_data_types_table', 2),
(23, '2018_03_16_000000_make_settings_value_nullable', 2),
(24, '2019_01_06_111055_create_contentblocks_table', 3),
(25, '2016_12_17_114551_create_categories_table', 4),
(26, '2016_12_17_119816_create_categorizables_table', 5),
(27, '2019_02_06_224423_create_creator_profiles', 6),
(28, '2020_11_03_134933_create_friendships_table', 7),
(29, '2020_11_03_134934_create_friendships_groups_table', 8),
(30, '2020_04_04_000000_create_user_follower_table', 9),
(31, '2018_12_14_000000_create_likes_table', 10),
(32, '2020_11_07_183413_create_comments_table', 11),
(33, '2014_10_28_175635_create_threads_table', 12),
(34, '2014_10_28_175710_create_messages_table', 12),
(35, '2014_10_28_180224_create_participants_table', 12),
(36, '2014_11_03_154831_add_soft_deletes_to_participants_table', 12),
(37, '2014_12_04_124531_add_softdeletes_to_threads_table', 12),
(38, '2017_03_30_152742_add_soft_deletes_to_messages_table', 12),
(39, '2020_11_19_145043_create_notifications_table', 13),
(40, '2019_05_03_000001_create_customer_columns', 14),
(41, '2019_05_03_000002_create_subscriptions_table', 15),
(42, '2019_05_03_000003_create_subscription_items_table', 15),
(43, '2021_01_11_165051_create_sessions_table', 16);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('05f3bfbf-1e10-4e63-8509-5b94e1e0c000', 'App\\Notifications\\ReceivedLike', 'App\\User', 29, '{\"user\":\"testuser124\",\"postId\":53}', NULL, '2021-08-27 15:29:45', '2021-08-27 15:29:45'),
('16f057ac-f730-46f9-b1b6-e259df791bec', 'App\\Notifications\\ReceivedComment', 'App\\User', 24, '{\"comment\":\"test\",\"is_approved\":true,\"user_id\":24,\"commentable_id\":62,\"commentable_type\":\"App\\\\Post\",\"updated_at\":\"2021-08-25 15:26:27\",\"created_at\":\"2021-08-25 15:26:27\",\"id\":2,\"commentator\":{\"id\":24,\"name\":\"Test User\",\"email\":\"testuser@myfans.com\",\"avatar\":\"users\\/default.png\",\"email_verified_at\":\"2021-08-25 18:43:12\",\"settings\":null,\"balance\":162.460000000000007958078640513122081756591796875,\"isAdmin\":\"No\",\"ip\":\"172.70.142.254\",\"isBanned\":\"No\",\"created_at\":\"2021-08-25 07:05:42\",\"updated_at\":\"2021-08-25 15:26:27\",\"likes\":[{\"id\":1,\"user_id\":24,\"likeable_type\":\"App\\\\Post\",\"likeable_id\":39,\"created_at\":\"2021-08-25 15:14:14\",\"updated_at\":\"2021-08-25 15:14:14\"},{\"id\":2,\"user_id\":24,\"likeable_type\":\"App\\\\Post\",\"likeable_id\":62,\"created_at\":\"2021-08-25 15:14:53\",\"updated_at\":\"2021-08-25 15:14:53\"}],\"profile\":{\"id\":12,\"user_id\":24,\"category_id\":1,\"username\":\"testuser124\",\"name\":\"Test User\",\"creating\":null,\"profilePic\":\"profilePics\\/FoIRfqHyMbVggx8BssQgbmEWyqCUGbAgimmPn0EE.jpeg\",\"coverPic\":\"coverPics\\/13gV0md2zm6BiiibNcaieIp50G7Bg72kXAHxqVZX.jpeg\",\"isVerified\":\"Yes\",\"isFeatured\":\"No\",\"fbUrl\":null,\"twUrl\":null,\"ytUrl\":null,\"twitchUrl\":null,\"instaUrl\":null,\"monthlyFee\":null,\"discountedFee\":null,\"minTip\":null,\"user_meta\":{\"country\":\"India\",\"city\":\"Mohali\",\"address\":\"#abcde\",\"id\":\"verification\\/ax2OAGeOE3DDrsccO1BnaROWJh5Rm8XzLaUzf1fI.jpeg\",\"verificationDisk\":\"public\"},\"popularity\":1,\"created_at\":\"2021-08-25 07:05:42\",\"updated_at\":\"2021-08-25 15:14:53\",\"payout_gateway\":\"None\",\"payout_details\":null}},\"commentable\":{\"id\":62,\"text_content\":\"So far we\\u2019ve covered text generators based on movies and authors. Fillerama is the last piece of the entertainment puzzle and offers text from popular television shows like the Simpsons, Dexter and Arrested Development, among others.\",\"media_type\":\"None\",\"media_content\":null,\"lock_type\":\"Paid\",\"user_id\":24,\"profile_id\":12,\"disk\":\"public\",\"created_at\":\"2021-08-25 13:19:43\",\"updated_at\":\"2021-08-25 13:20:38\",\"likes\":[{\"id\":2,\"user_id\":24,\"likeable_type\":\"App\\\\Post\",\"likeable_id\":62,\"created_at\":\"2021-08-25 15:14:53\",\"updated_at\":\"2021-08-25 15:14:53\"}],\"user\":{\"id\":24,\"name\":\"Test User\",\"email\":\"testuser@myfans.com\",\"avatar\":\"users\\/default.png\",\"email_verified_at\":\"2021-08-25 18:43:12\",\"settings\":null,\"balance\":162.460000000000007958078640513122081756591796875,\"isAdmin\":\"No\",\"ip\":\"172.70.142.254\",\"isBanned\":\"No\",\"created_at\":\"2021-08-25 07:05:42\",\"updated_at\":\"2021-08-25 15:26:27\",\"likes\":[{\"id\":1,\"user_id\":24,\"likeable_type\":\"App\\\\Post\",\"likeable_id\":39,\"created_at\":\"2021-08-25 15:14:14\",\"updated_at\":\"2021-08-25 15:14:14\"},{\"id\":2,\"user_id\":24,\"likeable_type\":\"App\\\\Post\",\"likeable_id\":62,\"created_at\":\"2021-08-25 15:14:53\",\"updated_at\":\"2021-08-25 15:14:53\"}],\"profile\":{\"id\":12,\"user_id\":24,\"category_id\":1,\"username\":\"testuser124\",\"name\":\"Test User\",\"creating\":null,\"profilePic\":\"profilePics\\/FoIRfqHyMbVggx8BssQgbmEWyqCUGbAgimmPn0EE.jpeg\",\"coverPic\":\"coverPics\\/13gV0md2zm6BiiibNcaieIp50G7Bg72kXAHxqVZX.jpeg\",\"isVerified\":\"Yes\",\"isFeatured\":\"No\",\"fbUrl\":null,\"twUrl\":null,\"ytUrl\":null,\"twitchUrl\":null,\"instaUrl\":null,\"monthlyFee\":null,\"discountedFee\":null,\"minTip\":null,\"user_meta\":{\"country\":\"India\",\"city\":\"Mohali\",\"address\":\"#abcde\",\"id\":\"verification\\/ax2OAGeOE3DDrsccO1BnaROWJh5Rm8XzLaUzf1fI.jpeg\",\"verificationDisk\":\"public\"},\"popularity\":1,\"created_at\":\"2021-08-25 07:05:42\",\"updated_at\":\"2021-08-25 15:14:53\",\"payout_gateway\":\"None\",\"payout_details\":null}}}}', '2021-08-25 19:28:01', '2021-08-25 19:26:27', '2021-08-25 19:28:01'),
('1fc664a0-94a5-45c4-b8d5-ad1fffd61198', 'App\\Notifications\\ReceivedComment', 'App\\User', 24, '{\"comment\":\"ok\",\"is_approved\":true,\"user_id\":24,\"commentable_id\":34,\"commentable_type\":\"App\\\\Post\",\"updated_at\":\"2021-08-25 17:36:11\",\"created_at\":\"2021-08-25 17:36:11\",\"id\":3,\"commentator\":{\"id\":24,\"name\":\"Test User\",\"email\":\"testuser@myfans.com\",\"avatar\":\"users\\/default.png\",\"email_verified_at\":\"2021-08-25 18:43:12\",\"settings\":null,\"balance\":162.460000000000007958078640513122081756591796875,\"isAdmin\":\"No\",\"ip\":\"172.70.142.254\",\"isBanned\":\"No\",\"created_at\":\"2021-08-25 07:05:42\",\"updated_at\":\"2021-08-25 17:36:11\",\"likes\":[{\"id\":1,\"user_id\":24,\"likeable_type\":\"App\\\\Post\",\"likeable_id\":39,\"created_at\":\"2021-08-25 15:14:14\",\"updated_at\":\"2021-08-25 15:14:14\"},{\"id\":2,\"user_id\":24,\"likeable_type\":\"App\\\\Post\",\"likeable_id\":62,\"created_at\":\"2021-08-25 15:14:53\",\"updated_at\":\"2021-08-25 15:14:53\"}],\"profile\":{\"id\":12,\"user_id\":24,\"category_id\":1,\"username\":\"testuser124\",\"name\":\"Test User\",\"creating\":null,\"profilePic\":\"profilePics\\/FoIRfqHyMbVggx8BssQgbmEWyqCUGbAgimmPn0EE.jpeg\",\"coverPic\":\"coverPics\\/13gV0md2zm6BiiibNcaieIp50G7Bg72kXAHxqVZX.jpeg\",\"isVerified\":\"Yes\",\"isFeatured\":\"No\",\"fbUrl\":null,\"twUrl\":null,\"ytUrl\":null,\"twitchUrl\":null,\"instaUrl\":null,\"monthlyFee\":null,\"discountedFee\":null,\"minTip\":null,\"user_meta\":{\"country\":\"India\",\"city\":\"Mohali\",\"address\":\"#abcde\",\"id\":\"verification\\/ax2OAGeOE3DDrsccO1BnaROWJh5Rm8XzLaUzf1fI.jpeg\",\"verificationDisk\":\"public\"},\"popularity\":2,\"created_at\":\"2021-08-25 07:05:42\",\"updated_at\":\"2021-08-25 15:26:27\",\"payout_gateway\":\"None\",\"payout_details\":null}},\"commentable\":{\"id\":34,\"text_content\":\"Samuel L. Jackson is arguably one of the most quotable Hollywood actors of all time. It\\u2019s no surprise that a dummy text generator comprised of his quotes made our list. For those who don\\u2019t appreciate the abundance of swear words, there is also a lite version with no profanity.\",\"media_type\":\"None\",\"media_content\":null,\"lock_type\":\"Free\",\"user_id\":24,\"profile_id\":12,\"disk\":\"public\",\"created_at\":\"2021-08-25 08:36:09\",\"updated_at\":\"2021-08-25 08:36:09\",\"likes\":[],\"user\":{\"id\":24,\"name\":\"Test User\",\"email\":\"testuser@myfans.com\",\"avatar\":\"users\\/default.png\",\"email_verified_at\":\"2021-08-25 18:43:12\",\"settings\":null,\"balance\":162.460000000000007958078640513122081756591796875,\"isAdmin\":\"No\",\"ip\":\"172.70.142.254\",\"isBanned\":\"No\",\"created_at\":\"2021-08-25 07:05:42\",\"updated_at\":\"2021-08-25 17:36:11\",\"likes\":[{\"id\":1,\"user_id\":24,\"likeable_type\":\"App\\\\Post\",\"likeable_id\":39,\"created_at\":\"2021-08-25 15:14:14\",\"updated_at\":\"2021-08-25 15:14:14\"},{\"id\":2,\"user_id\":24,\"likeable_type\":\"App\\\\Post\",\"likeable_id\":62,\"created_at\":\"2021-08-25 15:14:53\",\"updated_at\":\"2021-08-25 15:14:53\"}],\"profile\":{\"id\":12,\"user_id\":24,\"category_id\":1,\"username\":\"testuser124\",\"name\":\"Test User\",\"creating\":null,\"profilePic\":\"profilePics\\/FoIRfqHyMbVggx8BssQgbmEWyqCUGbAgimmPn0EE.jpeg\",\"coverPic\":\"coverPics\\/13gV0md2zm6BiiibNcaieIp50G7Bg72kXAHxqVZX.jpeg\",\"isVerified\":\"Yes\",\"isFeatured\":\"No\",\"fbUrl\":null,\"twUrl\":null,\"ytUrl\":null,\"twitchUrl\":null,\"instaUrl\":null,\"monthlyFee\":null,\"discountedFee\":null,\"minTip\":null,\"user_meta\":{\"country\":\"India\",\"city\":\"Mohali\",\"address\":\"#abcde\",\"id\":\"verification\\/ax2OAGeOE3DDrsccO1BnaROWJh5Rm8XzLaUzf1fI.jpeg\",\"verificationDisk\":\"public\"},\"popularity\":2,\"created_at\":\"2021-08-25 07:05:42\",\"updated_at\":\"2021-08-25 15:26:27\",\"payout_gateway\":\"None\",\"payout_details\":null}}}}', '2021-08-26 13:49:17', '2021-08-25 21:36:11', '2021-08-26 13:49:17'),
('274e373f-8f19-41da-89d1-a35da0daa330', 'App\\Notifications\\ReceivedLike', 'App\\User', 24, '{\"user\":\"testuser124\",\"postId\":37}', '2021-08-26 15:02:39', '2021-08-26 15:02:24', '2021-08-26 15:02:39'),
('2e7c5d32-bba8-4264-b2c5-16777d4e0432', 'App\\Notifications\\NewFollower', 'App\\User', 22, '{\"id\":33,\"name\":\"eze\",\"profile\":{\"id\":21,\"user_id\":33,\"username\":\"eze33\",\"profilePic\":\"profilePics\\/default-profile-pic.png\"}}', '2021-08-26 16:05:41', '2021-08-25 21:38:50', '2021-08-26 16:05:41'),
('36ebaa8a-0d70-47ca-8eb9-2eb9fb97a24c', 'App\\Notifications\\ReceivedLike', 'App\\User', 25, '{\"user\":\"testuser124\",\"postId\":41}', NULL, '2021-08-26 15:57:53', '2021-08-26 15:57:53'),
('398dd962-c993-462c-b8e6-f2bdc821eb2f', 'App\\Notifications\\NewFollower', 'App\\User', 22, '{\"id\":24,\"name\":\"Test User\",\"profile\":{\"id\":12,\"user_id\":24,\"username\":\"testuser124\",\"profilePic\":\"profilePics\\/0FbXyhA1sXyosB5AAngWe6vKT1KTl2ObuUlWcq20.png\"}}', '2021-08-27 14:31:21', '2021-08-26 16:29:04', '2021-08-27 14:31:21'),
('3e5122bf-f048-442f-8b1c-1a0d34e640b6', 'App\\Notifications\\ReceivedLike', 'App\\User', 24, '{\"user\":\"theadmin\",\"postId\":86}', '2021-08-27 14:58:11', '2021-08-27 14:31:47', '2021-08-27 14:58:11'),
('563dc97a-e6e9-4b44-8589-e6d4ebc24c5d', 'App\\Notifications\\NewFollower', 'App\\User', 24, '{\"id\":22,\"name\":\"Site Admin\",\"profile\":{\"id\":10,\"user_id\":22,\"username\":\"theadmin\",\"profilePic\":\"profilePics\\/kozzK1ZOFSTtL6hvJ7hvGpzAGx9NpHUM2O2pXEz5.png\"}}', '2021-08-27 14:58:11', '2021-08-27 14:32:26', '2021-08-27 14:58:11'),
('705fc5d3-274c-4e4f-82cb-516ce339502c', 'App\\Notifications\\NewFollower', 'App\\User', 24, '{\"id\":34,\"name\":\"Okay\",\"profile\":{\"id\":22,\"user_id\":34,\"username\":\"okay34\",\"profilePic\":\"profilePics\\/default-profile-pic.png\"}}', '2021-08-26 13:49:17', '2021-08-25 22:24:42', '2021-08-26 13:49:17'),
('9324a79b-7d16-47d0-a7d4-e261f7e942e4', 'App\\Notifications\\NewFollower', 'App\\User', 24, '{\"id\":33,\"name\":\"eze\",\"profile\":{\"id\":21,\"user_id\":33,\"username\":\"eze33\",\"profilePic\":\"profilePics\\/default-profile-pic.png\"}}', '2021-08-26 13:49:17', '2021-08-25 21:38:23', '2021-08-26 13:49:17'),
('9829f900-e535-4dfa-8ab7-92798dee5930', 'App\\Notifications\\ReceivedLike', 'App\\User', 24, '{\"user\":\"testuser124\",\"postId\":62}', '2021-08-26 16:22:36', '2021-08-26 15:57:41', '2021-08-26 16:22:36'),
('a072dcff-31df-4f17-85d4-c8a5ebdcd581', 'App\\Notifications\\ReceivedComment', 'App\\User', 25, '{\"comment\":\"test message\",\"is_approved\":true,\"user_id\":24,\"commentable_id\":41,\"commentable_type\":\"App\\\\Post\",\"updated_at\":\"2021-08-26 11:58:04\",\"created_at\":\"2021-08-26 11:58:04\",\"id\":4,\"commentator\":{\"id\":24,\"name\":\"Test User\",\"email\":\"testuser@myfans.com\",\"avatar\":\"users\\/default.png\",\"email_verified_at\":\"2021-08-25 18:43:12\",\"settings\":null,\"balance\":162.460000000000007958078640513122081756591796875,\"isAdmin\":\"No\",\"ip\":\"172.70.142.254\",\"isBanned\":\"No\",\"created_at\":\"2021-08-25 07:05:42\",\"updated_at\":\"2021-08-26 11:58:04\",\"likes\":[{\"id\":1,\"user_id\":24,\"likeable_type\":\"App\\\\Post\",\"likeable_id\":39,\"created_at\":\"2021-08-25 15:14:14\",\"updated_at\":\"2021-08-25 15:14:14\"},{\"id\":4,\"user_id\":24,\"likeable_type\":\"App\\\\Post\",\"likeable_id\":62,\"created_at\":\"2021-08-26 11:57:41\",\"updated_at\":\"2021-08-26 11:57:41\"},{\"id\":5,\"user_id\":24,\"likeable_type\":\"App\\\\Post\",\"likeable_id\":41,\"created_at\":\"2021-08-26 11:57:53\",\"updated_at\":\"2021-08-26 11:57:53\"}],\"profile\":{\"id\":12,\"user_id\":24,\"category_id\":1,\"username\":\"testuser124\",\"name\":\"Test User\",\"creating\":null,\"profilePic\":\"profilePics\\/0FbXyhA1sXyosB5AAngWe6vKT1KTl2ObuUlWcq20.png\",\"coverPic\":\"coverPics\\/JzJXVy8uFCNskjTGPqBdqkjsyFfMgHjrMP4isnVY.jpeg\",\"isVerified\":\"Yes\",\"isFeatured\":\"No\",\"fbUrl\":null,\"twUrl\":null,\"ytUrl\":null,\"twitchUrl\":null,\"instaUrl\":null,\"monthlyFee\":30,\"discountedFee\":null,\"minTip\":1.9899999999999999911182158029987476766109466552734375,\"user_meta\":{\"country\":\"India\",\"city\":\"Mohali\",\"address\":\"#abcde\",\"id\":\"verification\\/ax2OAGeOE3DDrsccO1BnaROWJh5Rm8XzLaUzf1fI.jpeg\",\"verificationDisk\":\"public\"},\"popularity\":7,\"created_at\":\"2021-08-25 07:05:42\",\"updated_at\":\"2021-08-26 11:57:41\",\"payout_gateway\":\"None\",\"payout_details\":null}},\"commentable\":{\"id\":41,\"text_content\":\"That concludes our list of top 10 Lorem Ipsum alternatives. We hope this list will enable you to spice up some of the dummy text on your themes and websites. If we forgot any great alternatives, please leave us a comment below.\",\"media_type\":\"None\",\"media_content\":null,\"lock_type\":\"Free\",\"user_id\":25,\"profile_id\":13,\"disk\":\"public\",\"created_at\":\"2021-08-25 12:37:12\",\"updated_at\":\"2021-08-25 12:37:12\",\"likes\":[{\"id\":5,\"user_id\":24,\"likeable_type\":\"App\\\\Post\",\"likeable_id\":41,\"created_at\":\"2021-08-26 11:57:53\",\"updated_at\":\"2021-08-26 11:57:53\"}],\"user\":{\"id\":25,\"name\":\"testuser1\",\"email\":\"testuser1@myfans.com\",\"avatar\":\"users\\/default.png\",\"email_verified_at\":null,\"settings\":null,\"balance\":0,\"isAdmin\":\"No\",\"ip\":\"162.158.165.150\",\"isBanned\":\"No\",\"created_at\":\"2021-08-25 11:05:15\",\"updated_at\":\"2021-08-26 10:56:12\",\"likes\":[],\"profile\":{\"id\":13,\"user_id\":25,\"category_id\":1,\"username\":\"testuser125\",\"name\":\"testuser1\",\"creating\":\"a\",\"profilePic\":\"profilePics\\/PvKZE6FyoWWq21hdHZWTwwsShCaRgNOxQ5iRfruJ.png\",\"coverPic\":\"coverPics\\/qdfagCppNaEsGX5dMuEyWAGIfYpknrntiNxr8r7E.jpeg\",\"isVerified\":\"Yes\",\"isFeatured\":\"No\",\"fbUrl\":null,\"twUrl\":null,\"ytUrl\":null,\"twitchUrl\":null,\"instaUrl\":null,\"monthlyFee\":30,\"discountedFee\":null,\"minTip\":1.9899999999999999911182158029987476766109466552734375,\"user_meta\":null,\"popularity\":4,\"created_at\":\"2021-08-25 11:05:15\",\"updated_at\":\"2021-08-26 11:57:53\",\"payout_gateway\":\"None\",\"payout_details\":null}}}}', NULL, '2021-08-26 15:58:04', '2021-08-26 15:58:04'),
('ad27783b-cfab-491b-ad07-c147cf87ee41', 'App\\Notifications\\NewFollower', 'App\\User', 25, '{\"id\":24,\"name\":\"Test User\",\"profile\":{\"id\":12,\"user_id\":24,\"username\":\"testuser124\",\"profilePic\":\"profilePics\\/FoIRfqHyMbVggx8BssQgbmEWyqCUGbAgimmPn0EE.jpeg\"}}', NULL, '2021-08-25 19:13:42', '2021-08-25 19:13:42'),
('b4c7eeac-293c-4c6d-9aea-8d40865f4ab6', 'App\\Notifications\\ReceivedLike', 'App\\User', 25, '{\"user\":\"testuser124\",\"postId\":38}', NULL, '2021-08-26 15:58:44', '2021-08-26 15:58:44'),
('baff9208-107e-4e68-a7b1-877ff1849aa1', 'App\\Notifications\\NewFollower', 'App\\User', 26, '{\"id\":24,\"name\":\"Test User\",\"profile\":{\"id\":12,\"user_id\":24,\"username\":\"testuser124\",\"profilePic\":\"profilePics\\/0FbXyhA1sXyosB5AAngWe6vKT1KTl2ObuUlWcq20.png\"}}', NULL, '2021-08-27 14:58:24', '2021-08-27 14:58:24'),
('be43902d-6c89-4cc4-9c04-da47a4a22fd7', 'App\\Notifications\\ReceivedLike', 'App\\User', 25, '{\"user\":\"testuser124\",\"postId\":39}', NULL, '2021-08-25 19:14:14', '2021-08-25 19:14:14'),
('beb662db-dc72-4644-94d2-5fe095229334', 'App\\Notifications\\NewFollower', 'App\\User', 25, '{\"id\":24,\"name\":\"Test User\",\"profile\":{\"id\":12,\"user_id\":24,\"username\":\"testuser124\",\"profilePic\":\"profilePics\\/0FbXyhA1sXyosB5AAngWe6vKT1KTl2ObuUlWcq20.png\"}}', NULL, '2021-09-07 02:42:19', '2021-09-07 02:42:19'),
('c2ac017f-0c1f-49aa-b6e0-efff0252982c', 'App\\Notifications\\ReceivedLike', 'App\\User', 24, '{\"user\":\"testuser124\",\"postId\":62}', '2021-08-25 19:28:01', '2021-08-25 19:14:53', '2021-08-25 19:28:01'),
('c8b2c21e-da87-4bdf-9e43-072945b00533', 'App\\Notifications\\ReceivedComment', 'App\\User', 24, '{\"comment\":\"hi\",\"is_approved\":true,\"user_id\":22,\"commentable_id\":35,\"commentable_type\":\"App\\\\Post\",\"updated_at\":\"2021-08-27 12:12:03\",\"created_at\":\"2021-08-27 12:12:03\",\"id\":5,\"commentator\":{\"id\":22,\"name\":\"Site Admin\",\"email\":\"admin@myfans.com\",\"avatar\":\"users\\/default.png\",\"email_verified_at\":null,\"settings\":null,\"balance\":162.460000000000007958078640513122081756591796875,\"isAdmin\":\"Yes\",\"ip\":\"127.0.0.1\",\"isBanned\":\"No\",\"created_at\":\"2020-12-04 13:49:47\",\"updated_at\":\"2021-08-27 12:12:03\",\"likes\":[{\"id\":7,\"user_id\":22,\"likeable_type\":\"App\\\\Post\",\"likeable_id\":86,\"created_at\":\"2021-08-27 10:31:47\",\"updated_at\":\"2021-08-27 10:31:47\"},{\"id\":9,\"user_id\":22,\"likeable_type\":\"App\\\\Post\",\"likeable_id\":34,\"created_at\":\"2021-08-27 12:11:54\",\"updated_at\":\"2021-08-27 12:11:54\"}],\"profile\":{\"id\":10,\"user_id\":22,\"category_id\":4,\"username\":\"theadmin\",\"name\":\"Site Admin\",\"creating\":\"Patron of this website\",\"profilePic\":\"profilePics\\/kozzK1ZOFSTtL6hvJ7hvGpzAGx9NpHUM2O2pXEz5.png\",\"coverPic\":\"coverPics\\/mClJ4fK1zcOqld3wXlolA85wNfuKPdYbZtLtqc74.jpeg\",\"isVerified\":\"Yes\",\"isFeatured\":\"No\",\"fbUrl\":null,\"twUrl\":null,\"ytUrl\":null,\"twitchUrl\":null,\"instaUrl\":null,\"monthlyFee\":10,\"discountedFee\":null,\"minTip\":4,\"user_meta\":{\"country\":\"United States\",\"city\":\"New York\",\"address\":\"NYC, New York\",\"id\":\"verification\\/gZbFPbF0sYuf312lbLkfO32Fk8dpy1tXI1BtZuzZ.png\"},\"popularity\":4,\"created_at\":\"2020-12-04 13:49:47\",\"updated_at\":\"2021-08-27 11:18:18\",\"payout_gateway\":\"Bank Transfer\",\"payout_details\":\"ttt\"}},\"commentable\":{\"id\":35,\"text_content\":\"Lorizzle is the most gangsta Lorem Ipsum there is. If you didn\\u2019t know any better, you\\u2019d think that Snoop Dogg actually created the dummy text for this site. While the site is extremely simple and offers limited functionality, the results are hilarious.\",\"media_type\":\"None\",\"media_content\":null,\"lock_type\":\"Paid\",\"user_id\":24,\"profile_id\":12,\"disk\":\"public\",\"created_at\":\"2021-08-25 12:31:57\",\"updated_at\":\"2021-08-25 13:21:53\",\"likes\":[],\"user\":{\"id\":24,\"name\":\"Test User\",\"email\":\"testuser@myfans.com\",\"avatar\":\"users\\/default.png\",\"email_verified_at\":\"2021-08-25 18:43:12\",\"settings\":null,\"balance\":162.460000000000007958078640513122081756591796875,\"isAdmin\":\"No\",\"ip\":\"172.70.142.254\",\"isBanned\":\"No\",\"created_at\":\"2021-08-25 07:05:42\",\"updated_at\":\"2021-08-27 12:11:41\",\"likes\":[{\"id\":1,\"user_id\":24,\"likeable_type\":\"App\\\\Post\",\"likeable_id\":39,\"created_at\":\"2021-08-25 15:14:14\",\"updated_at\":\"2021-08-25 15:14:14\"},{\"id\":5,\"user_id\":24,\"likeable_type\":\"App\\\\Post\",\"likeable_id\":41,\"created_at\":\"2021-08-26 11:57:53\",\"updated_at\":\"2021-08-26 11:57:53\"},{\"id\":6,\"user_id\":24,\"likeable_type\":\"App\\\\Post\",\"likeable_id\":38,\"created_at\":\"2021-08-26 11:58:44\",\"updated_at\":\"2021-08-26 11:58:44\"},{\"id\":8,\"user_id\":24,\"likeable_type\":\"App\\\\Post\",\"likeable_id\":53,\"created_at\":\"2021-08-27 11:29:45\",\"updated_at\":\"2021-08-27 11:29:45\"}],\"profile\":{\"id\":12,\"user_id\":24,\"category_id\":1,\"username\":\"testuser124\",\"name\":\"Test User\",\"creating\":null,\"profilePic\":\"profilePics\\/0FbXyhA1sXyosB5AAngWe6vKT1KTl2ObuUlWcq20.png\",\"coverPic\":\"coverPics\\/JzJXVy8uFCNskjTGPqBdqkjsyFfMgHjrMP4isnVY.jpeg\",\"isVerified\":\"Yes\",\"isFeatured\":\"No\",\"fbUrl\":null,\"twUrl\":null,\"ytUrl\":null,\"twitchUrl\":null,\"instaUrl\":null,\"monthlyFee\":30,\"discountedFee\":null,\"minTip\":1.9899999999999999911182158029987476766109466552734375,\"user_meta\":{\"country\":\"India\",\"city\":\"Mohali\",\"address\":\"#abcde\",\"id\":\"verification\\/ax2OAGeOE3DDrsccO1BnaROWJh5Rm8XzLaUzf1fI.jpeg\",\"verificationDisk\":\"public\"},\"popularity\":10,\"created_at\":\"2021-08-25 07:05:42\",\"updated_at\":\"2021-08-27 12:11:54\",\"payout_gateway\":\"None\",\"payout_details\":null}}}}', '2021-08-27 17:01:06', '2021-08-27 16:12:03', '2021-08-27 17:01:06'),
('dce84eda-5466-4335-9ad4-ce13905459e8', 'App\\Notifications\\ReceivedLike', 'App\\User', 24, '{\"user\":\"theadmin\",\"postId\":34}', '2021-08-27 17:01:06', '2021-08-27 16:11:54', '2021-08-27 17:01:06'),
('f784f866-6c22-4fe4-bd20-7961c343e4b8', 'App\\Notifications\\ReceivedComment', 'App\\User', 25, '{\"comment\":\"test\",\"is_approved\":true,\"user_id\":24,\"commentable_id\":39,\"commentable_type\":\"App\\\\Post\",\"updated_at\":\"2021-08-25 15:14:24\",\"created_at\":\"2021-08-25 15:14:24\",\"id\":1,\"commentator\":{\"id\":24,\"name\":\"Test User\",\"email\":\"testuser@myfans.com\",\"avatar\":\"users\\/default.png\",\"email_verified_at\":\"2021-08-25 18:43:12\",\"settings\":null,\"balance\":162.460000000000007958078640513122081756591796875,\"isAdmin\":\"No\",\"ip\":\"172.70.142.254\",\"isBanned\":\"No\",\"created_at\":\"2021-08-25 07:05:42\",\"updated_at\":\"2021-08-25 15:14:24\",\"likes\":[{\"id\":1,\"user_id\":24,\"likeable_type\":\"App\\\\Post\",\"likeable_id\":39,\"created_at\":\"2021-08-25 15:14:14\",\"updated_at\":\"2021-08-25 15:14:14\"}],\"profile\":{\"id\":12,\"user_id\":24,\"category_id\":1,\"username\":\"testuser124\",\"name\":\"Test User\",\"creating\":null,\"profilePic\":\"profilePics\\/FoIRfqHyMbVggx8BssQgbmEWyqCUGbAgimmPn0EE.jpeg\",\"coverPic\":\"coverPics\\/13gV0md2zm6BiiibNcaieIp50G7Bg72kXAHxqVZX.jpeg\",\"isVerified\":\"Yes\",\"isFeatured\":\"No\",\"fbUrl\":null,\"twUrl\":null,\"ytUrl\":null,\"twitchUrl\":null,\"instaUrl\":null,\"monthlyFee\":null,\"discountedFee\":null,\"minTip\":null,\"user_meta\":{\"country\":\"India\",\"city\":\"Mohali\",\"address\":\"#abcde\",\"id\":\"verification\\/ax2OAGeOE3DDrsccO1BnaROWJh5Rm8XzLaUzf1fI.jpeg\",\"verificationDisk\":\"public\"},\"popularity\":0,\"created_at\":\"2021-08-25 07:05:42\",\"updated_at\":\"2021-08-25 14:24:44\",\"payout_gateway\":\"None\",\"payout_details\":null}},\"commentable\":{\"id\":39,\"text_content\":\"So far we\\u2019ve covered text generators based on movies and authors. Fillerama is the last piece of the entertainment puzzle and offers text from popular television shows like the Simpsons, Dexter and Arrested Development, among others.\",\"media_type\":\"None\",\"media_content\":null,\"lock_type\":\"Free\",\"user_id\":25,\"profile_id\":13,\"disk\":\"public\",\"created_at\":\"2021-08-25 12:36:41\",\"updated_at\":\"2021-08-25 12:36:41\",\"likes\":[{\"id\":1,\"user_id\":24,\"likeable_type\":\"App\\\\Post\",\"likeable_id\":39,\"created_at\":\"2021-08-25 15:14:14\",\"updated_at\":\"2021-08-25 15:14:14\"}],\"user\":{\"id\":25,\"name\":\"testuser1\",\"email\":\"testuser1@myfans.com\",\"avatar\":\"users\\/default.png\",\"email_verified_at\":null,\"settings\":null,\"balance\":0,\"isAdmin\":\"No\",\"ip\":\"162.158.165.150\",\"isBanned\":\"No\",\"created_at\":\"2021-08-25 11:05:15\",\"updated_at\":\"2021-08-25 14:58:07\",\"likes\":[],\"profile\":{\"id\":13,\"user_id\":25,\"category_id\":1,\"username\":\"testuser125\",\"name\":\"testuser1\",\"creating\":\"a\",\"profilePic\":\"profilePics\\/DZhN3AAeFlgFKy7qRa771mdPzkBv8n0Jw9JRaoJR.jpeg\",\"coverPic\":\"coverPics\\/WNorL3VG053qitsUQo6ObvPtrrYyurfbd2rU1a05.jpeg\",\"isVerified\":\"Yes\",\"isFeatured\":\"No\",\"fbUrl\":null,\"twUrl\":null,\"ytUrl\":null,\"twitchUrl\":null,\"instaUrl\":null,\"monthlyFee\":null,\"discountedFee\":null,\"minTip\":null,\"user_meta\":null,\"popularity\":2,\"created_at\":\"2021-08-25 11:05:15\",\"updated_at\":\"2021-08-25 15:14:14\",\"payout_gateway\":\"None\",\"payout_details\":null}}}}', NULL, '2021-08-25 19:14:24', '2021-08-25 19:14:24'),
('fcd61b15-97cf-4177-82ad-4bab417651e0', 'App\\Notifications\\NewFollower', 'App\\User', 26, '{\"id\":22,\"name\":\"Site Admin\",\"profile\":{\"id\":10,\"user_id\":22,\"username\":\"theadmin\",\"profilePic\":\"profilePics\\/kozzK1ZOFSTtL6hvJ7hvGpzAGx9NpHUM2O2pXEz5.png\"}}', NULL, '2021-08-26 18:05:00', '2021-08-26 18:05:00');

-- --------------------------------------------------------

--
-- Table structure for table `options_table`
--

CREATE TABLE `options_table` (
  `id` int(10) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `option_value` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `options_table`
--

INSERT INTO `options_table` (`id`, `option_name`, `option_value`) VALUES
(13, 'payment-settings.currency_code', 'MXN'),
(14, 'payment-settings.currency_symbol', '$'),
(15, 'payment-settings.site_fee', '5'),
(16, 'STRIPE_PUBLIC_KEY', 'pk_test_ZtNLID4mYg59sALO1oYuPflC'),
(17, 'STRIPE_SECRET_KEY', 'sk_test_h3ae1pV1QA4Fs8KlCOhXkaB1'),
(18, 'stripeEnable', 'Yes'),
(19, 'paypalEnable', 'Yes'),
(20, 'STRIPE_WEBHOOK_SECRET', 'whsec_PUidlNQaj2UPsoEzCSrhOxqB7jzqUi9O'),
(21, 'paypal_email', 'your@paypal.com'),
(22, 'admin_email', 'real.it.expert@gmail.com'),
(29, 'withdraw_min', '20'),
(30, 'minMembershipFee', '2.99'),
(31, 'maxMembershipFee', '1000'),
(32, 'commentsPerPost', '5'),
(33, 'homepage_creators_count', '6'),
(34, 'browse_creators_per_page', '15'),
(35, 'feedPerPage', '10'),
(36, 'followListPerPage', '10'),
(37, 'seo_title', 'MyFans - Paid Content Creators Platform'),
(38, 'seo_desc', 'REWARD YOUR FAVOURITE CREATORS HARD WORK WITH PHP PATRON CLONE SCRIPT'),
(39, 'seo_keys', 'myfans, onlyfans clone script, php myfans, php onlyfans, onlyfans clone'),
(40, 'site_title', 'MyFans'),
(46, 'homepage_headline', 'Reward your favourite creators hard work'),
(47, 'homepage_intro', 'The best platform where content creators meet their audience. Supporters can subscribe and support to their favourite creators and everyone\'s on win-win.'),
(51, 'home_callout', 'Are you a ##CONTENT CREATOR$$ looking for a way to let your fans support your hard work?\r\nWe will take care of the rest. An entire platform at your fingertips hasslefree.'),
(54, 'homepage_left_title', 'How it works for Creators'),
(55, 'home_left_content', 'Your supporters decide to reward you for your hard work by paying a monthly subscription. In exchange, you keep doing what you love & also offer them some perks. \r\n\r\nAlso, you can get a ton of tips from your most advocate fans.'),
(56, 'homepage_right_title', 'How it works for Supporters'),
(57, 'home_right_content', 'You love what someone does and it is useful to you. You would like to reward them by offering your well appreciated support! Now you have the means to do so by using our platform. \r\n\r\nFind their profile by their name or follow a link provided by the creator and join in.'),
(81, 'minTipAmount', '1.99'),
(82, 'maxTipAmount', '500'),
(83, 'admin_extra_CSS', NULL),
(84, 'admin_extra_JS', NULL),
(85, 'default_storage', 'public'),
(95, 'hgr_left', '#C04848'),
(96, 'hgr_right', '#480048'),
(97, 'header_fcolor', '#FFFFFF'),
(98, 'red_btn_bg', '#DC3545'),
(99, 'red_btn_font', '#FFFFFF'),
(101, 'site_entry_popup', 'No'),
(102, 'entry_popup_title', 'Entry popup title'),
(103, 'entry_popup_message', 'Entry popup message'),
(104, 'entry_popup_confirm_text', 'Continue'),
(105, 'entry_popup_cancel_text', 'Cancel'),
(106, 'entry_popup_awayurl', 'https://google.com'),
(108, 'hide_admin_creators', 'No'),
(109, 'card_gateway', 'Stripe'),
(110, 'ccbill_clientAccnum', NULL),
(111, 'ccbill_Subacc', NULL),
(112, 'ccbill_flexid', NULL),
(113, 'ccbill_salt', NULL),
(118, 'enableMediaDownload', 'No'),
(130, 'laravel_short_pwa', 'FansApp'),
(131, 'PAYSTACK_PUBLIC_KEY', NULL),
(132, 'PAYSTACK_SECRET_KEY', NULL),
(134, 'allow_guest_profile_view', 'Yes'),
(135, 'allow_guest_creators_view', 'Yes'),
(136, 'lock_homepage', 'No'),
(138, 'hideEarningsSimulator', 'Show'),
(139, 'WAS_ACCESS_KEY_ID', NULL),
(140, 'WAS_SECRET_ACCESS_KEY', NULL),
(141, 'WAS_DEFAULT_REGION', NULL),
(142, 'WAS_BUCKET', NULL),
(143, 'DOS_ACCESS_KEY_ID', NULL),
(144, 'DOS_SECRET_ACCESS_KEY', NULL),
(145, 'DOS_DEFAULT_REGION', NULL),
(146, 'DOS_BUCKET', NULL),
(147, 'BACKBLAZE_ACCOUNT_ID', NULL),
(148, 'BACKBLAZE_APP_KEY', NULL),
(149, 'BACKBLAZE_BUCKET', NULL),
(150, 'BACKBLAZE_REGION', NULL),
(151, 'VULTR_ACCESS_KEY_ID', NULL),
(152, 'VULTR_SECRET_ACCESS_KEY', NULL),
(153, 'VULTR_DEFAULT_REGION', NULL),
(154, 'VULTR_BUCKET', NULL),
(155, 'AWS_ACCESS_KEY_ID', NULL),
(156, 'AWS_SECRET_ACCESS_KEY', NULL),
(157, 'AWS_DEFAULT_REGION', NULL),
(158, 'AWS_BUCKET', NULL),
(160, 'TransBank_ENV', 'Testing'),
(161, 'TransBank_CC', NULL),
(162, 'TransBank_Key', NULL),
(163, 'MERCADOPAGO_PUBLIC_KEY', NULL),
(164, 'MERCADOPAGO_SECRET_KEY', NULL),
(168, 'paystack-mode', 'linked'),
(169, 'lk', '8265dc1f-474c-4be1-bf8e-7cc11364e56e'),
(170, 'site_logo', '/images/8522123436130007c90387.svg');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `page_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_content` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `page_title`, `page_slug`, `page_content`, `created_at`, `updated_at`) VALUES
(1, 'Terms of Service', 'tos', '<p>Phasellus blandit leo ut odio. Suspendisse nisl elit, rhoncus eget, elementum ac, condimentum eget, diam. Fusce a quam. Donec posuere vulputate arcu. Nullam tincidunt adipiscing enim.<br><br>Sed augue ipsum, egestas nec, vestibulum et, malesuada adipiscing, dui. Fusce risus nisl, viverra et, tempor et, pretium in, sapien. Maecenas vestibulum mollis diam. Maecenas ullamcorper, dui et placerat feugiat, eros pede varius nisi, condimentum viverra felis nunc et lorem. Quisque malesuada placerat nisl.<br></p>', '2016-08-21 23:03:03', '2019-06-28 21:33:27'),
(3, 'Privacy Policy', 'privacy-policy', '<p>Aliquam eu nunc. Nullam vel sem. Curabitur at lacus ac velit ornare lobortis. Phasellus volutpat, metus eget egestas mollis, lacus lacus blandit dui, id egestas quam mauris ut lacus.<br><br>Sed hendrerit. Proin faucibus arcu quis ante. Cras id dui. Sed fringilla mauris sit amet nibh.<br></p>', '2016-08-28 12:46:04', '2016-08-28 12:46:04');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `gateway` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `p_meta` text COLLATE utf8_unicode_ci,
  `is_default` enum('No','Yes') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `user_id`, `gateway`, `p_meta`, `is_default`) VALUES
(1, 24, 'abc', 'abc', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `text_content` mediumtext COLLATE utf8mb4_unicode_ci,
  `media_type` enum('None','Image','Video','Audio','ZIP') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'None',
  `media_content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lock_type` enum('Free','Paid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Paid',
  `user_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'public',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `text_content`, `media_type`, `media_content`, `lock_type`, `user_id`, `profile_id`, `disk`, `created_at`, `updated_at`) VALUES
(34, 'Samuel L. Jackson is arguably one of the most quotable Hollywood actors of all time. It’s no surprise that a dummy text generator comprised of his quotes made our list. For those who don’t appreciate the abundance of swear words, there is also a lite version with no profanity.', 'None', NULL, 'Free', 24, 12, 'public', '2021-08-25 12:36:09', '2021-08-25 12:36:09'),
(35, 'Lorizzle is the most gangsta Lorem Ipsum there is. If you didn’t know any better, you’d think that Snoop Dogg actually created the dummy text for this site. While the site is extremely simple and offers limited functionality, the results are hilarious.', 'None', NULL, 'Paid', 24, 12, 'public', '2021-08-25 16:31:57', '2021-08-25 17:21:53'),
(36, 'If you’re a movie buff, this dummy text generator is right up your alley. Picksum Ipsum will generate some of the best lines from legendary Hollywood actors. The current lineup consists of Michael Caine, Clint Eastwood, Jim Carrey and Morgan Freeman. Simply pick your favorite actor, the number of paragraphs and away you go.', 'None', NULL, 'Paid', 24, 12, 'public', '2021-08-25 16:35:02', '2021-08-25 17:21:37'),
(37, 'Corporate ipsum is chalk full of over-used cliche business terms. For all the web developers and designers building business and corporate themes, this one is definitely for you. While it does produce some great corporate word content, we would like to see some variety in paragraph length or the ability to select a word count.', 'None', NULL, 'Paid', 24, 12, 'public', '2021-08-25 16:35:54', '2021-08-25 17:20:55'),
(38, 'We’re huge fans of Breaking Bad. Naturally, we were pretty stoked when we found out there was a Breaking Bad themed text generator. With Heisnberg Ipsum, you can choose between 11 characters from the show and random lines from the show will be generated.', 'None', NULL, 'Free', 25, 13, 'public', '2021-08-25 16:36:31', '2021-08-25 16:36:31'),
(39, 'So far we’ve covered text generators based on movies and authors. Fillerama is the last piece of the entertainment puzzle and offers text from popular television shows like the Simpsons, Dexter and Arrested Development, among others.', 'None', NULL, 'Free', 25, 13, 'public', '2021-08-25 16:36:41', '2021-08-25 16:36:41'),
(40, 'Tired of being mainstream and taking our advice? Lucky for you, Hipster Ipsum was developed as an ‘artisan’ filler text for your projects. Produce dummy text with all your favorite hipster lingo.', 'None', NULL, 'Free', 25, 13, 'public', '2021-08-25 16:36:54', '2021-08-25 16:36:54'),
(41, 'That concludes our list of top 10 Lorem Ipsum alternatives. We hope this list will enable you to spice up some of the dummy text on your themes and websites. If we forgot any great alternatives, please leave us a comment below.', 'None', NULL, 'Free', 25, 13, 'public', '2021-08-25 16:37:12', '2021-08-25 16:37:12'),
(42, 'Blind text generator is one of the most practical and useful dummy text alternatives for web developers and designers.  There are currently 10 different language options (as well as Lorem Ipsum) and a variety of formatting options to choose from. In addition to the standard options that most text generators provide, you even have the option to format the text and it will spit out the CSS code.', 'None', NULL, 'Free', 27, 15, 'public', '2021-08-25 16:50:04', '2021-08-25 16:50:04'),
(43, 'Not Lorem Ipsum is a collection of web copy for over 40 different industries to suit your needs. This allows you to bring a little life and realism to your designs.', 'None', NULL, 'Free', 27, 15, 'public', '2021-08-25 16:50:11', '2021-08-25 16:50:11'),
(44, 'Samuel L. Jackson is arguably one of the most quotable Hollywood actors of all time. It’s no surprise that a dummy text generator comprised of his quotes made our list. For those who don’t appreciate the abundance of swear words, there is also a lite version with no profanity.', 'None', NULL, 'Free', 27, 15, 'public', '2021-08-25 16:50:20', '2021-08-25 16:50:20'),
(45, 'Lorizzle is the most gangsta Lorem Ipsum there is. If you didn’t know any better, you’d think that Snoop Dogg actually created the dummy text for this site. While the site is extremely simple and offers limited functionality, the results are hilarious.', 'Image', NULL, 'Free', 27, 15, 'public', '2021-08-25 16:50:28', '2021-08-26 15:26:56'),
(46, 'If you’re a movie buff, this dummy text generator is right up your alley. Picksum Ipsum will generate some of the best lines from legendary Hollywood actors. The current lineup consists of Michael Caine, Clint Eastwood, Jim Carrey and Morgan Freeman. Simply pick your favorite actor, the number of paragraphs and away you go.', 'None', NULL, 'Free', 28, 16, 'public', '2021-08-25 16:52:23', '2021-08-25 16:52:23'),
(47, 'Corporate ipsum is chalk full of over-used cliche business terms. For all the web developers and designers building business and corporate themes, this one is definitely for you. While it does produce some great corporate word content, we would like to see some variety in paragraph length or the ability to select a word count.', 'None', NULL, 'Free', 28, 16, 'public', '2021-08-25 16:52:25', '2021-08-25 16:52:25'),
(48, 'We’re huge fans of Breaking Bad. Naturally, we were pretty stoked when we found out there was a Breaking Bad themed text generator. With Heisnberg Ipsum, you can choose between 11 characters from the show and random lines from the show will be generated.', 'None', NULL, 'Free', 28, 16, 'public', '2021-08-25 16:52:35', '2021-08-25 16:52:35'),
(49, 'So far we’ve covered text generators based on movies and authors. Fillerama is the last piece of the entertainment puzzle and offers text from popular television shows like the Simpsons, Dexter and Arrested Development, among others.', 'None', NULL, 'Free', 28, 16, 'public', '2021-08-25 16:52:42', '2021-08-25 16:52:42'),
(50, 'Tired of being mainstream and taking our advice? Lucky for you, Hipster Ipsum was developed as an ‘artisan’ filler text for your projects. Produce dummy text with all your favorite hipster lingo.', 'None', NULL, 'Free', 29, 17, 'public', '2021-08-25 16:53:20', '2021-08-25 16:53:20'),
(51, 'That concludes our list of top 10 Lorem Ipsum alternatives. We hope this list will enable you to spice up some of the dummy text on your themes and websites. If we forgot any great alternatives, please leave us a comment below.', 'None', NULL, 'Free', 29, 17, 'public', '2021-08-25 16:53:28', '2021-08-25 16:53:28'),
(52, 'Blind text generator is one of the most practical and useful dummy text alternatives for web developers and designers.  There are currently 10 different language options (as well as Lorem Ipsum) and a variety of formatting options to choose from. In addition to the standard options that most text generators provide, you even have the option to format the text and it will spit out the CSS code.', 'None', NULL, 'Free', 29, 17, 'public', '2021-08-25 16:53:40', '2021-08-25 16:53:40'),
(53, 'Not Lorem Ipsum is a collection of web copy for over 40 different industries to suit your needs. This allows you to bring a little life and realism to your designs.', 'None', NULL, 'Free', 29, 17, 'public', '2021-08-25 16:53:59', '2021-08-25 16:53:59'),
(54, 'Samuel L. Jackson is arguably one of the most quotable Hollywood actors of all time. It’s no surprise that a dummy text generator comprised of his quotes made our list. For those who don’t appreciate the abundance of swear words, there is also a lite version with no profanity.', 'None', NULL, 'Free', 30, 18, 'public', '2021-08-25 16:55:17', '2021-08-25 16:55:17'),
(55, 'Lorizzle is the most gangsta Lorem Ipsum there is. If you didn’t know any better, you’d think that Snoop Dogg actually created the dummy text for this site. While the site is extremely simple and offers limited functionality, the results are hilarious.', 'None', NULL, 'Free', 30, 18, 'public', '2021-08-25 16:55:25', '2021-08-25 16:55:25'),
(56, 'If you’re a movie buff, this dummy text generator is right up your alley. Picksum Ipsum will generate some of the best lines from legendary Hollywood actors. The current lineup consists of Michael Caine, Clint Eastwood, Jim Carrey and Morgan Freeman. Simply pick your favorite actor, the number of paragraphs and away you go.', 'None', NULL, 'Free', 30, 18, 'public', '2021-08-25 16:55:34', '2021-08-25 16:55:34'),
(57, 'Corporate ipsum is chalk full of over-used cliche business terms. For all the web developers and designers building business and corporate themes, this one is definitely for you. While it does produce some great corporate word content, we would like to see some variety in paragraph length or the ability to select a word count.', 'None', NULL, 'Free', 30, 18, 'public', '2021-08-25 16:55:42', '2021-08-25 16:55:42'),
(58, 'We’re huge fans of Breaking Bad. Naturally, we were pretty stoked when we found out there was a Breaking Bad themed text generator. With Heisnberg Ipsum, you can choose between 11 characters from the show and random lines from the show will be generated.', 'None', NULL, 'Free', 31, 19, 'public', '2021-08-25 16:57:43', '2021-08-25 16:57:43'),
(59, 'So far we’ve covered text generators based on movies and authors. Fillerama is the last piece of the entertainment puzzle and offers text from popular television shows like the Simpsons, Dexter and Arrested Development, among others.', 'None', NULL, 'Free', 31, 19, 'public', '2021-08-25 16:57:53', '2021-08-25 16:57:53'),
(60, 'Tired of being mainstream and taking our advice? Lucky for you, Hipster Ipsum was developed as an ‘artisan’ filler text for your projects. Produce dummy text with all your favorite hipster lingo.', 'None', NULL, 'Free', 31, 19, 'public', '2021-08-25 16:58:03', '2021-08-25 16:58:03'),
(61, 'That concludes our list of top 10 Lorem Ipsum alternatives. We hope this list will enable you to spice up some of the dummy text on your themes and websites. If we forgot any great alternatives, please leave us a comment below.', 'None', NULL, 'Free', 31, 19, 'public', '2021-08-25 16:58:10', '2021-08-25 16:58:10'),
(63, 'Blind text generator is one of the most practical and useful dummy text alternatives for web developers and designers.  There are currently 10 different language options (as well as Lorem Ipsum) and a variety of formatting options to choose from. In addition to the standard options that most text generators provide, you even have the option to format the text and it will spit out the CSS code.', 'None', NULL, 'Free', 32, 20, 'public', '2021-08-25 17:47:00', '2021-08-25 17:47:00'),
(66, 'test post from Zurich....', 'Video', 'userVids/YhJYUJVR3u8SBPJensH61H4u6fjKV9V2m7EtuG3D.mp4', 'Free', 33, 21, 'public', '2021-08-25 22:14:33', '2021-08-25 22:14:33'),
(67, 'Test Creator from Zurich....', 'Video', 'userVids/e54AVmvVNxhBBju4ZhiItZR8IN5HCDqYxn03QbDY.mp4', 'Paid', 22, 10, 'public', '2021-08-25 22:17:42', '2021-08-25 22:17:42'),
(71, 'Blind text generator is one of the most practical and useful dummy text alternatives for web developers and designers.  There are currently 10 different language options (as well as Lorem Ipsum) and a variety of formatting options to choose from. In addition to the standard options that most text generators provide, you even have the option to format the text and it will spit out the CSS code.', 'None', NULL, 'Paid', 26, 14, 'public', '2021-08-26 08:26:29', '2021-08-26 08:26:29'),
(76, 'vdeio', 'Video', 'userVids/tLHZj3vxQ2PfX6QXiE4raHypQO7cr520MRAONtjT.mp4', 'Paid', 24, 12, 'public', '2021-08-26 11:41:37', '2021-08-26 11:41:37'),
(85, 'hello', 'None', NULL, 'Paid', 24, 12, 'public', '2021-08-26 16:28:16', '2021-08-26 16:28:16'),
(86, 'So far we’ve covered text generators based on movies and authors. Fillerama is the last piece of the entertainment puzzle and offers text from popular television shows like the Simpsons, Dexter and Arrested Development, among others.', 'Image', 'userPics/612795be2eec7.jpg', 'Paid', 24, 12, 'public', '2021-08-26 17:23:10', '2021-08-26 17:23:33'),
(87, 'Hello world....', 'None', NULL, 'Paid', 24, 12, 'public', '2021-08-26 21:55:02', '2021-08-26 21:55:02'),
(89, 'helllo', 'None', NULL, 'Paid', 22, 10, 'public', '2021-09-02 02:41:10', '2021-09-02 02:41:10'),
(90, 'helllo', 'None', NULL, 'Paid', 22, 10, 'public', '2021-09-02 02:41:48', '2021-09-02 02:41:48'),
(91, 'helllo', 'None', NULL, 'Paid', 22, 10, 'public', '2021-09-02 02:42:05', '2021-09-02 02:42:05'),
(92, 'picture at beach', 'None', NULL, 'Free', 24, 12, 'public', '2021-09-07 05:57:03', '2021-09-07 06:19:09'),
(93, 'Beach pic', 'None', NULL, 'Free', 24, 12, 'public', '2021-09-07 05:59:20', '2021-09-07 05:59:20');

-- --------------------------------------------------------

--
-- Table structure for table `post_media`
--

CREATE TABLE `post_media` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `media_content` varchar(255) DEFAULT 'NULL',
  `disk` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post_media`
--

INSERT INTO `post_media` (`id`, `post_id`, `media_content`, `disk`, `created_at`, `updated_at`) VALUES
(6, 70, 'userPics/612724e48844c.png', 'public', '2021-08-26 05:21:40', '2021-08-26 05:21:40'),
(7, 70, 'userPics/61273961d89dc.jpg', 'public', '2021-08-26 06:49:05', '2021-08-26 06:49:05'),
(8, 70, 'userPics/61273a80f326c.jpg', 'public', '2021-08-26 06:53:53', '2021-08-26 06:53:53'),
(9, 61, 'userPics/6127564f177a4.jpg', 'public', '2021-08-26 08:52:31', '2021-08-26 08:52:31'),
(10, 61, 'userPics/612756701ffd2.jpg', 'public', '2021-08-26 08:53:04', '2021-08-26 08:53:04'),
(12, 78, 'userPics/612757743580f.jpg', 'public', '2021-08-26 08:57:24', '2021-08-26 08:57:24'),
(13, 78, 'userPics/6127579084951.jpg', 'public', '2021-08-26 08:57:52', '2021-08-26 08:57:52'),
(17, 34, 'userPics/61275b0d9eb1e.png', 'public', '2021-08-26 09:12:45', '2021-08-26 09:12:45'),
(26, 45, 'userPics/61277a808bcf3.jpg', 'public', '2021-08-26 11:26:56', '2021-08-26 11:26:56');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `reporter_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reporter_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reported_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `report_message` text COLLATE utf8_unicode_ci,
  `reporter_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8_unicode_ci,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('Wp8t8QOroW12jsxPSd1doavclPi7ACzHRdYDXWfc', 24, '172.70.82.70', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiNlRaV3A3cHNSa0h1bzhqUmk5MnB4NDNiSEZ5ZGlYdmd3MEs5TXhTeSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9vbmx5ZmFucy5iZXN0d2ViZGV2cy5jb20vZmVlZCI7fXM6MzoidXJsIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyNDtzOjExOiJzd2VldF9hbGVydCI7YTowOnt9fQ==', 1630985395),
('ysL4czUQkKY663Ew3NXBeIB9fwWEqS5rydisn1DF', NULL, '172.70.142.172', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibkRzcnVabUxnN2lyc0wzRlZXeDl3RDRtYndWV0NWSE42QW13V2c2MSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHA6Ly9vbmx5ZmFucy5iZXN0d2ViZGV2cy5jb20vZmF2aWNvbi5pY28iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1630986682);

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(10) UNSIGNED NOT NULL,
  `creator_id` int(11) NOT NULL,
  `subscriber_id` int(10) UNSIGNED NOT NULL,
  `subscription_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gateway` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subscription_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `subscription_expires` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` enum('Active','Canceled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Active',
  `subscription_price` double(10,2) NOT NULL,
  `creator_amount` double(10,2) NOT NULL,
  `admin_amount` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `creator_id`, `subscriber_id`, `subscription_id`, `gateway`, `subscription_date`, `subscription_expires`, `status`, `subscription_price`, `creator_amount`, `admin_amount`) VALUES
(1, 22, 24, '6126358f2e5b7', 'Admin', '2021-08-25 16:20:31', '2021-08-31 04:00:00', 'Active', 0.00, 0.00, 0.00),
(2, 22, 22, '61265e91b3d9c', 'Admin', '2021-08-25 19:15:29', '2021-01-01 05:00:00', 'Active', 0.00, 0.00, 0.00),
(3, 22, 33, '612689095a286', 'Admin', '2021-08-25 22:16:41', '2021-12-01 05:00:00', 'Active', 0.00, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `tips`
--

CREATE TABLE `tips` (
  `id` int(11) NOT NULL,
  `tipper_id` int(11) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `amount` double(10,2) NOT NULL,
  `creator_amount` double(10,2) DEFAULT NULL,
  `admin_amount` double(10,2) DEFAULT NULL,
  `gateway` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_status` enum('Paid','Pending') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Paid',
  `intent` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unlocks`
--

CREATE TABLE `unlocks` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipper_id` int(11) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `amount` double(10,2) NOT NULL,
  `creator_amount` double(10,2) DEFAULT NULL,
  `admin_amount` double(10,2) DEFAULT NULL,
  `gateway` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_status` enum('Paid','Pending') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Paid',
  `intent` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `balance` double(10,2) NOT NULL DEFAULT '0.00',
  `isAdmin` enum('Yes','No') COLLATE utf8_unicode_ci DEFAULT 'No',
  `ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isBanned` enum('No','Yes') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `balance`, `isAdmin`, `ip`, `isBanned`, `created_at`, `updated_at`) VALUES
(22, 'Site Admin', 'admin@myfans.com', 'users/default.png', NULL, '$2y$10$gcyUavRUZoGNEFO6OL9WZe8rXc1qJCO/lccniw461MVEUFfKQTULy', NULL, NULL, 162.46, 'Yes', '127.0.0.1', 'No', '2020-12-04 18:49:47', '2021-09-07 02:39:59'),
(24, 'Test User', 'testuser@myfans.com', 'users/default.png', '2021-08-25 22:43:12', '$2y$10$xpTppQlP5SRljhQWKDmII.pd1PyNXfz.5pFn8Q/hQdw00ugRV6vyO', NULL, NULL, 162.46, 'No', '172.70.142.254', 'No', '2021-08-25 11:05:42', '2021-09-07 07:13:55'),
(25, 'testuser1', 'testuser1@myfans.com', 'users/default.png', NULL, '$2y$10$xpTppQlP5SRljhQWKDmII.pd1PyNXfz.5pFn8Q/hQdw00ugRV6vyO', NULL, NULL, 0.00, 'No', '162.158.165.150', 'No', '2021-08-25 15:05:15', '2021-08-26 14:56:12'),
(26, 'testuser2', 'testuser2@myfans.com', 'users/default.png', NULL, '$2y$10$ffpiFnzB7BoBSSYthAH3v.0fVjU23R6dPKmiUFCzqmegMV7Vnycum', NULL, NULL, 0.00, 'No', '172.70.147.158', 'No', '2021-08-25 15:54:17', '2021-08-26 16:56:56'),
(27, 'testuser3', 'testuser3@myfans.com', 'users/default.png', NULL, '$2y$10$ffpiFnzB7BoBSSYthAH3v.0fVjU23R6dPKmiUFCzqmegMV7Vnycum', NULL, NULL, 0.00, 'No', '172.70.147.124', 'No', '2021-08-25 15:55:30', '2021-08-26 15:27:15'),
(28, 'testuser4', 'testuser4@myfans.com', 'users/default.png', NULL, '$2y$10$JaAwYVpg5dShL7MtsPNT3ubWIsqVUKxPhn/1EwlXFVifLoC.0AW9W', NULL, NULL, 0.00, 'No', '172.70.147.124', 'No', '2021-08-25 15:57:51', '2021-08-26 15:02:51'),
(29, 'testuser5', 'testuser5@myfans.com', 'users/default.png', NULL, '$2y$10$EI6Ak3nZQBropTZrMPoKWOxpEzp5LR0JyneL7VUwTa8VjCognBoxe', NULL, NULL, 0.00, 'No', '172.70.147.158', 'No', '2021-08-25 15:58:16', '2021-08-26 15:03:54'),
(30, 'testuser6', 'testuser6@myfans.com', 'users/default.png', NULL, '$2y$10$ykRHAJUIdqGu/RhRirfyu.B0YGCnYPsBRMuV/6Zkn8Ey3BiPvW6le', NULL, NULL, 0.00, 'No', '172.70.147.158', 'No', '2021-08-25 15:58:49', '2021-08-26 15:05:10'),
(31, 'testuser7', 'testuser7@myfans.com', 'users/default.png', NULL, '$2y$10$OnxepV0fBk/EB9SKFC32y.9xbjEP2fI0bYU6nW1tC1XYjmHDE90gS', NULL, NULL, 0.00, 'No', '172.70.142.56', 'No', '2021-08-25 15:59:29', '2021-08-27 22:18:34'),
(32, 'testuser8', 'testuser8@myfans.com', 'users/default.png', NULL, '$2y$10$WHxS3hCeea4WGj66iFgtHuLOM.CxzTi9Hv3swDOoFMQI3.cnC8Kfm', NULL, NULL, 0.00, 'No', '172.70.142.56', 'No', '2021-08-25 17:45:54', '2021-08-26 08:20:13'),
(33, 'eze', 'cube06@icloud.com', 'users/default.png', NULL, '$2y$10$sn4BJ/lCBZ5.zvWmsmKrsOg2JePsafNRmdfp35N5Kiw8Hr5Vdn5Le', NULL, NULL, 0.00, 'No', '162.158.129.76', 'No', '2021-08-25 21:38:08', '2021-08-25 22:15:23'),
(34, 'Okay', 'cube06@yahoo.com', 'users/default.png', NULL, '$2y$10$pwNmgCkSZKkgLvvmh0BZruD0cC3T8kh9LA/j0vxGzhI2ZE/ONCy2W', NULL, NULL, 0.00, 'No', '162.158.129.18', 'No', '2021-08-25 22:23:55', '2021-09-02 02:39:03');

-- --------------------------------------------------------

--
-- Table structure for table `user_follower`
--

CREATE TABLE `user_follower` (
  `id` int(10) UNSIGNED NOT NULL,
  `following_id` bigint(20) UNSIGNED NOT NULL,
  `follower_id` bigint(20) UNSIGNED NOT NULL,
  `accepted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_follower`
--

INSERT INTO `user_follower` (`id`, `following_id`, `follower_id`, `accepted_at`, `created_at`, `updated_at`) VALUES
(3, 24, 33, '2021-08-25 21:38:23', '2021-08-25 21:38:23', '2021-08-25 21:38:23'),
(4, 22, 33, '2021-08-25 21:38:50', '2021-08-25 21:38:50', '2021-08-25 21:38:50'),
(5, 24, 34, '2021-08-25 22:24:42', '2021-08-25 22:24:42', '2021-08-25 22:24:42'),
(6, 22, 24, '2021-08-26 16:29:04', '2021-08-26 16:29:04', '2021-08-26 16:29:04'),
(8, 24, 22, '2021-08-27 14:32:26', '2021-08-27 14:32:26', '2021-08-27 14:32:26'),
(10, 25, 24, '2021-09-07 02:42:18', '2021-09-07 02:42:18', '2021-09-07 02:42:18');

-- --------------------------------------------------------

--
-- Table structure for table `withdraws`
--

CREATE TABLE `withdraws` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double(10,2) NOT NULL,
  `status` enum('Pending','Paid','Canceled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `withdraws`
--

INSERT INTO `withdraws` (`id`, `user_id`, `amount`, `status`, `created_at`) VALUES
(1, 22, 162.46, 'Pending', '2021-08-27 15:18:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_commentable_type_commentable_id_index` (`commentable_type`,`commentable_id`);

--
-- Indexes for table `creator_profiles`
--
ALTER TABLE `creator_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `creator_profiles_user_id_foreign` (`user_id`),
  ADD KEY `creator_profiles_username_index` (`username`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `likes_likeable_type_likeable_id_index` (`likeable_type`,`likeable_id`),
  ADD KEY `likes_user_id_index` (`user_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message_media`
--
ALTER TABLE `message_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `options_table`
--
ALTER TABLE `options_table`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `options_table_option_name_unique` (`option_name`),
  ADD KEY `options_table_option_name_index` (`option_name`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_media`
--
ALTER TABLE `post_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tips`
--
ALTER TABLE `tips`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unlocks`
--
ALTER TABLE `unlocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_follower`
--
ALTER TABLE `user_follower`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_follower_following_id_index` (`following_id`),
  ADD KEY `user_follower_follower_id_index` (`follower_id`),
  ADD KEY `user_follower_accepted_at_index` (`accepted_at`);

--
-- Indexes for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `creator_profiles`
--
ALTER TABLE `creator_profiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `message_media`
--
ALTER TABLE `message_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `options_table`
--
ALTER TABLE `options_table`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `post_media`
--
ALTER TABLE `post_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tips`
--
ALTER TABLE `tips`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `unlocks`
--
ALTER TABLE `unlocks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `user_follower`
--
ALTER TABLE `user_follower`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `withdraws`
--
ALTER TABLE `withdraws`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
