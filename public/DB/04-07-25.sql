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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (7,'0001_01_01_000000_create_users_table',1),(8,'0001_01_01_000001_create_cache_table',1),(9,'0001_01_01_000002_create_jobs_table',1),(10,'2025_06_30_043756_create_xero_invoices_table',1),(11,'2025_06_30_064829_add_tenant_columns_to_xero_invoices_table',1),(12,'2025_06_30_111717_create_xero_invoice_items_table',1),(13,'2025_07_03_100942_create_xero_tokens_table',2),(14,'2025_07_03_102801_create_sync_logs_table',3),(15,'2025_07_03_102942_add_last_synced_at_to_xero_tokens_table',3),(16,'2025_07_03_103043_create_sync_logs_table',4),(17,'2025_07_03_111439_alter_expires_at_column_type_on_xero_tokens_table',5),(18,'2025_07_04_044815_create_xero_contacts_table',6),(19,'2025_07_04_045716_add_contact_id_to_xero_invoices_table',7),(20,'2025_07_04_060625_add_fields_to_xero_contacts_table',8);
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
INSERT INTO `sessions` VALUES ('zRWdXh7nraX5NMMLZsjsbJMcXeoofOSMBqk0WXK8',2,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoicVJ4dFh4ek90dzlsR0oyNEpjbkVROUxFN1JSRnZsSVpYaHJOQVNHMCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjkyOiJodHRwOi8vbG9jYWxob3N0OjgwMDAveGVyby9pbnZvaWNlcy9leUpwZGlJNkltSmFWalJLU1doTmFqRjVOMVp4Um5wcWVUaFZjVkU5UFNJc0luWmhiSFZsSWpvaVlVRmFWVGxuY3pSMWJqSjVMMUpyZVRoRWNuUjRZbk5FY21WRFFTdHBVMHhyU1VWdGMxUTJOa3BDT0ZobWFHUkdhakphYVdJeFRreEhRa0pWS3pkT1p5SXNJbTFoWXlJNkltVXhOV1JtTkRZM05EZzFNak16TkRGaE1qSTNNakkzT0RSbE1XSm1aREpqTlRNNVlXSXlZekJtTXpVME1qY3lOREUzT0dJME5qbGlabVF6TVRObU5qUWlMQ0owWVdjaU9pSWlmUT09Ijt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjtzOjExOiJvYXV0aDJzdGF0ZSI7czozMjoiM2Y1OGEwMzliODVhMTY1OTg2MTZiMWVjMjAwN2E4OGEiO30=',1751609581);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sync_logs`
--

DROP TABLE IF EXISTS `sync_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sync_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tenant_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tenant_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sync_logs`
--

LOCK TABLES `sync_logs` WRITE;
/*!40000 ALTER TABLE `sync_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `sync_logs` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Hammad Naseer','hammad.naseer@f3technologies.com',NULL,'$2y$10$wkkJ9Bqip7wnqTlj8AYkNexY4eZCZZn7c13QdM8X8iP2cf5mvNjAK',NULL,'2025-06-30 02:21:11','2025-06-30 02:21:11'),(2,'Hammad Ali','hammad.ali@f3technologies.eu',NULL,'$2y$12$L.S4Y73wLI.F5tF6sbUyf.mkrEGCMbU7oh789Ba2caicyUAlK1ApW',NULL,'2025-07-02 01:29:39','2025-07-02 01:29:39');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xero_contacts`
--

DROP TABLE IF EXISTS `xero_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xero_contacts` (
  `contact_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tenant_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xero_contacts`
--

LOCK TABLES `xero_contacts` WRITE;
/*!40000 ALTER TABLE `xero_contacts` DISABLE KEYS */;
INSERT INTO `xero_contacts` VALUES ('021b18f8-b62f-4d8a-889e-71fd5427892a','ac3d4882-08cf-4024-963d-f654e312b195','Young Bros Transport',NULL,NULL,'2025-07-04 01:11:26','2025-07-04 01:11:26',NULL,NULL,NULL,NULL),('1d80716b-427e-4cad-80c6-c4b3a18eb23d','ac3d4882-08cf-4024-963d-f654e312b195','Hoyt Productions',NULL,NULL,'2025-07-04 01:12:44','2025-07-04 01:12:44',NULL,NULL,NULL,NULL),('2aaaeb6b-b519-4698-9b0a-f74ba1d39be6','ac3d4882-08cf-4024-963d-f654e312b195','Petrie McLoud Watson & Associates',NULL,NULL,'2025-07-04 01:12:29','2025-07-04 01:12:29',NULL,NULL,NULL,NULL),('2e68080d-b3bd-4051-b33c-9f031550b958','ac3d4882-08cf-4024-963d-f654e312b195','24 Locks',NULL,NULL,'2025-07-04 01:12:58','2025-07-04 01:12:58',NULL,NULL,NULL,NULL),('378f211a-64c2-4327-bab3-9b057f4f51d9','ac3d4882-08cf-4024-963d-f654e312b195','Port & Philip Freight',NULL,NULL,'2025-07-04 01:11:29','2025-07-04 01:11:29',NULL,NULL,NULL,NULL),('37918a06-92f6-4edb-bfe0-1fc041c90f8b','ac3d4882-08cf-4024-963d-f654e312b195','Boom FM',NULL,NULL,'2025-07-04 01:11:13','2025-07-04 01:11:13',NULL,NULL,NULL,NULL),('39efa556-8dda-4c81-83d3-a631e59eb6d3','ac3d4882-08cf-4024-963d-f654e312b195','ABC Furniture',NULL,NULL,'2025-07-04 01:12:46','2025-07-04 01:12:46',NULL,NULL,NULL,NULL),('3b30a108-9156-4a42-a893-3bbbe7af1ef8','ac3d4882-08cf-4024-963d-f654e312b195','Xero',NULL,NULL,'2025-07-04 01:11:11','2025-07-04 01:11:11',NULL,NULL,NULL,NULL),('3cbd5263-0965-4c4e-932c-bf50e3297610','ac3d4882-08cf-4024-963d-f654e312b195','Rex Media Group',NULL,NULL,'2025-07-04 01:11:30','2025-07-04 01:11:30',NULL,NULL,NULL,NULL),('3f58af86-b4d9-4ac9-950c-2e4cdd94d5be','ac3d4882-08cf-4024-963d-f654e312b195','SMART Agency',NULL,NULL,'2025-07-04 01:12:15','2025-07-04 01:12:15',NULL,NULL,NULL,NULL),('47f61ab1-5245-40a2-a3a5-bc224c850c8d','ac3d4882-08cf-4024-963d-f654e312b195','Bank West',NULL,NULL,'2025-07-04 01:11:32','2025-07-04 01:11:32',NULL,NULL,NULL,NULL),('4ad99fdf-a0cc-4aaa-a1a6-6a1549b9df40','ac3d4882-08cf-4024-963d-f654e312b195','Carlton Functions',NULL,NULL,'2025-07-04 01:12:43','2025-07-04 01:12:43',NULL,NULL,NULL,NULL),('537d4d64-2fc1-4521-89c3-489d20fae20d','ac3d4882-08cf-4024-963d-f654e312b195','MCO Cleaning Services',NULL,NULL,'2025-07-04 01:11:37','2025-07-04 01:11:37',NULL,NULL,NULL,NULL),('5b96e86b-418e-48e8-8949-308c14aec278','ac3d4882-08cf-4024-963d-f654e312b195','Marine Systems',NULL,NULL,'2025-07-04 01:11:09','2025-07-04 01:11:09',NULL,NULL,NULL,NULL),('65a44264-dea0-481a-b49d-18a334a72334','ac3d4882-08cf-4024-963d-f654e312b195','Ridgeway University',NULL,NULL,'2025-07-04 01:11:45','2025-07-04 01:11:45',NULL,NULL,NULL,NULL),('78b7299c-4f1f-46d2-acc3-44a46bd361b1','ac3d4882-08cf-4024-963d-f654e312b195','Swanston Security',NULL,NULL,'2025-07-04 01:11:10','2025-07-04 01:11:10',NULL,NULL,NULL,NULL),('7c913d33-39d5-4a1c-b8b1-e23f5fc999e0','ac3d4882-08cf-4024-963d-f654e312b195','City Limousines',NULL,NULL,'2025-07-04 01:11:16','2025-07-04 01:11:16',NULL,NULL,NULL,NULL),('7ffcb6b1-9d0e-49ce-b3f4-7f29a8d59f97','ac3d4882-08cf-4024-963d-f654e312b195','Hammad Ali',NULL,NULL,'2025-07-04 01:12:57','2025-07-04 01:12:57',NULL,NULL,'65220c0c5b54ea5e35ca38839977cc97951cad1dad0e0266c3',NULL),('85d15bf3-207f-4278-8449-e12dade98c66','ac3d4882-08cf-4024-963d-f654e312b195','Basket Case',NULL,NULL,'2025-07-04 01:12:23','2025-07-04 01:12:23',NULL,NULL,NULL,NULL),('8f48b066-e047-459d-80dd-d495b36608d0','ac3d4882-08cf-4024-963d-f654e312b195','PowerDirect',NULL,NULL,'2025-07-04 01:11:20','2025-07-04 01:11:20',NULL,NULL,NULL,NULL),('a3cf95c5-9d26-42e1-80c0-69e5f24886d3','ac3d4882-08cf-4024-963d-f654e312b195','DIISR - Small Business Services',NULL,NULL,'2025-07-04 01:12:34','2025-07-04 01:12:34',NULL,NULL,NULL,NULL),('aacecb74-ef1e-44e0-ba52-0bc521639697','ac3d4882-08cf-4024-963d-f654e312b195','PC Complete',NULL,NULL,'2025-07-04 01:11:22','2025-07-04 01:11:22',NULL,NULL,NULL,NULL),('b553bc60-5fb9-4d5e-b604-71aaf657cd3d','ac3d4882-08cf-4024-963d-f654e312b195','Net Connect',NULL,NULL,'2025-07-04 01:11:23','2025-07-04 01:11:23',NULL,NULL,NULL,NULL),('b68deed5-49c8-416a-9f35-2ab14bb1fb6b','ac3d4882-08cf-4024-963d-f654e312b195','Bayside Club',NULL,NULL,'2025-07-04 01:12:25','2025-07-04 01:12:25',NULL,NULL,NULL,NULL),('c01292e3-1a1a-4a70-b120-1218f8f71096','ac3d4882-08cf-4024-963d-f654e312b195','Bayside Wholesale',NULL,NULL,'2025-07-04 01:12:12','2025-07-04 01:12:12',NULL,NULL,NULL,NULL),('cade9142-f5fe-4970-b39e-2f388b8740c0','ac3d4882-08cf-4024-963d-f654e312b195','Central Copiers',NULL,NULL,'2025-07-04 01:11:35','2025-07-04 01:11:35',NULL,NULL,NULL,NULL),('ddd4ba65-9b7e-4adf-be7a-e91efbb6c082','ac3d4882-08cf-4024-963d-f654e312b195','Gateway Motors',NULL,NULL,'2025-07-04 01:12:21','2025-07-04 01:12:21',NULL,NULL,NULL,NULL),('f4af0a9b-e710-4611-8618-4360944ce1f3','ac3d4882-08cf-4024-963d-f654e312b195','Truxton Property Management',NULL,NULL,'2025-07-04 01:11:19','2025-07-04 01:11:19',NULL,NULL,NULL,NULL),('f93cd75c-9412-4a8c-91a3-b41fe751aa01','ac3d4882-08cf-4024-963d-f654e312b195','Capital Cab Co',NULL,NULL,'2025-07-04 01:12:14','2025-07-04 01:12:14',NULL,NULL,NULL,NULL),('fa52f698-1244-47cd-8fb9-5f32b6490a55','ac3d4882-08cf-4024-963d-f654e312b195','City Agency',NULL,NULL,'2025-07-04 01:11:52','2025-07-04 01:11:52',NULL,NULL,NULL,NULL),('fd89489e-699c-4d77-a881-10c127bfbeb3','ac3d4882-08cf-4024-963d-f654e312b195','Hamilton Smith Ltd',NULL,NULL,'2025-07-04 01:11:14','2025-07-04 01:11:14',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `xero_contacts` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xero_invoice_items`
--

LOCK TABLES `xero_invoice_items` WRITE;
/*!40000 ALTER TABLE `xero_invoice_items` DISABLE KEYS */;
INSERT INTO `xero_invoice_items` VALUES (41,'fee88eea-f2aa-4a71-a372-33d6d83d3c45','Marketing guides',4.0000,99.0000,396.0000,NULL,30.1800,'2025-07-04 01:11:09','2025-07-04 01:11:09'),(42,'9f5bca33-8590-4b6f-acfb-e85712b10217','Our share building doorman/security',1.0000,55.0000,55.0000,NULL,4.5400,'2025-07-04 01:11:10','2025-07-04 01:11:10'),(43,'8a3fdcc9-83eb-4fdd-83e0-52ec1b40b072','Monthly subscription',1.0000,29.0000,29.0000,NULL,2.3900,'2025-07-04 01:11:12','2025-07-04 01:11:12'),(44,'4c4db294-3633-45cd-8706-f0b3b0079609','Half day training - Microsoft Office',1.0000,500.0000,500.0000,'Train-MS',41.2500,'2025-07-04 01:11:13','2025-07-04 01:11:13'),(45,'b7e0c5f4-9f52-4126-b102-45fd12eaa3ca','Desktop/network support via email & phone.\r\nPer month fixed fee for minimum 20 hours/month.',1.0000,500.0000,500.0000,'Support-M',41.2500,'2025-07-04 01:11:15','2025-07-04 01:11:15'),(46,'07e71ce4-9801-4cce-914b-dc07e9c0ca5e','\'Fish out of Water: Finding Your Brand\'',1.0000,19.9500,19.9500,'BOOK',1.7500,'2025-07-04 01:11:16','2025-07-04 01:11:16'),(47,'3a669bd8-b601-4b9a-81d4-cb03f1af3059','Monthly subscription',1.0000,29.0000,29.0000,NULL,2.3900,'2025-07-04 01:11:18','2025-07-04 01:11:18'),(48,'6a77611c-f9af-483b-aa6e-d0fd23137394','Monthy rent in advance',1.0000,1181.2500,1181.2500,NULL,90.0300,'2025-07-04 01:11:19','2025-07-04 01:11:19'),(49,'28a34ad7-6c41-4d92-8312-cd07f8328e90','Monthly power supply',1.0000,110.0000,110.0000,NULL,9.0800,'2025-07-04 01:11:21','2025-07-04 01:11:21'),(50,'824c6c13-b7a5-49a2-99bd-4a6d77f7866e','Laptop (Oliver)',1.0000,1804.5000,1804.5000,NULL,148.8700,'2025-07-04 01:11:22','2025-07-04 01:11:22'),(51,'236985ea-21a5-4b17-afb9-c16ff9ff3e27','Cable internet',1.0000,41.5000,41.5000,NULL,3.4200,'2025-07-04 01:11:24','2025-07-04 01:11:24'),(52,'cb5119d0-9759-49d3-800b-7d0a90818178','Desktop/network support via email & phone.\r\nPer month fixed fee for minimum 20 hours/month.',1.0000,500.0000,500.0000,'Support-M',41.2500,'2025-07-04 01:11:25','2025-07-04 01:11:25'),(53,'ac4883f6-fb22-4f55-9ed1-34929fc53c78','Desktop/network support via email & phone.\r\nPer month fixed fee for minimum 20 hours/month.',1.0000,500.0000,500.0000,'Support-M',41.2500,'2025-07-04 01:11:26','2025-07-04 01:11:26'),(54,'1938eac0-c2dc-48f1-b4e1-b3ae59362f9b','Monthly subscription',1.0000,29.0000,29.0000,NULL,2.3900,'2025-07-04 01:11:28','2025-07-04 01:11:28'),(55,'f61d2da2-3957-42f7-b268-6117b957794e','Desktop/network support via email & phone.\r\nPer month fixed fee for minimum 20 hours/month.',1.0000,500.0000,500.0000,'Support-M',41.2500,'2025-07-04 01:11:29','2025-07-04 01:11:29'),(56,'043ce7df-fc3d-4e6b-b505-34579d0490f3','Desktop/network support via email & phone.\r\nPer month fixed fee for minimum 20 hours/month.',1.0000,500.0000,500.0000,'Support-M',41.2500,'2025-07-04 01:11:31','2025-07-04 01:11:31'),(57,'64f222d5-e59a-43e0-8f6b-69f87e42a527','Half day training - Microsoft Office - for your Priority Mortgage Services Team (Session 3)',1.0000,400.0000,400.0000,'Train-MS',33.0000,'2025-07-04 01:11:32','2025-07-04 01:11:32'),(58,'64f222d5-e59a-43e0-8f6b-69f87e42a527','Half day training - Microsoft Office - for your Lending Services Team (Session 2)',1.0000,400.0000,400.0000,'Train-MS',33.0000,'2025-07-04 01:11:33','2025-07-04 01:11:33'),(59,'64f222d5-e59a-43e0-8f6b-69f87e42a527','Half day training - Microsoft Office - for your Customer Support Team (Session 1)',1.0000,400.0000,400.0000,'Train-MS',33.0000,'2025-07-04 01:11:34','2025-07-04 01:11:34'),(60,'14aa8bd8-7473-42c7-b8bc-ca83d7a75236','Photocopier repair & drum replacement',1.0000,982.5000,982.5000,NULL,81.0600,'2025-07-04 01:11:36','2025-07-04 01:11:36'),(61,'9a4a5e48-56fb-4ec6-9c3b-07c947239372','Office Cleaning for month',1.0000,110.0000,110.0000,NULL,9.0800,'2025-07-04 01:11:37','2025-07-04 01:11:37'),(62,'ffbb9f34-f7d7-4f55-91cb-af89552ecdd7','Our share building doorman/security',1.0000,55.0000,55.0000,NULL,4.5400,'2025-07-04 01:11:39','2025-07-04 01:11:39'),(63,'5fe76602-3f0d-48e6-88b6-aadfab4829a8','Network diagnostics software',1.0000,500.0000,500.0000,NULL,43.7500,'2025-07-04 01:11:40','2025-07-04 01:11:40'),(64,'5fe76602-3f0d-48e6-88b6-aadfab4829a8','Replacement hub & network switches',1.0000,850.0000,850.0000,NULL,70.1300,'2025-07-04 01:11:41','2025-07-04 01:11:41'),(65,'0bd7b530-d244-4716-a93e-710de7c61b76','DVD writer for laptop',1.0000,250.0000,250.0000,NULL,20.6300,'2025-07-04 01:11:43','2025-07-04 01:11:43'),(66,'a909dda4-555b-414b-a395-ba7a4077de72','Development work - develper onsite per day',1.0000,650.0000,650.0000,'DevD',53.6300,'2025-07-04 01:11:44','2025-07-04 01:11:44'),(67,'3f887d04-cbd9-4853-b594-bc1ab207558c','Onsite project management for CRM Project 3 days/week',1.0000,6187.5000,6187.5000,NULL,471.5600,'2025-07-04 01:11:46','2025-07-04 01:11:46'),(68,'50e1cbd2-86c6-42df-9538-5691dd54bbee','Project management & implementation - branding workshop with your team - follow up session',1.0000,200.0000,200.0000,'PMBr',16.5000,'2025-07-04 01:11:47','2025-07-04 01:11:47'),(69,'6b99fc0b-e148-458d-aa8b-da550803c93e','Delivery of new reception desk',1.0000,115.5000,115.5000,NULL,9.5300,'2025-07-04 01:11:49','2025-07-04 01:11:49'),(70,'7a69814e-dc6f-4c8b-80ad-cfe9c78c2763','Monthly power supply',1.0000,100.3200,100.3200,NULL,8.2800,'2025-07-04 01:11:50','2025-07-04 01:11:50'),(71,'08e6466f-29f3-4af7-aeac-102944c10033','Cable internet',1.0000,50.0000,50.0000,NULL,4.1300,'2025-07-04 01:11:51','2025-07-04 01:11:51'),(72,'50a8143e-f9a5-4b84-8560-0daeba260020','Project management & implementation - branding workshop with your team\r\n========================\r\n\r\n- \'Buzz Words\' session with your Steering Group\r\n- Analysis of current marketing materials\r\n- Workshop on re-brand outcomes and stakeholder identification\r\n\r\n- Analysis and presentation of findings to your Steering Group & Board',1.0000,500.0000,500.0000,'PMBr',41.2500,'2025-07-04 01:11:53','2025-07-04 01:11:53'),(73,'50a8143e-f9a5-4b84-8560-0daeba260020','Copies of \'Fish out of Water\' text for your Branding Team',4.0000,11.9500,47.8000,NULL,4.1800,'2025-07-04 01:11:54','2025-07-04 01:11:54'),(74,'7f750739-c67a-4acc-9cd7-c133ddbcb7b1','Laptop (Tracy)',1.0000,1969.9900,1969.9900,NULL,162.5200,'2025-07-04 01:11:55','2025-07-04 01:11:55'),(75,'61127f1e-d938-4176-a72e-fd500d5b064f','Cable internet',1.0000,39.0000,39.0000,NULL,3.2200,'2025-07-04 01:11:57','2025-07-04 01:11:57'),(76,'323103d0-050b-4538-9abd-b05894f176f5','Monthly power supply',1.0000,105.0000,105.0000,NULL,8.6600,'2025-07-04 01:11:58','2025-07-04 01:11:58'),(77,'1ee8729f-0a1f-4e36-8a10-de4c087b92ab','Cable internet',1.0000,39.0000,39.0000,NULL,3.2200,'2025-07-04 01:12:00','2025-07-04 01:12:00'),(78,'927cc424-d1b9-48c8-a6aa-c134b3bc74a4','Monthly power supply',1.0000,105.0000,105.0000,NULL,8.6600,'2025-07-04 01:12:01','2025-07-04 01:12:01'),(79,'f8c11fab-d8b2-4fdc-a803-34501181df3b','Our share building doorman/security',1.0000,55.0000,55.0000,NULL,4.5400,'2025-07-04 01:12:03','2025-07-04 01:12:03'),(80,'a8beb072-5464-46ab-b437-cce25e6f2a0a','Monthly subscription',1.0000,29.0000,29.0000,NULL,2.3900,'2025-07-04 01:12:04','2025-07-04 01:12:04'),(81,'543f7cd8-323d-4baf-96b2-cb76831bccfb','Monthy rent in advance',1.0000,1181.2500,1181.2500,NULL,90.0300,'2025-07-04 01:12:06','2025-07-04 01:12:06'),(82,'df852239-2d19-4313-8285-e94957a45020','Our share building doorman/security',1.0000,55.0000,55.0000,NULL,4.5400,'2025-07-04 01:12:07','2025-07-04 01:12:07'),(83,'57f74b0c-137d-4627-8c08-388f49a62510','Monthly subscription',1.0000,29.0000,29.0000,NULL,2.3900,'2025-07-04 01:12:08','2025-07-04 01:12:08'),(84,'2a35b64d-8564-43c8-a43f-e56b3f8dddcd','Monthy rent in advance',1.0000,1181.2500,1181.2500,NULL,90.0300,'2025-07-04 01:12:10','2025-07-04 01:12:10'),(85,'1a29fe51-c155-4c8e-b91b-baa176655d23','Our share building doorman/security',1.0000,55.0000,55.0000,NULL,4.5400,'2025-07-04 01:12:11','2025-07-04 01:12:11'),(86,'f2b3f909-1472-4ee8-98ac-5045bacb5656','Golf balls - white single',200.0000,4.2000,840.0000,'GB1-White',64.0200,'2025-07-04 01:12:13','2025-07-04 01:12:13'),(87,'93796a50-2fb6-4982-9ccd-01898b419ea0','Taxi services',1.0000,242.0000,242.0000,NULL,18.4400,'2025-07-04 01:12:14','2025-07-04 01:12:14'),(88,'84f7c2d0-8383-46ed-bf45-17e00665ceab','Design concepts for Oaktown Business Leader ad series',1.0000,2000.0000,2000.0000,NULL,152.4200,'2025-07-04 01:12:16','2025-07-04 01:12:16'),(89,'628fc0b0-e65c-47ef-a3e2-99632a1136e7','Prototype media banner & print mockups for Oaktown Business Leader ad series',1.0000,2500.0000,2500.0000,NULL,190.5300,'2025-07-04 01:12:17','2025-07-04 01:12:17'),(90,'bd63b5f1-5503-4c62-9c4a-e4b9e4257dc9','Project management & implementation - branding workshop with your team',1.0000,250.0000,250.0000,'PMBr',19.0500,'2025-07-04 01:12:19','2025-07-04 01:12:19'),(91,'bbf21465-7a03-417d-b41d-48d3000e858e','Monthy rent in advance',1.0000,1181.2500,1181.2500,NULL,90.0300,'2025-07-04 01:12:20','2025-07-04 01:12:20'),(92,'361a4980-7f53-4b68-820c-f6487f613284','Annual service company car',1.0000,380.0000,380.0000,NULL,31.3500,'2025-07-04 01:12:22','2025-07-04 01:12:22'),(93,'016a64c7-be0b-45a2-acae-13057fdf1566','Development work - per hour rate',5.0000,94.0000,470.0000,'DevH',35.8200,'2025-07-04 01:12:23','2025-07-04 01:12:23'),(94,'016a64c7-be0b-45a2-acae-13057fdf1566','Project team meeting to discuss dev changes required to your online gift basket ordering system',1.0000,444.5500,444.5500,NULL,33.8800,'2025-07-04 01:12:24','2025-07-04 01:12:24'),(95,'88617351-56ed-4c14-a30d-34a006d0a75a','Golf balls - white single',40.0000,5.6000,224.0000,'GB1-White',17.0700,'2025-07-04 01:12:25','2025-07-04 01:12:25'),(96,'88617351-56ed-4c14-a30d-34a006d0a75a','Delivery charge',1.0000,10.0000,10.0000,NULL,0.0000,'2025-07-04 01:12:26','2025-07-04 01:12:26'),(97,'f175784c-3ae0-4850-8504-46ad807181f7','Room hire',1.0000,130.0000,130.0000,NULL,9.9100,'2025-07-04 01:12:28','2025-07-04 01:12:28'),(98,'463042ef-4343-4a5a-abb8-9a1a3e2e1057','Development work - develper onsite per day',2.0000,650.0000,1300.0000,'DevD',107.2500,'2025-07-04 01:12:29','2025-07-04 01:12:29'),(99,'11e353a8-73f8-4f50-82e0-ff1a2ff8ffba','Half day training - Microsoft Office - reception staff (Session 1)',1.0000,500.0000,500.0000,'Train-MS',41.2500,'2025-07-04 01:12:31','2025-07-04 01:12:31'),(100,'11e353a8-73f8-4f50-82e0-ff1a2ff8ffba','Half day training - Microsoft Office - operations staff (Session 2)',1.0000,500.0000,500.0000,'Train-MS',41.2500,'2025-07-04 01:12:32','2025-07-04 01:12:32'),(101,'cb43aadd-8836-4e95-aa2c-c4ba66c2ca9e','Onsite project management for CRM Project 3 days/week',1.0000,6187.5000,6187.5000,NULL,471.5600,'2025-07-04 01:12:33','2025-07-04 01:12:33'),(102,'2c916a34-14fe-4b38-af86-6b0fcc371a89','\'Fish out of Water: Finding Your Brand\'',1.0000,19.9500,19.9500,'BOOK',1.7500,'2025-07-04 01:12:35','2025-07-04 01:12:35'),(103,'2c916a34-14fe-4b38-af86-6b0fcc371a89','Project management & implementation - branding workshop with your team - follow up',1.0000,200.0000,200.0000,'PMBr',16.5000,'2025-07-04 01:12:36','2025-07-04 01:12:36'),(104,'1371f05a-4cd3-4760-99a9-e4cf8d98e7bb','Desktop/network support via email & phone.\r\nPer month fixed fee for minimum 20 hours/month.',1.0000,500.0000,500.0000,'Support-M',41.2500,'2025-07-04 01:12:37','2025-07-04 01:12:37'),(105,'f0065405-e5ad-4c34-ad5b-645e72813c03','Desktop/network support via email & phone.\r\nPer month fixed fee for minimum 20 hours/month.',1.0000,500.0000,500.0000,'Support-M',41.2500,'2025-07-04 01:12:39','2025-07-04 01:12:39'),(106,'72860d4a-207b-4f24-895d-167ffd44ae00','Desktop/network support via email & phone.\r\nPer month fixed fee for minimum 20 hours/month.',1.0000,500.0000,500.0000,'Support-M',41.2500,'2025-07-04 01:12:40','2025-07-04 01:12:40'),(107,'1ee8363f-097f-4fb3-a452-8068b947e75e','Desktop/network support via email & phone.\r\nPer month fixed fee for minimum 20 hours/month.',1.0000,500.0000,500.0000,'Support-M',41.2500,'2025-07-04 01:12:42','2025-07-04 01:12:42'),(108,'2a578929-58bf-4eca-90db-1356383aeecb','Deposit on venue hire for client function',1.0000,1500.0000,1500.0000,NULL,0.0000,'2025-07-04 01:12:43','2025-07-04 01:12:43'),(109,'12d3bc5a-efe2-4093-b0e3-f6474ef7596d','20-second still frame ad shown in 5 city cinemas 5 times each',1.0000,5500.0000,5500.0000,NULL,453.7500,'2025-07-04 01:12:45','2025-07-04 01:12:45'),(110,'6e74d1a5-e95b-406d-8d96-7d8752fa388e','Coffee table for reception',1.0000,1000.0000,1000.0000,NULL,76.2100,'2025-07-04 01:12:46','2025-07-04 01:12:46'),(111,'4286e4ee-cc4a-4d74-9568-10935b3600bb','Project management & implementation - branding workshop with your team',1.0000,250.0000,250.0000,'PMBr',20.6300,'2025-07-04 01:12:48','2025-07-04 01:12:48'),(112,'4286e4ee-cc4a-4d74-9568-10935b3600bb','Project management & implementation - \'due diligence\' stocktake of your project scope/schedule/implementation plan/outcome measures (hourly rate as agreed)',5.0000,105.0000,525.0000,'PMDD',43.3100,'2025-07-04 01:12:49','2025-07-04 01:12:49'),(113,'bc532b0e-dfa7-44fd-99d9-1d24acd55b1c','Monthy rent in advance',1.0000,1181.2500,1181.2500,NULL,90.0300,'2025-07-04 01:12:50','2025-07-04 01:12:50'),(114,'9d9cd0fc-661b-49fb-9062-6e50c139b78b','Cable internet',1.0000,43.2500,43.2500,NULL,3.5700,'2025-07-04 01:12:52','2025-07-04 01:12:52'),(115,'47b97878-df82-4330-b731-80610cce65d1','Monthly power supply',1.0000,125.5000,125.5000,NULL,10.3500,'2025-07-04 01:12:53','2025-07-04 01:12:53'),(116,'1bba28a1-2807-4d2e-86a0-c418a91ac12f','Desktop/network support via email & phone.\r\nPer month fixed fee for minimum 20 hours/month.',1.0000,550.0000,550.0000,'Support-M',41.9200,'2025-07-04 01:12:54','2025-07-04 01:12:54'),(117,'3f4a783e-6e80-4062-9300-4df2524e8bf7','Desktop/network support via email & phone.\r\nPer month fixed fee for minimum 20 hours/month.',1.0000,550.0000,550.0000,'Support-M',41.9200,'2025-07-04 01:12:56','2025-07-04 01:12:56'),(118,'57bf3de4-016b-4813-a81a-5379940a06b9','Hamilton Accounting Conference - Mileage',27.0000,0.7000,18.9000,NULL,0.0000,'2025-07-04 01:12:57','2025-07-04 01:12:57'),(119,'d927c2a8-01f6-442c-a690-b41eb247ece4','Development work - develper onsite per day',1.0000,650.0000,650.0000,'DevD',49.5400,'2025-07-04 01:12:59','2025-07-04 01:12:59'),(120,'d927c2a8-01f6-442c-a690-b41eb247ece4','Golf balls - white single. Please reorder with code GB1-White',1.0000,5.6000,5.6000,'GB1-White',0.4500,'2025-07-04 01:13:00','2025-07-04 01:13:00');
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
  `contact_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tenant_created_at` timestamp NULL DEFAULT NULL,
  `tenant_updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `xero_invoices_invoice_id_unique` (`invoice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xero_invoices`
--

LOCK TABLES `xero_invoices` WRITE;
/*!40000 ALTER TABLE `xero_invoices` DISABLE KEYS */;
INSERT INTO `xero_invoices` VALUES (38,'ac3d4882-08cf-4024-963d-f654e312b195','fee88eea-f2aa-4a71-a372-33d6d83d3c45','ACCREC','INV-0027','Ref MK815','AUTHORISED','USD',365.82,30.18,396,396,0,0,0,0,'2025-06-26 00:00:00','2025-07-02 00:00:00','2008-12-19 00:00:00',NULL,0,'2025-07-04 01:11:09','2025-07-04 01:11:09','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(39,'ac3d4882-08cf-4024-963d-f654e312b195','9f5bca33-8590-4b6f-acfb-e85712b10217','ACCPAY','AP','','AUTHORISED','USD',55,4.54,59.54,59.54,0,0,0,0,'2025-06-06 00:00:00','2025-06-13 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-07-04 01:11:10','2025-07-04 01:11:10','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(40,'ac3d4882-08cf-4024-963d-f654e312b195','8a3fdcc9-83eb-4fdd-83e0-52ec1b40b072','ACCPAY','AP','','AUTHORISED','USD',29,2.39,31.39,31.39,0,0,0,0,'2025-06-23 00:00:00','2025-06-23 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-07-04 01:11:11','2025-07-04 01:11:11','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(41,'ac3d4882-08cf-4024-963d-f654e312b195','4c4db294-3633-45cd-8706-f0b3b0079609','ACCREC','INV-0010','Training','PAID','USD',500,41.25,541.25,0,0,541.25,0,0,'2025-05-04 00:00:00','2025-05-17 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-07-04 01:11:13','2025-07-04 01:11:13','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(42,'ac3d4882-08cf-4024-963d-f654e312b195','b7e0c5f4-9f52-4126-b102-45fd12eaa3ca','ACCREC','INV-0005','Monthly Support','PAID','USD',500,41.25,541.25,0,0,541.25,0,0,'2025-04-27 00:00:00','2025-05-07 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-07-04 01:11:14','2025-07-04 01:11:14','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(43,'ac3d4882-08cf-4024-963d-f654e312b195','07e71ce4-9801-4cce-914b-dc07e9c0ca5e','ACCREC','INV-0017','Book','AUTHORISED','USD',19.95,1.75,21.7,21.7,0,0,0,0,'2025-05-15 00:00:00','2025-05-25 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-07-04 01:11:16','2025-07-04 01:11:16','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(44,'ac3d4882-08cf-4024-963d-f654e312b195','3a669bd8-b601-4b9a-81d4-cb03f1af3059','ACCPAY','AP','','PAID','USD',29,2.39,31.39,0,31.39,0,0,0,'2025-04-23 00:00:00','2025-04-23 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-07-04 01:11:17','2025-07-04 01:11:17','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(45,'ac3d4882-08cf-4024-963d-f654e312b195','6a77611c-f9af-483b-aa6e-d0fd23137394','ACCPAY','RENT','','PAID','USD',1091.22,90.03,1181.25,0,1181.25,0,0,0,'2025-04-26 00:00:00','2025-04-26 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-07-04 01:11:19','2025-07-04 01:11:19','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(46,'ac3d4882-08cf-4024-963d-f654e312b195','28a34ad7-6c41-4d92-8312-cd07f8328e90','ACCPAY','Rpt','','PAID','USD',110,9.08,119.08,0,119.08,0,0,0,'2025-04-26 00:00:00','2025-05-06 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-07-04 01:11:20','2025-07-04 01:11:20','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(47,'ac3d4882-08cf-4024-963d-f654e312b195','824c6c13-b7a5-49a2-99bd-4a6d77f7866e','ACCPAY','','','PAID','USD',1804.5,148.87,1953.37,0,1682.74,270.63,0,0,'2025-05-06 00:00:00','2025-05-06 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-07-04 01:11:22','2025-07-04 01:11:22','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(48,'ac3d4882-08cf-4024-963d-f654e312b195','236985ea-21a5-4b17-afb9-c16ff9ff3e27','ACCPAY','Rpt','','PAID','USD',41.5,3.42,44.92,0,44.92,0,0,0,'2025-04-27 00:00:00','2025-05-07 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-07-04 01:11:23','2025-07-04 01:11:23','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(49,'ac3d4882-08cf-4024-963d-f654e312b195','cb5119d0-9759-49d3-800b-7d0a90818178','ACCREC','INV-0001','Monthly Support','PAID','USD',500,41.25,541.25,0,541.25,0,0,0,'2025-04-26 00:00:00','2025-05-07 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-07-04 01:11:25','2025-07-04 01:11:25','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(50,'ac3d4882-08cf-4024-963d-f654e312b195','ac4883f6-fb22-4f55-9ed1-34929fc53c78','ACCREC','INV-0002','Monthly Support','PAID','USD',500,41.25,541.25,0,541.25,0,0,0,'2025-04-26 00:00:00','2025-05-07 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-07-04 01:11:26','2025-07-04 01:11:26','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(51,'ac3d4882-08cf-4024-963d-f654e312b195','1938eac0-c2dc-48f1-b4e1-b3ae59362f9b','ACCPAY','AP','','PAID','USD',29,2.39,31.39,0,31.39,0,0,0,'2025-05-24 00:00:00','2025-05-24 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-07-04 01:11:27','2025-07-04 01:11:27','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(52,'ac3d4882-08cf-4024-963d-f654e312b195','f61d2da2-3957-42f7-b268-6117b957794e','ACCREC','INV-0003','Monthly Support','PAID','USD',500,41.25,541.25,0,541.25,0,0,0,'2025-04-26 00:00:00','2025-05-07 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-07-04 01:11:29','2025-07-04 01:11:29','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(53,'ac3d4882-08cf-4024-963d-f654e312b195','043ce7df-fc3d-4e6b-b505-34579d0490f3','ACCREC','INV-0004','Monthly Support','PAID','USD',500,41.25,541.25,0,541.25,0,0,0,'2025-04-26 00:00:00','2025-05-07 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-07-04 01:11:30','2025-07-04 01:11:30','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(54,'ac3d4882-08cf-4024-963d-f654e312b195','64f222d5-e59a-43e0-8f6b-69f87e42a527','ACCREC','INV-0008','Training','PAID','USD',1200,99,1299,0,1299,0,0,0,'2025-04-28 00:00:00','2025-05-09 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-07-04 01:11:32','2025-07-04 01:11:32','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(55,'ac3d4882-08cf-4024-963d-f654e312b195','14aa8bd8-7473-42c7-b8bc-ca83d7a75236','ACCPAY','945-OCon','','AUTHORISED','USD',982.5,81.06,1063.56,163.56,900,0,0,0,'2025-05-04 00:00:00','2025-05-09 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-07-04 01:11:35','2025-07-04 01:11:35','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(56,'ac3d4882-08cf-4024-963d-f654e312b195','9a4a5e48-56fb-4ec6-9c3b-07c947239372','ACCPAY','5679','','PAID','USD',110,9.08,119.08,0,119.08,0,0,0,'2025-05-06 00:00:00','2025-05-12 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-07-04 01:11:37','2025-07-04 01:11:37','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(57,'ac3d4882-08cf-4024-963d-f654e312b195','ffbb9f34-f7d7-4f55-91cb-af89552ecdd7','ACCPAY','AP','','PAID','USD',55,4.54,59.54,0,34.1,25.44,0,0,'2025-05-06 00:00:00','2025-05-13 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-07-04 01:11:38','2025-07-04 01:11:38','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(58,'ac3d4882-08cf-4024-963d-f654e312b195','5fe76602-3f0d-48e6-88b6-aadfab4829a8','ACCPAY','9781','','PAID','USD',1350,113.88,1463.88,0,1463.88,0,0,0,'2025-05-05 00:00:00','2025-05-16 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-07-04 01:11:40','2025-07-04 01:11:40','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(59,'ac3d4882-08cf-4024-963d-f654e312b195','0bd7b530-d244-4716-a93e-710de7c61b76','ACCPAY','OG laptop','','PAID','USD',250,20.63,270.63,0,270.63,0,0,0,'2025-05-17 00:00:00','2025-05-17 00:00:00','2008-12-20 00:00:00',NULL,0,'2025-07-04 01:11:42','2025-07-04 01:11:42','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(60,'ac3d4882-08cf-4024-963d-f654e312b195','a909dda4-555b-414b-a395-ba7a4077de72','ACCREC','INV-0024','P/O 9711','AUTHORISED','USD',650,53.63,703.63,703.63,0,0,0,0,'2025-06-21 00:00:00','2025-07-06 00:00:00','2008-12-21 00:00:00',NULL,0,'2025-07-04 01:11:44','2025-07-04 01:11:44','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(61,'ac3d4882-08cf-4024-963d-f654e312b195','3f887d04-cbd9-4853-b594-bc1ab207558c','ACCREC','INV-0025','P/O CRM08-12','AUTHORISED','USD',5715.94,471.56,6187.5,6187.5,0,0,0,0,'2025-06-05 00:00:00','2025-06-26 00:00:00','2008-12-21 00:00:00',NULL,0,'2025-07-04 01:11:45','2025-07-04 01:11:45','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(62,'ac3d4882-08cf-4024-963d-f654e312b195','50e1cbd2-86c6-42df-9538-5691dd54bbee','ACCREC','INV-0012','P/O 9711','AUTHORISED','USD',200,16.5,216.5,216.5,0,0,0,0,'2025-05-12 00:00:00','2025-05-22 00:00:00','2008-12-21 00:00:00',NULL,0,'2025-07-04 01:11:47','2025-07-04 01:11:47','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(63,'ac3d4882-08cf-4024-963d-f654e312b195','6b99fc0b-e148-458d-aa8b-da550803c93e','ACCPAY','','','AUTHORISED','USD',115.5,9.53,125.03,125.03,0,0,0,0,'2025-06-23 00:00:00','2025-07-06 00:00:00','2008-12-21 00:00:00',NULL,0,'2025-07-04 01:11:48','2025-07-04 01:11:48','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(64,'ac3d4882-08cf-4024-963d-f654e312b195','7a69814e-dc6f-4c8b-80ad-cfe9c78c2763','ACCPAY','Rpt','','AUTHORISED','USD',100.32,8.28,108.6,108.6,0,0,0,0,'2025-06-26 00:00:00','2025-07-06 00:00:00','2008-12-21 00:00:00',NULL,0,'2025-07-04 01:11:50','2025-07-04 01:11:50','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(65,'ac3d4882-08cf-4024-963d-f654e312b195','08e6466f-29f3-4af7-aeac-102944c10033','ACCPAY','Rpt','','AUTHORISED','USD',50,4.13,54.13,54.13,0,0,0,0,'2025-06-27 00:00:00','2025-07-07 00:00:00','2008-12-21 00:00:00',NULL,0,'2025-07-04 01:11:51','2025-07-04 01:11:51','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(66,'ac3d4882-08cf-4024-963d-f654e312b195','50a8143e-f9a5-4b84-8560-0daeba260020','ACCREC','INV-0007','Workshop','PAID','USD',547.8,45.43,593.23,0,593.23,0,0,0,'2025-04-29 00:00:00','2025-05-10 00:00:00','2009-02-15 00:00:00',NULL,0,'2025-07-04 01:11:52','2025-07-04 01:11:52','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(67,'ac3d4882-08cf-4024-963d-f654e312b195','7f750739-c67a-4acc-9cd7-c133ddbcb7b1','ACCPAY','','','AUTHORISED','USD',1969.99,162.52,2132.51,2132.51,0,0,0,0,'2025-06-21 00:00:00','2025-07-27 00:00:00','2009-03-16 00:00:00',NULL,0,'2025-07-04 01:11:55','2025-07-04 01:11:55','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(68,'ac3d4882-08cf-4024-963d-f654e312b195','61127f1e-d938-4176-a72e-fd500d5b064f','ACCPAY','Rpt','','DELETED','USD',39,3.22,42.22,0,0,0,0,0,'2025-08-28 00:00:00','2025-06-27 00:00:00','2009-09-07 00:00:00',NULL,0,'2025-07-04 01:11:56','2025-07-04 01:11:56','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(69,'ac3d4882-08cf-4024-963d-f654e312b195','323103d0-050b-4538-9abd-b05894f176f5','ACCPAY','Rpt','','DELETED','USD',105,8.66,113.66,0,0,0,0,0,'2025-08-27 00:00:00','2025-09-14 00:00:00','2009-09-07 00:00:00',NULL,0,'2025-07-04 01:11:58','2025-07-04 01:11:58','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(70,'ac3d4882-08cf-4024-963d-f654e312b195','1ee8729f-0a1f-4e36-8a10-de4c087b92ab','ACCPAY','Rpt','','DELETED','USD',39,3.22,42.22,0,0,0,0,0,'2025-07-28 00:00:00','2025-09-04 00:00:00','2009-09-07 00:00:00',NULL,0,'2025-07-04 01:11:59','2025-07-04 01:11:59','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(71,'ac3d4882-08cf-4024-963d-f654e312b195','927cc424-d1b9-48c8-a6aa-c134b3bc74a4','ACCPAY','Rpt','','DELETED','USD',105,8.66,113.66,0,0,0,0,0,'2025-07-27 00:00:00','2025-08-17 00:00:00','2009-09-07 00:00:00',NULL,0,'2025-07-04 01:12:01','2025-07-04 01:12:01','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(72,'ac3d4882-08cf-4024-963d-f654e312b195','f8c11fab-d8b2-4fdc-a803-34501181df3b','ACCPAY','AP','','VOIDED','USD',55,4.54,59.54,0,0,0,0,0,'2025-07-06 00:00:00','2025-07-14 00:00:00','2009-09-07 00:00:00',NULL,0,'2025-07-04 01:12:02','2025-07-04 01:12:02','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(73,'ac3d4882-08cf-4024-963d-f654e312b195','a8beb072-5464-46ab-b437-cce25e6f2a0a','ACCPAY','AP','','VOIDED','USD',29,2.39,31.39,0,0,0,0,0,'2025-07-24 00:00:00','2025-08-08 00:00:00','2009-09-07 00:00:00',NULL,0,'2025-07-04 01:12:04','2025-07-04 01:12:04','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(74,'ac3d4882-08cf-4024-963d-f654e312b195','543f7cd8-323d-4baf-96b2-cb76831bccfb','ACCPAY','RENT','','VOIDED','USD',1091.22,90.03,1181.25,0,0,0,0,0,'2025-07-27 00:00:00','2025-08-08 00:00:00','2009-09-07 00:00:00',NULL,0,'2025-07-04 01:12:05','2025-07-04 01:12:05','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(75,'ac3d4882-08cf-4024-963d-f654e312b195','df852239-2d19-4313-8285-e94957a45020','ACCPAY','AP','','VOIDED','USD',55,4.54,59.54,0,0,0,0,0,'2025-08-06 00:00:00','2025-08-14 00:00:00','2009-09-07 00:00:00',NULL,0,'2025-07-04 01:12:07','2025-07-04 01:12:07','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(76,'ac3d4882-08cf-4024-963d-f654e312b195','57f74b0c-137d-4627-8c08-388f49a62510','ACCPAY','AP','','VOIDED','USD',29,2.39,31.39,0,0,0,0,0,'2025-08-24 00:00:00','2025-09-05 00:00:00','2009-09-07 00:00:00',NULL,0,'2025-07-04 01:12:08','2025-07-04 01:12:08','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(77,'ac3d4882-08cf-4024-963d-f654e312b195','2a35b64d-8564-43c8-a43f-e56b3f8dddcd','ACCPAY','RENT','','VOIDED','USD',1091.22,90.03,1181.25,0,0,0,0,0,'2025-08-27 00:00:00','2025-09-05 00:00:00','2009-09-07 00:00:00',NULL,0,'2025-07-04 01:12:09','2025-07-04 01:12:09','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(78,'ac3d4882-08cf-4024-963d-f654e312b195','1a29fe51-c155-4c8e-b91b-baa176655d23','ACCPAY','AP','','VOIDED','USD',55,4.54,59.54,0,0,0,0,0,'2025-09-04 00:00:00','2025-09-11 00:00:00','2009-09-07 00:00:00',NULL,0,'2025-07-04 01:12:11','2025-07-04 01:12:11','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(79,'ac3d4882-08cf-4024-963d-f654e312b195','f2b3f909-1472-4ee8-98ac-5045bacb5656','ACCPAY','GB1-White','','AUTHORISED','USD',775.98,64.02,840,840,0,0,0,0,'2025-06-24 00:00:00','2025-07-05 00:00:00','2010-09-29 00:00:00',NULL,0,'2025-07-04 01:12:12','2025-07-04 01:12:12','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(80,'ac3d4882-08cf-4024-963d-f654e312b195','93796a50-2fb6-4982-9ccd-01898b419ea0','ACCPAY','CS815','','AUTHORISED','USD',223.56,18.44,242,242,0,0,0,0,'2025-06-27 00:00:00','2025-07-03 00:00:00','2013-01-04 00:00:00',NULL,0,'2025-07-04 01:12:14','2025-07-04 01:12:14','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(81,'ac3d4882-08cf-4024-963d-f654e312b195','84f7c2d0-8383-46ed-bf45-17e00665ceab','ACCPAY','SM0195','','AUTHORISED','USD',1847.58,152.42,2000,2000,0,0,0,0,'2025-05-06 00:00:00','2025-05-17 00:00:00','2013-01-05 00:00:00',NULL,0,'2025-07-04 01:12:15','2025-07-04 01:12:15','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(82,'ac3d4882-08cf-4024-963d-f654e312b195','628fc0b0-e65c-47ef-a3e2-99632a1136e7','ACCPAY','SM0210','','AUTHORISED','USD',2309.47,190.53,2500,2500,0,0,0,0,'2025-06-16 00:00:00','2025-06-26 00:00:00','2013-01-05 00:00:00',NULL,0,'2025-07-04 01:12:17','2025-07-04 01:12:17','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(83,'ac3d4882-08cf-4024-963d-f654e312b195','bd63b5f1-5503-4c62-9c4a-e4b9e4257dc9','ACCREC','INV-0006','P/O 9711','AUTHORISED','USD',230.95,19.05,250,250,0,0,0,0,'2025-04-25 00:00:00','2025-05-05 00:00:00','2013-01-05 00:00:00',NULL,0,'2025-07-04 01:12:18','2025-07-04 01:12:18','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(84,'ac3d4882-08cf-4024-963d-f654e312b195','bbf21465-7a03-417d-b41d-48d3000e858e','ACCPAY','RENT','','PAID','USD',1091.22,90.03,1181.25,0,1181.25,0,0,0,'2025-06-16 00:00:00','2025-06-26 00:00:00','2013-01-05 00:00:00',NULL,0,'2025-07-04 01:12:20','2025-07-04 01:12:20','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(85,'ac3d4882-08cf-4024-963d-f654e312b195','361a4980-7f53-4b68-820c-f6487f613284','ACCPAY','','','PAID','USD',380,31.35,411.35,0,411.35,0,0,0,'2025-06-22 00:00:00','2025-07-23 00:00:00','2013-01-05 00:00:00',NULL,0,'2025-07-04 01:12:21','2025-07-04 01:12:21','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(86,'ac3d4882-08cf-4024-963d-f654e312b195','016a64c7-be0b-45a2-acae-13057fdf1566','ACCREC','INV-0026','','AUTHORISED','USD',844.85,69.7,914.55,914.55,0,0,0,0,'2025-06-26 00:00:00','2025-07-06 00:00:00','2013-01-07 00:00:00',NULL,0,'2025-07-04 01:12:23','2025-07-04 01:12:23','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(87,'ac3d4882-08cf-4024-963d-f654e312b195','88617351-56ed-4c14-a30d-34a006d0a75a','ACCREC','INV-0028','GB1-White','AUTHORISED','USD',216.93,17.07,234,234,0,0,0,0,'2025-06-26 00:00:00','2025-07-15 00:00:00','2013-01-14 00:00:00',NULL,0,'2025-07-04 01:12:25','2025-07-04 01:12:25','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(88,'ac3d4882-08cf-4024-963d-f654e312b195','f175784c-3ae0-4850-8504-46ad807181f7','ACCPAY','','','AUTHORISED','USD',120.09,9.91,130,130,0,0,0,0,'2025-06-21 00:00:00','2025-07-01 00:00:00','2013-01-14 00:00:00',NULL,0,'2025-07-04 01:12:28','2025-07-04 01:12:28','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(89,'ac3d4882-08cf-4024-963d-f654e312b195','463042ef-4343-4a5a-abb8-9a1a3e2e1057','ACCREC','INV-0011','Portal Proj','PAID','USD',1300,107.25,1407.25,0,1407.25,0,0,0,'2025-05-10 00:00:00','2025-05-27 00:00:00','2013-11-21 00:00:00',NULL,0,'2025-07-04 01:12:29','2025-07-04 01:12:29','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(90,'ac3d4882-08cf-4024-963d-f654e312b195','11e353a8-73f8-4f50-82e0-ff1a2ff8ffba','ACCREC','INV-0013','Training','PAID','USD',1000,82.5,1082.5,0,1082.5,0,0,0,'2025-05-15 00:00:00','2025-05-27 00:00:00','2013-11-21 00:00:00',NULL,0,'2025-07-04 01:12:30','2025-07-04 01:12:30','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(91,'ac3d4882-08cf-4024-963d-f654e312b195','cb43aadd-8836-4e95-aa2c-c4ba66c2ca9e','ACCREC','INV-0009','P/O CRM08-12','PAID','USD',5715.94,471.56,6187.5,0,6187.5,0,0,0,'2025-05-05 00:00:00','2025-05-27 00:00:00','2013-11-21 00:00:00',NULL,0,'2025-07-04 01:12:33','2025-07-04 01:12:33','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(92,'ac3d4882-08cf-4024-963d-f654e312b195','2c916a34-14fe-4b38-af86-6b0fcc371a89','ACCREC','INV-0022','Yr Ref W08-143','PAID','USD',219.95,18.25,238.2,0,216.5,21.7,0,0,'2025-05-27 00:00:00','2025-06-06 00:00:00','2013-11-21 00:00:00',NULL,0,'2025-07-04 01:12:34','2025-07-04 01:12:34','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(93,'ac3d4882-08cf-4024-963d-f654e312b195','1371f05a-4cd3-4760-99a9-e4cf8d98e7bb','ACCREC','INV-0018','Monthly Support','PAID','USD',500,41.25,541.25,0,541.25,0,0,0,'2025-05-27 00:00:00','2025-06-06 00:00:00','2013-11-21 00:00:00',NULL,0,'2025-07-04 01:12:37','2025-07-04 01:12:37','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(94,'ac3d4882-08cf-4024-963d-f654e312b195','f0065405-e5ad-4c34-ad5b-645e72813c03','ACCREC','INV-0019','Monthly Support','PAID','USD',500,41.25,541.25,0,541.25,0,0,0,'2025-05-27 00:00:00','2025-06-06 00:00:00','2013-11-21 00:00:00',NULL,0,'2025-07-04 01:12:38','2025-07-04 01:12:38','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(95,'ac3d4882-08cf-4024-963d-f654e312b195','72860d4a-207b-4f24-895d-167ffd44ae00','ACCREC','INV-0020','Monthly Support','PAID','USD',500,41.25,541.25,0,541.25,0,0,0,'2025-05-27 00:00:00','2025-06-06 00:00:00','2013-11-21 00:00:00',NULL,0,'2025-07-04 01:12:40','2025-07-04 01:12:40','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(96,'ac3d4882-08cf-4024-963d-f654e312b195','1ee8363f-097f-4fb3-a452-8068b947e75e','ACCREC','INV-0021','Monthly Support','PAID','USD',500,41.25,541.25,0,541.25,0,0,0,'2025-05-27 00:00:00','2025-06-06 00:00:00','2013-11-21 00:00:00',NULL,0,'2025-07-04 01:12:41','2025-07-04 01:12:41','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(97,'ac3d4882-08cf-4024-963d-f654e312b195','2a578929-58bf-4eca-90db-1356383aeecb','ACCPAY','Dep','','PAID','USD',1500,0,1500,0,1500,0,0,0,'2025-05-27 00:00:00','2025-06-06 00:00:00','2013-11-21 00:00:00',NULL,0,'2025-07-04 01:12:43','2025-07-04 01:12:43','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(98,'ac3d4882-08cf-4024-963d-f654e312b195','12d3bc5a-efe2-4093-b0e3-f6474ef7596d','ACCPAY','08-4123','','PAID','USD',5500,453.75,5953.75,0,5953.75,0,0,0,'2025-05-27 00:00:00','2025-06-06 00:00:00','2013-11-21 00:00:00',NULL,0,'2025-07-04 01:12:44','2025-07-04 01:12:44','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(99,'ac3d4882-08cf-4024-963d-f654e312b195','6e74d1a5-e95b-406d-8d96-7d8752fa388e','ACCPAY','710','','PAID','USD',923.79,76.21,1000,0,1000,0,0,0,'2025-06-06 00:00:00','2025-06-06 00:00:00','2013-11-21 00:00:00',NULL,0,'2025-07-04 01:12:46','2025-07-04 01:12:46','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(100,'ac3d4882-08cf-4024-963d-f654e312b195','4286e4ee-cc4a-4d74-9568-10935b3600bb','ACCREC','INV-0016','Yr Ref W08-143','AUTHORISED','USD',775,63.94,838.94,270.63,568.31,0,0,0,'2025-05-17 00:00:00','2025-05-27 00:00:00','2013-11-21 00:00:00',NULL,0,'2025-07-04 01:12:47','2025-07-04 01:12:47','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(101,'ac3d4882-08cf-4024-963d-f654e312b195','bc532b0e-dfa7-44fd-99d9-1d24acd55b1c','ACCPAY','RENT','','PAID','USD',1091.22,90.03,1181.25,0,1181.25,0,0,0,'2025-05-27 00:00:00','2025-05-27 00:00:00','2013-11-21 00:00:00',NULL,0,'2025-07-04 01:12:50','2025-07-04 01:12:50','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(102,'ac3d4882-08cf-4024-963d-f654e312b195','9d9cd0fc-661b-49fb-9062-6e50c139b78b','ACCPAY','Rpt','','PAID','USD',43.25,3.57,46.82,0,46.82,0,0,0,'2025-05-28 00:00:00','2025-06-06 00:00:00','2013-11-21 00:00:00',NULL,0,'2025-07-04 01:12:51','2025-07-04 01:12:51','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(103,'ac3d4882-08cf-4024-963d-f654e312b195','47b97878-df82-4330-b731-80610cce65d1','ACCPAY','Rpt','','PAID','USD',125.5,10.35,135.85,0,135.85,0,0,0,'2025-05-27 00:00:00','2025-06-06 00:00:00','2013-11-21 00:00:00',NULL,0,'2025-07-04 01:12:53','2025-07-04 01:12:53','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(104,'ac3d4882-08cf-4024-963d-f654e312b195','1bba28a1-2807-4d2e-86a0-c418a91ac12f','ACCREC','INV-0030','Monthly support','DRAFT','USD',508.08,41.92,550,550,0,0,0,0,'2025-06-25 00:00:00','2025-07-10 00:00:00','2016-06-24 00:00:00',NULL,0,'2025-07-04 01:12:54','2025-07-04 01:12:54','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(105,'ac3d4882-08cf-4024-963d-f654e312b195','3f4a783e-6e80-4062-9300-4df2524e8bf7','ACCREC','INV-0029','Monthly support','DRAFT','USD',508.08,41.92,550,550,0,0,0,0,'2025-06-25 00:00:00','2025-07-10 00:00:00','2016-06-24 00:00:00',NULL,0,'2025-07-04 01:12:55','2025-07-04 01:12:55','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(106,'ac3d4882-08cf-4024-963d-f654e312b195','57bf3de4-016b-4813-a81a-5379940a06b9','ACCPAY','Expense Claims','','AUTHORISED','USD',18.9,0,18.9,18.9,0,0,0,0,'2017-07-19 00:00:00','2025-06-27 00:00:00','2025-06-27 00:00:00',NULL,0,'2025-07-04 01:12:57','2025-07-04 01:12:57','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06'),(107,'ac3d4882-08cf-4024-963d-f654e312b195','d927c2a8-01f6-442c-a690-b41eb247ece4','ACCREC','INV-0031','','AUTHORISED','USD',605.61,49.99,655.6,655.6,0,0,0,0,'2025-06-30 00:00:00','2025-07-02 00:00:00','2025-06-30 00:00:00',NULL,0,'2025-07-04 01:12:58','2025-07-04 01:12:58','Demo Company (Global)','ORGANISATION','ac3d4882-08cf-4024-963d-f654e312b195',NULL,'2025-07-04 01:11:06','2025-07-04 01:11:06');
/*!40000 ALTER TABLE `xero_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xero_tokens`
--

DROP TABLE IF EXISTS `xero_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xero_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tenant_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tenant_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tenant_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organisation_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `refresh_token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `last_synced_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `xero_tokens_tenant_id_unique` (`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xero_tokens`
--

LOCK TABLES `xero_tokens` WRITE;
/*!40000 ALTER TABLE `xero_tokens` DISABLE KEYS */;
INSERT INTO `xero_tokens` VALUES (1,'4ca51534-0f48-4727-8274-4cda048f2cd6','Secureism','ORGANISATION',NULL,'eyJhbGciOiJSUzI1NiIsImtpZCI6IjFDQUY4RTY2NzcyRDZEQzAyOEQ2NzI2RkQwMjYxNTgxNTcwRUZDMTkiLCJ0eXAiOiJKV1QiLCJ4NXQiOiJISy1PWm5jdGJjQW8xbkp2MENZVmdWY09fQmsifQ.eyJuYmYiOjE3NTE2MDkwOTAsImV4cCI6MTc1MTYxMDg5MCwiaXNzIjoiaHR0cHM6Ly9pZGVudGl0eS54ZXJvLmNvbSIsImF1ZCI6Imh0dHBzOi8vaWRlbnRpdHkueGVyby5jb20vcmVzb3VyY2VzIiwiY2xpZW50X2lkIjoiMUVFMkE3RTYxNDFFNEVCRkFEMDQ1NUI3M0M4QzMyOUYiLCJzdWIiOiI1ZDIxM2U5MDdlODc1MmQzOTAxNThlNzEzMjI0ZDFlMyIsImF1dGhfdGltZSI6MTc1MTYwNzEzMywieGVyb191c2VyaWQiOiI0YTczZWFmYi0xOTZmLTQ3YTYtOTI0NS0xYzgyYzY5NmE2NGYiLCJnbG9iYWxfc2Vzc2lvbl9pZCI6ImIzOTk0YjU0ZTllNjQ5OTFiMjgzNDM1Y2ZiM2VhMGYxIiwic2lkIjoiYjM5OTRiNTRlOWU2NDk5MWIyODM0MzVjZmIzZWEwZjEiLCJqdGkiOiI0MzAwREUzNzMyNEY2MkVCMTRCQ0Q0RUEwNjU4ODM0NyIsImF1dGhlbnRpY2F0aW9uX2V2ZW50X2lkIjoiN2EzMjRkYjgtNzkxZi00Yzg0LWFhN2MtMGMwM2JjYThmYjIxIiwic2NvcGUiOlsiZW1haWwiLCJwcm9maWxlIiwib3BlbmlkIiwiYWNjb3VudGluZy5zZXR0aW5ncyIsImFjY291bnRpbmcudHJhbnNhY3Rpb25zIiwib2ZmbGluZV9hY2Nlc3MiXSwiYW1yIjpbInB3ZCJdfQ.r7VlIFdCo-wgIWJkPRdYspEkmFjb5HGLRKWB3NtTi-JQk4MX_R0-E9clMsbLjBHTtsDe7TDbGOBYw8fKx1YmhONa06LSzhSBY_KY1pzvDUkaIXCNh4Dac-H9gmhjPWfdRclkpEt-QjRR2z4z9OILD_5tqKatfaeOoVSH3uBGu7WWjNBFGnJkxWsfdXhd_b_4GONBgDUmZlz-u6edRZSWuPbO3Xgltbcoi6J8Tu9Cvz9C2kdDop6BDITx--ddFLGsK7C1tgeX6V0HZAA5u-kwf-6Vf0oXypFEMctvmJz8J5eZQneTY6dc2618nZqlWhA8_QOLlBXL5UM8ZVd4WDL4Tw','67A8Q7C_KEJfz1DzF7z070r9Gsxp5KkB-YdP4cHUuwA','2081-01-04 12:40:08',NULL,'2025-07-04 01:05:05','2025-07-04 01:05:05'),(2,'ac3d4882-08cf-4024-963d-f654e312b195','Demo Company (Global)','ORGANISATION',NULL,'eyJhbGciOiJSUzI1NiIsImtpZCI6IjFDQUY4RTY2NzcyRDZEQzAyOEQ2NzI2RkQwMjYxNTgxNTcwRUZDMTkiLCJ0eXAiOiJKV1QiLCJ4NXQiOiJISy1PWm5jdGJjQW8xbkp2MENZVmdWY09fQmsifQ.eyJuYmYiOjE3NTE2MDkwOTAsImV4cCI6MTc1MTYxMDg5MCwiaXNzIjoiaHR0cHM6Ly9pZGVudGl0eS54ZXJvLmNvbSIsImF1ZCI6Imh0dHBzOi8vaWRlbnRpdHkueGVyby5jb20vcmVzb3VyY2VzIiwiY2xpZW50X2lkIjoiMUVFMkE3RTYxNDFFNEVCRkFEMDQ1NUI3M0M4QzMyOUYiLCJzdWIiOiI1ZDIxM2U5MDdlODc1MmQzOTAxNThlNzEzMjI0ZDFlMyIsImF1dGhfdGltZSI6MTc1MTYwNzEzMywieGVyb191c2VyaWQiOiI0YTczZWFmYi0xOTZmLTQ3YTYtOTI0NS0xYzgyYzY5NmE2NGYiLCJnbG9iYWxfc2Vzc2lvbl9pZCI6ImIzOTk0YjU0ZTllNjQ5OTFiMjgzNDM1Y2ZiM2VhMGYxIiwic2lkIjoiYjM5OTRiNTRlOWU2NDk5MWIyODM0MzVjZmIzZWEwZjEiLCJqdGkiOiI0MzAwREUzNzMyNEY2MkVCMTRCQ0Q0RUEwNjU4ODM0NyIsImF1dGhlbnRpY2F0aW9uX2V2ZW50X2lkIjoiN2EzMjRkYjgtNzkxZi00Yzg0LWFhN2MtMGMwM2JjYThmYjIxIiwic2NvcGUiOlsiZW1haWwiLCJwcm9maWxlIiwib3BlbmlkIiwiYWNjb3VudGluZy5zZXR0aW5ncyIsImFjY291bnRpbmcudHJhbnNhY3Rpb25zIiwib2ZmbGluZV9hY2Nlc3MiXSwiYW1yIjpbInB3ZCJdfQ.r7VlIFdCo-wgIWJkPRdYspEkmFjb5HGLRKWB3NtTi-JQk4MX_R0-E9clMsbLjBHTtsDe7TDbGOBYw8fKx1YmhONa06LSzhSBY_KY1pzvDUkaIXCNh4Dac-H9gmhjPWfdRclkpEt-QjRR2z4z9OILD_5tqKatfaeOoVSH3uBGu7WWjNBFGnJkxWsfdXhd_b_4GONBgDUmZlz-u6edRZSWuPbO3Xgltbcoi6J8Tu9Cvz9C2kdDop6BDITx--ddFLGsK7C1tgeX6V0HZAA5u-kwf-6Vf0oXypFEMctvmJz8J5eZQneTY6dc2618nZqlWhA8_QOLlBXL5UM8ZVd4WDL4Tw','67A8Q7C_KEJfz1DzF7z070r9Gsxp5KkB-YdP4cHUuwA','2081-01-04 12:40:08',NULL,'2025-07-04 01:05:05','2025-07-04 01:05:05');
/*!40000 ALTER TABLE `xero_tokens` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-04 11:16:10
