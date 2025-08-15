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
-- Table structure for table `activity_logs`
--

DROP TABLE IF EXISTS `activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `record_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_hash` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hash_changed` tinyint(1) NOT NULL DEFAULT '1',
  `data` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_logs`
--

LOCK TABLES `activity_logs` WRITE;
/*!40000 ALTER TABLE `activity_logs` DISABLE KEYS */;
INSERT INTO `activity_logs` VALUES (1,2,'Hammad Ali','127.0.0.1','unknown','add','Added new item: Services Description',NULL,'items','87f96baeab783f0515014f525a6932a37635849873ad4a0d6dc507241dfb0110',1,'{\"item_description\":\"Services Description\",\"item_hs_code\":\"hs-code\",\"item_price\":45,\"item_tax_rate\":10,\"item_uom\":\"Per Month\",\"updated_at\":\"2025-08-13T09:47:05.000000Z\",\"created_at\":\"2025-08-13T09:47:05.000000Z\",\"item_id\":12}','2025-08-13 04:47:05',NULL),(2,2,'Hammad Ali','127.0.0.1','unknown','update','Updated item: Services Description',NULL,'items','69535887a3003fa458d2073ec8edf887304caa081ffd15825e4a32df58a561ee',0,'{\"old\":{\"item_id\":12,\"item_hs_code\":\"hs-code\",\"item_description\":\"Services Description\",\"item_price\":45,\"item_tax_rate\":10,\"item_uom\":\"Per Month\",\"created_at\":\"2025-08-13T09:47:05.000000Z\",\"updated_at\":\"2025-08-13T09:47:05.000000Z\"},\"new\":{\"item_id\":12,\"item_hs_code\":\"hs-code1\",\"item_description\":\"Services Description\",\"item_price\":455,\"item_tax_rate\":10,\"item_uom\":\"Per Month\",\"created_at\":\"2025-08-13T09:47:05.000000Z\",\"updated_at\":\"2025-08-13T09:47:29.000000Z\"}}','2025-08-13 04:47:29',NULL),(3,2,'Hammad Ali','127.0.0.1','unknown','update','Updated item: Services Description',NULL,'items','76a3314d38333da09cfe918fba5e59fbcfd9aa95790ffd6b73941226415cef36',0,'{\"old\":{\"item_id\":12,\"item_hs_code\":\"hs-code1\",\"item_description\":\"Services Description\",\"item_price\":455,\"item_tax_rate\":10,\"item_uom\":\"Per Month\",\"created_at\":\"2025-08-13T09:47:05.000000Z\",\"updated_at\":\"2025-08-13T09:47:29.000000Z\"},\"new\":{\"item_id\":12,\"item_hs_code\":\"hs-code1\",\"item_description\":\"Services Description\",\"item_price\":455,\"item_tax_rate\":11,\"item_uom\":\"Per Month\",\"created_at\":\"2025-08-13T09:47:05.000000Z\",\"updated_at\":\"2025-08-13T09:49:53.000000Z\"}}','2025-08-13 04:49:53',NULL),(4,2,'Hammad Ali','127.0.0.1','unknown','add','Added new client: test11',NULL,'buyers','fcd70d64a032de9821f14d63146fe5735678de4abd0289675bb2ca4a1b339b7f',1,'{\"byr_name\":\"test11\",\"byr_type\":1,\"byr_ntn_cnic\":4444444,\"byr_address\":\"Client Address\",\"byr_province\":\"Islamabad\",\"byr_account_title\":\"Account Title\",\"byr_account_number\":\"Account Number\",\"byr_reg_num\":\"65f5sd4af-d\",\"byr_contact_num\":\"0300-5325487\",\"byr_contact_person\":\"Waheed Ahmed\",\"byr_IBAN\":\"IBAN\",\"byr_acc_branch_name\":\"Branch Name\",\"byr_acc_branch_code\":\"Branch Name Branch Code\",\"byr_logo\":\"1755081132.png\",\"updated_at\":\"2025-08-13T10:32:12.000000Z\",\"created_at\":\"2025-08-13T10:32:12.000000Z\",\"byr_id\":9}','2025-08-13 05:32:12',NULL),(5,2,'Hammad Ali','127.0.0.1','unknown','update','Updated client: test11',NULL,'buyers','18fa478f1b006b687981518625c3654590ef898e36a07e539f31f9cead3d0679',0,'{\"old\":{\"byr_id\":9,\"byr_name\":\"test11\",\"byr_type\":1,\"byr_ntn_cnic\":4444444,\"byr_address\":\"Client Address\",\"byr_province\":\"Islamabad\",\"byr_logo\":\"1755081132.png\",\"byr_account_title\":\"Account Title\",\"byr_account_number\":\"Account Number\",\"byr_reg_num\":\"65f5sd4af-d\",\"byr_contact_num\":\"0300-5325487\",\"byr_contact_person\":\"Waheed Ahmed\",\"byr_IBAN\":\"IBAN\",\"byr_swift_code\":null,\"byr_acc_branch_name\":\"Branch Name\",\"byr_acc_branch_code\":\"Branch Name Branch Code\",\"created_at\":\"2025-08-13T10:32:12.000000Z\",\"updated_at\":\"2025-08-13T10:32:12.000000Z\"},\"new\":{\"byr_id\":9,\"byr_name\":\"test11\",\"byr_type\":0,\"byr_ntn_cnic\":null,\"byr_address\":\"Client Address\",\"byr_province\":\"Islamabad\",\"byr_logo\":\"1755081132.png\",\"byr_account_title\":\"Account Title\",\"byr_account_number\":\"Account Number\",\"byr_reg_num\":\"65f5sd4af-d\",\"byr_contact_num\":\"0300-5325487\",\"byr_contact_person\":\"Waheed Ahmed\",\"byr_IBAN\":\"IBAN\",\"byr_swift_code\":null,\"byr_acc_branch_name\":\"Branch Name\",\"byr_acc_branch_code\":\"Branch Name Branch Code\",\"created_at\":\"2025-08-13T10:32:12.000000Z\",\"updated_at\":\"2025-08-13T10:32:35.000000Z\"}}','2025-08-13 05:32:35',NULL),(6,2,'Hammad Ali','127.0.0.1','unknown','delete','Deleted client: test11','9','buyers','1d07265b8837488870ea8de1876bf6527cad332e36d34101640f267e298971dd',1,'{\"byr_id\":9,\"byr_name\":\"test11\",\"byr_type\":0,\"byr_ntn_cnic\":null,\"byr_address\":\"Client Address\",\"byr_province\":\"Islamabad\",\"byr_logo\":\"1755081132.png\",\"byr_account_title\":\"Account Title\",\"byr_account_number\":\"Account Number\",\"byr_reg_num\":\"65f5sd4af-d\",\"byr_contact_num\":\"0300-5325487\",\"byr_contact_person\":\"Waheed Ahmed\",\"byr_IBAN\":\"IBAN\",\"byr_swift_code\":null,\"byr_acc_branch_name\":\"Branch Name\",\"byr_acc_branch_code\":\"Branch Name Branch Code\",\"created_at\":\"2025-08-13T10:32:12.000000Z\",\"updated_at\":\"2025-08-13T10:32:35.000000Z\"}','2025-08-13 05:33:52',NULL),(7,2,'Hammad Ali','127.0.0.1','unknown','update','Updated company configuration',NULL,'business_configurations','9cf657fd5ad96ee471941bc2e1da5958c45be817ee1471cb7c555d5746d37f99',0,'{\"old\":{\"bus_config_id\":1,\"bus_name\":\"SECUREISM (PRIVATE) LIMITED\",\"bus_ntn_cnic\":8923980,\"bus_address\":\"F3 Center of Technology, Zaraj Society, Islamabad Pakistan\",\"bus_province\":\"Punjab\",\"bus_logo\":\"1752125231.svg\",\"bus_account_title\":\"SECUREISM (PRIVATE) LIMITED\",\"bus_account_number\":10109016750017,\"bus_reg_num\":119999,\"bus_contact_num\":3001234567,\"bus_contact_person\":\"ZEESHAN QAMAR\",\"bus_IBAN\":\"PK44ABPA0010109016750017\",\"bus_swift_code\":\"ABPAPKKA\",\"bus_acc_branch_name\":\"ABL CHAKLALA SCHEME 3 RAWALPINDI\",\"bus_acc_branch_code\":757,\"created_at\":\"2025-07-04T17:02:41.000000Z\",\"updated_at\":\"2025-08-12T09:28:59.000000Z\"},\"new\":{\"bus_config_id\":1,\"bus_name\":\"SECUREISM (PRIVATE) LIMITED\",\"bus_ntn_cnic\":8923980,\"bus_address\":\"F3 Center of Technology, Zaraj Society, Islamabad Pakistan\",\"bus_province\":\"Punjab\",\"bus_logo\":\"1752125231.svg\",\"bus_account_title\":\"SECUREISM (PRIVATE) LIMITED\",\"bus_account_number\":10109016750017,\"bus_reg_num\":119999,\"bus_contact_num\":3001234567,\"bus_contact_person\":\"ZEESHAN QAMAR\",\"bus_IBAN\":\"PK44ABPA0010109016750017\",\"bus_swift_code\":\"ABPAPKKA\",\"bus_acc_branch_name\":\"ABL CHAKLALA SCHEME 3 RAWALPINDI\",\"bus_acc_branch_code\":757,\"created_at\":\"2025-07-04T17:02:41.000000Z\",\"updated_at\":\"2025-08-12T09:28:59.000000Z\"}}','2025-08-13 05:35:43',NULL),(8,2,'Hammad Ali','127.0.0.1','unknown','update','Updated company configuration',NULL,'business_configurations','11ca2b2c3f3be8874c5864178ce3d6b6a9b5e772638294ba8615e9a97086011d',0,'{\"old\":{\"bus_config_id\":1,\"bus_name\":\"SECUREISM (PRIVATE) LIMITED\",\"bus_ntn_cnic\":8923980,\"bus_address\":\"F3 Center of Technology, Zaraj Society, Islamabad Pakistan\",\"bus_province\":\"Punjab\",\"bus_logo\":\"1752125231.svg\",\"bus_account_title\":\"SECUREISM (PRIVATE) LIMITED\",\"bus_account_number\":10109016750017,\"bus_reg_num\":119999,\"bus_contact_num\":3001234567,\"bus_contact_person\":\"ZEESHAN QAMAR\",\"bus_IBAN\":\"PK44ABPA0010109016750017\",\"bus_swift_code\":\"ABPAPKKA\",\"bus_acc_branch_name\":\"ABL CHAKLALA SCHEME 3 RAWALPINDI\",\"bus_acc_branch_code\":757,\"created_at\":\"2025-07-04T17:02:41.000000Z\",\"updated_at\":\"2025-08-12T09:28:59.000000Z\"},\"new\":{\"bus_config_id\":1,\"bus_name\":\"SECUREISM (PRIVATE) LIMITED.\",\"bus_ntn_cnic\":8923980,\"bus_address\":\"F3 Center of Technology, Zaraj Society, Islamabad Pakistan\",\"bus_province\":\"Punjab\",\"bus_logo\":\"1752125231.svg\",\"bus_account_title\":\"SECUREISM (PRIVATE) LIMITED\",\"bus_account_number\":10109016750017,\"bus_reg_num\":119999,\"bus_contact_num\":3001234567,\"bus_contact_person\":\"ZEESHAN QAMAR\",\"bus_IBAN\":\"PK44ABPA0010109016750017\",\"bus_swift_code\":\"ABPAPKKA\",\"bus_acc_branch_name\":\"ABL CHAKLALA SCHEME 3 RAWALPINDI\",\"bus_acc_branch_code\":757,\"created_at\":\"2025-07-04T17:02:41.000000Z\",\"updated_at\":\"2025-08-13T10:36:28.000000Z\"}}','2025-08-13 05:36:28',NULL),(9,2,'Hammad Ali','127.0.0.1','unknown','update','Updated company configuration',NULL,'business_configurations','1a308ba2f3295e490c0acb2fe7b02c6f801b11fab6b9f20cc1fb96ef0cc6e88b',0,'{\"old\":{\"bus_config_id\":1,\"bus_name\":\"SECUREISM (PRIVATE) LIMITED.\",\"bus_ntn_cnic\":8923980,\"bus_address\":\"F3 Center of Technology, Zaraj Society, Islamabad Pakistan\",\"bus_province\":\"Punjab\",\"bus_logo\":\"1752125231.svg\",\"bus_account_title\":\"SECUREISM (PRIVATE) LIMITED\",\"bus_account_number\":10109016750017,\"bus_reg_num\":119999,\"bus_contact_num\":3001234567,\"bus_contact_person\":\"ZEESHAN QAMAR\",\"bus_IBAN\":\"PK44ABPA0010109016750017\",\"bus_swift_code\":\"ABPAPKKA\",\"bus_acc_branch_name\":\"ABL CHAKLALA SCHEME 3 RAWALPINDI\",\"bus_acc_branch_code\":757,\"created_at\":\"2025-07-04T17:02:41.000000Z\",\"updated_at\":\"2025-08-13T10:36:28.000000Z\"},\"new\":{\"bus_config_id\":1,\"bus_name\":\"SECUREISM (PRIVATE) LIMITED\",\"bus_ntn_cnic\":8923980,\"bus_address\":\"F3 Center of Technology, Zaraj Society, Islamabad Pakistan\",\"bus_province\":\"Punjab\",\"bus_logo\":\"1752125231.svg\",\"bus_account_title\":\"SECUREISM (PRIVATE) LIMITED\",\"bus_account_number\":10109016750017,\"bus_reg_num\":119999,\"bus_contact_num\":3001234567,\"bus_contact_person\":\"ZEESHAN QAMAR\",\"bus_IBAN\":\"PK44ABPA0010109016750017\",\"bus_swift_code\":\"ABPAPKKA\",\"bus_acc_branch_name\":\"ABL CHAKLALA SCHEME 3 RAWALPINDI\",\"bus_acc_branch_code\":757,\"created_at\":\"2025-07-04T17:02:41.000000Z\",\"updated_at\":\"2025-08-13T10:36:41.000000Z\"}}','2025-08-13 05:36:41',NULL),(18,2,'Hammad Ali','127.0.0.1','unknown','update','Posted invoice to FBR: INV-000161','INV-000161','invoices','b066355fbab2dbdcdc7b6296582afbf3f2b99f8b3ece5349f5bde65e771231ac',0,'{\"invoice_type\":\"Sale Invoice\",\"invoice_date\":\"2025-08-15\",\"due_date\":\"2025-08-16\",\"scenario_id\":\"SN018\",\"invoice_ref_no\":null,\"seller_id\":1,\"buyer_id\":3,\"invoice_status\":2,\"is_posted_to_fbr\":1,\"totalAmountExcludingTax\":10000,\"totalAmountIncludingTax\":11600,\"totalSalesTax\":1600,\"totalfurtherTax\":0,\"totalextraTax\":0,\"shipping_charges\":0,\"other_charges\":0,\"discount_amount\":0,\"payment_status\":null,\"notes\":null,\"updated_at\":\"2025-08-15T04:07:54.000000Z\",\"created_at\":\"2025-08-15T04:07:53.000000Z\",\"invoice_id\":161,\"invoice_no\":\"INV-000161\",\"fbr_invoice_number\":\"8923980DI1755230853498\",\"response_status\":\"Success\",\"response_message\":\"Posted successfully to FBR SANDBOX\"}','2025-08-14 23:07:54',NULL),(19,2,'Hammad Ali','127.0.0.1','unknown','update','Posted invoice to FBR: INV-000162','INV-000162','invoices','1ad62a963c7419b8f968a6250cbc70bb5247db2928a64ce42cccd3de394d8ba3',0,'{\"invoice_type\":\"Sale Invoice\",\"invoice_date\":\"2025-08-15\",\"due_date\":\"2025-08-19\",\"scenario_id\":\"SN018\",\"invoice_ref_no\":null,\"seller_id\":1,\"buyer_id\":3,\"invoice_status\":2,\"is_posted_to_fbr\":1,\"totalAmountExcludingTax\":10000,\"totalAmountIncludingTax\":11600,\"totalSalesTax\":1600,\"totalfurtherTax\":0,\"totalextraTax\":0,\"shipping_charges\":0,\"other_charges\":0,\"discount_amount\":0,\"payment_status\":null,\"notes\":null,\"updated_at\":\"2025-08-15T05:03:40.000000Z\",\"created_at\":\"2025-08-15T05:03:38.000000Z\",\"invoice_id\":162,\"invoice_no\":\"INV-000162\",\"fbr_invoice_number\":\"8923980DI1755234199105\",\"response_status\":\"Success\",\"response_message\":\"Posted successfully to FBR SANDBOX\"}','2025-08-15 00:03:40',NULL),(20,2,'Hammad Ali','127.0.0.1','unknown','update','Posted invoice to FBR: INV-000163','INV-000163','invoices','a4ba38baeb60735b7060f64b355253e1d6c058cec0ae0703ce4ad67d56e68ff6',0,'{\"invoice_type\":\"Sale Invoice\",\"invoice_date\":\"2025-08-15\",\"due_date\":\"2025-08-18\",\"scenario_id\":\"SN018\",\"invoice_ref_no\":null,\"seller_id\":1,\"buyer_id\":3,\"invoice_status\":2,\"is_posted_to_fbr\":1,\"totalAmountExcludingTax\":10000,\"totalAmountIncludingTax\":11600,\"totalSalesTax\":1600,\"totalfurtherTax\":0,\"totalextraTax\":0,\"shipping_charges\":0,\"other_charges\":0,\"discount_amount\":0,\"payment_status\":null,\"notes\":null,\"updated_at\":\"2025-08-15T05:07:19.000000Z\",\"created_at\":\"2025-08-15T05:07:17.000000Z\",\"invoice_id\":163,\"invoice_no\":\"INV-000163\",\"fbr_invoice_number\":\"8923980DI1755234417846\",\"response_status\":\"Success\",\"response_message\":\"Posted successfully to FBR SANDBOX\"}','2025-08-15 00:07:19',NULL);
/*!40000 ALTER TABLE `activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

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
  `bus_account_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `business_configurations` VALUES (1,'SECUREISM (PRIVATE) LIMITED','8923980','F3 Center of Technology, Zaraj Society, Islamabad Pakistan','Punjab','1752125231.svg','SECUREISM (PRIVATE) LIMITED','0010109016750017','0119999','03001234567','ZEESHAN QAMAR','PK44ABPA0010109016750017','ABPAPKKA','ABL CHAKLALA SCHEME 3 RAWALPINDI','0757','2025-07-04 12:02:41','2025-08-13 05:36:41');
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
  `byr_ntn_cnic` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `byr_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `byr_province` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `byr_logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `byr_account_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyers`
--

LOCK TABLES `buyers` WRITE;
/*!40000 ALTER TABLE `buyers` DISABLE KEYS */;
INSERT INTO `buyers` VALUES (1,'SkyPass',1,'','Office 304, Centaurus Mall, Islamabad','Islamabad','1752126900.png','SkyPass Technologies (Pvt) Ltd','00123456789012','REG-987654','03005325487','Waheed Ahmed','PK36ABPA0001234567890123','ABPAPKKA','F-8 Markaz Branch','0876','2025-07-10 00:55:00','2025-08-12 02:59:05'),(3,'F3 Technologies (Pvt) Ltd',0,'','2nd Floor, Arfa Software Tech Park, Lahore','Punjab','1752127824.jpeg','F3 Technologies Pvt Ltd','00098765432100','REG-2025013','Salman Qureshi','03211234567','PK92HABB0009876543210001','ABCDPKKB','Main Boulevard Gulberg Branch','0452','2025-07-10 01:10:24','2025-08-12 02:46:18'),(4,'ZAQ Technologies',1,'4784448','Jan Plaza, Chakri Rd, RWP, Pakistan','Islamabad','1752554304.png','ZAQ Technologies','1234567890123466','REG-IES-20745','03703011272','Saqib','sfdafsafasfadsfdasf','ABCDPKKBC','ABLF','08766','2025-07-14 23:38:24','2025-08-12 02:46:07'),(5,'Testing',1,'6111455','Address','Islamabad','1754992029.png','Islamabad Electric Supply Company','00123456789012','65f5sd4af-d','0300-5325487','Waheed Ahmed','00123456789012','33','ABL','0876','2025-08-12 04:47:09','2025-08-12 04:51:40'),(8,'test',0,NULL,'fClient Address','Islamabad','1755061596.png','Account Title','Account Number','Registration Number','Contact Number','Contact Person','IBAN',NULL,'Branch Name','Branch Code','2025-08-13 00:06:36','2025-08-13 00:39:37');
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
INSERT INTO `cache` VALUES ('secureism_invoicing_management_system_cache_da4b9237bacccdf19c0760cab7aec4a8359010b0','i:1;',1755234248),('secureism_invoicing_management_system_cache_da4b9237bacccdf19c0760cab7aec4a8359010b0:timer','i:1755234248;',1755234248);
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
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_details`
--

LOCK TABLES `invoice_details` WRITE;
/*!40000 ALTER TABLE `invoice_details` DISABLE KEYS */;
INSERT INTO `invoice_details` VALUES (42,23,7,1,11600.00,10000.00,0.00,1600.00,0.00,0.00,0.00,0.00,0.00,'Services','','','2025-07-28 00:05:55','2025-07-28 00:05:55'),(57,34,7,1,11600.00,10000.00,0.00,1600.00,0.00,0.00,0.00,0.00,0.00,'Services','','','2025-08-12 00:01:18','2025-08-12 00:01:18'),(173,150,7,1,11600.00,10000.00,0.00,1600.00,0.00,0.00,0.00,0.00,0.00,'Services (FED in ST Mode)','','','2025-08-13 06:18:01','2025-08-13 06:18:01'),(186,161,7,1,11600.00,10000.00,0.00,1600.00,0.00,0.00,0.00,0.00,0.00,'Services (FED in ST Mode)','','','2025-08-14 23:07:53','2025-08-14 23:07:53'),(187,162,7,1,11600.00,10000.00,0.00,1600.00,0.00,0.00,0.00,0.00,0.00,'Services (FED in ST Mode)','','','2025-08-15 00:03:38','2025-08-15 00:03:38'),(188,163,7,1,11600.00,10000.00,0.00,1600.00,0.00,0.00,0.00,0.00,0.00,'Services (FED in ST Mode)','','','2025-08-15 00:07:17','2025-08-15 00:07:17');
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
  `invoice_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_date` date NOT NULL,
  `due_date` date DEFAULT NULL,
  `scenario_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_ref_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seller_id` bigint unsigned NOT NULL,
  `buyer_id` bigint unsigned NOT NULL,
  `fbr_invoice_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qr_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_posted_to_fbr` tinyint NOT NULL DEFAULT '0',
  `invoice_status` tinyint NOT NULL DEFAULT '1',
  `response_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `response_message` text COLLATE utf8mb4_unicode_ci,
  `totalAmountExcludingTax` double DEFAULT NULL,
  `totalAmountIncludingTax` double DEFAULT NULL,
  `totalSalesTax` double DEFAULT NULL,
  `totalfurtherTax` double DEFAULT NULL,
  `totalextraTax` double DEFAULT NULL,
  `shipping_charges` double DEFAULT NULL,
  `other_charges` double DEFAULT NULL,
  `discount_amount` double DEFAULT NULL,
  `payment_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `invoices_seller_id_foreign` (`seller_id`),
  KEY `invoices_buyer_id_foreign` (`buyer_id`),
  CONSTRAINT `invoices_buyer_id_foreign` FOREIGN KEY (`buyer_id`) REFERENCES `buyers` (`byr_id`) ON DELETE CASCADE,
  CONSTRAINT `invoices_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `business_configurations` (`bus_config_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (23,NULL,'Sale Invoice','2025-07-26','2025-07-30',NULL,NULL,1,3,NULL,NULL,0,1,NULL,NULL,10000,11600,1600,10,0,0,0,0,NULL,NULL,'2025-07-25 06:05:03','2025-07-27 23:38:35'),(34,NULL,'Sale Invoice','2025-08-12','2025-08-14',NULL,NULL,1,3,NULL,NULL,0,1,NULL,NULL,10000,11600,1600,0,0,0,0,0,NULL,NULL,'2025-08-12 00:01:18','2025-08-12 00:01:18'),(150,'INV-000150','Sale Invoice','2025-08-13','2025-08-15','SN018',NULL,1,3,'8923980DI1755083863552',NULL,1,2,'Success','Posted successfully to FBR SANDBOX',10000,11600,1600,0,0,0,0,0,NULL,NULL,'2025-08-13 06:18:01','2025-08-13 06:18:02'),(161,'INV-000161','Sale Invoice','2025-08-15','2025-08-16','SN018',NULL,1,3,'8923980DI1755230853498',NULL,1,2,'Success','Posted successfully to FBR SANDBOX',10000,11600,1600,0,0,0,0,0,NULL,NULL,'2025-08-14 23:07:53','2025-08-14 23:07:54'),(162,'INV-000162','Sale Invoice','2025-08-15','2025-08-19','SN018',NULL,1,3,'8923980DI1755234199105',NULL,1,2,'Success','Posted successfully to FBR SANDBOX',10000,11600,1600,0,0,0,0,0,NULL,NULL,'2025-08-15 00:03:38','2025-08-15 00:03:40'),(163,'INV-000163','Sale Invoice','2025-08-15','2025-08-18','SN018',NULL,1,3,'8923980DI1755234417846','qr_INV-000163_1755234439.png',1,2,'Success','Posted successfully to FBR SANDBOX',10000,11600,1600,0,0,0,0,0,NULL,NULL,'2025-08-15 00:07:17','2025-08-15 00:07:19');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,NULL,'Custom website development using Laravel & React',150000,'18','Per Project','2025-07-10 01:11:44','2025-07-10 01:11:59'),(2,NULL,'SEO Optimization Package',25000,'16','Per Month','2025-07-10 01:12:21','2025-07-10 01:12:21'),(3,NULL,'AWS-based cloud hosting with 99.9% uptime SLA',10000,'15','Per Month','2025-07-10 01:12:48','2025-07-10 01:12:48'),(4,NULL,'Logo design, banners, and brand identity materials',12000,'15','Per Design Package','2025-07-10 01:13:08','2025-07-10 01:13:08'),(5,NULL,'Bug fixing and feature updates for Android/iOS apps',30000,'17','Per Month','2025-07-10 01:13:34','2025-07-10 01:13:34'),(7,'9815.6000','API Integration Services',10000,'16','Per Month','2025-07-25 01:39:42','2025-07-25 01:39:42'),(12,'hs-code1','Services Description',455,'11','Per Month','2025-08-13 04:47:05','2025-08-13 04:49:53');
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (7,'0001_01_01_000000_create_users_table',1),(8,'0001_01_01_000001_create_cache_table',1),(9,'0001_01_01_000002_create_jobs_table',1),(22,'2025_07_04_120046_create_business_configurations_table',2),(24,'2025_07_04_121405_create_buyers_table',3),(25,'2025_07_07_045332_create_items_table',4),(26,'2025_07_07_050034_create_invoices_table',5),(27,'2025_07_07_050036_create_invoice_details_table',5),(28,'2025_07_07_110924_add_bus_province_to_business_configurations_table',6),(29,'2025_07_07_111052_add_byr_province_to_buyers_table',7),(30,'2025_07_08_112513_add_totals_to_invoices_table',8),(31,'2025_07_10_052012_add_bus_account_title_to_business_configurations_table',9),(32,'2025_07_10_054824_add_byr_account_title_to_buyers_table',10),(33,'2025_07_10_063142_add_invoice_no_and_due_date_to_invoices_table',11),(34,'2025_07_14_071715_add_columns_to_invoices_table',12),(35,'2025_07_14_075126_make_invoice_no_nullable_in_invoices_table',13),(36,'2025_08_13_044242_alter_byr_ntn_cnic_nullable_in_buyers_table',14),(37,'2025_08_13_091004_create_activity_logs_table',15),(38,'2025_08_13_112939_add_qr_code_to_invoices_table',16);
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
INSERT INTO `sessions` VALUES ('2PxlqWN0DD69M5aDelHiFK6cHvMBHM1buHbwP1Cb',2,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiWEt3REhPUkxLRXY3TkROQ0RNYnowQmJoYXpVQnFpd045VlJMcW9GTCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvaW52b2ljZXMvY3JlYXRlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mjt9',1755238231);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'Hammad Ali','hammad.ali@f3technologies.eu',NULL,'$2y$12$pJSGUTTYxPO7RIRKganrT.d5Yd.M.qT5RR7DNjlDMWfj9t7UTD0kG',NULL,'2025-07-02 01:29:39','2025-07-14 02:06:02'),(3,'Hammad Naseer','hammad.naseer@f3technologies.eu',NULL,'$2y$12$uUtR1dE5s3FQOYUd/2DSmOhnR64Mo/SkDT.PZ.j4CA5H0JTJDpmti',NULL,'2025-07-04 02:20:40','2025-07-04 02:20:40'),(4,'PRAL','admin@pral.com',NULL,'$2y$12$L.S4Y73wLI.F5tF6sbUyf.mkrEGCMbU7oh789Ba2caicyUAlK1ApW',NULL,'2025-07-02 01:29:39','2025-07-02 01:29:39');
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

-- Dump completed on 2025-08-15 11:12:16
