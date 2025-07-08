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
INSERT INTO `business_configurations` VALUES (1,'Secureisms Ltd','12345-6789012-3','123 Business Avenue, Lahore, Pakistan','Islamabad','1751891434.png','9876543210123456','REG-789456','03001234567','John Doe','PK36SCBL0000001123456702','SCBLPKKTYIT','Lahore Main Branch','1234','2025-07-04 12:02:41','2025-07-07 07:30:34');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyers`
--

LOCK TABLES `buyers` WRITE;
/*!40000 ALTER TABLE `buyers` DISABLE KEYS */;
INSERT INTO `buyers` VALUES (1,'ABC Traders',0,'12345-1234567-1','123 Market Street, City','Isb','1751891096.png','12345678901234','REG-987654','03001234567','John Doe','PK12ABCD00000012345678','ABCDPKKA','Main Branch','0012','2025-07-04 12:15:53','2025-07-07 07:24:56'),(2,'SkyPass',1,'478458-6','Address ,Address ,Address ,Address ,Address  Islamabad','Rawalpindi','1751891068.png','11224587-dfasfdsad','65f5sd4af-d','0300-5325487','Waheed Ahmed','PAK87458as','fdsaf874-h','ABL','1178','2025-07-07 01:12:30','2025-07-07 07:24:28'),(3,'Test',1,'3740525394438 1','195 Lambton Quay\r\nPrivate Bag 18 901\r\nWellington 6160, New Zealand','TEST','1751890822.png','4545454551','REG-9876544554','03115276352','03115276352','5454+5','5465','Allied JFKJ','1178','2025-07-07 07:20:22','2025-07-07 07:20:22'),(4,'Hammad Buyer',1,'3740525394438 1','195 Lambton Quay\r\nPrivate Bag 18 901\r\nWellington 6160, New Zealand','TEST','1751947229.jpg','11224587-Hm','REG-8521','03115276352','TEST BUYER','987456321','2541','Askari Bank','728','2025-07-07 23:00:29','2025-07-07 23:00:29'),(5,'Test',0,'12345-1234567-1','195 Lambton Quay\r\nPrivate Bag 18 901\r\nWellington 6160, New Zealand','TEST','1751947301.jpg','12345678901234','567412589638888','03115276352','TAZ','45646565',NULL,'Allied',NULL,'2025-07-07 23:01:41','2025-07-08 02:08:52'),(6,'Farhan',0,'37405253944382','TEST','TST','1751947545.jpg','12345678541234','REG-1111','03319748582','TEST','54545241','987654','Alflah Bank','96321','2025-07-07 23:05:45','2025-07-07 23:05:45'),(7,'Shawaiz',0,'3740525394438','195 Lambton Quay\r\nPrivate Bag 18 901\r\nWellington 6160, New Zealand','TST','1751947644.jpg','4545454551','REG-96521','03115276352','Zahid','54654156','32556','Islamic','96521','2025-07-07 23:07:24','2025-07-07 23:07:24'),(8,'XYZ Traders',1,'56546','195 Lambton Quay\r\nPrivate Bag 18 901\r\nWellington 6160, New Zealand','jj','1751947746.png','11224587-65465','567446455','03115276352','Waheed','145456','6565','Faisal','321','2025-07-07 23:09:06','2025-07-07 23:09:06'),(9,'BUYER 12',0,'12345-1234567-1','195 Lambton Quay\r\nPrivate Bag 18 901\r\nWellington 6160, New Zealand','TST','1751947841.jpg','11224587-AC','65545454','03115276352','Junaid','454564',NULL,'JS Bank','9651','2025-07-07 23:10:41','2025-07-08 02:46:57');
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
  `retail_price` decimal(12,2) DEFAULT NULL,
  `sales_tax_applicable` decimal(12,2) NOT NULL,
  `sales_tax_withheld` decimal(12,2) NOT NULL DEFAULT '0.00',
  `extra_tax` decimal(12,2) DEFAULT '0.00',
  `further_tax` decimal(12,2) DEFAULT '0.00',
  `fed_payable` decimal(12,2) DEFAULT '0.00',
  `discount` decimal(12,2) DEFAULT '0.00',
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_details`
--

LOCK TABLES `invoice_details` WRITE;
/*!40000 ALTER TABLE `invoice_details` DISABLE KEYS */;
INSERT INTO `invoice_details` VALUES (5,3,2,2,4720.00,4000.00,NULL,18.00,0.00,0.00,0.00,0.00,0.00,'services',NULL,NULL,'2025-07-08 05:16:07','2025-07-08 05:16:07'),(6,3,3,2,10810.80,4290.00,NULL,152.00,0.00,0.00,0.00,0.00,0.00,'services',NULL,NULL,'2025-07-08 05:16:07','2025-07-08 05:16:07'),(7,4,2,2,4720.00,4000.00,NULL,18.00,0.00,200.00,100.00,0.00,0.00,'services',NULL,NULL,'2025-07-08 06:34:18','2025-07-08 06:34:18'),(8,4,3,3,16216.20,6435.00,NULL,152.00,0.00,0.00,0.00,0.00,0.00,'services',NULL,NULL,'2025-07-08 06:34:18','2025-07-08 06:34:18'),(9,4,4,4,1476.60,1284.00,NULL,15.00,0.00,50.00,50.00,0.00,0.00,'services',NULL,NULL,'2025-07-08 06:34:18','2025-07-08 06:34:18'),(10,5,2,2,4720.00,4000.00,NULL,18.00,0.00,0.00,0.00,0.00,0.00,'services',NULL,NULL,'2025-07-08 07:09:40','2025-07-08 07:09:40'),(11,5,3,3,16216.20,6435.00,NULL,152.00,0.00,180.00,250.00,0.00,0.00,'services',NULL,NULL,'2025-07-08 07:09:40','2025-07-08 07:09:40'),(12,5,5,3,17512.32,15636.00,NULL,12.00,0.00,80.00,50.00,0.00,0.00,'services',NULL,NULL,'2025-07-08 07:09:40','2025-07-08 07:09:40');
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
  `totalAmountExcludingTax` double DEFAULT NULL,
  `totalAmountIncludingTax` double DEFAULT NULL,
  `totalSalesTax` double DEFAULT NULL,
  `totalfurtherTax` double DEFAULT NULL,
  `totalextraTax` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `invoices_seller_id_foreign` (`seller_id`),
  KEY `invoices_buyer_id_foreign` (`buyer_id`),
  CONSTRAINT `invoices_buyer_id_foreign` FOREIGN KEY (`buyer_id`) REFERENCES `buyers` (`byr_id`) ON DELETE CASCADE,
  CONSTRAINT `invoices_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `business_configurations` (`bus_config_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (3,'Sales Invoice','2025-07-08','SN001',NULL,1,1,NULL,1,'Unknown','',NULL,NULL,NULL,NULL,NULL,'2025-07-08 05:16:07','2025-07-08 05:16:07'),(4,'Sales Invoice','2025-07-08','SN001',NULL,1,1,NULL,1,'Unknown','',11719,22412.8,10693.8,150,250,'2025-07-08 06:34:18','2025-07-08 06:34:18'),(5,'Sales Invoice','2025-07-08','SN001',NULL,1,4,NULL,1,'Unknown','',26071,38448.52,12377.52,300,260,'2025-07-08 07:09:40','2025-07-08 07:09:40');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (2,NULL,'The morning air was crisp and sharp as Sean walked down the road.',2000,'18','KG','2025-07-07 05:11:12','2025-07-08 05:13:10'),(3,'446','text description is a verbal representation of something, using written words to convey information about a person, place, thing, or idea. It aims to create a clear and vivid mental image',2145,'152','12','2025-07-07 23:27:29','2025-07-08 00:32:05'),(4,'852','A short description is a concise summary or overview of something, like a product, concept, or task, providing essential information in a brief and easily understandable manner',321,'15','52','2025-07-08 00:36:55','2025-07-08 00:36:55'),(5,'852','The best descriptions are simple and to the point. You want to sprinkle your descriptions throughout your writing so that they complement the message you\'re trying to convey, not bury it',5212,'12','12','2025-07-08 00:38:55','2025-07-08 02:49:38'),(6,NULL,'Add more depth to your tasks with a fully customizable item description. The description can be added to any item in your workspace as a widget. It can include formatting, images, and text, just like a mini monday Workdoc.',123,'10','12','2025-07-08 04:36:07','2025-07-08 04:36:07'),(7,'852','To add an Item Description as a new item view, head over to the Item Views Center. Open up the Updates Section of any item on your board and click the \"+\" in the header. From the list of views, select \"Item description',7410,'8','5','2025-07-08 04:36:35','2025-07-08 04:36:35'),(8,'123','You can change some of your widgets\' settings by clicking the 3-dot menu at the top right corner. From here, you can delete your widget if necessary. You can also click \"Full Screen\" to work a little more comfortably, as you would with a Workdoc.',321,'15','4','2025-07-08 04:37:08','2025-07-08 04:37:08'),(9,'123','You can resize your widget by hovering anywhere in it and dragging the corner to where you want it to be. You can also move the widget by hovering over the icon at the top left corner and then just dragging',410,'12','12','2025-07-08 04:54:07','2025-07-08 04:54:07');
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (7,'0001_01_01_000000_create_users_table',1),(8,'0001_01_01_000001_create_cache_table',1),(9,'0001_01_01_000002_create_jobs_table',1),(22,'2025_07_04_120046_create_business_configurations_table',2),(24,'2025_07_04_121405_create_buyers_table',3),(25,'2025_07_07_045332_create_items_table',4),(26,'2025_07_07_050034_create_invoices_table',5),(27,'2025_07_07_050036_create_invoice_details_table',5),(28,'2025_07_07_110924_add_bus_province_to_business_configurations_table',6),(29,'2025_07_07_111052_add_byr_province_to_buyers_table',7),(30,'2025_07_08_112513_add_totals_to_invoices_table',8);
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
INSERT INTO `sessions` VALUES ('eQHSckc1s7t0SyGyvAjnYvlxD0fk4EBXAbyaQ7fs',3,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoicjY2UzhQRTVsUmlXQVFKemZ0cHZoTmR3d0ZjWHhpY0JBUWVGNmhEUyI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvaXRlbXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTozO30=',1751968858),('mjyC0SNhCJ9qCrAmUUv54c4Hi47i6H5LdWg6SqUg',2,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNVRRS2pSWkE3dURDY2lCRTdVazl4YkNsVnA5eXNRamRXbjBQaEtYaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9pbnZvaWNlcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7fQ==',1751978381);
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

-- Dump completed on 2025-07-08 17:42:10
