-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2025 at 12:02 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tax_bridge`
--

-- --------------------------------------------------------

--
-- Table structure for table `business_configurations`
--

CREATE TABLE `business_configurations` (
  `bus_config_id` bigint(20) UNSIGNED NOT NULL,
  `bus_name` varchar(255) NOT NULL,
  `bus_ntn_cnic` varchar(255) NOT NULL,
  `bus_address` text NOT NULL,
  `bus_province` varchar(255) NOT NULL,
  `bus_logo` varchar(255) NOT NULL,
  `bus_account_number` varchar(255) NOT NULL,
  `bus_reg_num` varchar(255) NOT NULL,
  `bus_contact_num` varchar(20) NOT NULL,
  `bus_contact_person` varchar(255) NOT NULL,
  `bus_IBAN` varchar(255) NOT NULL,
  `bus_swift_code` varchar(255) DEFAULT NULL,
  `bus_acc_branch_name` varchar(255) NOT NULL,
  `bus_acc_branch_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_configurations`
--

INSERT INTO `business_configurations` (`bus_config_id`, `bus_name`, `bus_ntn_cnic`, `bus_address`, `bus_province`, `bus_logo`, `bus_account_number`, `bus_reg_num`, `bus_contact_num`, `bus_contact_person`, `bus_IBAN`, `bus_swift_code`, `bus_acc_branch_name`, `bus_acc_branch_code`, `created_at`, `updated_at`) VALUES
(1, 'Secureisms Ltd', '12345-6789012-3', '123 Business Avenue, Lahore, Pakistan', 'Islamabad', '1751891434.png', '9876543210123456', 'REG-789456', '03001234567', 'John Doe', 'PK36SCBL0000001123456702', 'SCBLPKKTYIT', 'Lahore Main Branch', '1234', '2025-07-04 12:02:41', '2025-07-07 07:30:34');

-- --------------------------------------------------------

--
-- Table structure for table `buyers`
--

CREATE TABLE `buyers` (
  `byr_id` bigint(20) UNSIGNED NOT NULL,
  `byr_name` varchar(255) NOT NULL,
  `byr_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `byr_ntn_cnic` varchar(255) NOT NULL,
  `byr_address` text NOT NULL,
  `byr_province` varchar(255) NOT NULL,
  `byr_logo` varchar(255) NOT NULL,
  `byr_account_number` varchar(255) NOT NULL,
  `byr_reg_num` varchar(255) NOT NULL,
  `byr_contact_num` varchar(20) NOT NULL,
  `byr_contact_person` varchar(255) NOT NULL,
  `byr_IBAN` varchar(255) NOT NULL,
  `byr_swift_code` varchar(255) DEFAULT NULL,
  `byr_acc_branch_name` varchar(255) NOT NULL,
  `byr_acc_branch_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `buyers`
--

INSERT INTO `buyers` (`byr_id`, `byr_name`, `byr_type`, `byr_ntn_cnic`, `byr_address`, `byr_province`, `byr_logo`, `byr_account_number`, `byr_reg_num`, `byr_contact_num`, `byr_contact_person`, `byr_IBAN`, `byr_swift_code`, `byr_acc_branch_name`, `byr_acc_branch_code`, `created_at`, `updated_at`) VALUES
(1, 'ABC Traders', 0, '12345-1234567-1', '123 Market Street, City', 'Isb', '1751891096.png', '12345678901234', 'REG-987654', '03001234567', 'John Doe', 'PK12ABCD00000012345678', 'ABCDPKKA', 'Main Branch', '0012', '2025-07-04 12:15:53', '2025-07-07 07:24:56'),
(2, 'SkyPass', 1, '478458-6', 'Address ,Address ,Address ,Address ,Address  Islamabad', 'Rawalpindi', '1751891068.png', '11224587-dfasfdsad', '65f5sd4af-d', '0300-5325487', 'Waheed Ahmed', 'PAK87458as', 'fdsaf874-h', 'ABL', '1178', '2025-07-07 01:12:30', '2025-07-07 07:24:28'),
(3, 'Test', 1, '3740525394438 1', '195 Lambton Quay\r\nPrivate Bag 18 901\r\nWellington 6160, New Zealand', 'TEST', '1751890822.png', '4545454551', 'REG-9876544554', '03115276352', '03115276352', '5454+5', '5465', 'Allied JFKJ', '1178', '2025-07-07 07:20:22', '2025-07-07 07:20:22'),
(4, 'Hammad Buyer', 1, '3740525394438 1', '195 Lambton Quay\r\nPrivate Bag 18 901\r\nWellington 6160, New Zealand', 'TEST', '1751947229.jpg', '11224587-Hm', 'REG-8521', '03115276352', 'TEST BUYER', '987456321', '2541', 'Askari Bank', '728', '2025-07-07 23:00:29', '2025-07-07 23:00:29'),
(5, 'Test', 0, '12345-1234567-1', '195 Lambton Quay\r\nPrivate Bag 18 901\r\nWellington 6160, New Zealand', 'TEST', '1751947301.jpg', '12345678901234', '567412589638888', '03115276352', 'TAZ', '45646565', NULL, 'Allied', NULL, '2025-07-07 23:01:41', '2025-07-08 02:08:52'),
(6, 'Farhan', 0, '37405253944382', 'TEST', 'TST', '1751947545.jpg', '12345678541234', 'REG-1111', '03319748582', 'TEST', '54545241', '987654', 'Alflah Bank', '96321', '2025-07-07 23:05:45', '2025-07-07 23:05:45'),
(7, 'Shawaiz', 0, '3740525394438', '195 Lambton Quay\r\nPrivate Bag 18 901\r\nWellington 6160, New Zealand', 'TST', '1751947644.jpg', '4545454551', 'REG-96521', '03115276352', 'Zahid', '54654156', '32556', 'Islamic', '96521', '2025-07-07 23:07:24', '2025-07-07 23:07:24'),
(8, 'XYZ Traders', 1, '56546', '195 Lambton Quay\r\nPrivate Bag 18 901\r\nWellington 6160, New Zealand', 'jj', '1751947746.png', '11224587-65465', '567446455', '03115276352', 'Waheed', '145456', '6565', 'Faisal', '321', '2025-07-07 23:09:06', '2025-07-07 23:09:06'),
(9, 'BUYER 12', 0, '12345-1234567-1', '195 Lambton Quay\r\nPrivate Bag 18 901\r\nWellington 6160, New Zealand', 'TST', '1751947841.jpg', '11224587-AC', '65545454', '03115276352', 'Junaid', '454564', NULL, 'JS Bank', '9651', '2025-07-07 23:10:41', '2025-07-08 02:46:57');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_type` varchar(50) NOT NULL,
  `invoice_date` date NOT NULL,
  `scenario_id` varchar(50) DEFAULT NULL,
  `invoice_ref_no` varchar(100) DEFAULT NULL,
  `seller_id` bigint(20) UNSIGNED NOT NULL,
  `buyer_id` bigint(20) UNSIGNED NOT NULL,
  `fbr_invoice_number` varchar(255) DEFAULT NULL,
  `is_posted_to_fbr` tinyint(4) NOT NULL DEFAULT 0,
  `response_status` varchar(50) DEFAULT NULL,
  `response_message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_details`
--

CREATE TABLE `invoice_details` (
  `invoice_detail_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `total_value` decimal(12,2) NOT NULL,
  `value_excl_tax` decimal(12,2) NOT NULL,
  `retail_price` decimal(12,2) NOT NULL DEFAULT 0.00,
  `sales_tax_applicable` decimal(12,2) NOT NULL,
  `sales_tax_withheld` decimal(12,2) NOT NULL DEFAULT 0.00,
  `extra_tax` decimal(12,2) NOT NULL DEFAULT 0.00,
  `further_tax` decimal(12,2) NOT NULL DEFAULT 0.00,
  `fed_payable` decimal(12,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `sale_type` varchar(255) NOT NULL,
  `sro_schedule_no` varchar(50) DEFAULT NULL,
  `sro_item_serial_no` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `item_hs_code` varchar(20) DEFAULT NULL,
  `item_description` varchar(255) NOT NULL,
  `item_price` double NOT NULL,
  `item_tax_rate` varchar(10) NOT NULL,
  `item_uom` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`item_id`, `item_hs_code`, `item_description`, `item_price`, `item_tax_rate`, `item_uom`, `created_at`, `updated_at`) VALUES
(2, NULL, 'The morning air was crisp and sharp as Sean walked down the road.', 2000, '15%', 'KG', '2025-07-07 05:11:12', '2025-07-08 00:36:15'),
(3, '446', 'text description is a verbal representation of something, using written words to convey information about a person, place, thing, or idea. It aims to create a clear and vivid mental image', 2145, '152', '12', '2025-07-07 23:27:29', '2025-07-08 00:32:05'),
(4, '852', 'A short description is a concise summary or overview of something, like a product, concept, or task, providing essential information in a brief and easily understandable manner', 321, '15', '52', '2025-07-08 00:36:55', '2025-07-08 00:36:55'),
(5, '852', 'The best descriptions are simple and to the point. You want to sprinkle your descriptions throughout your writing so that they complement the message you\'re trying to convey, not bury it', 5212, '12', '12', '2025-07-08 00:38:55', '2025-07-08 02:49:38'),
(6, NULL, 'Add more depth to your tasks with a fully customizable item description. The description can be added to any item in your workspace as a widget. It can include formatting, images, and text, just like a mini monday Workdoc.', 123, '10', '12', '2025-07-08 04:36:07', '2025-07-08 04:36:07'),
(7, '852', 'To add an Item Description as a new item view, head over to the Item Views Center. Open up the Updates Section of any item on your board and click the \"+\" in the header. From the list of views, select \"Item description', 7410, '8', '5', '2025-07-08 04:36:35', '2025-07-08 04:36:35'),
(8, '123', 'You can change some of your widgets\' settings by clicking the 3-dot menu at the top right corner. From here, you can delete your widget if necessary. You can also click \"Full Screen\" to work a little more comfortably, as you would with a Workdoc.', 321, '15', '4', '2025-07-08 04:37:08', '2025-07-08 04:37:08'),
(9, '123', 'You can resize your widget by hovering anywhere in it and dragging the corner to where you want it to be. You can also move the widget by hovering over the icon at the top left corner and then just dragging', 410, '12', '12', '2025-07-08 04:54:07', '2025-07-08 04:54:07');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(7, '0001_01_01_000000_create_users_table', 1),
(8, '0001_01_01_000001_create_cache_table', 1),
(9, '0001_01_01_000002_create_jobs_table', 1),
(22, '2025_07_04_120046_create_business_configurations_table', 2),
(24, '2025_07_04_121405_create_buyers_table', 3),
(25, '2025_07_07_045332_create_items_table', 4),
(26, '2025_07_07_050034_create_invoices_table', 5),
(27, '2025_07_07_050036_create_invoice_details_table', 5),
(28, '2025_07_07_110924_add_bus_province_to_business_configurations_table', 6),
(29, '2025_07_07_111052_add_byr_province_to_buyers_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('eQHSckc1s7t0SyGyvAjnYvlxD0fk4EBXAbyaQ7fs', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoicjY2UzhQRTVsUmlXQVFKemZ0cHZoTmR3d0ZjWHhpY0JBUWVGNmhEUyI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvaXRlbXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTozO30=', 1751968858);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Hammad Ali', 'hammad.ali@f3technologies.eu', NULL, '$2y$12$L.S4Y73wLI.F5tF6sbUyf.mkrEGCMbU7oh789Ba2caicyUAlK1ApW', NULL, '2025-07-02 01:29:39', '2025-07-02 01:29:39'),
(3, 'Hammad Naseer', 'hammad.naseer@f3technologies.eu', NULL, '$2y$12$uUtR1dE5s3FQOYUd/2DSmOhnR64Mo/SkDT.PZ.j4CA5H0JTJDpmti', NULL, '2025-07-04 02:20:40', '2025-07-04 02:20:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `business_configurations`
--
ALTER TABLE `business_configurations`
  ADD PRIMARY KEY (`bus_config_id`);

--
-- Indexes for table `buyers`
--
ALTER TABLE `buyers`
  ADD PRIMARY KEY (`byr_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `invoices_seller_id_foreign` (`seller_id`),
  ADD KEY `invoices_buyer_id_foreign` (`buyer_id`);

--
-- Indexes for table `invoice_details`
--
ALTER TABLE `invoice_details`
  ADD PRIMARY KEY (`invoice_detail_id`),
  ADD KEY `invoice_details_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_details_item_id_foreign` (`item_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `business_configurations`
--
ALTER TABLE `business_configurations`
  MODIFY `bus_config_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `buyers`
--
ALTER TABLE `buyers`
  MODIFY `byr_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `invoice_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_details`
--
ALTER TABLE `invoice_details`
  MODIFY `invoice_detail_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `item_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_buyer_id_foreign` FOREIGN KEY (`buyer_id`) REFERENCES `buyers` (`byr_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoices_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `business_configurations` (`bus_config_id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_details`
--
ALTER TABLE `invoice_details`
  ADD CONSTRAINT `invoice_details_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`invoice_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoice_details_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
