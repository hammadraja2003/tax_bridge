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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (7,'0001_01_01_000000_create_users_table',1),(8,'0001_01_01_000001_create_cache_table',1),(9,'0001_01_01_000002_create_jobs_table',1),(10,'2025_06_30_043756_create_xero_invoices_table',1),(11,'2025_06_30_064829_add_tenant_columns_to_xero_invoices_table',1),(12,'2025_06_30_111717_create_xero_invoice_items_table',1);
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
INSERT INTO `sessions` VALUES ('Q0O3TNZZY32qFaRQiV9ni4zBTFnH3bhXMbC1eBg8',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiem5NUURGYVV6Q2VqZm1vYzBBOXgwcFFuVElCVjR3MGtMQ2d1NGh5SSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czoxMToib2F1dGgyc3RhdGUiO3M6MzI6IjIzOGUxNjJkNjhhZTI4MmI4MjE5OTg0NTU3ZDAyNDEzIjtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozODoiaHR0cDovL2xvY2FsaG9zdDo4MDAwL3hlcm8vZGItaW52b2ljZXMiO31zOjEwOiJ4ZXJvX3Rva2VuIjtPOjM4OiJMZWFndWVcT0F1dGgyXENsaWVudFxUb2tlblxBY2Nlc3NUb2tlbiI6NTp7czoxNDoiACoAYWNjZXNzVG9rZW4iO3M6MTI5MjoiZXlKaGJHY2lPaUpTVXpJMU5pSXNJbXRwWkNJNklqRkRRVVk0UlRZMk56Y3lSRFpFUXpBeU9FUTJOekkyUmtRd01qWXhOVGd4TlRjd1JVWkRNVGtpTENKMGVYQWlPaUpLVjFRaUxDSjROWFFpT2lKSVN5MVBXbTVqZEdKalFXOHhia3AyTUVOWlZtZFdZMDlmUW1zaWZRLmV5SnVZbVlpT2pFM05URXlPRGMzTlRVc0ltVjRjQ0k2TVRjMU1USTRPVFUxTlN3aWFYTnpJam9pYUhSMGNITTZMeTlwWkdWdWRHbDBlUzU0WlhKdkxtTnZiU0lzSW1GMVpDSTZJbWgwZEhCek9pOHZhV1JsYm5ScGRIa3VlR1Z5Ynk1amIyMHZjbVZ6YjNWeVkyVnpJaXdpWTJ4cFpXNTBYMmxrSWpvaU1VVkZNa0UzUlRZeE5ERkZORVZDUmtGRU1EUTFOVUkzTTBNNFF6TXlPVVlpTENKemRXSWlPaUkxWkRJeE0yVTVNRGRsT0RjMU1tUXpPVEF4TlRobE56RXpNakkwWkRGbE15SXNJbUYxZEdoZmRHbHRaU0k2TVRjMU1USTROemN5TlN3aWVHVnliMTkxYzJWeWFXUWlPaUkwWVRjelpXRm1ZaTB4T1RabUxUUTNZVFl0T1RJME5TMHhZemd5WXpZNU5tRTJOR1lpTENKbmJHOWlZV3hmYzJWemMybHZibDlwWkNJNkltTXhNR1F5WXprNU9HWXpaRFJoWkdVNVl6bGhPRGczTm1KbFlXTmlOakl5SWl3aWMybGtJam9pWXpFd1pESmpPVGs0WmpOa05HRmtaVGxqT1dFNE9EYzJZbVZoWTJJMk1qSWlMQ0pxZEdraU9pSkZSa000TmprM05FSTJRMEUzTURFMU5qSTROa015UkRFMU0wTXdRa1EwTUNJc0ltRjFkR2hsYm5ScFkyRjBhVzl1WDJWMlpXNTBYMmxrSWpvaVpUazBaVFEzWWpVdE1HTmhOaTAwT0RVMExXSmlNVEV0TWpreVpERTFZemM0WkRRNUlpd2ljMk52Y0dVaU9sc2laVzFoYVd3aUxDSndjbTltYVd4bElpd2liM0JsYm1sa0lpd2lZV05qYjNWdWRHbHVaeTV6WlhSMGFXNW5jeUlzSW1GalkyOTFiblJwYm1jdWRISmhibk5oWTNScGIyNXpJaXdpYjJabWJHbHVaVjloWTJObGMzTWlYU3dpWVcxeUlqcGJJbXhsWjJGamVTSmRmUS5GaTlhc1AwODRUWXNsQnF5UnZFM29ST3pyXzByYzREbkFJOTZkRW9vM2FsUURsODZIOWxIcVlGZkRlamFxTkQ4d0wza2EzWlR3Q0kxbHh6OU9RUVFMY3kxc0NvVGRudURxQ2JyZF91MlRDWnJsMjJTa0hrQk1YenFSRUNjeW5heUExazlSaEU0aVZpZWQ5ZXBuc2tpaDM1RExXbEZsamFKSlNmaXR4cGtnS0doT1ZPTkRQNTVuMVdDT3NaenZQWG9aYmJHWnZaLVpMYUpIMjh3NUpqYlFzbVdFdjN2bjlha01neDlQMWhqUHNoTWx4RDBGVUhoSGROMzF2R2oydml6ejNLZjZzaUN4bHZTNzFvTVoydGlWeXNVa2M3elVhSFdUZUZVU1hNN0oxTVlPNmg1R0h2czA2eXlsMDRVeVY4V3RReU9LY0FRMWV0TFNJWFN6OXNzbUEiO3M6MTA6IgAqAGV4cGlyZXMiO2k6MTc1MTI4OTU2OTtzOjE1OiIAKgByZWZyZXNoVG9rZW4iO3M6NDM6ImNoT2NHcFd0blhaR0NtQVNjUUFDN0NpTFRWYzYwWGdrUmh4dWIwT0w2NVUiO3M6MTg6IgAqAHJlc291cmNlT3duZXJJZCI7TjtzOjk6IgAqAHZhbHVlcyI7YTozOntzOjg6ImlkX3Rva2VuIjtzOjEyNjY6ImV5SmhiR2NpT2lKU1V6STFOaUlzSW10cFpDSTZJakZEUVVZNFJUWTJOemN5UkRaRVF6QXlPRVEyTnpJMlJrUXdNall4TlRneE5UY3dSVVpETVRraUxDSjBlWEFpT2lKS1YxUWlMQ0o0TlhRaU9pSklTeTFQV201amRHSmpRVzh4YmtwMk1FTlpWbWRXWTA5ZlFtc2lmUS5leUp1WW1ZaU9qRTNOVEV5T0RjM05UVXNJbVY0Y0NJNk1UYzFNVEk0T0RBMU5Td2lhWE56SWpvaWFIUjBjSE02THk5cFpHVnVkR2wwZVM1NFpYSnZMbU52YlNJc0ltRjFaQ0k2SWpGRlJUSkJOMFUyTVRReFJUUkZRa1pCUkRBME5UVkNOek5ET0VNek1qbEdJaXdpYVdGMElqb3hOelV4TWpnM056VTFMQ0poZEY5b1lYTm9Jam9pTlU1aU9VZzFia3MxWmpscGRUUjRZa05oYzJOM1FTSXNJbk5mYUdGemFDSTZJbkZCZVV4S2VGcFZOa1F5WmpoT2FVdGFSekpXUkVFaUxDSnphV1FpT2lKak1UQmtNbU01T1RobU0yUTBZV1JsT1dNNVlUZzROelppWldGallqWXlNaUlzSW5OMVlpSTZJalZrTWpFelpUa3dOMlU0TnpVeVpETTVNREUxT0dVM01UTXlNalJrTVdVeklpd2lZWFYwYUY5MGFXMWxJam94TnpVeE1qZzNOekkxTENKNFpYSnZYM1Z6WlhKcFpDSTZJalJoTnpObFlXWmlMVEU1Tm1ZdE5EZGhOaTA1TWpRMUxURmpPREpqTmprMllUWTBaaUlzSW1kc2IySmhiRjl6WlhOemFXOXVYMmxrSWpvaVl6RXdaREpqT1RrNFpqTmtOR0ZrWlRsak9XRTRPRGMyWW1WaFkySTJNaklpTENKd2NtVm1aWEp5WldSZmRYTmxjbTVoYldVaU9pSm9ZVzF0WVdRdVlXeHBRR1l6ZEdWamFHNXZiRzluYVdWekxtVjFJaXdpWlcxaGFXd2lPaUpvWVcxdFlXUXVZV3hwUUdZemRHVmphRzV2Ykc5bmFXVnpMbVYxSWl3aVoybDJaVzVmYm1GdFpTSTZJa2hoYlcxaFpDSXNJbVpoYldsc2VWOXVZVzFsSWpvaVFXeHBJaXdpYm1GdFpTSTZJa2hoYlcxaFpDQkJiR2tpTENKaGJYSWlPbHNpYkdWbllXTjVJbDE5Lnd4anBGNXRRSm1yUGxwT3ExR0xWMFpVSkRfMjFFT1lVd2lmNDZ4UnpkZjgtYkRVQjNsS2ZCeHQ4cnFKY3ZxRDJQc19xelcxUGZEUm5xWDZSNHhZVXZJX1N3SFNmMDJpY1F6QW1jcG1vVmpPRFNYWkVnX3VRNU93OFlnSzdvUDdVZE5tbXZNbjM5U1ZFS1VYandNM3ZHbDBzVjJBdnFGSmxPRm41WVVJMllDcHBXaDFYWnFwek80ZkxXT3NST2RaVUxLUTFZNGFFeFltdVdNdXNoMmdwV2RqT2szWUNYSXB6bHFlaXN5OGhWOGp3MWFQZlJieTBVZm9PZHQ3WTk1dzdIRER3Qkl6MzhRc0t3d29rbHFnMVlZd2NZTUo0dm9zTFJnc3NEbWN4c1ZuNG9GV3lkT0ZvUFlsM1Z5UmhsZ0tVX1h3ZjBGMmhmMmtvMVdnUklXVXl4ZyI7czoxMDoidG9rZW5fdHlwZSI7czo2OiJCZWFyZXIiO3M6NToic2NvcGUiO3M6Nzk6Im9wZW5pZCBwcm9maWxlIGVtYWlsIGFjY291bnRpbmcudHJhbnNhY3Rpb25zIGFjY291bnRpbmcuc2V0dGluZ3Mgb2ZmbGluZV9hY2Nlc3MiO319fQ==',1751287828);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xero_invoice_items`
--

DROP TABLE IF EXISTS `xero_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xero_invoice_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `quantity` decimal(12,4) DEFAULT NULL,
  `unit_amount` decimal(18,4) DEFAULT NULL,
  `line_amount` decimal(18,4) DEFAULT NULL,
  `item_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_amount` decimal(18,4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xero_invoice_items_invoice_id_foreign` (`invoice_id`),
  CONSTRAINT `xero_invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `xero_invoices` (`invoice_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xero_invoice_items`
--

LOCK TABLES `xero_invoice_items` WRITE;
/*!40000 ALTER TABLE `xero_invoice_items` DISABLE KEYS */;
INSERT INTO `xero_invoice_items` VALUES (40,'fee88eea-f2aa-4a71-a372-33d6d83d3c45','Marketing guides',4.0000,99.0000,396.0000,NULL,30.1800,'2025-06-30 07:16:13','2025-06-30 07:16:13'),(41,'9f5bca33-8590-4b6f-acfb-e85712b10217','Our share building doorman/security',1.0000,55.0000,55.0000,NULL,4.5400,'2025-06-30 07:16:14','2025-06-30 07:16:14'),(42,'8a3fdcc9-83eb-4fdd-83e0-52ec1b40b072','Monthly subscription',1.0000,29.0000,29.0000,NULL,2.3900,'2025-06-30 07:16:16','2025-06-30 07:16:16'),(43,'4c4db294-3633-45cd-8706-f0b3b0079609','Half day training - Microsoft Office',1.0000,500.0000,500.0000,'Train-MS',41.2500,'2025-06-30 07:16:17','2025-06-30 07:16:17'),(44,'b7e0c5f4-9f52-4126-b102-45fd12eaa3ca','Desktop/network support via email & phone.\r\nPer month fixed fee for minimum 20 hours/month.',1.0000,500.0000,500.0000,'Support-M',41.2500,'2025-06-30 07:16:19','2025-06-30 07:16:19'),(45,'07e71ce4-9801-4cce-914b-dc07e9c0ca5e','\'Fish out of Water: Finding Your Brand\'',1.0000,19.9500,19.9500,'BOOK',1.7500,'2025-06-30 07:16:20','2025-06-30 07:16:20'),(46,'3a669bd8-b601-4b9a-81d4-cb03f1af3059','Monthly subscription',1.0000,29.0000,29.0000,NULL,2.3900,'2025-06-30 07:16:22','2025-06-30 07:16:22'),(47,'6a77611c-f9af-483b-aa6e-d0fd23137394','Monthy rent in advance',1.0000,1181.2500,1181.2500,NULL,90.0300,'2025-06-30 07:16:23','2025-06-30 07:16:23'),(48,'28a34ad7-6c41-4d92-8312-cd07f8328e90','Monthly power supply',1.0000,110.0000,110.0000,NULL,9.0800,'2025-06-30 07:16:25','2025-06-30 07:16:25'),(49,'824c6c13-b7a5-49a2-99bd-4a6d77f7866e','Laptop (Oliver)',1.0000,1804.5000,1804.5000,NULL,148.8700,'2025-06-30 07:16:26','2025-06-30 07:16:26'),(50,'236985ea-21a5-4b17-afb9-c16ff9ff3e27','Cable internet',1.0000,41.5000,41.5000,NULL,3.4200,'2025-06-30 07:16:28','2025-06-30 07:16:28'),(51,'cb5119d0-9759-49d3-800b-7d0a90818178','Desktop/network support via email & phone.\r\nPer month fixed fee for minimum 20 hours/month.',1.0000,500.0000,500.0000,'Support-M',41.2500,'2025-06-30 07:16:29','2025-06-30 07:16:29'),(52,'ac4883f6-fb22-4f55-9ed1-34929fc53c78','Desktop/network support via email & phone.\r\nPer month fixed fee for minimum 20 hours/month.',1.0000,500.0000,500.0000,'Support-M',41.2500,'2025-06-30 07:16:30','2025-06-30 07:16:30'),(53,'1938eac0-c2dc-48f1-b4e1-b3ae59362f9b','Monthly subscription',1.0000,29.0000,29.0000,NULL,2.3900,'2025-06-30 07:16:32','2025-06-30 07:16:32'),(54,'f61d2da2-3957-42f7-b268-6117b957794e','Desktop/network support via email & phone.\r\nPer month fixed fee for minimum 20 hours/month.',1.0000,500.0000,500.0000,'Support-M',41.2500,'2025-06-30 07:16:33','2025-06-30 07:16:33'),(55,'043ce7df-fc3d-4e6b-b505-34579d0490f3','Desktop/network support via email & phone.\r\nPer month fixed fee for minimum 20 hours/month.',1.0000,500.0000,500.0000,'Support-M',41.2500,'2025-06-30 07:16:35','2025-06-30 07:16:35'),(56,'64f222d5-e59a-43e0-8f6b-69f87e42a527','Half day training - Microsoft Office - for your Priority Mortgage Services Team (Session 3)',1.0000,400.0000,400.0000,'Train-MS',33.0000,'2025-06-30 07:16:36','2025-06-30 07:16:36'),(57,'64f222d5-e59a-43e0-8f6b-69f87e42a527','Half day training - Microsoft Office - for your Lending Services Team (Session 2)',1.0000,400.0000,400.0000,'Train-MS',33.0000,'2025-06-30 07:16:37','2025-06-30 07:16:37'),(58,'64f222d5-e59a-43e0-8f6b-69f87e42a527','Half day training - Microsoft Office - for your Customer Support Team (Session 1)',1.0000,400.0000,400.0000,'Train-MS',33.0000,'2025-06-30 07:16:38','2025-06-30 07:16:38'),(59,'14aa8bd8-7473-42c7-b8bc-ca83d7a75236','Photocopier repair & drum replacement',1.0000,982.5000,982.5000,NULL,81.0600,'2025-06-30 07:16:40','2025-06-30 07:16:40'),(60,'9a4a5e48-56fb-4ec6-9c3b-07c947239372','Office Cleaning for month',1.0000,110.0000,110.0000,NULL,9.0800,'2025-06-30 07:16:41','2025-06-30 07:16:41'),(61,'ffbb9f34-f7d7-4f55-91cb-af89552ecdd7','Our share building doorman/security',1.0000,55.0000,55.0000,NULL,4.5400,'2025-06-30 07:16:43','2025-06-30 07:16:43'),(62,'5fe76602-3f0d-48e6-88b6-aadfab4829a8','Network diagnostics software',1.0000,500.0000,500.0000,NULL,43.7500,'2025-06-30 07:16:44','2025-06-30 07:16:44'),(63,'5fe76602-3f0d-48e6-88b6-aadfab4829a8','Replacement hub & network switches',1.0000,850.0000,850.0000,NULL,70.1300,'2025-06-30 07:16:45','2025-06-30 07:16:45'),(64,'0bd7b530-d244-4716-a93e-710de7c61b76','DVD writer for laptop',1.0000,250.0000,250.0000,NULL,20.6300,'2025-06-30 07:16:47','2025-06-30 07:16:47'),(65,'a909dda4-555b-414b-a395-ba7a4077de72','Development work - develper onsite per day',1.0000,650.0000,650.0000,'DevD',53.6300,'2025-06-30 07:16:48','2025-06-30 07:16:48'),(66,'3f887d04-cbd9-4853-b594-bc1ab207558c','Onsite project management for CRM Project 3 days/week',1.0000,6187.5000,6187.5000,NULL,471.5600,'2025-06-30 07:16:50','2025-06-30 07:16:50'),(67,'50e1cbd2-86c6-42df-9538-5691dd54bbee','Project management & implementation - branding workshop with your team - follow up session',1.0000,200.0000,200.0000,'PMBr',16.5000,'2025-06-30 07:16:51','2025-06-30 07:16:51'),(68,'6b99fc0b-e148-458d-aa8b-da550803c93e','Delivery of new reception desk',1.0000,115.5000,115.5000,NULL,9.5300,'2025-06-30 07:16:52','2025-06-30 07:16:52'),(69,'7a69814e-dc6f-4c8b-80ad-cfe9c78c2763','Monthly power supply',1.0000,100.3200,100.3200,NULL,8.2800,'2025-06-30 07:16:54','2025-06-30 07:16:54'),(70,'08e6466f-29f3-4af7-aeac-102944c10033','Cable internet',1.0000,50.0000,50.0000,NULL,4.1300,'2025-06-30 07:16:55','2025-06-30 07:16:55'),(71,'50a8143e-f9a5-4b84-8560-0daeba260020','Project management & implementation - branding workshop with your team\r\n========================\r\n\r\n- \'Buzz Words\' session with your Steering Group\r\n- Analysis of current marketing materials\r\n- Workshop on re-brand outcomes and stakeholder identification\r\n\r\n- Analysis and presentation of findings to your Steering Group & Board',1.0000,500.0000,500.0000,'PMBr',41.2500,'2025-06-30 07:16:57','2025-06-30 07:16:57'),(72,'50a8143e-f9a5-4b84-8560-0daeba260020','Copies of \'Fish out of Water\' text for your Branding Team',4.0000,11.9500,47.8000,NULL,4.1800,'2025-06-30 07:16:58','2025-06-30 07:16:58'),(73,'7f750739-c67a-4acc-9cd7-c133ddbcb7b1','Laptop (Tracy)',1.0000,1969.9900,1969.9900,NULL,162.5200,'2025-06-30 07:16:59','2025-06-30 07:16:59'),(74,'61127f1e-d938-4176-a72e-fd500d5b064f','Cable internet',1.0000,39.0000,39.0000,NULL,3.2200,'2025-06-30 07:17:01','2025-06-30 07:17:01'),(75,'323103d0-050b-4538-9abd-b05894f176f5','Monthly power supply',1.0000,105.0000,105.0000,NULL,8.6600,'2025-06-30 07:17:02','2025-06-30 07:17:02'),(76,'1ee8729f-0a1f-4e36-8a10-de4c087b92ab','Cable internet',1.0000,39.0000,39.0000,NULL,3.2200,'2025-06-30 07:17:04','2025-06-30 07:17:04'),(77,'927cc424-d1b9-48c8-a6aa-c134b3bc74a4','Monthly power supply',1.0000,105.0000,105.0000,NULL,8.6600,'2025-06-30 07:17:05','2025-06-30 07:17:05'),(78,'f8c11fab-d8b2-4fdc-a803-34501181df3b','Our share building doorman/security',1.0000,55.0000,55.0000,NULL,4.5400,'2025-06-30 07:17:06','2025-06-30 07:17:06'),(79,'a8beb072-5464-46ab-b437-cce25e6f2a0a','Monthly subscription',1.0000,29.0000,29.0000,NULL,2.3900,'2025-06-30 07:17:08','2025-06-30 07:17:08'),(80,'543f7cd8-323d-4baf-96b2-cb76831bccfb','Monthy rent in advance',1.0000,1181.2500,1181.2500,NULL,90.0300,'2025-06-30 07:17:09','2025-06-30 07:17:09'),(81,'df852239-2d19-4313-8285-e94957a45020','Our share building doorman/security',1.0000,55.0000,55.0000,NULL,4.5400,'2025-06-30 07:17:11','2025-06-30 07:17:11'),(82,'57f74b0c-137d-4627-8c08-388f49a62510','Monthly subscription',1.0000,29.0000,29.0000,NULL,2.3900,'2025-06-30 07:17:12','2025-06-30 07:17:12'),(83,'2a35b64d-8564-43c8-a43f-e56b3f8dddcd','Monthy rent in advance',1.0000,1181.2500,1181.2500,NULL,90.0300,'2025-06-30 07:17:14','2025-06-30 07:17:14'),(84,'1a29fe51-c155-4c8e-b91b-baa176655d23','Our share building doorman/security',1.0000,55.0000,55.0000,NULL,4.5400,'2025-06-30 07:17:15','2025-06-30 07:17:15'),(85,'f2b3f909-1472-4ee8-98ac-5045bacb5656','Golf balls - white single',200.0000,4.2000,840.0000,'GB1-White',64.0200,'2025-06-30 07:17:17','2025-06-30 07:17:17'),(86,'93796a50-2fb6-4982-9ccd-01898b419ea0','Taxi services',1.0000,242.0000,242.0000,NULL,18.4400,'2025-06-30 07:17:18','2025-06-30 07:17:18'),(87,'84f7c2d0-8383-46ed-bf45-17e00665ceab','Design concepts for Oaktown Business Leader ad series',1.0000,2000.0000,2000.0000,NULL,152.4200,'2025-06-30 07:17:20','2025-06-30 07:17:20'),(88,'628fc0b0-e65c-47ef-a3e2-99632a1136e7','Prototype media banner & print mockups for Oaktown Business Leader ad series',1.0000,2500.0000,2500.0000,NULL,190.5300,'2025-06-30 07:17:21','2025-06-30 07:17:21'),(89,'bd63b5f1-5503-4c62-9c4a-e4b9e4257dc9','Project management & implementation - branding workshop with your team',1.0000,250.0000,250.0000,'PMBr',19.0500,'2025-06-30 07:17:22','2025-06-30 07:17:22'),(90,'bbf21465-7a03-417d-b41d-48d3000e858e','Monthy rent in advance',1.0000,1181.2500,1181.2500,NULL,90.0300,'2025-06-30 07:17:24','2025-06-30 07:17:24'),(91,'361a4980-7f53-4b68-820c-f6487f613284','Annual service company car',1.0000,380.0000,380.0000,NULL,31.3500,'2025-06-30 07:17:25','2025-06-30 07:17:25'),(92,'016a64c7-be0b-45a2-acae-13057fdf1566','Development work - per hour rate',5.0000,94.0000,470.0000,'DevH',35.8200,'2025-06-30 07:17:27','2025-06-30 07:17:27'),(93,'016a64c7-be0b-45a2-acae-13057fdf1566','Project team meeting to discuss dev changes required to your online gift basket ordering system',1.0000,444.5500,444.5500,NULL,33.8800,'2025-06-30 07:17:28','2025-06-30 07:17:28'),(94,'88617351-56ed-4c14-a30d-34a006d0a75a','Golf balls - white single',40.0000,5.6000,224.0000,'GB1-White',17.0700,'2025-06-30 07:17:29','2025-06-30 07:17:29'),(95,'88617351-56ed-4c14-a30d-34a006d0a75a','Delivery charge',1.0000,10.0000,10.0000,NULL,0.0000,'2025-06-30 07:17:30','2025-06-30 07:17:30'),(96,'f175784c-3ae0-4850-8504-46ad807181f7','Room hire',1.0000,130.0000,130.0000,NULL,9.9100,'2025-06-30 07:17:32','2025-06-30 07:17:32'),(97,'463042ef-4343-4a5a-abb8-9a1a3e2e1057','Development work - develper onsite per day',2.0000,650.0000,1300.0000,'DevD',107.2500,'2025-06-30 07:17:33','2025-06-30 07:17:33'),(98,'11e353a8-73f8-4f50-82e0-ff1a2ff8ffba','Half day training - Microsoft Office - reception staff (Session 1)',1.0000,500.0000,500.0000,'Train-MS',41.2500,'2025-06-30 07:17:35','2025-06-30 07:17:35'),(99,'11e353a8-73f8-4f50-82e0-ff1a2ff8ffba','Half day training - Microsoft Office - operations staff (Session 2)',1.0000,500.0000,500.0000,'Train-MS',41.2500,'2025-06-30 07:17:36','2025-06-30 07:17:36'),(100,'cb43aadd-8836-4e95-aa2c-c4ba66c2ca9e','Onsite project management for CRM Project 3 days/week',1.0000,6187.5000,6187.5000,NULL,471.5600,'2025-06-30 07:17:37','2025-06-30 07:17:37'),(101,'2c916a34-14fe-4b38-af86-6b0fcc371a89','\'Fish out of Water: Finding Your Brand\'',1.0000,19.9500,19.9500,'BOOK',1.7500,'2025-06-30 07:17:39','2025-06-30 07:17:39'),(102,'2c916a34-14fe-4b38-af86-6b0fcc371a89','Project management & implementation - branding workshop with your team - follow up',1.0000,200.0000,200.0000,'PMBr',16.5000,'2025-06-30 07:17:40','2025-06-30 07:17:40'),(103,'1371f05a-4cd3-4760-99a9-e4cf8d98e7bb','Desktop/network support via email & phone.\r\nPer month fixed fee for minimum 20 hours/month.',1.0000,500.0000,500.0000,'Support-M',41.2500,'2025-06-30 07:17:41','2025-06-30 07:17:41'),(104,'f0065405-e5ad-4c34-ad5b-645e72813c03','Desktop/network support via email & phone.\r\nPer month fixed fee for minimum 20 hours/month.',1.0000,500.0000,500.0000,'Support-M',41.2500,'2025-06-30 07:17:42','2025-06-30 07:17:42'),(105,'72860d4a-207b-4f24-895d-167ffd44ae00','Desktop/network support via email & phone.\r\nPer month fixed fee for minimum 20 hours/month.',1.0000,500.0000,500.0000,'Support-M',41.2500,'2025-06-30 07:17:44','2025-06-30 07:17:44'),(106,'1ee8363f-097f-4fb3-a452-8068b947e75e','Desktop/network support via email & phone.\r\nPer month fixed fee for minimum 20 hours/month.',1.0000,500.0000,500.0000,'Support-M',41.2500,'2025-06-30 07:17:45','2025-06-30 07:17:45'),(107,'2a578929-58bf-4eca-90db-1356383aeecb','Deposit on venue hire for client function',1.0000,1500.0000,1500.0000,NULL,0.0000,'2025-06-30 07:17:47','2025-06-30 07:17:47'),(108,'12d3bc5a-efe2-4093-b0e3-f6474ef7596d','20-second still frame ad shown in 5 city cinemas 5 times each',1.0000,5500.0000,5500.0000,NULL,453.7500,'2025-06-30 07:17:48','2025-06-30 07:17:48'),(109,'6e74d1a5-e95b-406d-8d96-7d8752fa388e','Coffee table for reception',1.0000,1000.0000,1000.0000,NULL,76.2100,'2025-06-30 07:17:50','2025-06-30 07:17:50'),(110,'4286e4ee-cc4a-4d74-9568-10935b3600bb','Project management & implementation - branding workshop with your team',1.0000,250.0000,250.0000,'PMBr',20.6300,'2025-06-30 07:17:51','2025-06-30 07:17:51'),(111,'4286e4ee-cc4a-4d74-9568-10935b3600bb','Project management & implementation - \'due diligence\' stocktake of your project scope/schedule/implementation plan/outcome measures (hourly rate as agreed)',5.0000,105.0000,525.0000,'PMDD',43.3100,'2025-06-30 07:17:52','2025-06-30 07:17:52'),(112,'bc532b0e-dfa7-44fd-99d9-1d24acd55b1c','Monthy rent in advance',1.0000,1181.2500,1181.2500,NULL,90.0300,'2025-06-30 07:17:54','2025-06-30 07:17:54'),(113,'9d9cd0fc-661b-49fb-9062-6e50c139b78b','Cable internet',1.0000,43.2500,43.2500,NULL,3.5700,'2025-06-30 07:17:55','2025-06-30 07:17:55'),(114,'47b97878-df82-4330-b731-80610cce65d1','Monthly power supply',1.0000,125.5000,125.5000,NULL,10.3500,'2025-06-30 07:17:57','2025-06-30 07:17:57'),(115,'1bba28a1-2807-4d2e-86a0-c418a91ac12f','Desktop/network support via email & phone.\r\nPer month fixed fee for minimum 20 hours/month.',1.0000,550.0000,550.0000,'Support-M',41.9200,'2025-06-30 07:17:59','2025-06-30 07:17:59'),(116,'3f4a783e-6e80-4062-9300-4df2524e8bf7','Desktop/network support via email & phone.\r\nPer month fixed fee for minimum 20 hours/month.',1.0000,550.0000,550.0000,'Support-M',41.9200,'2025-06-30 07:18:00','2025-06-30 07:18:00'),(117,'57bf3de4-016b-4813-a81a-5379940a06b9','Hamilton Accounting Conference - Mileage',27.0000,0.7000,18.9000,NULL,0.0000,'2025-06-30 07:18:02','2025-06-30 07:18:02'),(118,'d927c2a8-01f6-442c-a690-b41eb247ece4','Development work - develper onsite per day',1.0000,650.0000,650.0000,'DevD',49.5400,'2025-06-30 07:18:03','2025-06-30 07:18:03'),(119,'d927c2a8-01f6-442c-a690-b41eb247ece4','Golf balls - white single. Please reorder with code GB1-White',1.0000,5.6000,5.6000,'GB1-White',0.4500,'2025-06-30 07:18:04','2025-06-30 07:18:04');
/*!40000 ALTER TABLE `xero_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xero_invoices`
--

DROP TABLE IF EXISTS `xero_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xero_invoices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tenant_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` double DEFAULT NULL,
  `total_tax` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `amount_due` double DEFAULT NULL,
  `amount_paid` double DEFAULT NULL,
  `amount_credited` double DEFAULT NULL,
  `is_discounted` tinyint(1) NOT NULL DEFAULT '0',
  `has_attachments` tinyint(1) NOT NULL DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `updated_date_utc` datetime DEFAULT NULL,
  `fbr_invoice_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `posted_to_fbr` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tenant_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tenant_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organisation_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tenant_created_at` timestamp NULL DEFAULT NULL,
  `tenant_updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `xero_invoices_invoice_id_unique` (`invoice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xero_invoices`
--

LOCK TABLES `xero_invoices` WRITE;
/*!40000 ALTER TABLE `xero_invoices` DISABLE KEYS */;
INSERT INTO `xero_invoices` VALUES (37,'ac3d4882-08cf-4024-963d-f654e312b195','fee88eea-f2aa-4a71-a372-33d6d83d3c45','ACCREC','INV-0027','Ref MK815','AUTHORISED','USD',365.82,30.18,396,396,0,0,0,0,'2025-06-26 00:00:00','2025-07-02 00:00:00','2008-12-19 00:00:00',NULL,0,'2025-06-30 07:16:12','2025-06-30 07:16:12','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(38,'ac3d4882-08cf-4024-963d-f654e312b195','9f5bca33-8590-4b6f-acfb-e85712b10217','ACCPAY','AP','','AUTHORISED','USD',55,4.54,59.54,59.54,0,0,0,0,'2025-06-06 00:00:00','2025-06-13 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-06-30 07:16:14','2025-06-30 07:16:14','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(39,'ac3d4882-08cf-4024-963d-f654e312b195','8a3fdcc9-83eb-4fdd-83e0-52ec1b40b072','ACCPAY','AP','','AUTHORISED','USD',29,2.39,31.39,31.39,0,0,0,0,'2025-06-23 00:00:00','2025-06-23 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-06-30 07:16:15','2025-06-30 07:16:15','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(40,'ac3d4882-08cf-4024-963d-f654e312b195','4c4db294-3633-45cd-8706-f0b3b0079609','ACCREC','INV-0010','Training','PAID','USD',500,41.25,541.25,0,0,541.25,0,0,'2025-05-04 00:00:00','2025-05-17 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-06-30 07:16:17','2025-06-30 07:16:17','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(41,'ac3d4882-08cf-4024-963d-f654e312b195','b7e0c5f4-9f52-4126-b102-45fd12eaa3ca','ACCREC','INV-0005','Monthly Support','PAID','USD',500,41.25,541.25,0,0,541.25,0,0,'2025-04-27 00:00:00','2025-05-07 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-06-30 07:16:18','2025-06-30 07:16:18','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(42,'ac3d4882-08cf-4024-963d-f654e312b195','07e71ce4-9801-4cce-914b-dc07e9c0ca5e','ACCREC','INV-0017','Book','AUTHORISED','USD',19.95,1.75,21.7,21.7,0,0,0,0,'2025-05-15 00:00:00','2025-05-25 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-06-30 07:16:20','2025-06-30 07:16:20','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(43,'ac3d4882-08cf-4024-963d-f654e312b195','3a669bd8-b601-4b9a-81d4-cb03f1af3059','ACCPAY','AP','','PAID','USD',29,2.39,31.39,0,31.39,0,0,0,'2025-04-23 00:00:00','2025-04-23 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-06-30 07:16:21','2025-06-30 07:16:21','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(44,'ac3d4882-08cf-4024-963d-f654e312b195','6a77611c-f9af-483b-aa6e-d0fd23137394','ACCPAY','RENT','','PAID','USD',1091.22,90.03,1181.25,0,1181.25,0,0,0,'2025-04-26 00:00:00','2025-04-26 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-06-30 07:16:23','2025-06-30 07:16:23','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(45,'ac3d4882-08cf-4024-963d-f654e312b195','28a34ad7-6c41-4d92-8312-cd07f8328e90','ACCPAY','Rpt','','PAID','USD',110,9.08,119.08,0,119.08,0,0,0,'2025-04-26 00:00:00','2025-05-06 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-06-30 07:16:24','2025-06-30 07:16:24','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(46,'ac3d4882-08cf-4024-963d-f654e312b195','824c6c13-b7a5-49a2-99bd-4a6d77f7866e','ACCPAY','','','PAID','USD',1804.5,148.87,1953.37,0,1682.74,270.63,0,0,'2025-05-06 00:00:00','2025-05-06 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-06-30 07:16:26','2025-06-30 07:16:26','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(47,'ac3d4882-08cf-4024-963d-f654e312b195','236985ea-21a5-4b17-afb9-c16ff9ff3e27','ACCPAY','Rpt','','PAID','USD',41.5,3.42,44.92,0,44.92,0,0,0,'2025-04-27 00:00:00','2025-05-07 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-06-30 07:16:27','2025-06-30 07:16:27','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(48,'ac3d4882-08cf-4024-963d-f654e312b195','cb5119d0-9759-49d3-800b-7d0a90818178','ACCREC','INV-0001','Monthly Support','PAID','USD',500,41.25,541.25,0,541.25,0,0,0,'2025-04-26 00:00:00','2025-05-07 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-06-30 07:16:29','2025-06-30 07:16:29','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(49,'ac3d4882-08cf-4024-963d-f654e312b195','ac4883f6-fb22-4f55-9ed1-34929fc53c78','ACCREC','INV-0002','Monthly Support','PAID','USD',500,41.25,541.25,0,541.25,0,0,0,'2025-04-26 00:00:00','2025-05-07 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-06-30 07:16:30','2025-06-30 07:16:30','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(50,'ac3d4882-08cf-4024-963d-f654e312b195','1938eac0-c2dc-48f1-b4e1-b3ae59362f9b','ACCPAY','AP','','PAID','USD',29,2.39,31.39,0,31.39,0,0,0,'2025-05-24 00:00:00','2025-05-24 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-06-30 07:16:31','2025-06-30 07:16:31','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(51,'ac3d4882-08cf-4024-963d-f654e312b195','f61d2da2-3957-42f7-b268-6117b957794e','ACCREC','INV-0003','Monthly Support','PAID','USD',500,41.25,541.25,0,541.25,0,0,0,'2025-04-26 00:00:00','2025-05-07 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-06-30 07:16:33','2025-06-30 07:16:33','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(52,'ac3d4882-08cf-4024-963d-f654e312b195','043ce7df-fc3d-4e6b-b505-34579d0490f3','ACCREC','INV-0004','Monthly Support','PAID','USD',500,41.25,541.25,0,541.25,0,0,0,'2025-04-26 00:00:00','2025-05-07 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-06-30 07:16:34','2025-06-30 07:16:34','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(53,'ac3d4882-08cf-4024-963d-f654e312b195','64f222d5-e59a-43e0-8f6b-69f87e42a527','ACCREC','INV-0008','Training','PAID','USD',1200,99,1299,0,1299,0,0,0,'2025-04-28 00:00:00','2025-05-09 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-06-30 07:16:36','2025-06-30 07:16:36','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(54,'ac3d4882-08cf-4024-963d-f654e312b195','14aa8bd8-7473-42c7-b8bc-ca83d7a75236','ACCPAY','945-OCon','','AUTHORISED','USD',982.5,81.06,1063.56,163.56,900,0,0,0,'2025-05-04 00:00:00','2025-05-09 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-06-30 07:16:39','2025-06-30 07:16:39','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(55,'ac3d4882-08cf-4024-963d-f654e312b195','9a4a5e48-56fb-4ec6-9c3b-07c947239372','ACCPAY','5679','','PAID','USD',110,9.08,119.08,0,119.08,0,0,0,'2025-05-06 00:00:00','2025-05-12 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-06-30 07:16:41','2025-06-30 07:16:41','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(56,'ac3d4882-08cf-4024-963d-f654e312b195','ffbb9f34-f7d7-4f55-91cb-af89552ecdd7','ACCPAY','AP','','PAID','USD',55,4.54,59.54,0,34.1,25.44,0,0,'2025-05-06 00:00:00','2025-05-13 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-06-30 07:16:42','2025-06-30 07:16:42','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(57,'ac3d4882-08cf-4024-963d-f654e312b195','5fe76602-3f0d-48e6-88b6-aadfab4829a8','ACCPAY','9781','','PAID','USD',1350,113.88,1463.88,0,1463.88,0,0,0,'2025-05-05 00:00:00','2025-05-16 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-06-30 07:16:44','2025-06-30 07:16:44','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(58,'ac3d4882-08cf-4024-963d-f654e312b195','0bd7b530-d244-4716-a93e-710de7c61b76','ACCPAY','OG laptop','','PAID','USD',250,20.63,270.63,0,270.63,0,0,0,'2025-05-17 00:00:00','2025-05-17 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-06-30 07:16:46','2025-06-30 07:16:46','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(59,'ac3d4882-08cf-4024-963d-f654e312b195','a909dda4-555b-414b-a395-ba7a4077de72','ACCREC','INV-0024','P/O 9711','AUTHORISED','USD',650,53.63,703.63,703.63,0,0,0,0,'2025-06-21 00:00:00','2025-07-06 00:00:00','2008-12-21 00:00:00',NULL,0,'2025-06-30 07:16:48','2025-06-30 07:16:48','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(60,'ac3d4882-08cf-4024-963d-f654e312b195','3f887d04-cbd9-4853-b594-bc1ab207558c','ACCREC','INV-0025','P/O CRM08-12','AUTHORISED','USD',5715.94,471.56,6187.5,6187.5,0,0,0,0,'2025-06-05 00:00:00','2025-06-26 00:00:00','2008-12-21 00:00:00',NULL,0,'2025-06-30 07:16:49','2025-06-30 07:16:49','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(61,'ac3d4882-08cf-4024-963d-f654e312b195','50e1cbd2-86c6-42df-9538-5691dd54bbee','ACCREC','INV-0012','P/O 9711','AUTHORISED','USD',200,16.5,216.5,216.5,0,0,0,0,'2025-05-12 00:00:00','2025-05-22 00:00:00','2008-12-21 00:00:00',NULL,0,'2025-06-30 07:16:51','2025-06-30 07:16:51','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(62,'ac3d4882-08cf-4024-963d-f654e312b195','6b99fc0b-e148-458d-aa8b-da550803c93e','ACCPAY','','','AUTHORISED','USD',115.5,9.53,125.03,125.03,0,0,0,0,'2025-06-23 00:00:00','2025-07-06 00:00:00','2008-12-21 00:00:00',NULL,0,'2025-06-30 07:16:52','2025-06-30 07:16:52','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(63,'ac3d4882-08cf-4024-963d-f654e312b195','7a69814e-dc6f-4c8b-80ad-cfe9c78c2763','ACCPAY','Rpt','','AUTHORISED','USD',100.32,8.28,108.6,108.6,0,0,0,0,'2025-06-26 00:00:00','2025-07-06 00:00:00','2008-12-21 00:00:00',NULL,0,'2025-06-30 07:16:53','2025-06-30 07:16:53','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(64,'ac3d4882-08cf-4024-963d-f654e312b195','08e6466f-29f3-4af7-aeac-102944c10033','ACCPAY','Rpt','','AUTHORISED','USD',50,4.13,54.13,54.13,0,0,0,0,'2025-06-27 00:00:00','2025-07-07 00:00:00','2008-12-21 00:00:00',NULL,0,'2025-06-30 07:16:55','2025-06-30 07:16:55','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(65,'ac3d4882-08cf-4024-963d-f654e312b195','50a8143e-f9a5-4b84-8560-0daeba260020','ACCREC','INV-0007','Workshop','PAID','USD',547.8,45.43,593.23,0,593.23,0,0,0,'2025-04-29 00:00:00','2025-05-10 00:00:00','2009-02-15 00:00:00',NULL,0,'2025-06-30 07:16:56','2025-06-30 07:16:56','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(66,'ac3d4882-08cf-4024-963d-f654e312b195','7f750739-c67a-4acc-9cd7-c133ddbcb7b1','ACCPAY','','','AUTHORISED','USD',1969.99,162.52,2132.51,2132.51,0,0,0,0,'2025-06-21 00:00:00','2025-07-27 00:00:00','2009-03-16 00:00:00',NULL,0,'2025-06-30 07:16:59','2025-06-30 07:16:59','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(67,'ac3d4882-08cf-4024-963d-f654e312b195','61127f1e-d938-4176-a72e-fd500d5b064f','ACCPAY','Rpt','','DELETED','USD',39,3.22,42.22,0,0,0,0,0,'2025-08-28 00:00:00','2025-06-27 00:00:00','2009-09-07 00:00:00',NULL,0,'2025-06-30 07:17:00','2025-06-30 07:17:00','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(68,'ac3d4882-08cf-4024-963d-f654e312b195','323103d0-050b-4538-9abd-b05894f176f5','ACCPAY','Rpt','','DELETED','USD',105,8.66,113.66,0,0,0,0,0,'2025-08-27 00:00:00','2025-09-14 00:00:00','2009-09-07 00:00:00',NULL,0,'2025-06-30 07:17:02','2025-06-30 07:17:02','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(69,'ac3d4882-08cf-4024-963d-f654e312b195','1ee8729f-0a1f-4e36-8a10-de4c087b92ab','ACCPAY','Rpt','','DELETED','USD',39,3.22,42.22,0,0,0,0,0,'2025-07-28 00:00:00','2025-09-04 00:00:00','2009-09-07 00:00:00',NULL,0,'2025-06-30 07:17:03','2025-06-30 07:17:03','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(70,'ac3d4882-08cf-4024-963d-f654e312b195','927cc424-d1b9-48c8-a6aa-c134b3bc74a4','ACCPAY','Rpt','','DELETED','USD',105,8.66,113.66,0,0,0,0,0,'2025-07-27 00:00:00','2025-08-17 00:00:00','2009-09-07 00:00:00',NULL,0,'2025-06-30 07:17:05','2025-06-30 07:17:05','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(71,'ac3d4882-08cf-4024-963d-f654e312b195','f8c11fab-d8b2-4fdc-a803-34501181df3b','ACCPAY','AP','','VOIDED','USD',55,4.54,59.54,0,0,0,0,0,'2025-07-06 00:00:00','2025-07-14 00:00:00','2009-09-07 00:00:00',NULL,0,'2025-06-30 07:17:06','2025-06-30 07:17:06','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(72,'ac3d4882-08cf-4024-963d-f654e312b195','a8beb072-5464-46ab-b437-cce25e6f2a0a','ACCPAY','AP','','VOIDED','USD',29,2.39,31.39,0,0,0,0,0,'2025-07-24 00:00:00','2025-08-08 00:00:00','2009-09-07 00:00:00',NULL,0,'2025-06-30 07:17:07','2025-06-30 07:17:07','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(73,'ac3d4882-08cf-4024-963d-f654e312b195','543f7cd8-323d-4baf-96b2-cb76831bccfb','ACCPAY','RENT','','VOIDED','USD',1091.22,90.03,1181.25,0,0,0,0,0,'2025-07-27 00:00:00','2025-08-08 00:00:00','2009-09-07 00:00:00',NULL,0,'2025-06-30 07:17:09','2025-06-30 07:17:09','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(74,'ac3d4882-08cf-4024-963d-f654e312b195','df852239-2d19-4313-8285-e94957a45020','ACCPAY','AP','','VOIDED','USD',55,4.54,59.54,0,0,0,0,0,'2025-08-06 00:00:00','2025-08-14 00:00:00','2009-09-07 00:00:00',NULL,0,'2025-06-30 07:17:10','2025-06-30 07:17:10','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(75,'ac3d4882-08cf-4024-963d-f654e312b195','57f74b0c-137d-4627-8c08-388f49a62510','ACCPAY','AP','','VOIDED','USD',29,2.39,31.39,0,0,0,0,0,'2025-08-24 00:00:00','2025-09-05 00:00:00','2009-09-07 00:00:00',NULL,0,'2025-06-30 07:17:12','2025-06-30 07:17:12','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(76,'ac3d4882-08cf-4024-963d-f654e312b195','2a35b64d-8564-43c8-a43f-e56b3f8dddcd','ACCPAY','RENT','','VOIDED','USD',1091.22,90.03,1181.25,0,0,0,0,0,'2025-08-27 00:00:00','2025-09-05 00:00:00','2009-09-07 00:00:00',NULL,0,'2025-06-30 07:17:13','2025-06-30 07:17:13','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(77,'ac3d4882-08cf-4024-963d-f654e312b195','1a29fe51-c155-4c8e-b91b-baa176655d23','ACCPAY','AP','','VOIDED','USD',55,4.54,59.54,0,0,0,0,0,'2025-09-04 00:00:00','2025-09-11 00:00:00','2009-09-07 00:00:00',NULL,0,'2025-06-30 07:17:15','2025-06-30 07:17:15','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(78,'ac3d4882-08cf-4024-963d-f654e312b195','f2b3f909-1472-4ee8-98ac-5045bacb5656','ACCPAY','GB1-White','','AUTHORISED','USD',775.98,64.02,840,840,0,0,0,0,'2025-06-24 00:00:00','2025-07-05 00:00:00','2010-09-29 00:00:00',NULL,0,'2025-06-30 07:17:16','2025-06-30 07:17:16','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(79,'ac3d4882-08cf-4024-963d-f654e312b195','93796a50-2fb6-4982-9ccd-01898b419ea0','ACCPAY','CS815','','AUTHORISED','USD',223.56,18.44,242,242,0,0,0,0,'2025-06-27 00:00:00','2025-07-03 00:00:00','2013-01-04 00:00:00',NULL,0,'2025-06-30 07:17:18','2025-06-30 07:17:18','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(80,'ac3d4882-08cf-4024-963d-f654e312b195','84f7c2d0-8383-46ed-bf45-17e00665ceab','ACCPAY','SM0195','','AUTHORISED','USD',1847.58,152.42,2000,2000,0,0,0,0,'2025-05-06 00:00:00','2025-05-17 00:00:00','2013-01-05 00:00:00',NULL,0,'2025-06-30 07:17:19','2025-06-30 07:17:19','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(81,'ac3d4882-08cf-4024-963d-f654e312b195','628fc0b0-e65c-47ef-a3e2-99632a1136e7','ACCPAY','SM0210','','AUTHORISED','USD',2309.47,190.53,2500,2500,0,0,0,0,'2025-06-16 00:00:00','2025-06-26 00:00:00','2013-01-05 00:00:00',NULL,0,'2025-06-30 07:17:21','2025-06-30 07:17:21','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(82,'ac3d4882-08cf-4024-963d-f654e312b195','bd63b5f1-5503-4c62-9c4a-e4b9e4257dc9','ACCREC','INV-0006','P/O 9711','AUTHORISED','USD',230.95,19.05,250,250,0,0,0,0,'2025-04-25 00:00:00','2025-05-05 00:00:00','2013-01-05 00:00:00',NULL,0,'2025-06-30 07:17:22','2025-06-30 07:17:22','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(83,'ac3d4882-08cf-4024-963d-f654e312b195','bbf21465-7a03-417d-b41d-48d3000e858e','ACCPAY','RENT','','PAID','USD',1091.22,90.03,1181.25,0,1181.25,0,0,0,'2025-06-16 00:00:00','2025-06-26 00:00:00','2013-01-05 00:00:00',NULL,0,'2025-06-30 07:17:23','2025-06-30 07:17:23','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(84,'ac3d4882-08cf-4024-963d-f654e312b195','361a4980-7f53-4b68-820c-f6487f613284','ACCPAY','','','PAID','USD',380,31.35,411.35,0,411.35,0,0,0,'2025-06-22 00:00:00','2025-07-23 00:00:00','2013-01-05 00:00:00',NULL,0,'2025-06-30 07:17:25','2025-06-30 07:17:25','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(85,'ac3d4882-08cf-4024-963d-f654e312b195','016a64c7-be0b-45a2-acae-13057fdf1566','ACCREC','INV-0026','','AUTHORISED','USD',844.85,69.7,914.55,914.55,0,0,0,0,'2025-06-26 00:00:00','2025-07-06 00:00:00','2013-01-07 00:00:00',NULL,0,'2025-06-30 07:17:26','2025-06-30 07:17:26','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(86,'ac3d4882-08cf-4024-963d-f654e312b195','88617351-56ed-4c14-a30d-34a006d0a75a','ACCREC','INV-0028','GB1-White','AUTHORISED','USD',216.93,17.07,234,234,0,0,0,0,'2025-06-26 00:00:00','2025-07-15 00:00:00','2013-01-14 00:00:00',NULL,0,'2025-06-30 07:17:29','2025-06-30 07:17:29','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(87,'ac3d4882-08cf-4024-963d-f654e312b195','f175784c-3ae0-4850-8504-46ad807181f7','ACCPAY','','','AUTHORISED','USD',120.09,9.91,130,130,0,0,0,0,'2025-06-21 00:00:00','2025-07-01 00:00:00','2013-01-14 00:00:00',NULL,0,'2025-06-30 07:17:31','2025-06-30 07:17:31','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(88,'ac3d4882-08cf-4024-963d-f654e312b195','463042ef-4343-4a5a-abb8-9a1a3e2e1057','ACCREC','INV-0011','Portal Proj','PAID','USD',1300,107.25,1407.25,0,1407.25,0,0,0,'2025-05-10 00:00:00','2025-05-27 00:00:00','2013-11-21 00:00:00',NULL,0,'2025-06-30 07:17:33','2025-06-30 07:17:33','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(89,'ac3d4882-08cf-4024-963d-f654e312b195','11e353a8-73f8-4f50-82e0-ff1a2ff8ffba','ACCREC','INV-0013','Training','PAID','USD',1000,82.5,1082.5,0,1082.5,0,0,0,'2025-05-15 00:00:00','2025-05-27 00:00:00','2013-11-21 00:00:00',NULL,0,'2025-06-30 07:17:34','2025-06-30 07:17:34','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(90,'ac3d4882-08cf-4024-963d-f654e312b195','cb43aadd-8836-4e95-aa2c-c4ba66c2ca9e','ACCREC','INV-0009','P/O CRM08-12','PAID','USD',5715.94,471.56,6187.5,0,6187.5,0,0,0,'2025-05-05 00:00:00','2025-05-27 00:00:00','2013-11-21 00:00:00',NULL,0,'2025-06-30 07:17:37','2025-06-30 07:17:37','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(91,'ac3d4882-08cf-4024-963d-f654e312b195','2c916a34-14fe-4b38-af86-6b0fcc371a89','ACCREC','INV-0022','Yr Ref W08-143','PAID','USD',219.95,18.25,238.2,0,216.5,21.7,0,0,'2025-05-27 00:00:00','2025-06-06 00:00:00','2013-11-21 00:00:00',NULL,0,'2025-06-30 07:17:38','2025-06-30 07:17:38','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(92,'ac3d4882-08cf-4024-963d-f654e312b195','1371f05a-4cd3-4760-99a9-e4cf8d98e7bb','ACCREC','INV-0018','Monthly Support','PAID','USD',500,41.25,541.25,0,541.25,0,0,0,'2025-05-27 00:00:00','2025-06-06 00:00:00','2013-11-21 00:00:00',NULL,0,'2025-06-30 07:17:41','2025-06-30 07:17:41','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(93,'ac3d4882-08cf-4024-963d-f654e312b195','f0065405-e5ad-4c34-ad5b-645e72813c03','ACCREC','INV-0019','Monthly Support','PAID','USD',500,41.25,541.25,0,541.25,0,0,0,'2025-05-27 00:00:00','2025-06-06 00:00:00','2013-11-21 00:00:00',NULL,0,'2025-06-30 07:17:42','2025-06-30 07:17:42','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(94,'ac3d4882-08cf-4024-963d-f654e312b195','72860d4a-207b-4f24-895d-167ffd44ae00','ACCREC','INV-0020','Monthly Support','PAID','USD',500,41.25,541.25,0,541.25,0,0,0,'2025-05-27 00:00:00','2025-06-06 00:00:00','2013-11-21 00:00:00',NULL,0,'2025-06-30 07:17:43','2025-06-30 07:17:43','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(95,'ac3d4882-08cf-4024-963d-f654e312b195','1ee8363f-097f-4fb3-a452-8068b947e75e','ACCREC','INV-0021','Monthly Support','PAID','USD',500,41.25,541.25,0,541.25,0,0,0,'2025-05-27 00:00:00','2025-06-06 00:00:00','2013-11-21 00:00:00',NULL,0,'2025-06-30 07:17:45','2025-06-30 07:17:45','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(96,'ac3d4882-08cf-4024-963d-f654e312b195','2a578929-58bf-4eca-90db-1356383aeecb','ACCPAY','Dep','','PAID','USD',1500,0,1500,0,1500,0,0,0,'2025-05-27 00:00:00','2025-06-06 00:00:00','2013-11-21 00:00:00',NULL,0,'2025-06-30 07:17:46','2025-06-30 07:17:46','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(97,'ac3d4882-08cf-4024-963d-f654e312b195','12d3bc5a-efe2-4093-b0e3-f6474ef7596d','ACCPAY','08-4123','','PAID','USD',5500,453.75,5953.75,0,5953.75,0,0,0,'2025-05-27 00:00:00','2025-06-06 00:00:00','2013-11-21 00:00:00',NULL,0,'2025-06-30 07:17:48','2025-06-30 07:17:48','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(98,'ac3d4882-08cf-4024-963d-f654e312b195','6e74d1a5-e95b-406d-8d96-7d8752fa388e','ACCPAY','710','','PAID','USD',923.79,76.21,1000,0,1000,0,0,0,'2025-06-06 00:00:00','2025-06-06 00:00:00','2013-11-21 00:00:00',NULL,0,'2025-06-30 07:17:49','2025-06-30 07:17:49','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(99,'ac3d4882-08cf-4024-963d-f654e312b195','4286e4ee-cc4a-4d74-9568-10935b3600bb','ACCREC','INV-0016','Yr Ref W08-143','AUTHORISED','USD',775,63.94,838.94,270.63,568.31,0,0,0,'2025-05-17 00:00:00','2025-05-27 00:00:00','2013-11-21 00:00:00',NULL,0,'2025-06-30 07:17:51','2025-06-30 07:17:51','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(100,'ac3d4882-08cf-4024-963d-f654e312b195','bc532b0e-dfa7-44fd-99d9-1d24acd55b1c','ACCPAY','RENT','','PAID','USD',1091.22,90.03,1181.25,0,1181.25,0,0,0,'2025-05-27 00:00:00','2025-05-27 00:00:00','2013-11-21 00:00:00',NULL,0,'2025-06-30 07:17:53','2025-06-30 07:17:53','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(101,'ac3d4882-08cf-4024-963d-f654e312b195','9d9cd0fc-661b-49fb-9062-6e50c139b78b','ACCPAY','Rpt','','PAID','USD',43.25,3.57,46.82,0,46.82,0,0,0,'2025-05-28 00:00:00','2025-06-06 00:00:00','2013-11-21 00:00:00',NULL,0,'2025-06-30 07:17:55','2025-06-30 07:17:55','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(102,'ac3d4882-08cf-4024-963d-f654e312b195','47b97878-df82-4330-b731-80610cce65d1','ACCPAY','Rpt','','PAID','USD',125.5,10.35,135.85,0,135.85,0,0,0,'2025-05-27 00:00:00','2025-06-06 00:00:00','2013-11-21 00:00:00',NULL,0,'2025-06-30 07:17:56','2025-06-30 07:17:56','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(103,'ac3d4882-08cf-4024-963d-f654e312b195','1bba28a1-2807-4d2e-86a0-c418a91ac12f','ACCREC','INV-0030','Monthly support','DRAFT','USD',508.08,41.92,550,550,0,0,0,0,'2025-06-25 00:00:00','2025-07-10 00:00:00','2016-06-24 00:00:00',NULL,0,'2025-06-30 07:17:58','2025-06-30 07:17:58','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(104,'ac3d4882-08cf-4024-963d-f654e312b195','3f4a783e-6e80-4062-9300-4df2524e8bf7','ACCREC','INV-0029','Monthly support','DRAFT','USD',508.08,41.92,550,550,0,0,0,0,'2025-06-25 00:00:00','2025-07-10 00:00:00','2016-06-24 00:00:00',NULL,0,'2025-06-30 07:18:00','2025-06-30 07:18:00','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(105,'ac3d4882-08cf-4024-963d-f654e312b195','57bf3de4-016b-4813-a81a-5379940a06b9','ACCPAY','Expense Claims','','AUTHORISED','USD',18.9,0,18.9,18.9,0,0,0,0,'2017-07-19 00:00:00','2025-06-27 00:00:00','2025-06-27 00:00:00',NULL,0,'2025-06-30 07:18:01','2025-06-30 07:18:01','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47'),(106,'ac3d4882-08cf-4024-963d-f654e312b195','d927c2a8-01f6-442c-a690-b41eb247ece4','ACCREC','INV-0031','','AUTHORISED','USD',605.61,49.99,655.6,655.6,0,0,0,0,'2025-06-30 00:00:00','2025-07-02 00:00:00','2025-06-30 00:00:00',NULL,0,'2025-06-30 07:18:03','2025-06-30 07:18:03','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195','2025-06-27 07:22:47','2025-06-27 07:22:47');
/*!40000 ALTER TABLE `xero_invoices` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-30 17:51:39
