-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tax_bridge
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `business_configurations`
--

DROP TABLE IF EXISTS `business_configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_configurations` (
  `bus_config_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bus_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bus_ntn_cnic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bus_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `bus_province` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bus_logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bus_account_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bus_reg_num` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bus_contact_num` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bus_contact_person` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bus_IBAN` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bus_swift_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bus_acc_branch_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bus_acc_branch_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`bus_config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_configurations`
--

LOCK TABLES `business_configurations` WRITE;
/*!40000 ALTER TABLE `business_configurations` DISABLE KEYS */;
INSERT INTO `business_configurations` VALUES (1,'Secureisms Ltd','12345-6789012-3','123 Business Avenue, Lahore, Pakistan','Islamabad','1751869409_secureism.png','9876543210123456','REG-789456','03001234567','John Doe','PK36SCBL0000001123456702','SCBLPKKXXXX','Lahore Main Branch','1234','2025-07-04 12:02:41','2025-07-07 06:16:31');
/*!40000 ALTER TABLE `business_configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buyers`
--

DROP TABLE IF EXISTS `buyers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buyers` (
  `byr_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `byr_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `byr_type` tinyint unsigned NOT NULL DEFAULT '0',
  `byr_ntn_cnic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `byr_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `byr_province` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `byr_logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `byr_account_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `byr_reg_num` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `byr_contact_num` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `byr_contact_person` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `byr_IBAN` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `byr_swift_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `byr_acc_branch_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `byr_acc_branch_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`byr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyers`
--

LOCK TABLES `buyers` WRITE;
/*!40000 ALTER TABLE `buyers` DISABLE KEYS */;
INSERT INTO `buyers` VALUES (1,'ABC Traders',0,'12345-1234567-1','123 Market Street, City','Isb','logo.png','12345678901234','REG-987654','03001234567','John Doe','PK12ABCD00000012345678','ABCDPKKA','Main Branch','0012','2025-07-04 12:15:53','2025-07-07 06:59:43'),(2,'SkyPass',1,'478458-6','Address ,Address ,Address ,Address ,Address  Islamabad','Rawalpindi','1751868785_skypass.png','11224587-dfasfdsad','65f5sd4af-d','0300-5325487','Waheed Ahmed','PAK87458as','fdsaf874-h','ABL','1178','2025-07-07 01:12:30','2025-07-07 06:44:01');
/*!40000 ALTER TABLE `buyers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_details`
--

DROP TABLE IF EXISTS `invoice_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_details` (
  `invoice_detail_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint unsigned NOT NULL,
  `item_id` bigint unsigned DEFAULT NULL,
  `quantity` int NOT NULL,
  `total_value` decimal(12,2) NOT NULL,
  `value_excl_tax` decimal(12,2) NOT NULL,
  `retail_price` decimal(12,2) NOT NULL DEFAULT '0.00',
  `sales_tax_applicable` decimal(12,2) NOT NULL,
  `sales_tax_withheld` decimal(12,2) NOT NULL DEFAULT '0.00',
  `extra_tax` decimal(12,2) NOT NULL DEFAULT '0.00',
  `further_tax` decimal(12,2) NOT NULL DEFAULT '0.00',
  `fed_payable` decimal(12,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `sale_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sro_schedule_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sro_item_serial_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`invoice_detail_id`),
  KEY `invoice_details_invoice_id_foreign` (`invoice_id`),
  KEY `invoice_details_item_id_foreign` (`item_id`),
  CONSTRAINT `invoice_details_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`invoice_id`) ON DELETE CASCADE,
  CONSTRAINT `invoice_details_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_details`
--

LOCK TABLES `invoice_details` WRITE;
/*!40000 ALTER TABLE `invoice_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `invoice_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_date` date NOT NULL,
  `scenario_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_ref_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seller_id` bigint unsigned NOT NULL,
  `buyer_id` bigint unsigned NOT NULL,
  `fbr_invoice_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_posted_to_fbr` tinyint NOT NULL DEFAULT '0',
  `response_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `response_message` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `invoices_seller_id_foreign` (`seller_id`),
  KEY `invoices_buyer_id_foreign` (`buyer_id`),
  CONSTRAINT `invoices_buyer_id_foreign` FOREIGN KEY (`buyer_id`) REFERENCES `buyers` (`byr_id`) ON DELETE CASCADE,
  CONSTRAINT `invoices_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `business_configurations` (`bus_config_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `item_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `item_hs_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_price` double NOT NULL,
  `item_tax_rate` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_uom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'hs-code','Test Item 1',1000,'19%','PCS','2025-07-07 04:32:43','2025-07-07 04:33:11'),(2,NULL,'Test Item 2',2000,'15%','KG','2025-07-07 05:11:12','2025-07-07 05:11:12');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (7,'0001_01_01_000000_create_users_table',1),(8,'0001_01_01_000001_create_cache_table',1),(9,'0001_01_01_000002_create_jobs_table',1),(22,'2025_07_04_120046_create_business_configurations_table',2),(24,'2025_07_04_121405_create_buyers_table',3),(25,'2025_07_07_045332_create_items_table',4),(26,'2025_07_07_050034_create_invoices_table',5),(27,'2025_07_07_050036_create_invoice_details_table',5),(28,'2025_07_07_110924_add_bus_province_to_business_configurations_table',6),(29,'2025_07_07_111052_add_byr_province_to_buyers_table',7);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('KuyvHqTFEbTjhX2Mlm903L4lPMlczkb5ShSWAHs0',2,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoieWR2bko5MG1MSGRtbGVrYjRYQ2NVQTVma2Zid1ZlZXM0eXJLR0hkdCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvaXRlbXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=',1751889904),('ZfWWwCBJg2I5hWIMLbozKUHb7pafxrtf6veLDKUp',2,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiY3VSQzdEZ2d1RWxidks2UGdXVGxHeW1uZ2t3Y3k1clZSak5xTXhkUSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM2OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYnV5ZXJzL215Um91dGUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=',1751888472);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'Hammad Ali','hammad.ali@f3technologies.eu',NULL,'$2y$12$L.S4Y73wLI.F5tF6sbUyf.mkrEGCMbU7oh789Ba2caicyUAlK1ApW',NULL,'2025-07-02 01:29:39','2025-07-02 01:29:39'),(3,'Hammad Naseer','hammad.naseer@f3technologies.eu',NULL,'$2y$12$uUtR1dE5s3FQOYUd/2DSmOhnR64Mo/SkDT.PZ.j4CA5H0JTJDpmti',NULL,'2025-07-04 02:20:40','2025-07-04 02:20:40');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-07 17:09:32
