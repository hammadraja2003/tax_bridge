USE `tax_bridge`;
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_logs`
--

LOCK TABLES `activity_logs` WRITE;
/*!40000 ALTER TABLE `activity_logs` DISABLE KEYS */;
INSERT INTO `activity_logs` VALUES (1,2,'Hammad Ali','127.0.0.1','unknown','add','Added new item: API Integration Services',NULL,'items','001e112751aed980ef1e93674517d7d1de88518ab2cfc2e37ca4f454a3864f8d',1,'{\"item_description\":\"API Integration Services\",\"item_hs_code\":9815.6,\"item_price\":10000,\"item_tax_rate\":16,\"item_uom\":\"Per Month\",\"hash\":\"3afbbbb655fda2a169b9e1333fd17dd3\",\"updated_at\":\"2025-08-18T06:10:32.000000Z\",\"created_at\":\"2025-08-18T06:10:32.000000Z\",\"item_id\":1}','2025-08-18 01:10:32',NULL),(2,2,'Hammad Ali','127.0.0.1','unknown','update','Updated item: API Integration Services.',NULL,'items','8ca241139cc11c0589752ab49bbfc6503d00418346f11d51e22cc6971267f2f4',0,'{\"old\":{\"item_id\":1,\"item_hs_code\":9815.6,\"item_description\":\"API Integration Services\",\"item_price\":10000,\"item_tax_rate\":16,\"item_uom\":\"Per Month\",\"hash\":\"3afbbbb655fda2a169b9e1333fd17dd3\",\"created_at\":\"2025-08-18T06:10:32.000000Z\",\"updated_at\":\"2025-08-18T06:10:32.000000Z\"},\"new\":{\"item_id\":1,\"item_hs_code\":9815.6,\"item_description\":\"API Integration Services.\",\"item_price\":10000,\"item_tax_rate\":16,\"item_uom\":\"Per Month\",\"hash\":\"b18912aedf0edc4f980c1939889f02c1\",\"created_at\":\"2025-08-18T06:10:32.000000Z\",\"updated_at\":\"2025-08-18T06:11:13.000000Z\"}}','2025-08-18 01:11:13',NULL),(3,2,'Hammad Ali','127.0.0.1','unknown','add','Added new client: F3 Technologies (Pvt) Ltd',NULL,'buyers','e68cfdd78fd115acadd397141e78ab60f13a0e834aa20fd435bbb75ddf3628e6',1,'{\"byr_name\":\"F3 Technologies (Pvt) Ltd\",\"byr_type\":0,\"byr_ntn_cnic\":null,\"byr_address\":\"Dr, Zaraj Housing Society Sector B Islamabad\",\"byr_province\":\"Islamabad\",\"byr_account_title\":\"F3 Technologies Pvt Ltd\",\"byr_account_number\":98765432100,\"byr_reg_num\":\"REG-2025013\",\"byr_contact_num\":\"0300-5325487\",\"byr_contact_person\":\"Dr Ahmed Javad\",\"byr_IBAN\":\"PKIBAN789798978987\",\"byr_acc_branch_name\":\"F-8 Markaz Branch\",\"byr_acc_branch_code\":876,\"byr_logo\":\"1755497672.jpg\",\"hash\":\"6bfdd53b167d10d243265fd8ea4299db\",\"updated_at\":\"2025-08-18T06:14:32.000000Z\",\"created_at\":\"2025-08-18T06:14:32.000000Z\",\"byr_id\":1}','2025-08-18 01:14:32',NULL),(4,2,'Hammad Ali','127.0.0.1','unknown','update','Updated client: F3 Technologies (Pvt) Ltd.',NULL,'buyers','379dd75dc402007ed2ed0bef5cdc94b6d6ae569651dd6ce88baf9f34721cff53',0,'{\"old\":{\"byr_id\":1,\"byr_name\":\"F3 Technologies (Pvt) Ltd\",\"byr_type\":0,\"byr_ntn_cnic\":null,\"byr_address\":\"Dr, Zaraj Housing Society Sector B Islamabad\",\"byr_province\":\"Islamabad\",\"byr_logo\":\"1755497672.jpg\",\"byr_account_title\":\"F3 Technologies Pvt Ltd\",\"byr_account_number\":98765432100,\"byr_reg_num\":\"REG-2025013\",\"byr_contact_num\":\"0300-5325487\",\"byr_contact_person\":\"Dr Ahmed Javad\",\"byr_IBAN\":\"PKIBAN789798978987\",\"byr_swift_code\":null,\"byr_acc_branch_name\":\"F-8 Markaz Branch\",\"byr_acc_branch_code\":876,\"hash\":\"6bfdd53b167d10d243265fd8ea4299db\",\"created_at\":\"2025-08-18T06:14:32.000000Z\",\"updated_at\":\"2025-08-18T06:14:32.000000Z\"},\"new\":{\"byr_id\":1,\"byr_name\":\"F3 Technologies (Pvt) Ltd.\",\"byr_type\":0,\"byr_ntn_cnic\":null,\"byr_address\":\"Dr, Zaraj Housing Society Sector B Islamabad\",\"byr_province\":\"Islamabad\",\"byr_logo\":\"1755497672.jpg\",\"byr_account_title\":\"F3 Technologies Pvt Ltd\",\"byr_account_number\":98765432100,\"byr_reg_num\":\"REG-2025013\",\"byr_contact_num\":\"0300-5325487\",\"byr_contact_person\":\"Dr Ahmed Javad\",\"byr_IBAN\":\"PKIBAN789798978987\",\"byr_swift_code\":null,\"byr_acc_branch_name\":\"F-8 Markaz Branch\",\"byr_acc_branch_code\":876,\"hash\":\"b7cbe9df5fe4dc2c59d385b89ee93a3e\",\"created_at\":\"2025-08-18T06:14:32.000000Z\",\"updated_at\":\"2025-08-18T06:14:59.000000Z\"}}','2025-08-18 01:14:59',NULL),(5,2,'Hammad Ali','127.0.0.1','unknown','update','Updated client: F3 Technologies (Pvt) Ltd.',NULL,'buyers','6d526c7d18adbab757ad5e29fbfcba879afdcfbb6cefcb045e6d96910cf41a12',0,'{\"old\":{\"byr_id\":1,\"byr_name\":\"F3 Technologies (Pvt) Ltd.\",\"byr_type\":0,\"byr_ntn_cnic\":null,\"byr_address\":\"Dr, Zaraj Housing Society Sector B Islamabad\",\"byr_province\":\"Islamabad\",\"byr_logo\":\"1755497672.jpg\",\"byr_account_title\":\"F3 Technologies Pvt Ltd\",\"byr_account_number\":98765432100,\"byr_reg_num\":\"REG-2025013\",\"byr_contact_num\":\"0300-5325487\",\"byr_contact_person\":\"Dr Ahmed Javad\",\"byr_IBAN\":\"PKIBAN789798978987\",\"byr_swift_code\":null,\"byr_acc_branch_name\":\"F-8 Markaz Branch\",\"byr_acc_branch_code\":876,\"hash\":\"b7cbe9df5fe4dc2c59d385b89ee93a3e\",\"created_at\":\"2025-08-18T06:14:32.000000Z\",\"updated_at\":\"2025-08-18T06:14:59.000000Z\"},\"new\":{\"byr_id\":1,\"byr_name\":\"F3 Technologies (Pvt) Ltd.\",\"byr_type\":0,\"byr_ntn_cnic\":null,\"byr_address\":\"Dr, Zaraj Housing Society Sector B Islamabad\",\"byr_province\":\"Punjab\",\"byr_logo\":\"1755497672.jpg\",\"byr_account_title\":\"F3 Technologies Pvt Ltd\",\"byr_account_number\":98765432100,\"byr_reg_num\":\"REG-2025013\",\"byr_contact_num\":\"0300-5325487\",\"byr_contact_person\":\"Dr Ahmed Javad\",\"byr_IBAN\":\"PKIBAN789798978987\",\"byr_swift_code\":null,\"byr_acc_branch_name\":\"F-8 Markaz Branch\",\"byr_acc_branch_code\":876,\"hash\":\"1d254d85e96f5896b378ceb969ba75ec\",\"created_at\":\"2025-08-18T06:14:32.000000Z\",\"updated_at\":\"2025-08-18T06:27:53.000000Z\"}}','2025-08-18 01:27:53',NULL),(6,2,'Hammad Ali','127.0.0.1','unknown','update','Posted invoice to FBR: INV-000001','INV-000001','invoices','e7c2521a3518c18975e697c8ec2e000a8d192779ee6c5e136aa1fb387fdac464',0,'{\"invoice_id\":1,\"invoice_no\":\"INV-000001\",\"invoice_type\":\"Sale Invoice\",\"invoice_date\":\"2025-08-18\",\"due_date\":\"2025-08-20\",\"scenario_id\":\"SN018\",\"invoice_ref_no\":null,\"seller_id\":1,\"buyer_id\":1,\"fbr_invoice_number\":\"8923980DI1755498461992\",\"qr_code\":null,\"is_posted_to_fbr\":1,\"invoice_status\":2,\"response_status\":\"Success\",\"response_message\":\"Posted successfully to FBR SANDBOX\",\"totalAmountExcludingTax\":10000,\"totalAmountIncludingTax\":11600,\"totalSalesTax\":1600,\"totalfurtherTax\":0,\"totalextraTax\":0,\"shipping_charges\":0,\"other_charges\":0,\"discount_amount\":0,\"payment_status\":null,\"notes\":null,\"hash\":\"8b92e427efd23424e9a70eb89f5d255ee989cbcd7753b7209dcd90a3059d7c3f\",\"created_at\":\"2025-08-18T06:16:54.000000Z\",\"updated_at\":\"2025-08-18T06:28:07.000000Z\"}','2025-08-18 01:28:07',NULL),(7,2,'Hammad Ali','127.0.0.1','unknown','update','Posted invoice to FBR: INV-000002','INV-000002','invoices','3b47f1be9943350609e6dd40e60577503eb2458e5fec2cd4a5f972a624a42828',0,'{\"invoice_id\":2,\"invoice_no\":\"INV-000002\",\"invoice_type\":\"Sale Invoice\",\"invoice_date\":\"2025-08-18\",\"due_date\":\"2025-08-19\",\"scenario_id\":\"SN019\",\"invoice_ref_no\":null,\"seller_id\":1,\"buyer_id\":1,\"fbr_invoice_number\":\"8923980DI1755498519086\",\"qr_code\":null,\"is_posted_to_fbr\":1,\"invoice_status\":2,\"response_status\":\"Success\",\"response_message\":\"Posted successfully to FBR SANDBOX\",\"totalAmountExcludingTax\":10000,\"totalAmountIncludingTax\":11600,\"totalSalesTax\":1600,\"totalfurtherTax\":0,\"totalextraTax\":0,\"shipping_charges\":0,\"other_charges\":0,\"discount_amount\":0,\"payment_status\":null,\"notes\":null,\"hash\":\"ebcadd4a5ce1b31ca956842b650f7e5424967717a96d18dabc1a1f5a57f707b7\",\"created_at\":\"2025-08-18T06:28:51.000000Z\",\"updated_at\":\"2025-08-18T06:29:04.000000Z\"}','2025-08-18 01:29:04',NULL),(8,2,'Hammad Ali','127.0.0.1','unknown','add','Added new item: Custom Software Development',NULL,'items','7f4fa133487dca77df78ed86fcc7c972b6bc4bcf4ddc28b659f8191873e37cbd',1,'{\"item_description\":\"Custom Software Development\",\"item_hs_code\":998314,\"item_price\":250000,\"item_tax_rate\":18,\"item_uom\":\"Per Project\",\"hash\":\"0e237b30925385b6c9b79293e6452ba9\",\"updated_at\":\"2025-08-18T06:36:21.000000Z\",\"created_at\":\"2025-08-18T06:36:21.000000Z\",\"item_id\":2}','2025-08-18 01:36:21',NULL),(9,2,'Hammad Ali','127.0.0.1','unknown','update','Updated item: API Integration Services.',NULL,'items','6e385fe9aa32c5e09b04be69ae7c533db8241a7c43675484953c326c5bd8fed7',0,'{\"old\":{\"item_id\":1,\"item_hs_code\":9815.6,\"item_description\":\"API Integration Services.\",\"item_price\":10000,\"item_tax_rate\":16,\"item_uom\":\"Per Month\",\"hash\":\"b18912aedf0edc4f980c1939889f02c1\",\"created_at\":\"2025-08-18T06:10:32.000000Z\",\"updated_at\":\"2025-08-18T06:11:13.000000Z\"},\"new\":{\"item_id\":1,\"item_hs_code\":9815.6,\"item_description\":\"API Integration Services.\",\"item_price\":15000,\"item_tax_rate\":16,\"item_uom\":\"Per Month\",\"hash\":\"388ae412f2b5aa5b3c3f2af7ae3201c3\",\"created_at\":\"2025-08-18T06:10:32.000000Z\",\"updated_at\":\"2025-08-18T06:37:49.000000Z\"}}','2025-08-18 01:37:49',NULL),(10,2,'Hammad Ali','127.0.0.1','unknown','update','Updated client: F3 Technologies (Pvt) Ltd.',NULL,'buyers','4ab748a2728d6070655f4703a3258b26827904a4b5f5271527c0d2cecb88e6a3',0,'{\"old\":{\"byr_id\":1,\"byr_name\":\"F3 Technologies (Pvt) Ltd.\",\"byr_type\":0,\"byr_ntn_cnic\":null,\"byr_address\":\"Dr, Zaraj Housing Society Sector B Islamabad\",\"byr_province\":\"Punjab\",\"byr_logo\":\"1755497672.jpg\",\"byr_account_title\":\"F3 Technologies Pvt Ltd\",\"byr_account_number\":98765432100,\"byr_reg_num\":\"REG-2025013\",\"byr_contact_num\":\"0300-5325487\",\"byr_contact_person\":\"Dr Ahmed Javad\",\"byr_IBAN\":\"PKIBAN789798978987\",\"byr_swift_code\":null,\"byr_acc_branch_name\":\"F-8 Markaz Branch\",\"byr_acc_branch_code\":876,\"hash\":\"1d254d85e96f5896b378ceb969ba75ec\",\"created_at\":\"2025-08-18T06:14:32.000000Z\",\"updated_at\":\"2025-08-18T06:27:53.000000Z\"},\"new\":{\"byr_id\":1,\"byr_name\":\"F3 Technologies (Pvt) Ltd.\",\"byr_type\":0,\"byr_ntn_cnic\":null,\"byr_address\":\"Dr, Zaraj Housing Society Sector B Islamabad\",\"byr_province\":\"Islamabad\",\"byr_logo\":\"1755497672.jpg\",\"byr_account_title\":\"F3 Technologies Pvt Ltd\",\"byr_account_number\":98765432100,\"byr_reg_num\":\"REG-2025013\",\"byr_contact_num\":\"0300-5325487\",\"byr_contact_person\":\"Dr Ahmed Javad\",\"byr_IBAN\":\"PKIBAN789798978987\",\"byr_swift_code\":null,\"byr_acc_branch_name\":\"F-8 Markaz Branch\",\"byr_acc_branch_code\":876,\"hash\":\"b7cbe9df5fe4dc2c59d385b89ee93a3e\",\"created_at\":\"2025-08-18T06:14:32.000000Z\",\"updated_at\":\"2025-08-18T07:07:10.000000Z\"}}','2025-08-18 02:07:10',NULL),(11,2,'Hammad Ali','127.0.0.1','unknown','update','Updated client: F3 Technologies (Pvt) Ltd.',NULL,'buyers','4020a584b351b05d6d77c1eb64eca36ec1410011da89f349aec9f09511b1b661',0,'{\"old\":{\"byr_id\":1,\"byr_name\":\"F3 Technologies (Pvt) Ltd.\",\"byr_type\":0,\"byr_ntn_cnic\":null,\"byr_address\":\"Dr, Zaraj Housing Society Sector B Islamabad\",\"byr_province\":\"Islamabad\",\"byr_logo\":\"1755497672.jpg\",\"byr_account_title\":\"F3 Technologies Pvt Ltd\",\"byr_account_number\":98765432100,\"byr_reg_num\":\"REG-2025013\",\"byr_contact_num\":\"0300-5325487\",\"byr_contact_person\":\"Dr Ahmed Javad\",\"byr_IBAN\":\"PKIBAN789798978987\",\"byr_swift_code\":null,\"byr_acc_branch_name\":\"F-8 Markaz Branch\",\"byr_acc_branch_code\":876,\"hash\":\"b7cbe9df5fe4dc2c59d385b89ee93a3e\",\"created_at\":\"2025-08-18T06:14:32.000000Z\",\"updated_at\":\"2025-08-18T07:07:10.000000Z\"},\"new\":{\"byr_id\":1,\"byr_name\":\"F3 Technologies (Pvt) Ltd.\",\"byr_type\":0,\"byr_ntn_cnic\":null,\"byr_address\":\"Dr, Zaraj Housing Society Sector B Islamabad\",\"byr_province\":\"Punjab\",\"byr_logo\":\"1755497672.jpg\",\"byr_account_title\":\"F3 Technologies Pvt Ltd\",\"byr_account_number\":98765432100,\"byr_reg_num\":\"REG-2025013\",\"byr_contact_num\":\"0300-5325487\",\"byr_contact_person\":\"Dr Ahmed Javad\",\"byr_IBAN\":\"PKIBAN789798978987\",\"byr_swift_code\":null,\"byr_acc_branch_name\":\"F-8 Markaz Branch\",\"byr_acc_branch_code\":876,\"hash\":\"1d254d85e96f5896b378ceb969ba75ec\",\"created_at\":\"2025-08-18T06:14:32.000000Z\",\"updated_at\":\"2025-08-18T07:10:50.000000Z\"}}','2025-08-18 02:10:50',NULL),(12,2,'Hammad Ali','127.0.0.1','unknown','update','Posted invoice to FBR: INV-000003','INV-000003','invoices','634041f3b2c7c960477170c53d169cd0d857a573a467ee8ae447577db254beae',0,'{\"invoice_id\":3,\"invoice_no\":\"INV-000003\",\"invoice_type\":\"Sale Invoice\",\"invoice_date\":\"2025-08-18\",\"due_date\":\"2025-08-23\",\"scenario_id\":\"SN018\",\"invoice_ref_no\":null,\"seller_id\":1,\"buyer_id\":1,\"fbr_invoice_number\":\"8923980DI1755501057284\",\"qr_code\":null,\"is_posted_to_fbr\":1,\"invoice_status\":2,\"response_status\":\"Success\",\"response_message\":\"Posted successfully to FBR SANDBOX\",\"totalAmountExcludingTax\":15000,\"totalAmountIncludingTax\":17400,\"totalSalesTax\":2400,\"totalfurtherTax\":0,\"totalextraTax\":0,\"shipping_charges\":0,\"other_charges\":0,\"discount_amount\":0,\"payment_status\":null,\"notes\":null,\"hash\":\"295caa2d400f5114b9a0bc4e99f08ad766ac9ef833cc015b44095e9b42b07b92\",\"created_at\":\"2025-08-18T07:09:21.000000Z\",\"updated_at\":\"2025-08-18T07:11:22.000000Z\"}','2025-08-18 02:11:22',NULL),(13,2,'Hammad Ali','127.0.0.1','unknown','update','Updated client: F3 Technologies (Pvt) Ltd.',NULL,'buyers','1b0a6a1cc8ec1f1f8b4463cda5922d28e317f1c9f499dfa854bdbcf65086acad',0,'{\"old\":{\"byr_id\":1,\"byr_name\":\"F3 Technologies (Pvt) Ltd.\",\"byr_type\":0,\"byr_ntn_cnic\":null,\"byr_address\":\"Dr, Zaraj Housing Society Sector B Islamabad\",\"byr_province\":\"Punjab\",\"byr_logo\":\"1755497672.jpg\",\"byr_account_title\":\"F3 Technologies Pvt Ltd\",\"byr_account_number\":98765432100,\"byr_reg_num\":\"REG-2025013\",\"byr_contact_num\":\"0300-5325487\",\"byr_contact_person\":\"Dr Ahmed Javad\",\"byr_IBAN\":\"PKIBAN789798978987\",\"byr_swift_code\":null,\"byr_acc_branch_name\":\"F-8 Markaz Branch\",\"byr_acc_branch_code\":876,\"hash\":\"1d254d85e96f5896b378ceb969ba75ec\",\"created_at\":\"2025-08-18T06:14:32.000000Z\",\"updated_at\":\"2025-08-18T07:10:50.000000Z\"},\"new\":{\"byr_id\":1,\"byr_name\":\"F3 Technologies (Pvt) Ltd.\",\"byr_type\":0,\"byr_ntn_cnic\":null,\"byr_address\":\"Dr, Zaraj Housing Society Sector B Islamabad\",\"byr_province\":\"Punjab\",\"byr_logo\":\"1755497672.jpg\",\"byr_account_title\":\"F3 Technologies Pvt Ltd\",\"byr_account_number\":98765432100,\"byr_reg_num\":\"REG-2025013\",\"byr_contact_num\":\"0300-5325487\",\"byr_contact_person\":\"Dr Ahmed Javad\",\"byr_IBAN\":\"PKIBAN789798978987\",\"byr_swift_code\":null,\"byr_acc_branch_name\":\"F-8 Markaz Branch\",\"byr_acc_branch_code\":876,\"hash\":\"1d254d85e96f5896b378ceb969ba75ec\",\"created_at\":\"2025-08-18T06:14:32.000000Z\",\"updated_at\":\"2025-08-18T07:10:50.000000Z\"}}','2025-08-18 04:09:00',NULL),(14,2,'Hammad Ali','127.0.0.1','unknown','update','Updated company configuration',NULL,'business_configurations','e873eef530d82522896d332d0791f7282674156a94993923cb4a2099dda15347',0,'{\"old\":{\"bus_config_id\":1,\"bus_name\":\"Secureism Pvt Ltd\",\"bus_ntn_cnic\":8923980,\"bus_address\":\"F3 Center of Technology, Zaraj Society, Islamabad Pakistan\",\"bus_province\":\"Punjab\",\"bus_logo\":\"1752125231.svg\",\"bus_account_title\":\"SECUREISM (PRIVATE) LIMITED\",\"bus_account_number\":10109016750017,\"bus_reg_num\":119999,\"bus_contact_num\":3001234567,\"bus_contact_person\":\"ZEESHAN QAMAR\",\"bus_IBAN\":\"PK44ABPA0010109016750017\",\"bus_swift_code\":\"ABPAPKKA\",\"bus_acc_branch_name\":\"ABL CHAKLALA SCHEME 3 RAWALPINDI\",\"bus_acc_branch_code\":757,\"hash\":null,\"created_at\":\"2025-07-04T17:02:41.000000Z\",\"updated_at\":\"2025-08-18T10:42:12.000000Z\"},\"new\":{\"bus_config_id\":1,\"bus_name\":\"Secureism Pvt Ltd\",\"bus_ntn_cnic\":8923980,\"bus_address\":\"F3 Center of Technology, Zaraj Society, Islamabad Pakistan\",\"bus_province\":\"Sindh\",\"bus_logo\":\"1752125231.svg\",\"bus_account_title\":\"SECUREISM (PRIVATE) LIMITED\",\"bus_account_number\":10109016750017,\"bus_reg_num\":119999,\"bus_contact_num\":3001234567,\"bus_contact_person\":\"ZEESHAN QAMAR\",\"bus_IBAN\":\"PK44ABPA0010109016750017\",\"bus_swift_code\":\"ABPAPKKA\",\"bus_acc_branch_name\":\"ABL CHAKLALA SCHEME 3 RAWALPINDI\",\"bus_acc_branch_code\":757,\"hash\":\"506c201f09b8a921df3d35f2cbdd053b\",\"created_at\":\"2025-07-04T17:02:41.000000Z\",\"updated_at\":\"2025-08-18T09:10:38.000000Z\"}}','2025-08-18 04:10:38',NULL),(15,2,'Hammad Ali','127.0.0.1','unknown','update','Updated company configuration',NULL,'business_configurations','b5cf0de5abafe321fab8e27aa82178ba1e781a102e30414159500437a873d4c5',0,'{\"old\":{\"bus_config_id\":1,\"bus_name\":\"Secureism Pvt Ltd\",\"bus_ntn_cnic\":8923980,\"bus_address\":\"F3 Center of Technology, Zaraj Society, Islamabad Pakistan\",\"bus_province\":\"Sindh\",\"bus_logo\":\"1752125231.svg\",\"bus_account_title\":\"SECUREISM (PRIVATE) LIMITED\",\"bus_account_number\":10109016750017,\"bus_reg_num\":119999,\"bus_contact_num\":3001234567,\"bus_contact_person\":\"ZEESHAN QAMAR\",\"bus_IBAN\":\"PK44ABPA0010109016750017\",\"bus_swift_code\":\"ABPAPKKA\",\"bus_acc_branch_name\":\"ABL CHAKLALA SCHEME 3 RAWALPINDI\",\"bus_acc_branch_code\":757,\"hash\":\"506c201f09b8a921df3d35f2cbdd053b\",\"created_at\":\"2025-07-04T17:02:41.000000Z\",\"updated_at\":\"2025-08-18T09:10:38.000000Z\"},\"new\":{\"bus_config_id\":1,\"bus_name\":\"Secureism Pvt Ltd\",\"bus_ntn_cnic\":8923980,\"bus_address\":\"F3 Center of Technology, Zaraj Society, Islamabad Pakistan\",\"bus_province\":\"Punjab\",\"bus_logo\":\"1752125231.svg\",\"bus_account_title\":\"SECUREISM (PRIVATE) LIMITED\",\"bus_account_number\":10109016750017,\"bus_reg_num\":119999,\"bus_contact_num\":3001234567,\"bus_contact_person\":\"ZEESHAN QAMAR\",\"bus_IBAN\":\"PK44ABPA0010109016750017\",\"bus_swift_code\":\"ABPAPKKA\",\"bus_acc_branch_name\":\"ABL CHAKLALA SCHEME 3 RAWALPINDI\",\"bus_acc_branch_code\":757,\"hash\":\"169c39ba55ca5c43c30e3faaaae9e083\",\"created_at\":\"2025-07-04T17:02:41.000000Z\",\"updated_at\":\"2025-08-18T09:10:42.000000Z\"}}','2025-08-18 04:10:42',NULL),(16,2,'Hammad Ali','127.0.0.1','unknown','update','Updated client: F3 Technologies (Pvt) Ltd.',NULL,'buyers','1b0a6a1cc8ec1f1f8b4463cda5922d28e317f1c9f499dfa854bdbcf65086acad',0,'{\"old\":{\"byr_id\":1,\"byr_name\":\"F3 Technologies (Pvt) Ltd.\",\"byr_type\":0,\"byr_ntn_cnic\":null,\"byr_address\":\"Dr, Zaraj Housing Society Sector B Islamabad\",\"byr_province\":\"Punjab\",\"byr_logo\":\"1755497672.jpg\",\"byr_account_title\":\"F3 Technologies Pvt Ltd\",\"byr_account_number\":98765432100,\"byr_reg_num\":\"REG-2025013\",\"byr_contact_num\":\"0300-5325487\",\"byr_contact_person\":\"Dr Ahmed Javad\",\"byr_IBAN\":\"PKIBAN789798978987\",\"byr_swift_code\":null,\"byr_acc_branch_name\":\"F-8 Markaz Branch\",\"byr_acc_branch_code\":876,\"hash\":\"1d254d85e96f5896b378ceb969ba75ec\",\"created_at\":\"2025-08-18T06:14:32.000000Z\",\"updated_at\":\"2025-08-18T07:10:50.000000Z\"},\"new\":{\"byr_id\":1,\"byr_name\":\"F3 Technologies (Pvt) Ltd.\",\"byr_type\":0,\"byr_ntn_cnic\":null,\"byr_address\":\"Dr, Zaraj Housing Society Sector B Islamabad\",\"byr_province\":\"Punjab\",\"byr_logo\":\"1755497672.jpg\",\"byr_account_title\":\"F3 Technologies Pvt Ltd\",\"byr_account_number\":98765432100,\"byr_reg_num\":\"REG-2025013\",\"byr_contact_num\":\"0300-5325487\",\"byr_contact_person\":\"Dr Ahmed Javad\",\"byr_IBAN\":\"PKIBAN789798978987\",\"byr_swift_code\":null,\"byr_acc_branch_name\":\"F-8 Markaz Branch\",\"byr_acc_branch_code\":876,\"hash\":\"1d254d85e96f5896b378ceb969ba75ec\",\"created_at\":\"2025-08-18T06:14:32.000000Z\",\"updated_at\":\"2025-08-18T07:10:50.000000Z\"}}','2025-08-18 04:16:46',NULL),(17,2,'Hammad Ali','127.0.0.1','unknown','update','Updated company configuration',NULL,'business_configurations','58a74e500183ecf469cdfb22feede8ece10abd1ad4b449410a7fa06719a82ee4',0,'{\"old\":{\"bus_config_id\":1,\"bus_name\":\"Secureism Pvt Ltd\",\"bus_ntn_cnic\":8923980,\"bus_address\":\"F3 Center of Technology, Zaraj Society, Islamabad Pakistan\",\"bus_province\":\"Punjab\",\"bus_logo\":\"1752125231.svg\",\"bus_account_title\":\"SECUREISM (PRIVATE) LIMITED\",\"bus_account_number\":10109016750017,\"bus_reg_num\":119999,\"bus_contact_num\":3001234567,\"bus_contact_person\":\"ZEESHAN QAMAR\",\"bus_IBAN\":\"PK44ABPA0010109016750017\",\"bus_swift_code\":\"ABPAPKKA\",\"bus_acc_branch_name\":\"ABL CHAKLALA SCHEME 3 RAWALPINDI\",\"bus_acc_branch_code\":757,\"hash\":\"169c39ba55ca5c43c30e3faaaae9e083\",\"created_at\":\"2025-07-04T17:02:41.000000Z\",\"updated_at\":\"2025-08-18T09:10:42.000000Z\"},\"new\":{\"bus_config_id\":1,\"bus_name\":\"Secureism Pvt Ltd\",\"bus_ntn_cnic\":8923980,\"bus_address\":\"F3 Center of Technology, Zaraj Society, Islamabad Pakistan\",\"bus_province\":\"Punjab\",\"bus_logo\":\"1752125231.svg\",\"bus_account_title\":\"SECUREISM (PRIVATE) LIMITED\",\"bus_account_number\":10109016750017,\"bus_reg_num\":119999,\"bus_contact_num\":3001234567,\"bus_contact_person\":\"ZEESHAN QAMAR\",\"bus_IBAN\":\"PK44ABPA0010109016750017\",\"bus_swift_code\":\"ABPAPKKA\",\"bus_acc_branch_name\":\"ABL CHAKLALA SCHEME 3 RAWALPINDI\",\"bus_acc_branch_code\":757,\"hash\":\"169c39ba55ca5c43c30e3faaaae9e083\",\"created_at\":\"2025-07-04T17:02:41.000000Z\",\"updated_at\":\"2025-08-18T09:10:42.000000Z\"}}','2025-08-19 04:43:57',NULL),(18,2,'Hammad Ali','127.0.0.1','unknown','add','Added new client: Skypass Traders Pvt. Ltd.',NULL,'buyers','0bcdcf5c9b31d1279ee245c09e77d5802bd5ceb540b9b5436c003b7becee05a4',1,'{\"byr_name\":\"Skypass Traders Pvt. Ltd.\",\"byr_type\":0,\"byr_ntn_cnic\":null,\"byr_address\":\"Office #12, Business Hub Plaza, MM Alam Road, Lahore\",\"byr_province\":\"Punjab\",\"byr_account_title\":\"Skypass Traders Pvt. Ltd.\",\"byr_account_number\":1234567890123,\"byr_reg_num\":\"REG-2025-98765\",\"byr_contact_num\":\"+92-321-4567890\",\"byr_contact_person\":\"Ahmed Khan\",\"byr_IBAN\":\"PK12 HABB 0001 2345 6789 0123\",\"byr_acc_branch_name\":\"Gulberg Branch\",\"byr_acc_branch_code\":123,\"byr_logo\":\"1755596792.png\",\"hash\":\"41eb1e6ea4bdd17406988ded1537a7ed\",\"updated_at\":\"2025-08-19T09:46:32.000000Z\",\"created_at\":\"2025-08-19T09:46:32.000000Z\",\"byr_id\":2}','2025-08-19 04:46:32',NULL),(19,2,'Hammad Ali','127.0.0.1','unknown','add','Added new item: Mobile App Development (iOS & Android)',NULL,'items','0361ede810dd4c029bc4d480ef255578a56b520f2c2c95c46e9257e649758624',1,'{\"item_description\":\"Mobile App Development (iOS & Android)\",\"item_hs_code\":998316,\"item_price\":120000,\"item_tax_rate\":18,\"item_uom\":\"Per Month\",\"hash\":\"2727c58f23b0c1981d760b89393ebb5e\",\"updated_at\":\"2025-08-19T09:47:45.000000Z\",\"created_at\":\"2025-08-19T09:47:45.000000Z\",\"item_id\":3}','2025-08-19 04:47:45',NULL),(20,2,'Hammad Ali','127.0.0.1','unknown','update','Posted invoice to FBR: INV-000005','INV-000005','invoices','0ba2d696b9813e01189e9b9128db30e95f492dc931b58f05bded43afc209160f',0,'{\"invoice_type\":\"Sale Invoice\",\"invoice_date\":\"2025-08-19\",\"due_date\":\"2025-08-21\",\"scenario_id\":\"SN018\",\"invoice_ref_no\":null,\"seller_id\":1,\"buyer_id\":2,\"invoice_status\":2,\"is_posted_to_fbr\":1,\"totalAmountExcludingTax\":15000,\"totalAmountIncludingTax\":17400,\"totalSalesTax\":2400,\"totalfurtherTax\":0,\"totalextraTax\":0,\"shipping_charges\":0,\"other_charges\":0,\"discount_amount\":0,\"payment_status\":null,\"notes\":null,\"hash\":\"eb6b48201723c3d45de9587c97048ef96ea55b5ba849bb081d37f37b94706b25\",\"updated_at\":\"2025-08-19T09:49:18.000000Z\",\"created_at\":\"2025-08-19T09:49:16.000000Z\",\"invoice_id\":5,\"invoice_no\":\"INV-000005\",\"fbr_invoice_number\":\"8923980DI1755596931625\",\"response_status\":\"Success\",\"response_message\":\"Posted successfully to FBR SANDBOX\"}','2025-08-19 04:49:18',NULL),(21,2,'Hammad Ali','127.0.0.1','unknown','update','Posted invoice to FBR: INV-000007','INV-000007','invoices','b997243f8ef1441105388c19dd08e748b31013a1d69b31f27381582d39b4cb0b',0,'{\"invoice_type\":\"Sale Invoice\",\"invoice_date\":\"2025-08-19\",\"due_date\":\"2025-08-22\",\"scenario_id\":\"SN018\",\"invoice_ref_no\":null,\"seller_id\":1,\"buyer_id\":2,\"invoice_status\":2,\"is_posted_to_fbr\":1,\"totalAmountExcludingTax\":15000,\"totalAmountIncludingTax\":17400,\"totalSalesTax\":2400,\"totalfurtherTax\":0,\"totalextraTax\":0,\"shipping_charges\":0,\"other_charges\":0,\"discount_amount\":0,\"payment_status\":null,\"notes\":null,\"hash\":\"f885b9582baa1f20aad68eafb6f36cfb82870e1c8148510cd3aa08a7a3c7ffef\",\"updated_at\":\"2025-08-19T10:06:54.000000Z\",\"created_at\":\"2025-08-19T10:06:51.000000Z\",\"invoice_id\":7,\"invoice_no\":\"INV-000007\",\"fbr_invoice_number\":\"8923980DI1755597987313\",\"response_status\":\"Success\",\"response_message\":\"Posted successfully to FBR SANDBOX\"}','2025-08-19 05:06:54',NULL),(22,2,'Hammad Ali','127.0.0.1','unknown','update','Posted invoice to FBR: INV-000008','INV-000008','invoices','5c1522f6e14912c21e26be9e41081d45ad53deccbe776ab711121558c6bc8c60',0,'{\"invoice_type\":\"Sale Invoice\",\"invoice_date\":\"2025-08-19\",\"due_date\":\"2025-08-21\",\"scenario_id\":\"SN019\",\"invoice_ref_no\":null,\"seller_id\":1,\"buyer_id\":2,\"invoice_status\":2,\"is_posted_to_fbr\":1,\"totalAmountExcludingTax\":15000,\"totalAmountIncludingTax\":17400,\"totalSalesTax\":2400,\"totalfurtherTax\":0,\"totalextraTax\":0,\"shipping_charges\":0,\"other_charges\":0,\"discount_amount\":0,\"payment_status\":null,\"notes\":null,\"hash\":\"1048086d7bd7bb99b041b29635aeb80be55074a44e87a6b89092610b5bcd8a16\",\"updated_at\":\"2025-08-19T10:14:49.000000Z\",\"created_at\":\"2025-08-19T10:14:46.000000Z\",\"invoice_id\":8,\"invoice_no\":\"INV-000008\",\"fbr_invoice_number\":\"8923980DI1755598462537\",\"response_status\":\"Success\",\"response_message\":\"Posted successfully to FBR SANDBOX\"}','2025-08-19 05:14:49',NULL),(23,2,'Hammad Ali','127.0.0.1','unknown','update','Updated item: Software / IT System Development',NULL,'items','cf915e735faf167a1657f8c8613c6911f108079153782069ea471c82bfa0dc50',0,'{\"old\":{\"item_id\":3,\"item_hs_code\":998316,\"item_description\":\"Mobile App Development (iOS & Android)\",\"item_price\":120000,\"item_tax_rate\":18,\"item_uom\":\"Per Month\",\"hash\":\"2727c58f23b0c1981d760b89393ebb5e\",\"created_at\":\"2025-08-19T09:47:45.000000Z\",\"updated_at\":\"2025-08-19T09:47:45.000000Z\"},\"new\":{\"item_id\":3,\"item_hs_code\":98156000,\"item_description\":\"Software / IT System Development\",\"item_price\":120000,\"item_tax_rate\":18,\"item_uom\":\"Per Month\",\"hash\":\"3f7185093e9dba3134e3d92f46963a5b\",\"created_at\":\"2025-08-19T09:47:45.000000Z\",\"updated_at\":\"2025-08-19T11:18:44.000000Z\"}}','2025-08-19 06:18:44',NULL),(24,2,'Hammad Ali','127.0.0.1','unknown','update','Updated item: Technical / Engineering Consulting',NULL,'items','f904f48ebc7be4e002eadbe324bcf8adbb9007f5c9d2111039c02cb38763aaea',0,'{\"old\":{\"item_id\":2,\"item_hs_code\":998314,\"item_description\":\"Custom Software Developement\",\"item_price\":250000,\"item_tax_rate\":18,\"item_uom\":\"Per Project\",\"hash\":\"0e237b30925385b6c9b79293e6452ba9\",\"created_at\":\"2025-08-18T06:36:21.000000Z\",\"updated_at\":\"2025-08-18T06:36:21.000000Z\"},\"new\":{\"item_id\":2,\"item_hs_code\":98151000,\"item_description\":\"Technical / Engineering Consulting\",\"item_price\":250000,\"item_tax_rate\":18,\"item_uom\":\"Per Project\",\"hash\":\"a29f17c42cb506082db74724417eb5ec\",\"created_at\":\"2025-08-18T06:36:21.000000Z\",\"updated_at\":\"2025-08-19T11:19:14.000000Z\"}}','2025-08-19 06:19:14',NULL),(25,2,'Hammad Ali','127.0.0.1','unknown','update','Posted invoice to FBR: INV-000016','INV-000016','invoices','d43b21ed3cdddaa3f3edc679ab82ba90553bff395cce60f5431bfe04824f01ba',0,'{\"invoice_type\":\"Sale Invoice\",\"invoice_date\":\"2025-08-19\",\"due_date\":\"2025-08-21\",\"scenario_id\":\"SN018\",\"invoice_ref_no\":null,\"seller_id\":1,\"buyer_id\":1,\"invoice_status\":2,\"is_posted_to_fbr\":1,\"totalAmountExcludingTax\":15000,\"totalAmountIncludingTax\":17400,\"totalSalesTax\":2400,\"totalfurtherTax\":0,\"totalextraTax\":0,\"shipping_charges\":0,\"other_charges\":0,\"discount_amount\":0,\"payment_status\":null,\"notes\":null,\"hash\":\"b41bbbccd58b2cf5421b6f7d0fca5bfe52196dd01bb55b7a770a25576da8a833\",\"updated_at\":\"2025-08-19T11:33:25.000000Z\",\"created_at\":\"2025-08-19T11:33:24.000000Z\",\"invoice_id\":16,\"invoice_no\":\"INV-000016\",\"fbr_invoice_number\":\"8923980DI1755603179148\",\"response_status\":\"Success\",\"response_message\":\"Posted successfully to FBR SANDBOX\"}','2025-08-19 06:33:25',NULL),(26,2,'Hammad Ali','127.0.0.1','unknown','add','Added new client: Unilever Pakistan Limited',NULL,'buyers','aa87620da37cc04c487f7fc50e8f36dfc26294fa3a943dc6177c55ea6f4516b3',1,'{\"byr_name\":\"Unilever Pakistan Limited\",\"byr_type\":1,\"byr_ntn_cnic\":1234567,\"byr_address\":\"Plot 12, Industrial Estate, Karachi\",\"byr_province\":\"Sindh\",\"byr_account_title\":\"Unilever Pakistan Ltd.\",\"byr_account_number\":123456789012345,\"byr_reg_num\":\"UPL-2023-Karachi\",\"byr_contact_num\":\"+92-21-34567890\",\"byr_contact_person\":\"Mr. A. Hassan\",\"byr_IBAN\":\"PK36UNIL0000001234567890\",\"byr_acc_branch_name\":\"Karachi Industrial Branch\",\"byr_acc_branch_code\":12,\"byr_logo\":\"1755681601.jpg\",\"hash\":\"d091edf2e5740aceae32161e78bcfe20\",\"updated_at\":\"2025-08-20T09:20:01.000000Z\",\"created_at\":\"2025-08-20T09:20:01.000000Z\",\"byr_id\":3}','2025-08-20 04:20:01',NULL),(27,2,'Hammad Ali','127.0.0.1','unknown','add','Added new client: ICI Pakistan Limited',NULL,'buyers','53b259bc719341a2dfb98a95df9f326c1b431b45392bb280e8519f08f89bf3aa',1,'{\"byr_name\":\"ICI Pakistan Limited\",\"byr_type\":1,\"byr_ntn_cnic\":9876543,\"byr_address\":\"45 Canal Road, Lahore\",\"byr_province\":\"Punjab\",\"byr_account_title\":\"ICI Pakistan Ltd.\",\"byr_account_number\":2233445566778899,\"byr_reg_num\":\"ICI-2008-Lahore\",\"byr_contact_num\":\"+92-42-35678901\",\"byr_contact_person\":\"Ms. S. Khan\",\"byr_IBAN\":\"PK22ICIP0000002233445566\",\"byr_acc_branch_name\":\"Lahore Main Branch\",\"byr_acc_branch_code\":34,\"byr_logo\":\"1755681838.png\",\"hash\":\"355b4734ee708560ab2916a240e1c844\",\"updated_at\":\"2025-08-20T09:23:58.000000Z\",\"created_at\":\"2025-08-20T09:23:58.000000Z\",\"byr_id\":4}','2025-08-20 04:23:58',NULL),(28,2,'Hammad Ali','127.0.0.1','unknown','add','Added new client: Ghandhara Industries Ltd. (Isuzu Pakistan)',NULL,'buyers','bb134128497f78587105badd0a686fd16e39991bc492b2b0bf31b46e32628231',1,'{\"byr_name\":\"Ghandhara Industries Ltd. (Isuzu Pakistan)\",\"byr_type\":1,\"byr_ntn_cnic\":7654321,\"byr_address\":\"SITE Industrial Area, Karachi\",\"byr_province\":\"Sindh\",\"byr_account_title\":\"Ghandhara Industries Ltd.\",\"byr_account_number\":3344556677889900,\"byr_reg_num\":\"GIL-1953-Karachi\",\"byr_contact_num\":\"+92-21-36789012\",\"byr_contact_person\":\"Mr. K. Khattak\",\"byr_IBAN\":\"PK44GHDA0000003344556677\",\"byr_acc_branch_name\":\"SITE Town Branch\",\"byr_acc_branch_code\":45,\"byr_logo\":\"1755681976.jpg\",\"hash\":\"c6d942856cb8912725175086e98115b6\",\"updated_at\":\"2025-08-20T09:26:16.000000Z\",\"created_at\":\"2025-08-20T09:26:16.000000Z\",\"byr_id\":5}','2025-08-20 04:26:16',NULL),(29,2,'Hammad Ali','127.0.0.1','unknown','update','Updated item: Technical / Engineering Consulting',NULL,'items','389de5bc2e8fcffdecc4e89cd8481e56ff5040e6aada8edaa456f22fbbad8769',0,'{\"old\":{\"item_id\":2,\"item_hs_code\":98151000,\"item_description\":\"Technical / Engineering Consulting\",\"item_price\":250000,\"item_tax_rate\":18,\"item_uom\":\"Per Project\",\"hash\":\"a29f17c42cb506082db74724417eb5ec\",\"created_at\":\"2025-08-18T06:36:21.000000Z\",\"updated_at\":\"2025-08-19T11:19:14.000000Z\"},\"new\":{\"item_id\":2,\"item_hs_code\":9815.1,\"item_description\":\"Technical / Engineering Consulting\",\"item_price\":250000,\"item_tax_rate\":18,\"item_uom\":\"Per Project\",\"hash\":\"d2835ff717a3aa96cc00d8e5c29ae3ca\",\"created_at\":\"2025-08-18T06:36:21.000000Z\",\"updated_at\":\"2025-08-20T09:59:06.000000Z\"}}','2025-08-20 04:59:06',NULL),(30,2,'Hammad Ali','127.0.0.1','unknown','update','Updated item: Software / IT System Development',NULL,'items','b79fb273eb619974e6d7ba06c2bdddb3a3db9a87fd9e7c2aee97361552a804e9',0,'{\"old\":{\"item_id\":3,\"item_hs_code\":98156000,\"item_description\":\"Software / IT System Development\",\"item_price\":120000,\"item_tax_rate\":18,\"item_uom\":\"Per Month\",\"hash\":\"3f7185093e9dba3134e3d92f46963a5b\",\"created_at\":\"2025-08-19T09:47:45.000000Z\",\"updated_at\":\"2025-08-19T11:18:44.000000Z\"},\"new\":{\"item_id\":3,\"item_hs_code\":9815.6,\"item_description\":\"Software / IT System Development\",\"item_price\":120000,\"item_tax_rate\":18,\"item_uom\":\"Per Month\",\"hash\":\"5671770bb7ac4d4b406e8228406fc70d\",\"created_at\":\"2025-08-19T09:47:45.000000Z\",\"updated_at\":\"2025-08-20T09:59:13.000000Z\"}}','2025-08-20 04:59:13',NULL),(31,2,'Hammad Ali','127.0.0.1','unknown','update','Updated client: Ghandhara Industries Ltd. (Isuzu Pakistan)',NULL,'buyers','1886315e58e877fff45432e276ac65edc120eb92d49643b79e6ee8854b35ec5a',0,'{\"old\":{\"byr_id\":5,\"byr_name\":\"Ghandhara Industries Ltd. (Isuzu Pakistan)\",\"byr_type\":1,\"byr_ntn_cnic\":7654321,\"byr_address\":\"SITE Industrial Area, Karachi\",\"byr_province\":\"Sindh\",\"byr_logo\":\"1755681976.jpg\",\"byr_account_title\":\"Ghandhara Industries Ltd.\",\"byr_account_number\":3344556677889900,\"byr_reg_num\":\"GIL-1953-Karachi\",\"byr_contact_num\":\"+92-21-36789012\",\"byr_contact_person\":\"Mr. K. Khattak\",\"byr_IBAN\":\"PK44GHDA0000003344556677\",\"byr_swift_code\":null,\"byr_acc_branch_name\":\"SITE Town Branch\",\"byr_acc_branch_code\":45,\"hash\":\"c6d942856cb8912725175086e98115b6\",\"created_at\":\"2025-08-20T09:26:16.000000Z\",\"updated_at\":\"2025-08-20T09:26:16.000000Z\"},\"new\":{\"byr_id\":5,\"byr_name\":\"Ghandhara Industries Ltd. (Isuzu Pakistan)\",\"byr_type\":0,\"byr_ntn_cnic\":null,\"byr_address\":\"SITE Industrial Area, Karachi\",\"byr_province\":\"Sindh\",\"byr_logo\":\"1755681976.jpg\",\"byr_account_title\":\"Ghandhara Industries Ltd.\",\"byr_account_number\":3344556677889900,\"byr_reg_num\":\"GIL-1953-Karachi\",\"byr_contact_num\":\"+92-21-36789012\",\"byr_contact_person\":\"Mr. K. Khattak\",\"byr_IBAN\":\"PK44GHDA0000003344556677\",\"byr_swift_code\":null,\"byr_acc_branch_name\":\"SITE Town Branch\",\"byr_acc_branch_code\":45,\"hash\":\"4d0b18516f7b0c1edd3d7d94a930f2cb\",\"created_at\":\"2025-08-20T09:26:16.000000Z\",\"updated_at\":\"2025-08-20T10:00:18.000000Z\"}}','2025-08-20 05:00:18',NULL),(32,2,'Hammad Ali','127.0.0.1','unknown','update','Updated client: ICI Pakistan Limited',NULL,'buyers','06f9c86ee1332c47eaa2994b436874fdb5dc2efe4ad2694b618bea0ead45f807',0,'{\"old\":{\"byr_id\":4,\"byr_name\":\"ICI Pakistan Limited\",\"byr_type\":1,\"byr_ntn_cnic\":9876543,\"byr_address\":\"45 Canal Road, Lahore\",\"byr_province\":\"Punjab\",\"byr_logo\":\"1755681838.png\",\"byr_account_title\":\"ICI Pakistan Ltd.\",\"byr_account_number\":2233445566778899,\"byr_reg_num\":\"ICI-2008-Lahore\",\"byr_contact_num\":\"+92-42-35678901\",\"byr_contact_person\":\"Ms. S. Khan\",\"byr_IBAN\":\"PK22ICIP0000002233445566\",\"byr_swift_code\":null,\"byr_acc_branch_name\":\"Lahore Main Branch\",\"byr_acc_branch_code\":34,\"hash\":\"355b4734ee708560ab2916a240e1c844\",\"created_at\":\"2025-08-20T09:23:58.000000Z\",\"updated_at\":\"2025-08-20T09:23:58.000000Z\"},\"new\":{\"byr_id\":4,\"byr_name\":\"ICI Pakistan Limited\",\"byr_type\":0,\"byr_ntn_cnic\":null,\"byr_address\":\"45 Canal Road, Lahore\",\"byr_province\":\"Punjab\",\"byr_logo\":\"1755681838.png\",\"byr_account_title\":\"ICI Pakistan Ltd.\",\"byr_account_number\":2233445566778899,\"byr_reg_num\":\"ICI-2008-Lahore\",\"byr_contact_num\":\"+92-42-35678901\",\"byr_contact_person\":\"Ms. S. Khan\",\"byr_IBAN\":\"PK22ICIP0000002233445566\",\"byr_swift_code\":null,\"byr_acc_branch_name\":\"Lahore Main Branch\",\"byr_acc_branch_code\":34,\"hash\":\"b7766a9284822f81905d4d22edefbfc7\",\"created_at\":\"2025-08-20T09:23:58.000000Z\",\"updated_at\":\"2025-08-20T10:00:30.000000Z\"}}','2025-08-20 05:00:30',NULL),(33,2,'Hammad Ali','127.0.0.1','unknown','update','Updated client: Unilever Pakistan Limited',NULL,'buyers','8523af996aea8990abe47c7969b85e19ce7d07177bdaf5193659d4f9166c11c3',0,'{\"old\":{\"byr_id\":3,\"byr_name\":\"Unilever Pakistan Limited\",\"byr_type\":1,\"byr_ntn_cnic\":1234567,\"byr_address\":\"Plot 12, Industrial Estate, Karachi\",\"byr_province\":\"Sindh\",\"byr_logo\":\"1755681601.jpg\",\"byr_account_title\":\"Unilever Pakistan Ltd.\",\"byr_account_number\":123456789012345,\"byr_reg_num\":\"UPL-2023-Karachi\",\"byr_contact_num\":\"+92-21-34567890\",\"byr_contact_person\":\"Mr. A. Hassan\",\"byr_IBAN\":\"PK36UNIL0000001234567890\",\"byr_swift_code\":null,\"byr_acc_branch_name\":\"Karachi Industrial Branch\",\"byr_acc_branch_code\":12,\"hash\":\"d091edf2e5740aceae32161e78bcfe20\",\"created_at\":\"2025-08-20T09:20:01.000000Z\",\"updated_at\":\"2025-08-20T09:20:01.000000Z\"},\"new\":{\"byr_id\":3,\"byr_name\":\"Unilever Pakistan Limited\",\"byr_type\":0,\"byr_ntn_cnic\":null,\"byr_address\":\"Plot 12, Industrial Estate, Karachi\",\"byr_province\":\"Sindh\",\"byr_logo\":\"1755681601.jpg\",\"byr_account_title\":\"Unilever Pakistan Ltd.\",\"byr_account_number\":123456789012345,\"byr_reg_num\":\"UPL-2023-Karachi\",\"byr_contact_num\":\"+92-21-34567890\",\"byr_contact_person\":\"Mr. A. Hassan\",\"byr_IBAN\":\"PK36UNIL0000001234567890\",\"byr_swift_code\":null,\"byr_acc_branch_name\":\"Karachi Industrial Branch\",\"byr_acc_branch_code\":12,\"hash\":\"3f9c63d8a3f9ff8bfa423e2c155b7baa\",\"created_at\":\"2025-08-20T09:20:01.000000Z\",\"updated_at\":\"2025-08-20T10:00:45.000000Z\"}}','2025-08-20 05:00:45',NULL),(34,2,'Hammad Ali','127.0.0.1','unknown','update','Updated item: Software / IT System Development',NULL,'items','11e5a22f5a3779e7271c0168c277448a898c4b9fca5d567618b0a843831055f6',0,'{\"old\":{\"item_id\":3,\"item_hs_code\":9815.6,\"item_description\":\"Software / IT System Development\",\"item_price\":120000,\"item_tax_rate\":18,\"item_uom\":\"Per Month\",\"hash\":\"5671770bb7ac4d4b406e8228406fc70d\",\"created_at\":\"2025-08-19T09:47:45.000000Z\",\"updated_at\":\"2025-08-20T09:59:13.000000Z\"},\"new\":{\"item_id\":3,\"item_hs_code\":9815.6,\"item_description\":\"Software / IT System Development\",\"item_price\":120000,\"item_tax_rate\":16,\"item_uom\":\"Per Month\",\"hash\":\"1bf62be5137a3a9ca55f0420ad10b213\",\"created_at\":\"2025-08-19T09:47:45.000000Z\",\"updated_at\":\"2025-08-20T10:05:58.000000Z\"}}','2025-08-20 05:05:58',NULL),(35,2,'Hammad Ali','127.0.0.1','unknown','update','Updated item: Technical / Engineering Consulting',NULL,'items','3f90a30fabd03dc214081b6a6bdd1f674fdae43b4f671f59cb136765dc1e5fbd',0,'{\"old\":{\"item_id\":2,\"item_hs_code\":9815.1,\"item_description\":\"Technical / Engineering Consulting\",\"item_price\":250000,\"item_tax_rate\":18,\"item_uom\":\"Per Project\",\"hash\":\"d2835ff717a3aa96cc00d8e5c29ae3ca\",\"created_at\":\"2025-08-18T06:36:21.000000Z\",\"updated_at\":\"2025-08-20T09:59:06.000000Z\"},\"new\":{\"item_id\":2,\"item_hs_code\":9815.1,\"item_description\":\"Technical / Engineering Consulting\",\"item_price\":250000,\"item_tax_rate\":16,\"item_uom\":\"Per Project\",\"hash\":\"b55c2d2426032093bd03c3660dd5098d\",\"created_at\":\"2025-08-18T06:36:21.000000Z\",\"updated_at\":\"2025-08-20T10:06:06.000000Z\"}}','2025-08-20 05:06:06',NULL),(36,2,'Hammad Ali','127.0.0.1','unknown','update','Posted invoice to FBR: INV-000018','INV-000018','invoices','628e8b8a8bdde0718b2fd681bb0b0c2bcbc16063603e3fcddcb74fdc22b657bf',0,'{\"invoice_type\":\"Sale Invoice\",\"invoice_date\":\"2025-08-20\",\"due_date\":\"2025-08-21\",\"scenario_id\":\"SN018\",\"invoice_ref_no\":null,\"seller_id\":1,\"buyer_id\":3,\"invoice_status\":2,\"is_posted_to_fbr\":1,\"totalAmountExcludingTax\":250000,\"totalAmountIncludingTax\":290000,\"totalSalesTax\":40000,\"totalfurtherTax\":0,\"totalextraTax\":0,\"shipping_charges\":0,\"other_charges\":0,\"discount_amount\":0,\"payment_status\":null,\"notes\":null,\"hash\":\"a90dfee784dbf699b998772479c8af601738b86ecd34608b7e7c91020e36db71\",\"updated_at\":\"2025-08-20T10:06:50.000000Z\",\"created_at\":\"2025-08-20T10:06:49.000000Z\",\"invoice_id\":18,\"invoice_no\":\"INV-000018\",\"fbr_invoice_number\":\"8923980DI1755684382924\",\"response_status\":\"Success\",\"response_message\":\"Posted successfully to FBR SANDBOX\"}','2025-08-20 05:06:50',NULL),(37,2,'Hammad Ali','127.0.0.1','unknown','update','Posted invoice to FBR: INV-000019','INV-000019','invoices','40e00d929d177ca8e840d746396ad2228be7781faae0b7c45465259761989f6c',0,'{\"invoice_type\":\"Sale Invoice\",\"invoice_date\":\"2025-08-20\",\"due_date\":\"2025-08-22\",\"scenario_id\":\"SN018\",\"invoice_ref_no\":null,\"seller_id\":1,\"buyer_id\":4,\"invoice_status\":2,\"is_posted_to_fbr\":1,\"totalAmountExcludingTax\":120000,\"totalAmountIncludingTax\":139200,\"totalSalesTax\":19200,\"totalfurtherTax\":0,\"totalextraTax\":0,\"shipping_charges\":0,\"other_charges\":0,\"discount_amount\":0,\"payment_status\":null,\"notes\":null,\"hash\":\"0fe9c0d94b1b2a7593ca14b93de1cc0f4ad14dcddeb86c757a63cc2e322bae98\",\"updated_at\":\"2025-08-20T10:07:30.000000Z\",\"created_at\":\"2025-08-20T10:07:28.000000Z\",\"invoice_id\":19,\"invoice_no\":\"INV-000019\",\"fbr_invoice_number\":\"8923980DI1755684422905\",\"response_status\":\"Success\",\"response_message\":\"Posted successfully to FBR SANDBOX\"}','2025-08-20 05:07:30',NULL),(38,2,'Hammad Ali','127.0.0.1','unknown','update','Posted invoice to FBR: INV-000020','INV-000020','invoices','144c5043189f91fb34f9a75f59d0879ebddfe2c95c83d118c45fece4957feb62',0,'{\"invoice_type\":\"Sale Invoice\",\"invoice_date\":\"2025-08-20\",\"due_date\":\"2025-08-22\",\"scenario_id\":\"SN018\",\"invoice_ref_no\":null,\"seller_id\":1,\"buyer_id\":5,\"invoice_status\":2,\"is_posted_to_fbr\":1,\"totalAmountExcludingTax\":265000,\"totalAmountIncludingTax\":307400,\"totalSalesTax\":42400,\"totalfurtherTax\":2650,\"totalextraTax\":5300,\"shipping_charges\":0,\"other_charges\":0,\"discount_amount\":0,\"payment_status\":null,\"notes\":null,\"hash\":\"d32e5381acbe9819d576620955d7183e4a02e88565cfcb94cadd24509c018e35\",\"updated_at\":\"2025-08-20T10:09:00.000000Z\",\"created_at\":\"2025-08-20T10:08:58.000000Z\",\"invoice_id\":20,\"invoice_no\":\"INV-000020\",\"fbr_invoice_number\":\"8923980DI1755684512465\",\"response_status\":\"Success\",\"response_message\":\"Posted successfully to FBR SANDBOX\"}','2025-08-20 05:09:00',NULL);
/*!40000 ALTER TABLE `activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_logs`
--


CREATE TABLE `audit_logs` (
  `audit_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(100) NOT NULL,
  `row_id` bigint unsigned NOT NULL,
  `action_type` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `old_data` json DEFAULT NULL,
  `new_data` json DEFAULT NULL,
  `row_hash_old` varchar(64) DEFAULT NULL,
  `row_hash_new` varchar(64) DEFAULT NULL,
  `db_user` varchar(100) DEFAULT NULL,
  `changed_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(45) DEFAULT NULL,
  `device_info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`audit_id`),
  KEY `idx_table_row` (`table_name`,`row_id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;

--
-- Dumping data for table `audit_logs`
--

LOCK TABLES `audit_logs` WRITE;
/*!40000 ALTER TABLE `audit_logs` DISABLE KEYS */;
INSERT INTO `audit_logs` VALUES (1,'items',1,'INSERT',NULL,'{\"item_uom\": \"Per Month\", \"created_at\": \"2025-08-18 06:10:32.000000\", \"item_price\": 10000.0, \"updated_at\": \"2025-08-18 06:10:32.000000\", \"item_hs_code\": \"9815.6000\", \"item_tax_rate\": \"16\", \"item_description\": \"API Integration Services\"}',NULL,'c4c3e7133f0fdb2258773730acdbc5dfb7a91c805d4fcc291a253d3195d0fc5a','root@localhost','2025-08-18 06:10:32',NULL,NULL),(2,'items',1,'UPDATE','{\"item_uom\": \"Per Month\", \"created_at\": \"2025-08-18 06:10:32.000000\", \"item_price\": 10000.0, \"updated_at\": \"2025-08-18 06:10:32.000000\", \"item_hs_code\": \"9815.6000\", \"item_tax_rate\": \"16\", \"item_description\": \"API Integration Services\"}','{\"item_uom\": \"Per Month\", \"created_at\": \"2025-08-18 06:10:32.000000\", \"item_price\": 10000.0, \"updated_at\": \"2025-08-18 06:11:13.000000\", \"item_hs_code\": \"9815.6000\", \"item_tax_rate\": \"16\", \"item_description\": \"API Integration Services.\"}','c4c3e7133f0fdb2258773730acdbc5dfb7a91c805d4fcc291a253d3195d0fc5a','c0a03db5bab74f89a2002aa66994464ade5b646213ebbfd209893f2b308f7ee0','root@localhost','2025-08-18 06:11:13',NULL,NULL),(3,'buyers',1,'INSERT',NULL,'{\"byr_IBAN\": \"PKIBAN789798978987\", \"byr_logo\": \"1755497672.jpg\", \"byr_name\": \"F3 Technologies (Pvt) Ltd\", \"byr_type\": 0, \"created_at\": \"2025-08-18 06:14:32.000000\", \"updated_at\": \"2025-08-18 06:14:32.000000\", \"byr_address\": \"Dr, Zaraj Housing Society Sector B Islamabad\", \"byr_reg_num\": \"REG-2025013\", \"byr_ntn_cnic\": null, \"byr_province\": \"Islamabad\", \"byr_swift_code\": null, \"byr_contact_num\": \"0300-5325487\", \"byr_account_title\": \"F3 Technologies Pvt Ltd\", \"byr_account_number\": \"00098765432100\", \"byr_contact_person\": \"Dr Ahmed Javad\", \"byr_acc_branch_code\": \"0876\", \"byr_acc_branch_name\": \"F-8 Markaz Branch\"}',NULL,NULL,'root@localhost','2025-08-18 06:14:32',NULL,NULL),(4,'buyers',1,'UPDATE','{\"byr_IBAN\": \"PKIBAN789798978987\", \"byr_logo\": \"1755497672.jpg\", \"byr_name\": \"F3 Technologies (Pvt) Ltd\", \"byr_type\": 0, \"created_at\": \"2025-08-18 06:14:32.000000\", \"updated_at\": \"2025-08-18 06:14:32.000000\", \"byr_address\": \"Dr, Zaraj Housing Society Sector B Islamabad\", \"byr_reg_num\": \"REG-2025013\", \"byr_ntn_cnic\": null, \"byr_province\": \"Islamabad\", \"byr_swift_code\": null, \"byr_contact_num\": \"0300-5325487\", \"byr_account_title\": \"F3 Technologies Pvt Ltd\", \"byr_account_number\": \"00098765432100\", \"byr_contact_person\": \"Dr Ahmed Javad\", \"byr_acc_branch_code\": \"0876\", \"byr_acc_branch_name\": \"F-8 Markaz Branch\"}','{\"byr_IBAN\": \"PKIBAN789798978987\", \"byr_logo\": \"1755497672.jpg\", \"byr_name\": \"F3 Technologies (Pvt) Ltd.\", \"byr_type\": 0, \"created_at\": \"2025-08-18 06:14:32.000000\", \"updated_at\": \"2025-08-18 06:14:59.000000\", \"byr_address\": \"Dr, Zaraj Housing Society Sector B Islamabad\", \"byr_reg_num\": \"REG-2025013\", \"byr_ntn_cnic\": null, \"byr_province\": \"Islamabad\", \"byr_swift_code\": null, \"byr_contact_num\": \"0300-5325487\", \"byr_account_title\": \"F3 Technologies Pvt Ltd\", \"byr_account_number\": \"00098765432100\", \"byr_contact_person\": \"Dr Ahmed Javad\", \"byr_acc_branch_code\": \"0876\", \"byr_acc_branch_name\": \"F-8 Markaz Branch\"}',NULL,NULL,'root@localhost','2025-08-18 06:14:59',NULL,NULL),(5,'invoices',1,'INSERT',NULL,'{\"buyer_id\": 1, \"due_date\": \"2025-08-19\", \"seller_id\": 1, \"created_at\": \"2025-08-18 06:16:54.000000\", \"invoice_no\": null, \"updated_at\": \"2025-08-18 06:16:54.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-18\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}',NULL,NULL,'root@localhost','2025-08-18 06:16:54',NULL,NULL),(6,'invoice_details',1,'INSERT',NULL,'{\"item_id\": 1, \"discount\": 0.00, \"quantity\": 1, \"extra_tax\": 0.00, \"sale_type\": \"Services (FED in ST Mode)\", \"created_at\": \"2025-08-18 06:16:54.000000\", \"invoice_id\": 1, \"updated_at\": \"2025-08-18 06:16:54.000000\", \"fed_payable\": 0.00, \"further_tax\": 0.00, \"total_value\": 11600.00, \"retail_price\": 0.00, \"value_excl_tax\": 10000.00, \"sro_schedule_no\": \"\", \"sales_tax_withheld\": 0.00, \"sro_item_serial_no\": \"\", \"sales_tax_applicable\": 1600.00}',NULL,'9e52d5d2f18b5b034c492e851f6563fd6fe8a6cf4dbc174b2ae46897a3e8d236','root@localhost','2025-08-18 06:16:54',NULL,NULL),(7,'invoices',1,'UPDATE','{\"buyer_id\": 1, \"due_date\": \"2025-08-19\", \"seller_id\": 1, \"created_at\": \"2025-08-18 06:16:54.000000\", \"invoice_no\": null, \"updated_at\": \"2025-08-18 06:16:54.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-18\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}','{\"buyer_id\": 1, \"due_date\": \"2025-08-20\", \"seller_id\": 1, \"created_at\": \"2025-08-18 06:16:54.000000\", \"invoice_no\": null, \"updated_at\": \"2025-08-18 06:17:11.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-18\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}',NULL,NULL,'root@localhost','2025-08-18 06:17:11',NULL,NULL),(8,'invoice_details',1,'DELETE','{\"item_id\": 1, \"discount\": 0.00, \"quantity\": 1, \"extra_tax\": 0.00, \"sale_type\": \"Services (FED in ST Mode)\", \"created_at\": \"2025-08-18 06:16:54.000000\", \"invoice_id\": 1, \"updated_at\": \"2025-08-18 06:16:54.000000\", \"fed_payable\": 0.00, \"further_tax\": 0.00, \"total_value\": 11600.00, \"retail_price\": 0.00, \"value_excl_tax\": 10000.00, \"sro_schedule_no\": \"\", \"sales_tax_withheld\": 0.00, \"sro_item_serial_no\": \"\", \"sales_tax_applicable\": 1600.00}',NULL,'9e52d5d2f18b5b034c492e851f6563fd6fe8a6cf4dbc174b2ae46897a3e8d236',NULL,'root@localhost','2025-08-18 06:17:11',NULL,NULL),(9,'invoice_details',2,'INSERT',NULL,'{\"item_id\": 1, \"discount\": 0.00, \"quantity\": 1, \"extra_tax\": 0.00, \"sale_type\": \"Services (FED in ST Mode)\", \"created_at\": \"2025-08-18 06:17:11.000000\", \"invoice_id\": 1, \"updated_at\": \"2025-08-18 06:17:11.000000\", \"fed_payable\": 0.00, \"further_tax\": 0.00, \"total_value\": 11600.00, \"retail_price\": 0.00, \"value_excl_tax\": 10000.00, \"sro_schedule_no\": \"\", \"sales_tax_withheld\": 0.00, \"sro_item_serial_no\": \"\", \"sales_tax_applicable\": 1600.00}',NULL,'0d35c57000158a1580e37cf0d0e813e1f0045560407f012e4888af51ef67c021','root@localhost','2025-08-18 06:17:11',NULL,NULL),(30,'buyers',1,'UPDATE','{\"byr_IBAN\": \"PKIBAN789798978987\", \"byr_logo\": \"1755497672.jpg\", \"byr_name\": \"F3 Technologies (Pvt) Ltd.\", \"byr_type\": 0, \"created_at\": \"2025-08-18 06:14:32.000000\", \"updated_at\": \"2025-08-18 06:14:59.000000\", \"byr_address\": \"Dr, Zaraj Housing Society Sector B Islamabad\", \"byr_reg_num\": \"REG-2025013\", \"byr_ntn_cnic\": null, \"byr_province\": \"Islamabad\", \"byr_swift_code\": null, \"byr_contact_num\": \"0300-5325487\", \"byr_account_title\": \"F3 Technologies Pvt Ltd\", \"byr_account_number\": \"00098765432100\", \"byr_contact_person\": \"Dr Ahmed Javad\", \"byr_acc_branch_code\": \"0876\", \"byr_acc_branch_name\": \"F-8 Markaz Branch\"}','{\"byr_IBAN\": \"PKIBAN789798978987\", \"byr_logo\": \"1755497672.jpg\", \"byr_name\": \"F3 Technologies (Pvt) Ltd.\", \"byr_type\": 0, \"created_at\": \"2025-08-18 06:14:32.000000\", \"updated_at\": \"2025-08-18 06:27:53.000000\", \"byr_address\": \"Dr, Zaraj Housing Society Sector B Islamabad\", \"byr_reg_num\": \"REG-2025013\", \"byr_ntn_cnic\": null, \"byr_province\": \"Punjab\", \"byr_swift_code\": null, \"byr_contact_num\": \"0300-5325487\", \"byr_account_title\": \"F3 Technologies Pvt Ltd\", \"byr_account_number\": \"00098765432100\", \"byr_contact_person\": \"Dr Ahmed Javad\", \"byr_acc_branch_code\": \"0876\", \"byr_acc_branch_name\": \"F-8 Markaz Branch\"}',NULL,NULL,'root@localhost','2025-08-18 06:27:53',NULL,NULL),(31,'invoices',1,'UPDATE','{\"buyer_id\": 1, \"due_date\": \"2025-08-20\", \"seller_id\": 1, \"created_at\": \"2025-08-18 06:16:54.000000\", \"invoice_no\": null, \"updated_at\": \"2025-08-18 06:17:11.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-18\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}','{\"buyer_id\": 1, \"due_date\": \"2025-08-20\", \"seller_id\": 1, \"created_at\": \"2025-08-18 06:16:54.000000\", \"invoice_no\": null, \"updated_at\": \"2025-08-18 06:28:05.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-18\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}',NULL,NULL,'root@localhost','2025-08-18 06:28:05',NULL,NULL),(32,'invoices',1,'UPDATE','{\"buyer_id\": 1, \"due_date\": \"2025-08-20\", \"seller_id\": 1, \"created_at\": \"2025-08-18 06:16:54.000000\", \"invoice_no\": null, \"updated_at\": \"2025-08-18 06:28:05.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-18\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}','{\"buyer_id\": 1, \"due_date\": \"2025-08-20\", \"seller_id\": 1, \"created_at\": \"2025-08-18 06:16:54.000000\", \"invoice_no\": \"INV-000001\", \"updated_at\": \"2025-08-18 06:28:05.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-18\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}',NULL,NULL,'root@localhost','2025-08-18 06:28:05',NULL,NULL),(33,'invoice_details',2,'DELETE','{\"item_id\": 1, \"discount\": 0.00, \"quantity\": 1, \"extra_tax\": 0.00, \"sale_type\": \"Services (FED in ST Mode)\", \"created_at\": \"2025-08-18 06:17:11.000000\", \"invoice_id\": 1, \"updated_at\": \"2025-08-18 06:17:11.000000\", \"fed_payable\": 0.00, \"further_tax\": 0.00, \"total_value\": 11600.00, \"retail_price\": 0.00, \"value_excl_tax\": 10000.00, \"sro_schedule_no\": \"\", \"sales_tax_withheld\": 0.00, \"sro_item_serial_no\": \"\", \"sales_tax_applicable\": 1600.00}',NULL,'0d35c57000158a1580e37cf0d0e813e1f0045560407f012e4888af51ef67c021',NULL,'root@localhost','2025-08-18 06:28:05',NULL,NULL),(34,'invoice_details',8,'INSERT',NULL,'{\"item_id\": 1, \"discount\": 0.00, \"quantity\": 1, \"extra_tax\": 0.00, \"sale_type\": \"Services (FED in ST Mode)\", \"created_at\": \"2025-08-18 06:28:05.000000\", \"invoice_id\": 1, \"updated_at\": \"2025-08-18 06:28:05.000000\", \"fed_payable\": 0.00, \"further_tax\": 0.00, \"total_value\": 11600.00, \"retail_price\": 0.00, \"value_excl_tax\": 10000.00, \"sro_schedule_no\": \"\", \"sales_tax_withheld\": 0.00, \"sro_item_serial_no\": \"\", \"sales_tax_applicable\": 1600.00}',NULL,'594bacccf9a1088acb41f6d08071a3bac12b3b9083df728b7f2bce8766499ab5','root@localhost','2025-08-18 06:28:05',NULL,NULL),(35,'invoices',1,'UPDATE','{\"buyer_id\": 1, \"due_date\": \"2025-08-20\", \"seller_id\": 1, \"created_at\": \"2025-08-18 06:16:54.000000\", \"invoice_no\": \"INV-000001\", \"updated_at\": \"2025-08-18 06:28:05.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-18\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}','{\"buyer_id\": 1, \"due_date\": \"2025-08-20\", \"seller_id\": 1, \"created_at\": \"2025-08-18 06:16:54.000000\", \"invoice_no\": \"INV-000001\", \"updated_at\": \"2025-08-18 06:28:07.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-18\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 1, \"fbr_invoice_number\": \"8923980DI1755498461992\"}',NULL,NULL,'root@localhost','2025-08-18 06:28:07',NULL,NULL),(36,'invoices',1,'UPDATE','{\"buyer_id\": 1, \"due_date\": \"2025-08-20\", \"seller_id\": 1, \"created_at\": \"2025-08-18 06:16:54.000000\", \"invoice_no\": \"INV-000001\", \"updated_at\": \"2025-08-18 06:28:07.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-18\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 1, \"fbr_invoice_number\": \"8923980DI1755498461992\"}','{\"buyer_id\": 1, \"due_date\": \"2025-08-20\", \"seller_id\": 1, \"created_at\": \"2025-08-18 06:16:54.000000\", \"invoice_no\": \"INV-000001\", \"updated_at\": \"2025-08-18 06:28:08.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-18\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 1, \"fbr_invoice_number\": \"8923980DI1755498461992\"}',NULL,NULL,'root@localhost','2025-08-18 06:28:08',NULL,NULL),(37,'invoices',2,'INSERT',NULL,'{\"buyer_id\": 1, \"due_date\": \"2025-08-19\", \"seller_id\": 1, \"created_at\": \"2025-08-18 06:28:51.000000\", \"invoice_no\": null, \"updated_at\": \"2025-08-18 06:28:51.000000\", \"scenario_id\": \"SN019\", \"invoice_date\": \"2025-08-18\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}',NULL,NULL,'root@localhost','2025-08-18 06:28:51',NULL,NULL),(38,'invoice_details',9,'INSERT',NULL,'{\"item_id\": 1, \"discount\": 0.00, \"quantity\": 1, \"extra_tax\": 0.00, \"sale_type\": \"Services\", \"created_at\": \"2025-08-18 06:28:51.000000\", \"invoice_id\": 2, \"updated_at\": \"2025-08-18 06:28:51.000000\", \"fed_payable\": 0.00, \"further_tax\": 0.00, \"total_value\": 11600.00, \"retail_price\": 0.00, \"value_excl_tax\": 10000.00, \"sro_schedule_no\": \"\", \"sales_tax_withheld\": 0.00, \"sro_item_serial_no\": \"\", \"sales_tax_applicable\": 1600.00}',NULL,'ae37ab5481f03b5364c10733516cc87ef02bbbe6dc2f45c6f2e7bfb46ff4710b','root@localhost','2025-08-18 06:28:51',NULL,NULL),(39,'invoices',2,'UPDATE','{\"buyer_id\": 1, \"due_date\": \"2025-08-19\", \"seller_id\": 1, \"created_at\": \"2025-08-18 06:28:51.000000\", \"invoice_no\": null, \"updated_at\": \"2025-08-18 06:28:51.000000\", \"scenario_id\": \"SN019\", \"invoice_date\": \"2025-08-18\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}','{\"buyer_id\": 1, \"due_date\": \"2025-08-19\", \"seller_id\": 1, \"created_at\": \"2025-08-18 06:28:51.000000\", \"invoice_no\": null, \"updated_at\": \"2025-08-18 06:29:02.000000\", \"scenario_id\": \"SN019\", \"invoice_date\": \"2025-08-18\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}',NULL,NULL,'root@localhost','2025-08-18 06:29:02',NULL,NULL),(40,'invoices',2,'UPDATE','{\"buyer_id\": 1, \"due_date\": \"2025-08-19\", \"seller_id\": 1, \"created_at\": \"2025-08-18 06:28:51.000000\", \"invoice_no\": null, \"updated_at\": \"2025-08-18 06:29:02.000000\", \"scenario_id\": \"SN019\", \"invoice_date\": \"2025-08-18\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}','{\"buyer_id\": 1, \"due_date\": \"2025-08-19\", \"seller_id\": 1, \"created_at\": \"2025-08-18 06:28:51.000000\", \"invoice_no\": \"INV-000002\", \"updated_at\": \"2025-08-18 06:29:02.000000\", \"scenario_id\": \"SN019\", \"invoice_date\": \"2025-08-18\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}',NULL,NULL,'root@localhost','2025-08-18 06:29:02',NULL,NULL),(41,'invoice_details',9,'DELETE','{\"item_id\": 1, \"discount\": 0.00, \"quantity\": 1, \"extra_tax\": 0.00, \"sale_type\": \"Services\", \"created_at\": \"2025-08-18 06:28:51.000000\", \"invoice_id\": 2, \"updated_at\": \"2025-08-18 06:28:51.000000\", \"fed_payable\": 0.00, \"further_tax\": 0.00, \"total_value\": 11600.00, \"retail_price\": 0.00, \"value_excl_tax\": 10000.00, \"sro_schedule_no\": \"\", \"sales_tax_withheld\": 0.00, \"sro_item_serial_no\": \"\", \"sales_tax_applicable\": 1600.00}',NULL,'ae37ab5481f03b5364c10733516cc87ef02bbbe6dc2f45c6f2e7bfb46ff4710b',NULL,'root@localhost','2025-08-18 06:29:02',NULL,NULL),(42,'invoice_details',10,'INSERT',NULL,'{\"item_id\": 1, \"discount\": 0.00, \"quantity\": 1, \"extra_tax\": 0.00, \"sale_type\": \"Services\", \"created_at\": \"2025-08-18 06:29:02.000000\", \"invoice_id\": 2, \"updated_at\": \"2025-08-18 06:29:02.000000\", \"fed_payable\": 0.00, \"further_tax\": 0.00, \"total_value\": 11600.00, \"retail_price\": 0.00, \"value_excl_tax\": 10000.00, \"sro_schedule_no\": \"\", \"sales_tax_withheld\": 0.00, \"sro_item_serial_no\": \"\", \"sales_tax_applicable\": 1600.00}',NULL,'8d06c5de3c3a19bced0b4079dbbadc008c581b67f46a6f08a2a78689ad29afdd','root@localhost','2025-08-18 06:29:02',NULL,NULL),(43,'invoices',2,'UPDATE','{\"buyer_id\": 1, \"due_date\": \"2025-08-19\", \"seller_id\": 1, \"created_at\": \"2025-08-18 06:28:51.000000\", \"invoice_no\": \"INV-000002\", \"updated_at\": \"2025-08-18 06:29:02.000000\", \"scenario_id\": \"SN019\", \"invoice_date\": \"2025-08-18\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}','{\"buyer_id\": 1, \"due_date\": \"2025-08-19\", \"seller_id\": 1, \"created_at\": \"2025-08-18 06:28:51.000000\", \"invoice_no\": \"INV-000002\", \"updated_at\": \"2025-08-18 06:29:04.000000\", \"scenario_id\": \"SN019\", \"invoice_date\": \"2025-08-18\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 1, \"fbr_invoice_number\": \"8923980DI1755498519086\"}',NULL,NULL,'root@localhost','2025-08-18 06:29:04',NULL,NULL),(44,'invoices',2,'UPDATE','{\"buyer_id\": 1, \"due_date\": \"2025-08-19\", \"seller_id\": 1, \"created_at\": \"2025-08-18 06:28:51.000000\", \"invoice_no\": \"INV-000002\", \"updated_at\": \"2025-08-18 06:29:04.000000\", \"scenario_id\": \"SN019\", \"invoice_date\": \"2025-08-18\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 1, \"fbr_invoice_number\": \"8923980DI1755498519086\"}','{\"buyer_id\": 1, \"due_date\": \"2025-08-19\", \"seller_id\": 1, \"created_at\": \"2025-08-18 06:28:51.000000\", \"invoice_no\": \"INV-000002\", \"updated_at\": \"2025-08-18 06:29:05.000000\", \"scenario_id\": \"SN019\", \"invoice_date\": \"2025-08-18\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 1, \"fbr_invoice_number\": \"8923980DI1755498519086\"}',NULL,NULL,'root@localhost','2025-08-18 06:29:05',NULL,NULL),(45,'items',2,'INSERT',NULL,'{\"item_uom\": \"Per Project\", \"created_at\": \"2025-08-18 06:36:21.000000\", \"item_price\": 250000.0, \"updated_at\": \"2025-08-18 06:36:21.000000\", \"item_hs_code\": \"998314\", \"item_tax_rate\": \"18\", \"item_description\": \"Custom Software Development\"}',NULL,'b4a50d92053d85886e6580159ad18c4ed60aff4a5ba341785a93cba1fdf7a1e6','root@localhost','2025-08-18 06:36:21',NULL,NULL),(46,'items',2,'UPDATE','{\"item_uom\": \"Per Project\", \"created_at\": \"2025-08-18 06:36:21.000000\", \"item_price\": 250000.0, \"updated_at\": \"2025-08-18 06:36:21.000000\", \"item_hs_code\": \"998314\", \"item_tax_rate\": \"18\", \"item_description\": \"Custom Software Development\"}','{\"item_uom\": \"Per Project\", \"created_at\": \"2025-08-18 06:36:21.000000\", \"item_price\": 250000.0, \"updated_at\": \"2025-08-18 06:36:21.000000\", \"item_hs_code\": \"998314\", \"item_tax_rate\": \"18\", \"item_description\": \"Custom Software Developement\"}','b4a50d92053d85886e6580159ad18c4ed60aff4a5ba341785a93cba1fdf7a1e6','e93ffbb3f35fd257d5ee2053857b0ea5f0d0916286bb956e61e55977dd477d4a','root@localhost','2025-08-18 06:37:21',NULL,NULL),(47,'items',1,'UPDATE','{\"item_uom\": \"Per Month\", \"created_at\": \"2025-08-18 06:10:32.000000\", \"item_price\": 10000.0, \"updated_at\": \"2025-08-18 06:11:13.000000\", \"item_hs_code\": \"9815.6000\", \"item_tax_rate\": \"16\", \"item_description\": \"API Integration Services.\"}','{\"item_uom\": \"Per Month\", \"created_at\": \"2025-08-18 06:10:32.000000\", \"item_price\": 15000.0, \"updated_at\": \"2025-08-18 06:37:49.000000\", \"item_hs_code\": \"9815.6000\", \"item_tax_rate\": \"16\", \"item_description\": \"API Integration Services.\"}','c0a03db5bab74f89a2002aa66994464ade5b646213ebbfd209893f2b308f7ee0','fc1b5ae29b89f3c7f08c7911b2dcd7a75d7aeb8fb9b90c28749cb65675f86af7','root@localhost','2025-08-18 06:37:49',NULL,NULL),(48,'invoices',2,'UPDATE','{\"buyer_id\": 1, \"due_date\": \"2025-08-19\", \"seller_id\": 1, \"created_at\": \"2025-08-18 06:28:51.000000\", \"invoice_no\": \"INV-000002\", \"updated_at\": \"2025-08-18 06:29:05.000000\", \"scenario_id\": \"SN019\", \"invoice_date\": \"2025-08-18\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 1, \"fbr_invoice_number\": \"8923980DI1755498519086\"}','{\"buyer_id\": 1, \"due_date\": \"2025-08-19\", \"seller_id\": 1, \"created_at\": \"2025-08-18 06:28:51.000000\", \"invoice_no\": \"INV-000002\", \"updated_at\": \"2025-08-18 06:29:05.000000\", \"scenario_id\": \"SN019\", \"invoice_date\": \"2025-08-19\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 1, \"fbr_invoice_number\": \"8923980DI1755498519086\"}',NULL,NULL,'root@localhost','2025-08-18 06:39:30',NULL,NULL),(49,'buyers',1,'UPDATE','{\"byr_IBAN\": \"PKIBAN789798978987\", \"byr_logo\": \"1755497672.jpg\", \"byr_name\": \"F3 Technologies (Pvt) Ltd.\", \"byr_type\": 0, \"created_at\": \"2025-08-18 06:14:32.000000\", \"updated_at\": \"2025-08-18 06:27:53.000000\", \"byr_address\": \"Dr, Zaraj Housing Society Sector B Islamabad\", \"byr_reg_num\": \"REG-2025013\", \"byr_ntn_cnic\": null, \"byr_province\": \"Punjab\", \"byr_swift_code\": null, \"byr_contact_num\": \"0300-5325487\", \"byr_account_title\": \"F3 Technologies Pvt Ltd\", \"byr_account_number\": \"00098765432100\", \"byr_contact_person\": \"Dr Ahmed Javad\", \"byr_acc_branch_code\": \"0876\", \"byr_acc_branch_name\": \"F-8 Markaz Branch\"}','{\"byr_IBAN\": \"PKIBAN789798978987\", \"byr_logo\": \"1755497672.jpg\", \"byr_name\": \"F3 Technologies (Pvt) Ltd.\", \"byr_type\": 0, \"created_at\": \"2025-08-18 06:14:32.000000\", \"updated_at\": \"2025-08-18 07:07:10.000000\", \"byr_address\": \"Dr, Zaraj Housing Society Sector B Islamabad\", \"byr_reg_num\": \"REG-2025013\", \"byr_ntn_cnic\": null, \"byr_province\": \"Islamabad\", \"byr_swift_code\": null, \"byr_contact_num\": \"0300-5325487\", \"byr_account_title\": \"F3 Technologies Pvt Ltd\", \"byr_account_number\": \"00098765432100\", \"byr_contact_person\": \"Dr Ahmed Javad\", \"byr_acc_branch_code\": \"0876\", \"byr_acc_branch_name\": \"F-8 Markaz Branch\"}',NULL,NULL,'root@localhost','2025-08-18 07:07:10',NULL,NULL),(50,'invoices',3,'INSERT',NULL,'{\"buyer_id\": 1, \"due_date\": \"2025-08-23\", \"seller_id\": 1, \"created_at\": \"2025-08-18 07:09:21.000000\", \"invoice_no\": null, \"updated_at\": \"2025-08-18 07:09:21.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-20\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}',NULL,NULL,'root@localhost','2025-08-18 07:09:21',NULL,NULL),(51,'invoice_details',11,'INSERT',NULL,'{\"item_id\": 1, \"discount\": 0.00, \"quantity\": 1, \"extra_tax\": 0.00, \"sale_type\": \"Services (FED in ST Mode)\", \"created_at\": \"2025-08-18 07:09:21.000000\", \"invoice_id\": 3, \"updated_at\": \"2025-08-18 07:09:21.000000\", \"fed_payable\": 0.00, \"further_tax\": 0.00, \"total_value\": 17400.00, \"retail_price\": 0.00, \"value_excl_tax\": 15000.00, \"sro_schedule_no\": \"\", \"sales_tax_withheld\": 0.00, \"sro_item_serial_no\": \"\", \"sales_tax_applicable\": 2400.00}',NULL,'a3a190c0a392dde97e83bfc69c6f69d21b3cb24394f8d7bd36148ed5cb7bd712','root@localhost','2025-08-18 07:09:21',NULL,NULL),(60,'buyers',1,'UPDATE','{\"byr_IBAN\": \"PKIBAN789798978987\", \"byr_logo\": \"1755497672.jpg\", \"byr_name\": \"F3 Technologies (Pvt) Ltd.\", \"byr_type\": 0, \"created_at\": \"2025-08-18 06:14:32.000000\", \"updated_at\": \"2025-08-18 07:07:10.000000\", \"byr_address\": \"Dr, Zaraj Housing Society Sector B Islamabad\", \"byr_reg_num\": \"REG-2025013\", \"byr_ntn_cnic\": null, \"byr_province\": \"Islamabad\", \"byr_swift_code\": null, \"byr_contact_num\": \"0300-5325487\", \"byr_account_title\": \"F3 Technologies Pvt Ltd\", \"byr_account_number\": \"00098765432100\", \"byr_contact_person\": \"Dr Ahmed Javad\", \"byr_acc_branch_code\": \"0876\", \"byr_acc_branch_name\": \"F-8 Markaz Branch\"}','{\"byr_IBAN\": \"PKIBAN789798978987\", \"byr_logo\": \"1755497672.jpg\", \"byr_name\": \"F3 Technologies (Pvt) Ltd.\", \"byr_type\": 0, \"created_at\": \"2025-08-18 06:14:32.000000\", \"updated_at\": \"2025-08-18 07:10:50.000000\", \"byr_address\": \"Dr, Zaraj Housing Society Sector B Islamabad\", \"byr_reg_num\": \"REG-2025013\", \"byr_ntn_cnic\": null, \"byr_province\": \"Punjab\", \"byr_swift_code\": null, \"byr_contact_num\": \"0300-5325487\", \"byr_account_title\": \"F3 Technologies Pvt Ltd\", \"byr_account_number\": \"00098765432100\", \"byr_contact_person\": \"Dr Ahmed Javad\", \"byr_acc_branch_code\": \"0876\", \"byr_acc_branch_name\": \"F-8 Markaz Branch\"}',NULL,NULL,'root@localhost','2025-08-18 07:10:50',NULL,NULL),(65,'invoices',3,'UPDATE','{\"buyer_id\": 1, \"due_date\": \"2025-08-23\", \"seller_id\": 1, \"created_at\": \"2025-08-18 07:09:21.000000\", \"invoice_no\": null, \"updated_at\": \"2025-08-18 07:09:21.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-20\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}','{\"buyer_id\": 1, \"due_date\": \"2025-08-23\", \"seller_id\": 1, \"created_at\": \"2025-08-18 07:09:21.000000\", \"invoice_no\": null, \"updated_at\": \"2025-08-18 07:11:20.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-18\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}',NULL,NULL,'root@localhost','2025-08-18 07:11:20',NULL,NULL),(66,'invoices',3,'UPDATE','{\"buyer_id\": 1, \"due_date\": \"2025-08-23\", \"seller_id\": 1, \"created_at\": \"2025-08-18 07:09:21.000000\", \"invoice_no\": null, \"updated_at\": \"2025-08-18 07:11:20.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-18\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}','{\"buyer_id\": 1, \"due_date\": \"2025-08-23\", \"seller_id\": 1, \"created_at\": \"2025-08-18 07:09:21.000000\", \"invoice_no\": \"INV-000003\", \"updated_at\": \"2025-08-18 07:11:20.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-18\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}',NULL,NULL,'root@localhost','2025-08-18 07:11:20',NULL,NULL),(67,'invoice_details',11,'DELETE','{\"item_id\": 1, \"discount\": 0.00, \"quantity\": 1, \"extra_tax\": 0.00, \"sale_type\": \"Services (FED in ST Mode)\", \"created_at\": \"2025-08-18 07:09:21.000000\", \"invoice_id\": 3, \"updated_at\": \"2025-08-18 07:09:21.000000\", \"fed_payable\": 0.00, \"further_tax\": 0.00, \"total_value\": 17400.00, \"retail_price\": 0.00, \"value_excl_tax\": 15000.00, \"sro_schedule_no\": \"\", \"sales_tax_withheld\": 0.00, \"sro_item_serial_no\": \"\", \"sales_tax_applicable\": 2400.00}',NULL,'a3a190c0a392dde97e83bfc69c6f69d21b3cb24394f8d7bd36148ed5cb7bd712',NULL,'root@localhost','2025-08-18 07:11:20',NULL,NULL),(68,'invoice_details',15,'INSERT',NULL,'{\"item_id\": 1, \"discount\": 0.00, \"quantity\": 1, \"extra_tax\": 0.00, \"sale_type\": \"Services (FED in ST Mode)\", \"created_at\": \"2025-08-18 07:11:20.000000\", \"invoice_id\": 3, \"updated_at\": \"2025-08-18 07:11:20.000000\", \"fed_payable\": 0.00, \"further_tax\": 0.00, \"total_value\": 17400.00, \"retail_price\": 0.00, \"value_excl_tax\": 15000.00, \"sro_schedule_no\": \"\", \"sales_tax_withheld\": 0.00, \"sro_item_serial_no\": \"\", \"sales_tax_applicable\": 2400.00}',NULL,'780d3203c378d76c6d6c5bce9cb3b2f8341bdea9f369842b3f11c2037a9ba5df','root@localhost','2025-08-18 07:11:20',NULL,NULL),(69,'invoices',3,'UPDATE','{\"buyer_id\": 1, \"due_date\": \"2025-08-23\", \"seller_id\": 1, \"created_at\": \"2025-08-18 07:09:21.000000\", \"invoice_no\": \"INV-000003\", \"updated_at\": \"2025-08-18 07:11:20.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-18\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}','{\"buyer_id\": 1, \"due_date\": \"2025-08-23\", \"seller_id\": 1, \"created_at\": \"2025-08-18 07:09:21.000000\", \"invoice_no\": \"INV-000003\", \"updated_at\": \"2025-08-18 07:11:22.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-18\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 1, \"fbr_invoice_number\": \"8923980DI1755501057284\"}',NULL,NULL,'root@localhost','2025-08-18 07:11:22',NULL,NULL),(70,'invoices',3,'UPDATE','{\"buyer_id\": 1, \"due_date\": \"2025-08-23\", \"seller_id\": 1, \"created_at\": \"2025-08-18 07:09:21.000000\", \"invoice_no\": \"INV-000003\", \"updated_at\": \"2025-08-18 07:11:22.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-18\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 1, \"fbr_invoice_number\": \"8923980DI1755501057284\"}','{\"buyer_id\": 1, \"due_date\": \"2025-08-23\", \"seller_id\": 1, \"created_at\": \"2025-08-18 07:09:21.000000\", \"invoice_no\": \"INV-000003\", \"updated_at\": \"2025-08-18 07:11:23.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-18\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 1, \"fbr_invoice_number\": \"8923980DI1755501057284\"}',NULL,NULL,'root@localhost','2025-08-18 07:11:23',NULL,NULL),(71,'business_configurations',1,'UPDATE','{\"bus_IBAN\": \"PK44ABPA0010109016750017\", \"bus_logo\": \"1752125231.svg\", \"bus_name\": \"Secureism Pvt Ltd\", \"created_at\": \"2025-07-04 17:02:41.000000\", \"updated_at\": \"2025-08-18 10:42:12.000000\", \"bus_address\": \"F3 Center of Technology, Zaraj Society, Islamabad Pakistan\", \"bus_reg_num\": \"0119999\", \"bus_ntn_cnic\": \"8923980\", \"bus_province\": \"Punjab\", \"bus_swift_code\": \"ABPAPKKA\", \"bus_contact_num\": \"03001234567\", \"bus_account_title\": \"SECUREISM (PRIVATE) LIMITED\", \"bus_account_number\": \"0010109016750017\", \"bus_contact_person\": \"ZEESHAN QAMAR\", \"bus_acc_branch_code\": \"0757\", \"bus_acc_branch_name\": \"ABL CHAKLALA SCHEME 3 RAWALPINDI\"}','{\"bus_IBAN\": \"PK44ABPA0010109016750017\", \"bus_logo\": \"1752125231.svg\", \"bus_name\": \"Secureism Pvt Ltd\", \"created_at\": \"2025-07-04 17:02:41.000000\", \"updated_at\": \"2025-08-18 09:10:38.000000\", \"bus_address\": \"F3 Center of Technology, Zaraj Society, Islamabad Pakistan\", \"bus_reg_num\": \"0119999\", \"bus_ntn_cnic\": \"8923980\", \"bus_province\": \"Sindh\", \"bus_swift_code\": \"ABPAPKKA\", \"bus_contact_num\": \"03001234567\", \"bus_account_title\": \"SECUREISM (PRIVATE) LIMITED\", \"bus_account_number\": \"0010109016750017\", \"bus_contact_person\": \"ZEESHAN QAMAR\", \"bus_acc_branch_code\": \"0757\", \"bus_acc_branch_name\": \"ABL CHAKLALA SCHEME 3 RAWALPINDI\"}','e63bf0fe235a42ec8a6752371b050a38bf62053878155df7ae79ebe3367a64d3','388522278860d88966d2c55895389313b1e113cc50d3dfcf6dca84be859d9030','root@localhost','2025-08-18 09:10:38',NULL,NULL),(72,'business_configurations',1,'UPDATE','{\"bus_IBAN\": \"PK44ABPA0010109016750017\", \"bus_logo\": \"1752125231.svg\", \"bus_name\": \"Secureism Pvt Ltd\", \"created_at\": \"2025-07-04 17:02:41.000000\", \"updated_at\": \"2025-08-18 09:10:38.000000\", \"bus_address\": \"F3 Center of Technology, Zaraj Society, Islamabad Pakistan\", \"bus_reg_num\": \"0119999\", \"bus_ntn_cnic\": \"8923980\", \"bus_province\": \"Sindh\", \"bus_swift_code\": \"ABPAPKKA\", \"bus_contact_num\": \"03001234567\", \"bus_account_title\": \"SECUREISM (PRIVATE) LIMITED\", \"bus_account_number\": \"0010109016750017\", \"bus_contact_person\": \"ZEESHAN QAMAR\", \"bus_acc_branch_code\": \"0757\", \"bus_acc_branch_name\": \"ABL CHAKLALA SCHEME 3 RAWALPINDI\"}','{\"bus_IBAN\": \"PK44ABPA0010109016750017\", \"bus_logo\": \"1752125231.svg\", \"bus_name\": \"Secureism Pvt Ltd\", \"created_at\": \"2025-07-04 17:02:41.000000\", \"updated_at\": \"2025-08-18 09:10:42.000000\", \"bus_address\": \"F3 Center of Technology, Zaraj Society, Islamabad Pakistan\", \"bus_reg_num\": \"0119999\", \"bus_ntn_cnic\": \"8923980\", \"bus_province\": \"Punjab\", \"bus_swift_code\": \"ABPAPKKA\", \"bus_contact_num\": \"03001234567\", \"bus_account_title\": \"SECUREISM (PRIVATE) LIMITED\", \"bus_account_number\": \"0010109016750017\", \"bus_contact_person\": \"ZEESHAN QAMAR\", \"bus_acc_branch_code\": \"0757\", \"bus_acc_branch_name\": \"ABL CHAKLALA SCHEME 3 RAWALPINDI\"}','388522278860d88966d2c55895389313b1e113cc50d3dfcf6dca84be859d9030','74451af8b637c165e5b0ceaa6e18df3fe942015e8e5983df923cbdb57a436917','root@localhost','2025-08-18 09:10:42',NULL,NULL),(73,'buyers',2,'INSERT',NULL,'{\"byr_IBAN\": \"PK12 HABB 0001 2345 6789 0123\", \"byr_logo\": \"1755596792.png\", \"byr_name\": \"Skypass Traders Pvt. Ltd.\", \"byr_type\": 0, \"created_at\": \"2025-08-19 09:46:32.000000\", \"updated_at\": \"2025-08-19 09:46:32.000000\", \"byr_address\": \"Office #12, Business Hub Plaza, MM Alam Road, Lahore\", \"byr_reg_num\": \"REG-2025-98765\", \"byr_ntn_cnic\": null, \"byr_province\": \"Punjab\", \"byr_swift_code\": null, \"byr_contact_num\": \"+92-321-4567890\", \"byr_account_title\": \"Skypass Traders Pvt. Ltd.\", \"byr_account_number\": \"1234567890123\", \"byr_contact_person\": \"Ahmed Khan\", \"byr_acc_branch_code\": \"0123\", \"byr_acc_branch_name\": \"Gulberg Branch\"}',NULL,NULL,'root@localhost','2025-08-19 09:46:32',NULL,NULL),(74,'items',3,'INSERT',NULL,'{\"item_uom\": \"Per Month\", \"created_at\": \"2025-08-19 09:47:45.000000\", \"item_price\": 120000.0, \"updated_at\": \"2025-08-19 09:47:45.000000\", \"item_hs_code\": \"998316\", \"item_tax_rate\": \"18\", \"item_description\": \"Mobile App Development (iOS & Android)\"}',NULL,'61a1abe086901bdf22a12d7ff735414c89ab3c93f21e63ce7523bef01202cfb0','root@localhost','2025-08-19 09:47:45',NULL,NULL),(78,'invoices',5,'INSERT',NULL,'{\"buyer_id\": 2, \"due_date\": \"2025-08-21\", \"seller_id\": 1, \"created_at\": \"2025-08-19 09:49:16.000000\", \"invoice_no\": null, \"updated_at\": \"2025-08-19 09:49:16.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-19\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}',NULL,NULL,'root@localhost','2025-08-19 09:49:16',NULL,NULL),(79,'invoices',5,'UPDATE','{\"buyer_id\": 2, \"due_date\": \"2025-08-21\", \"seller_id\": 1, \"created_at\": \"2025-08-19 09:49:16.000000\", \"invoice_no\": null, \"updated_at\": \"2025-08-19 09:49:16.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-19\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}','{\"buyer_id\": 2, \"due_date\": \"2025-08-21\", \"seller_id\": 1, \"created_at\": \"2025-08-19 09:49:16.000000\", \"invoice_no\": \"INV-000005\", \"updated_at\": \"2025-08-19 09:49:16.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-19\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}',NULL,NULL,'root@localhost','2025-08-19 09:49:16',NULL,NULL),(80,'invoice_details',17,'INSERT',NULL,'{\"item_id\": 1, \"discount\": 0.00, \"quantity\": 1, \"extra_tax\": 0.00, \"sale_type\": \"Services (FED in ST Mode)\", \"created_at\": \"2025-08-19 09:49:16.000000\", \"invoice_id\": 5, \"updated_at\": \"2025-08-19 09:49:16.000000\", \"fed_payable\": 0.00, \"further_tax\": 0.00, \"total_value\": 17400.00, \"retail_price\": 0.00, \"value_excl_tax\": 15000.00, \"sro_schedule_no\": \"\", \"sales_tax_withheld\": 0.00, \"sro_item_serial_no\": \"\", \"sales_tax_applicable\": 2400.00}',NULL,'f5fc01549be4ba5777e803f1119885ebf6d613002a0d6d2f1220e68e9a344daf','root@localhost','2025-08-19 09:49:16',NULL,NULL),(81,'invoices',5,'UPDATE','{\"buyer_id\": 2, \"due_date\": \"2025-08-21\", \"seller_id\": 1, \"created_at\": \"2025-08-19 09:49:16.000000\", \"invoice_no\": \"INV-000005\", \"updated_at\": \"2025-08-19 09:49:16.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-19\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}','{\"buyer_id\": 2, \"due_date\": \"2025-08-21\", \"seller_id\": 1, \"created_at\": \"2025-08-19 09:49:16.000000\", \"invoice_no\": \"INV-000005\", \"updated_at\": \"2025-08-19 09:49:18.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-19\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 1, \"fbr_invoice_number\": \"8923980DI1755596931625\"}',NULL,NULL,'root@localhost','2025-08-19 09:49:18',NULL,NULL),(82,'invoices',5,'UPDATE','{\"buyer_id\": 2, \"due_date\": \"2025-08-21\", \"seller_id\": 1, \"created_at\": \"2025-08-19 09:49:16.000000\", \"invoice_no\": \"INV-000005\", \"updated_at\": \"2025-08-19 09:49:18.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-19\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 1, \"fbr_invoice_number\": \"8923980DI1755596931625\"}','{\"buyer_id\": 2, \"due_date\": \"2025-08-21\", \"seller_id\": 1, \"created_at\": \"2025-08-19 09:49:16.000000\", \"invoice_no\": \"INV-000005\", \"updated_at\": \"2025-08-19 09:49:18.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-19\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 1, \"fbr_invoice_number\": \"8923980DI1755596931625\"}',NULL,NULL,'root@localhost','2025-08-19 09:49:18',NULL,NULL),(86,'invoices',7,'INSERT',NULL,'{\"buyer_id\": 2, \"due_date\": \"2025-08-22\", \"seller_id\": 1, \"created_at\": \"2025-08-19 10:06:51.000000\", \"invoice_no\": null, \"updated_at\": \"2025-08-19 10:06:51.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-19\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}',NULL,NULL,'root@localhost','2025-08-19 10:06:51',NULL,NULL),(87,'invoices',7,'UPDATE','{\"buyer_id\": 2, \"due_date\": \"2025-08-22\", \"seller_id\": 1, \"created_at\": \"2025-08-19 10:06:51.000000\", \"invoice_no\": null, \"updated_at\": \"2025-08-19 10:06:51.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-19\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}','{\"buyer_id\": 2, \"due_date\": \"2025-08-22\", \"seller_id\": 1, \"created_at\": \"2025-08-19 10:06:51.000000\", \"invoice_no\": \"INV-000007\", \"updated_at\": \"2025-08-19 10:06:51.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-19\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}',NULL,NULL,'root@localhost','2025-08-19 10:06:51',NULL,NULL),(88,'invoice_details',19,'INSERT',NULL,'{\"item_id\": 1, \"discount\": 0.00, \"quantity\": 1, \"extra_tax\": 0.00, \"sale_type\": \"Services (FED in ST Mode)\", \"created_at\": \"2025-08-19 10:06:51.000000\", \"invoice_id\": 7, \"updated_at\": \"2025-08-19 10:06:51.000000\", \"fed_payable\": 0.00, \"further_tax\": 0.00, \"total_value\": 17400.00, \"retail_price\": 0.00, \"value_excl_tax\": 15000.00, \"sro_schedule_no\": \"\", \"sales_tax_withheld\": 0.00, \"sro_item_serial_no\": \"\", \"sales_tax_applicable\": 2400.00}',NULL,'5fe6ec64f28c67e8381849cf5e2816606c1d4bb3fd558b7300cc46e36f5f13ac','root@localhost','2025-08-19 10:06:51',NULL,NULL),(89,'invoices',7,'UPDATE','{\"buyer_id\": 2, \"due_date\": \"2025-08-22\", \"seller_id\": 1, \"created_at\": \"2025-08-19 10:06:51.000000\", \"invoice_no\": \"INV-000007\", \"updated_at\": \"2025-08-19 10:06:51.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-19\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}','{\"buyer_id\": 2, \"due_date\": \"2025-08-22\", \"seller_id\": 1, \"created_at\": \"2025-08-19 10:06:51.000000\", \"invoice_no\": \"INV-000007\", \"updated_at\": \"2025-08-19 10:06:54.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-19\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 1, \"fbr_invoice_number\": \"8923980DI1755597987313\"}',NULL,NULL,'root@localhost','2025-08-19 10:06:54',NULL,NULL),(90,'invoices',7,'UPDATE','{\"buyer_id\": 2, \"due_date\": \"2025-08-22\", \"seller_id\": 1, \"created_at\": \"2025-08-19 10:06:51.000000\", \"invoice_no\": \"INV-000007\", \"updated_at\": \"2025-08-19 10:06:54.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-19\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 1, \"fbr_invoice_number\": \"8923980DI1755597987313\"}','{\"buyer_id\": 2, \"due_date\": \"2025-08-22\", \"seller_id\": 1, \"created_at\": \"2025-08-19 10:06:51.000000\", \"invoice_no\": \"INV-000007\", \"updated_at\": \"2025-08-19 10:06:54.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-19\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 1, \"fbr_invoice_number\": \"8923980DI1755597987313\"}',NULL,NULL,'root@localhost','2025-08-19 10:06:54',NULL,NULL),(91,'invoices',8,'INSERT',NULL,'{\"buyer_id\": 2, \"due_date\": \"2025-08-21\", \"seller_id\": 1, \"created_at\": \"2025-08-19 10:14:46.000000\", \"invoice_no\": null, \"updated_at\": \"2025-08-19 10:14:46.000000\", \"scenario_id\": \"SN019\", \"invoice_date\": \"2025-08-19\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}',NULL,NULL,'root@localhost','2025-08-19 10:14:46',NULL,NULL),(92,'invoices',8,'UPDATE','{\"buyer_id\": 2, \"due_date\": \"2025-08-21\", \"seller_id\": 1, \"created_at\": \"2025-08-19 10:14:46.000000\", \"invoice_no\": null, \"updated_at\": \"2025-08-19 10:14:46.000000\", \"scenario_id\": \"SN019\", \"invoice_date\": \"2025-08-19\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}','{\"buyer_id\": 2, \"due_date\": \"2025-08-21\", \"seller_id\": 1, \"created_at\": \"2025-08-19 10:14:46.000000\", \"invoice_no\": \"INV-000008\", \"updated_at\": \"2025-08-19 10:14:46.000000\", \"scenario_id\": \"SN019\", \"invoice_date\": \"2025-08-19\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}',NULL,NULL,'root@localhost','2025-08-19 10:14:46',NULL,NULL),(93,'invoice_details',20,'INSERT',NULL,'{\"item_id\": 1, \"discount\": 0.00, \"quantity\": 1, \"extra_tax\": 0.00, \"sale_type\": \"Services\", \"created_at\": \"2025-08-19 10:14:46.000000\", \"invoice_id\": 8, \"updated_at\": \"2025-08-19 10:14:46.000000\", \"fed_payable\": 0.00, \"further_tax\": 0.00, \"total_value\": 17400.00, \"retail_price\": 0.00, \"value_excl_tax\": 15000.00, \"sro_schedule_no\": \"\", \"sales_tax_withheld\": 0.00, \"sro_item_serial_no\": \"\", \"sales_tax_applicable\": 2400.00}',NULL,'221771a838f3d9f1892b20a30a660837d63fe6e97fc5a2772fc9f75bfb095c9d','root@localhost','2025-08-19 10:14:46',NULL,NULL),(94,'invoices',8,'UPDATE','{\"buyer_id\": 2, \"due_date\": \"2025-08-21\", \"seller_id\": 1, \"created_at\": \"2025-08-19 10:14:46.000000\", \"invoice_no\": \"INV-000008\", \"updated_at\": \"2025-08-19 10:14:46.000000\", \"scenario_id\": \"SN019\", \"invoice_date\": \"2025-08-19\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}','{\"buyer_id\": 2, \"due_date\": \"2025-08-21\", \"seller_id\": 1, \"created_at\": \"2025-08-19 10:14:46.000000\", \"invoice_no\": \"INV-000008\", \"updated_at\": \"2025-08-19 10:14:49.000000\", \"scenario_id\": \"SN019\", \"invoice_date\": \"2025-08-19\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 1, \"fbr_invoice_number\": \"8923980DI1755598462537\"}',NULL,NULL,'root@localhost','2025-08-19 10:14:49',NULL,NULL),(95,'invoices',8,'UPDATE','{\"buyer_id\": 2, \"due_date\": \"2025-08-21\", \"seller_id\": 1, \"created_at\": \"2025-08-19 10:14:46.000000\", \"invoice_no\": \"INV-000008\", \"updated_at\": \"2025-08-19 10:14:49.000000\", \"scenario_id\": \"SN019\", \"invoice_date\": \"2025-08-19\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 1, \"fbr_invoice_number\": \"8923980DI1755598462537\"}','{\"buyer_id\": 2, \"due_date\": \"2025-08-21\", \"seller_id\": 1, \"created_at\": \"2025-08-19 10:14:46.000000\", \"invoice_no\": \"INV-000008\", \"updated_at\": \"2025-08-19 10:14:49.000000\", \"scenario_id\": \"SN019\", \"invoice_date\": \"2025-08-19\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 1, \"fbr_invoice_number\": \"8923980DI1755598462537\"}',NULL,NULL,'root@localhost','2025-08-19 10:14:49',NULL,NULL),(96,'items',3,'UPDATE','{\"item_uom\": \"Per Month\", \"created_at\": \"2025-08-19 09:47:45.000000\", \"item_price\": 120000.0, \"updated_at\": \"2025-08-19 09:47:45.000000\", \"item_hs_code\": \"998316\", \"item_tax_rate\": \"18\", \"item_description\": \"Mobile App Development (iOS & Android)\"}','{\"item_uom\": \"Per Month\", \"created_at\": \"2025-08-19 09:47:45.000000\", \"item_price\": 120000.0, \"updated_at\": \"2025-08-19 11:18:44.000000\", \"item_hs_code\": \"98156000\", \"item_tax_rate\": \"18\", \"item_description\": \"Software / IT System Development\"}','61a1abe086901bdf22a12d7ff735414c89ab3c93f21e63ce7523bef01202cfb0','36a465e3032121f097a51c9bcc63d8875b36d2ca1bea8bb31b0f346d392923ce','root@localhost','2025-08-19 11:18:44',NULL,NULL),(97,'items',2,'UPDATE','{\"item_uom\": \"Per Project\", \"created_at\": \"2025-08-18 06:36:21.000000\", \"item_price\": 250000.0, \"updated_at\": \"2025-08-18 06:36:21.000000\", \"item_hs_code\": \"998314\", \"item_tax_rate\": \"18\", \"item_description\": \"Custom Software Developement\"}','{\"item_uom\": \"Per Project\", \"created_at\": \"2025-08-18 06:36:21.000000\", \"item_price\": 250000.0, \"updated_at\": \"2025-08-19 11:19:14.000000\", \"item_hs_code\": \"98151000\", \"item_tax_rate\": \"18\", \"item_description\": \"Technical / Engineering Consulting\"}','e93ffbb3f35fd257d5ee2053857b0ea5f0d0916286bb956e61e55977dd477d4a','ed3048f1869245328c9575576d3d2c1c34a8b7961fc48cb640614a4439d3c856','root@localhost','2025-08-19 11:19:14',NULL,NULL),(119,'invoices',16,'INSERT',NULL,'{\"buyer_id\": 1, \"due_date\": \"2025-08-21\", \"seller_id\": 1, \"created_at\": \"2025-08-19 11:33:24.000000\", \"invoice_no\": null, \"updated_at\": \"2025-08-19 11:33:24.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-19\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}',NULL,NULL,'root@localhost','2025-08-19 11:33:24',NULL,NULL),(120,'invoices',16,'UPDATE','{\"buyer_id\": 1, \"due_date\": \"2025-08-21\", \"seller_id\": 1, \"created_at\": \"2025-08-19 11:33:24.000000\", \"invoice_no\": null, \"updated_at\": \"2025-08-19 11:33:24.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-19\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}','{\"buyer_id\": 1, \"due_date\": \"2025-08-21\", \"seller_id\": 1, \"created_at\": \"2025-08-19 11:33:24.000000\", \"invoice_no\": \"INV-000016\", \"updated_at\": \"2025-08-19 11:33:24.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-19\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}',NULL,NULL,'root@localhost','2025-08-19 11:33:24',NULL,NULL),(121,'invoice_details',28,'INSERT',NULL,'{\"item_id\": 1, \"discount\": 0.00, \"quantity\": 1, \"extra_tax\": 0.00, \"sale_type\": \"Services (FED in ST Mode)\", \"created_at\": \"2025-08-19 11:33:24.000000\", \"invoice_id\": 16, \"updated_at\": \"2025-08-19 11:33:24.000000\", \"fed_payable\": 0.00, \"further_tax\": 0.00, \"total_value\": 17400.00, \"retail_price\": 0.00, \"value_excl_tax\": 15000.00, \"sro_schedule_no\": \"\", \"sales_tax_withheld\": 0.00, \"sro_item_serial_no\": \"\", \"sales_tax_applicable\": 2400.00}',NULL,'858781a0f7e14a2bf1c156d5e8131d18640cdd9bfab119b68051eafa3aaa804d','root@localhost','2025-08-19 11:33:24',NULL,NULL),(122,'invoices',16,'UPDATE','{\"buyer_id\": 1, \"due_date\": \"2025-08-21\", \"seller_id\": 1, \"created_at\": \"2025-08-19 11:33:24.000000\", \"invoice_no\": \"INV-000016\", \"updated_at\": \"2025-08-19 11:33:24.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-19\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}','{\"buyer_id\": 1, \"due_date\": \"2025-08-21\", \"seller_id\": 1, \"created_at\": \"2025-08-19 11:33:24.000000\", \"invoice_no\": \"INV-000016\", \"updated_at\": \"2025-08-19 11:33:25.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-19\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 1, \"fbr_invoice_number\": \"8923980DI1755603179148\"}',NULL,NULL,'root@localhost','2025-08-19 11:33:25',NULL,NULL),(123,'invoices',16,'UPDATE','{\"buyer_id\": 1, \"due_date\": \"2025-08-21\", \"seller_id\": 1, \"created_at\": \"2025-08-19 11:33:24.000000\", \"invoice_no\": \"INV-000016\", \"updated_at\": \"2025-08-19 11:33:25.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-19\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 1, \"fbr_invoice_number\": \"8923980DI1755603179148\"}','{\"buyer_id\": 1, \"due_date\": \"2025-08-21\", \"seller_id\": 1, \"created_at\": \"2025-08-19 11:33:24.000000\", \"invoice_no\": \"INV-000016\", \"updated_at\": \"2025-08-19 11:33:26.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-19\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 1, \"fbr_invoice_number\": \"8923980DI1755603179148\"}',NULL,NULL,'root@localhost','2025-08-19 11:33:26',NULL,NULL),(124,'buyers',3,'INSERT',NULL,'{\"byr_IBAN\": \"PK36UNIL0000001234567890\", \"byr_logo\": \"1755681601.jpg\", \"byr_name\": \"Unilever Pakistan Limited\", \"byr_type\": 1, \"created_at\": \"2025-08-20 09:20:01.000000\", \"updated_at\": \"2025-08-20 09:20:01.000000\", \"byr_address\": \"Plot 12, Industrial Estate, Karachi\", \"byr_reg_num\": \"UPL-2023-Karachi\", \"byr_ntn_cnic\": \"1234567\", \"byr_province\": \"Sindh\", \"byr_swift_code\": null, \"byr_contact_num\": \"+92-21-34567890\", \"byr_account_title\": \"Unilever Pakistan Ltd.\", \"byr_account_number\": \"0123456789012345\", \"byr_contact_person\": \"Mr. A. Hassan\", \"byr_acc_branch_code\": \"0012\", \"byr_acc_branch_name\": \"Karachi Industrial Branch\"}',NULL,NULL,'root@localhost','2025-08-20 09:20:01',NULL,NULL),(125,'buyers',4,'INSERT',NULL,'{\"byr_IBAN\": \"PK22ICIP0000002233445566\", \"byr_logo\": \"1755681838.png\", \"byr_name\": \"ICI Pakistan Limited\", \"byr_type\": 1, \"created_at\": \"2025-08-20 09:23:58.000000\", \"updated_at\": \"2025-08-20 09:23:58.000000\", \"byr_address\": \"45 Canal Road, Lahore\", \"byr_reg_num\": \"ICI-2008-Lahore\", \"byr_ntn_cnic\": \"9876543\", \"byr_province\": \"Punjab\", \"byr_swift_code\": null, \"byr_contact_num\": \"+92-42-35678901\", \"byr_account_title\": \"ICI Pakistan Ltd.\", \"byr_account_number\": \"2233445566778899\", \"byr_contact_person\": \"Ms. S. Khan\", \"byr_acc_branch_code\": \"0034\", \"byr_acc_branch_name\": \"Lahore Main Branch\"}',NULL,NULL,'root@localhost','2025-08-20 09:23:58',NULL,NULL),(126,'buyers',5,'INSERT',NULL,'{\"byr_IBAN\": \"PK44GHDA0000003344556677\", \"byr_logo\": \"1755681976.jpg\", \"byr_name\": \"Ghandhara Industries Ltd. (Isuzu Pakistan)\", \"byr_type\": 1, \"created_at\": \"2025-08-20 09:26:16.000000\", \"updated_at\": \"2025-08-20 09:26:16.000000\", \"byr_address\": \"SITE Industrial Area, Karachi\", \"byr_reg_num\": \"GIL-1953-Karachi\", \"byr_ntn_cnic\": \"7654321\", \"byr_province\": \"Sindh\", \"byr_swift_code\": null, \"byr_contact_num\": \"+92-21-36789012\", \"byr_account_title\": \"Ghandhara Industries Ltd.\", \"byr_account_number\": \"3344556677889900\", \"byr_contact_person\": \"Mr. K. Khattak\", \"byr_acc_branch_code\": \"0045\", \"byr_acc_branch_name\": \"SITE Town Branch\"}',NULL,NULL,'root@localhost','2025-08-20 09:26:16',NULL,NULL),(127,'items',2,'UPDATE','{\"item_uom\": \"Per Project\", \"created_at\": \"2025-08-18 06:36:21.000000\", \"item_price\": 250000.0, \"updated_at\": \"2025-08-19 11:19:14.000000\", \"item_hs_code\": \"98151000\", \"item_tax_rate\": \"18\", \"item_description\": \"Technical / Engineering Consulting\"}','{\"item_uom\": \"Per Project\", \"created_at\": \"2025-08-18 06:36:21.000000\", \"item_price\": 250000.0, \"updated_at\": \"2025-08-20 09:59:06.000000\", \"item_hs_code\": \"9815.1000\", \"item_tax_rate\": \"18\", \"item_description\": \"Technical / Engineering Consulting\"}','ed3048f1869245328c9575576d3d2c1c34a8b7961fc48cb640614a4439d3c856','8c2b45f5595aeeb19b8436e32977c5a0bb355ab8451b2a4e99eac9b0a0e36804','root@localhost','2025-08-20 09:59:06',NULL,NULL),(128,'items',3,'UPDATE','{\"item_uom\": \"Per Month\", \"created_at\": \"2025-08-19 09:47:45.000000\", \"item_price\": 120000.0, \"updated_at\": \"2025-08-19 11:18:44.000000\", \"item_hs_code\": \"98156000\", \"item_tax_rate\": \"18\", \"item_description\": \"Software / IT System Development\"}','{\"item_uom\": \"Per Month\", \"created_at\": \"2025-08-19 09:47:45.000000\", \"item_price\": 120000.0, \"updated_at\": \"2025-08-20 09:59:13.000000\", \"item_hs_code\": \"9815.6000\", \"item_tax_rate\": \"18\", \"item_description\": \"Software / IT System Development\"}','36a465e3032121f097a51c9bcc63d8875b36d2ca1bea8bb31b0f346d392923ce','ccf2dbba0c5ddd11ac52ea706d1d9f0a3c2fd63520e7b4557f6439959c8ec634','root@localhost','2025-08-20 09:59:13',NULL,NULL),(129,'buyers',5,'UPDATE','{\"byr_IBAN\": \"PK44GHDA0000003344556677\", \"byr_logo\": \"1755681976.jpg\", \"byr_name\": \"Ghandhara Industries Ltd. (Isuzu Pakistan)\", \"byr_type\": 1, \"created_at\": \"2025-08-20 09:26:16.000000\", \"updated_at\": \"2025-08-20 09:26:16.000000\", \"byr_address\": \"SITE Industrial Area, Karachi\", \"byr_reg_num\": \"GIL-1953-Karachi\", \"byr_ntn_cnic\": \"7654321\", \"byr_province\": \"Sindh\", \"byr_swift_code\": null, \"byr_contact_num\": \"+92-21-36789012\", \"byr_account_title\": \"Ghandhara Industries Ltd.\", \"byr_account_number\": \"3344556677889900\", \"byr_contact_person\": \"Mr. K. Khattak\", \"byr_acc_branch_code\": \"0045\", \"byr_acc_branch_name\": \"SITE Town Branch\"}','{\"byr_IBAN\": \"PK44GHDA0000003344556677\", \"byr_logo\": \"1755681976.jpg\", \"byr_name\": \"Ghandhara Industries Ltd. (Isuzu Pakistan)\", \"byr_type\": 0, \"created_at\": \"2025-08-20 09:26:16.000000\", \"updated_at\": \"2025-08-20 10:00:18.000000\", \"byr_address\": \"SITE Industrial Area, Karachi\", \"byr_reg_num\": \"GIL-1953-Karachi\", \"byr_ntn_cnic\": null, \"byr_province\": \"Sindh\", \"byr_swift_code\": null, \"byr_contact_num\": \"+92-21-36789012\", \"byr_account_title\": \"Ghandhara Industries Ltd.\", \"byr_account_number\": \"3344556677889900\", \"byr_contact_person\": \"Mr. K. Khattak\", \"byr_acc_branch_code\": \"0045\", \"byr_acc_branch_name\": \"SITE Town Branch\"}',NULL,NULL,'root@localhost','2025-08-20 10:00:18',NULL,NULL),(130,'buyers',4,'UPDATE','{\"byr_IBAN\": \"PK22ICIP0000002233445566\", \"byr_logo\": \"1755681838.png\", \"byr_name\": \"ICI Pakistan Limited\", \"byr_type\": 1, \"created_at\": \"2025-08-20 09:23:58.000000\", \"updated_at\": \"2025-08-20 09:23:58.000000\", \"byr_address\": \"45 Canal Road, Lahore\", \"byr_reg_num\": \"ICI-2008-Lahore\", \"byr_ntn_cnic\": \"9876543\", \"byr_province\": \"Punjab\", \"byr_swift_code\": null, \"byr_contact_num\": \"+92-42-35678901\", \"byr_account_title\": \"ICI Pakistan Ltd.\", \"byr_account_number\": \"2233445566778899\", \"byr_contact_person\": \"Ms. S. Khan\", \"byr_acc_branch_code\": \"0034\", \"byr_acc_branch_name\": \"Lahore Main Branch\"}','{\"byr_IBAN\": \"PK22ICIP0000002233445566\", \"byr_logo\": \"1755681838.png\", \"byr_name\": \"ICI Pakistan Limited\", \"byr_type\": 0, \"created_at\": \"2025-08-20 09:23:58.000000\", \"updated_at\": \"2025-08-20 10:00:30.000000\", \"byr_address\": \"45 Canal Road, Lahore\", \"byr_reg_num\": \"ICI-2008-Lahore\", \"byr_ntn_cnic\": null, \"byr_province\": \"Punjab\", \"byr_swift_code\": null, \"byr_contact_num\": \"+92-42-35678901\", \"byr_account_title\": \"ICI Pakistan Ltd.\", \"byr_account_number\": \"2233445566778899\", \"byr_contact_person\": \"Ms. S. Khan\", \"byr_acc_branch_code\": \"0034\", \"byr_acc_branch_name\": \"Lahore Main Branch\"}',NULL,NULL,'root@localhost','2025-08-20 10:00:30',NULL,NULL),(131,'buyers',3,'UPDATE','{\"byr_IBAN\": \"PK36UNIL0000001234567890\", \"byr_logo\": \"1755681601.jpg\", \"byr_name\": \"Unilever Pakistan Limited\", \"byr_type\": 1, \"created_at\": \"2025-08-20 09:20:01.000000\", \"updated_at\": \"2025-08-20 09:20:01.000000\", \"byr_address\": \"Plot 12, Industrial Estate, Karachi\", \"byr_reg_num\": \"UPL-2023-Karachi\", \"byr_ntn_cnic\": \"1234567\", \"byr_province\": \"Sindh\", \"byr_swift_code\": null, \"byr_contact_num\": \"+92-21-34567890\", \"byr_account_title\": \"Unilever Pakistan Ltd.\", \"byr_account_number\": \"0123456789012345\", \"byr_contact_person\": \"Mr. A. Hassan\", \"byr_acc_branch_code\": \"0012\", \"byr_acc_branch_name\": \"Karachi Industrial Branch\"}','{\"byr_IBAN\": \"PK36UNIL0000001234567890\", \"byr_logo\": \"1755681601.jpg\", \"byr_name\": \"Unilever Pakistan Limited\", \"byr_type\": 0, \"created_at\": \"2025-08-20 09:20:01.000000\", \"updated_at\": \"2025-08-20 10:00:45.000000\", \"byr_address\": \"Plot 12, Industrial Estate, Karachi\", \"byr_reg_num\": \"UPL-2023-Karachi\", \"byr_ntn_cnic\": null, \"byr_province\": \"Sindh\", \"byr_swift_code\": null, \"byr_contact_num\": \"+92-21-34567890\", \"byr_account_title\": \"Unilever Pakistan Ltd.\", \"byr_account_number\": \"0123456789012345\", \"byr_contact_person\": \"Mr. A. Hassan\", \"byr_acc_branch_code\": \"0012\", \"byr_acc_branch_name\": \"Karachi Industrial Branch\"}',NULL,NULL,'root@localhost','2025-08-20 10:00:45',NULL,NULL),(135,'items',3,'UPDATE','{\"item_uom\": \"Per Month\", \"created_at\": \"2025-08-19 09:47:45.000000\", \"item_price\": 120000.0, \"updated_at\": \"2025-08-20 09:59:13.000000\", \"item_hs_code\": \"9815.6000\", \"item_tax_rate\": \"18\", \"item_description\": \"Software / IT System Development\"}','{\"item_uom\": \"Per Month\", \"created_at\": \"2025-08-19 09:47:45.000000\", \"item_price\": 120000.0, \"updated_at\": \"2025-08-20 10:05:58.000000\", \"item_hs_code\": \"9815.6000\", \"item_tax_rate\": \"16\", \"item_description\": \"Software / IT System Development\"}','ccf2dbba0c5ddd11ac52ea706d1d9f0a3c2fd63520e7b4557f6439959c8ec634','56ded405ca68fe452182380257044fd03e5a0fc62fe263aa7191145319e93e09','root@localhost','2025-08-20 10:05:58',NULL,NULL),(136,'items',2,'UPDATE','{\"item_uom\": \"Per Project\", \"created_at\": \"2025-08-18 06:36:21.000000\", \"item_price\": 250000.0, \"updated_at\": \"2025-08-20 09:59:06.000000\", \"item_hs_code\": \"9815.1000\", \"item_tax_rate\": \"18\", \"item_description\": \"Technical / Engineering Consulting\"}','{\"item_uom\": \"Per Project\", \"created_at\": \"2025-08-18 06:36:21.000000\", \"item_price\": 250000.0, \"updated_at\": \"2025-08-20 10:06:06.000000\", \"item_hs_code\": \"9815.1000\", \"item_tax_rate\": \"16\", \"item_description\": \"Technical / Engineering Consulting\"}','8c2b45f5595aeeb19b8436e32977c5a0bb355ab8451b2a4e99eac9b0a0e36804','b3ff0f66582c24ec40da9afa055f1848c2a1e5402ad0ad47b4daeb4294f6efd5','root@localhost','2025-08-20 10:06:06',NULL,NULL),(137,'invoices',18,'INSERT',NULL,'{\"buyer_id\": 3, \"due_date\": \"2025-08-21\", \"seller_id\": 1, \"created_at\": \"2025-08-20 10:06:49.000000\", \"invoice_no\": null, \"updated_at\": \"2025-08-20 10:06:49.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-20\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}',NULL,NULL,'root@localhost','2025-08-20 10:06:49',NULL,NULL),(138,'invoices',18,'UPDATE','{\"buyer_id\": 3, \"due_date\": \"2025-08-21\", \"seller_id\": 1, \"created_at\": \"2025-08-20 10:06:49.000000\", \"invoice_no\": null, \"updated_at\": \"2025-08-20 10:06:49.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-20\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}','{\"buyer_id\": 3, \"due_date\": \"2025-08-21\", \"seller_id\": 1, \"created_at\": \"2025-08-20 10:06:49.000000\", \"invoice_no\": \"INV-000018\", \"updated_at\": \"2025-08-20 10:06:49.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-20\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}',NULL,NULL,'root@localhost','2025-08-20 10:06:49',NULL,NULL),(139,'invoice_details',30,'INSERT',NULL,'{\"item_id\": 2, \"discount\": 0.00, \"quantity\": 1, \"extra_tax\": 0.00, \"sale_type\": \"Services (FED in ST Mode)\", \"created_at\": \"2025-08-20 10:06:49.000000\", \"invoice_id\": 18, \"updated_at\": \"2025-08-20 10:06:49.000000\", \"fed_payable\": 0.00, \"further_tax\": 0.00, \"total_value\": 290000.00, \"retail_price\": 0.00, \"value_excl_tax\": 250000.00, \"sro_schedule_no\": \"\", \"sales_tax_withheld\": 0.00, \"sro_item_serial_no\": \"\", \"sales_tax_applicable\": 40000.00}',NULL,'7d4be40689053feb34c0812830e7ffb8a1c622dbb9d25fd0bbe6c30789be1f53','root@localhost','2025-08-20 10:06:49',NULL,NULL),(140,'invoices',18,'UPDATE','{\"buyer_id\": 3, \"due_date\": \"2025-08-21\", \"seller_id\": 1, \"created_at\": \"2025-08-20 10:06:49.000000\", \"invoice_no\": \"INV-000018\", \"updated_at\": \"2025-08-20 10:06:49.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-20\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}','{\"buyer_id\": 3, \"due_date\": \"2025-08-21\", \"seller_id\": 1, \"created_at\": \"2025-08-20 10:06:49.000000\", \"invoice_no\": \"INV-000018\", \"updated_at\": \"2025-08-20 10:06:50.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-20\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 1, \"fbr_invoice_number\": \"8923980DI1755684382924\"}',NULL,NULL,'root@localhost','2025-08-20 10:06:50',NULL,NULL),(141,'invoices',18,'UPDATE','{\"buyer_id\": 3, \"due_date\": \"2025-08-21\", \"seller_id\": 1, \"created_at\": \"2025-08-20 10:06:49.000000\", \"invoice_no\": \"INV-000018\", \"updated_at\": \"2025-08-20 10:06:50.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-20\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 1, \"fbr_invoice_number\": \"8923980DI1755684382924\"}','{\"buyer_id\": 3, \"due_date\": \"2025-08-21\", \"seller_id\": 1, \"created_at\": \"2025-08-20 10:06:49.000000\", \"invoice_no\": \"INV-000018\", \"updated_at\": \"2025-08-20 10:06:51.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-20\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 1, \"fbr_invoice_number\": \"8923980DI1755684382924\"}',NULL,NULL,'root@localhost','2025-08-20 10:06:51',NULL,NULL),(142,'invoices',19,'INSERT',NULL,'{\"buyer_id\": 4, \"due_date\": \"2025-08-22\", \"seller_id\": 1, \"created_at\": \"2025-08-20 10:07:28.000000\", \"invoice_no\": null, \"updated_at\": \"2025-08-20 10:07:28.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-20\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}',NULL,NULL,'root@localhost','2025-08-20 10:07:28',NULL,NULL),(143,'invoices',19,'UPDATE','{\"buyer_id\": 4, \"due_date\": \"2025-08-22\", \"seller_id\": 1, \"created_at\": \"2025-08-20 10:07:28.000000\", \"invoice_no\": null, \"updated_at\": \"2025-08-20 10:07:28.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-20\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}','{\"buyer_id\": 4, \"due_date\": \"2025-08-22\", \"seller_id\": 1, \"created_at\": \"2025-08-20 10:07:28.000000\", \"invoice_no\": \"INV-000019\", \"updated_at\": \"2025-08-20 10:07:28.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-20\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}',NULL,NULL,'root@localhost','2025-08-20 10:07:28',NULL,NULL),(144,'invoice_details',31,'INSERT',NULL,'{\"item_id\": 3, \"discount\": 0.00, \"quantity\": 1, \"extra_tax\": 0.00, \"sale_type\": \"Services (FED in ST Mode)\", \"created_at\": \"2025-08-20 10:07:28.000000\", \"invoice_id\": 19, \"updated_at\": \"2025-08-20 10:07:28.000000\", \"fed_payable\": 0.00, \"further_tax\": 0.00, \"total_value\": 139200.00, \"retail_price\": 0.00, \"value_excl_tax\": 120000.00, \"sro_schedule_no\": \"\", \"sales_tax_withheld\": 0.00, \"sro_item_serial_no\": \"\", \"sales_tax_applicable\": 19200.00}',NULL,'d29ae769b52bdef9e57c6b38a9e8236615db3adb1e649c3104704e65f797a959','root@localhost','2025-08-20 10:07:28',NULL,NULL),(145,'invoices',19,'UPDATE','{\"buyer_id\": 4, \"due_date\": \"2025-08-22\", \"seller_id\": 1, \"created_at\": \"2025-08-20 10:07:28.000000\", \"invoice_no\": \"INV-000019\", \"updated_at\": \"2025-08-20 10:07:28.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-20\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}','{\"buyer_id\": 4, \"due_date\": \"2025-08-22\", \"seller_id\": 1, \"created_at\": \"2025-08-20 10:07:28.000000\", \"invoice_no\": \"INV-000019\", \"updated_at\": \"2025-08-20 10:07:30.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-20\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 1, \"fbr_invoice_number\": \"8923980DI1755684422905\"}',NULL,NULL,'root@localhost','2025-08-20 10:07:30',NULL,NULL),(146,'invoices',19,'UPDATE','{\"buyer_id\": 4, \"due_date\": \"2025-08-22\", \"seller_id\": 1, \"created_at\": \"2025-08-20 10:07:28.000000\", \"invoice_no\": \"INV-000019\", \"updated_at\": \"2025-08-20 10:07:30.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-20\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 1, \"fbr_invoice_number\": \"8923980DI1755684422905\"}','{\"buyer_id\": 4, \"due_date\": \"2025-08-22\", \"seller_id\": 1, \"created_at\": \"2025-08-20 10:07:28.000000\", \"invoice_no\": \"INV-000019\", \"updated_at\": \"2025-08-20 10:07:31.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-20\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 1, \"fbr_invoice_number\": \"8923980DI1755684422905\"}',NULL,NULL,'root@localhost','2025-08-20 10:07:31',NULL,NULL),(147,'invoices',20,'INSERT',NULL,'{\"buyer_id\": 5, \"due_date\": \"2025-08-22\", \"seller_id\": 1, \"created_at\": \"2025-08-20 10:08:58.000000\", \"invoice_no\": null, \"updated_at\": \"2025-08-20 10:08:58.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-20\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}',NULL,NULL,'root@localhost','2025-08-20 10:08:58',NULL,NULL),(148,'invoices',20,'UPDATE','{\"buyer_id\": 5, \"due_date\": \"2025-08-22\", \"seller_id\": 1, \"created_at\": \"2025-08-20 10:08:58.000000\", \"invoice_no\": null, \"updated_at\": \"2025-08-20 10:08:58.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-20\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}','{\"buyer_id\": 5, \"due_date\": \"2025-08-22\", \"seller_id\": 1, \"created_at\": \"2025-08-20 10:08:58.000000\", \"invoice_no\": \"INV-000020\", \"updated_at\": \"2025-08-20 10:08:58.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-20\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}',NULL,NULL,'root@localhost','2025-08-20 10:08:58',NULL,NULL),(149,'invoice_details',32,'INSERT',NULL,'{\"item_id\": 1, \"discount\": 0.00, \"quantity\": 1, \"extra_tax\": 300.00, \"sale_type\": \"Services (FED in ST Mode)\", \"created_at\": \"2025-08-20 10:08:58.000000\", \"invoice_id\": 20, \"updated_at\": \"2025-08-20 10:08:58.000000\", \"fed_payable\": 300.00, \"further_tax\": 150.00, \"total_value\": 17400.00, \"retail_price\": 0.00, \"value_excl_tax\": 15000.00, \"sro_schedule_no\": \"\", \"sales_tax_withheld\": 0.00, \"sro_item_serial_no\": \"\", \"sales_tax_applicable\": 2400.00}',NULL,'5eabcb66220080fcb7bce54cdc9f0aa5945de544c31221a48c94a8c254f5e24d','root@localhost','2025-08-20 10:08:58',NULL,NULL),(150,'invoice_details',33,'INSERT',NULL,'{\"item_id\": 2, \"discount\": 0.00, \"quantity\": 1, \"extra_tax\": 5000.00, \"sale_type\": \"Services (FED in ST Mode)\", \"created_at\": \"2025-08-20 10:08:58.000000\", \"invoice_id\": 20, \"updated_at\": \"2025-08-20 10:08:58.000000\", \"fed_payable\": 7500.00, \"further_tax\": 2500.00, \"total_value\": 290000.00, \"retail_price\": 0.00, \"value_excl_tax\": 250000.00, \"sro_schedule_no\": \"\", \"sales_tax_withheld\": 0.00, \"sro_item_serial_no\": \"\", \"sales_tax_applicable\": 40000.00}',NULL,'aabc2c6aa4e86653e458550b293026997d67b0e02ee46d7fe05d03782be18464','root@localhost','2025-08-20 10:08:58',NULL,NULL),(151,'invoices',20,'UPDATE','{\"buyer_id\": 5, \"due_date\": \"2025-08-22\", \"seller_id\": 1, \"created_at\": \"2025-08-20 10:08:58.000000\", \"invoice_no\": \"INV-000020\", \"updated_at\": \"2025-08-20 10:08:58.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-20\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 0, \"fbr_invoice_number\": null}','{\"buyer_id\": 5, \"due_date\": \"2025-08-22\", \"seller_id\": 1, \"created_at\": \"2025-08-20 10:08:58.000000\", \"invoice_no\": \"INV-000020\", \"updated_at\": \"2025-08-20 10:09:00.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-20\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 1, \"fbr_invoice_number\": \"8923980DI1755684512465\"}',NULL,NULL,'root@localhost','2025-08-20 10:09:00',NULL,NULL),(152,'invoices',20,'UPDATE','{\"buyer_id\": 5, \"due_date\": \"2025-08-22\", \"seller_id\": 1, \"created_at\": \"2025-08-20 10:08:58.000000\", \"invoice_no\": \"INV-000020\", \"updated_at\": \"2025-08-20 10:09:00.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-20\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 1, \"fbr_invoice_number\": \"8923980DI1755684512465\"}','{\"buyer_id\": 5, \"due_date\": \"2025-08-22\", \"seller_id\": 1, \"created_at\": \"2025-08-20 10:08:58.000000\", \"invoice_no\": \"INV-000020\", \"updated_at\": \"2025-08-20 10:09:01.000000\", \"scenario_id\": \"SN018\", \"invoice_date\": \"2025-08-20\", \"invoice_type\": \"Sale Invoice\", \"invoice_ref_no\": null, \"is_posted_to_fbr\": 1, \"fbr_invoice_number\": \"8923980DI1755684512465\"}',NULL,NULL,'root@localhost','2025-08-20 10:09:01',NULL,NULL);
/*!40000 ALTER TABLE `audit_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_configurations`
--

DROP TABLE IF EXISTS `business_configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_configurations` (
  `bus_config_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bus_name` varchar(255) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `bus_ntn_cnic` varchar(255) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `bus_address` text COLLATE utf8mb4_unicode_ci  NOT NULL,
  `bus_province` varchar(255) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `bus_logo` varchar(255) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `bus_account_title` varchar(255) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `bus_account_number` varchar(255) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `bus_reg_num` varchar(255) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `bus_contact_num` varchar(20) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `bus_contact_person` varchar(255) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `bus_IBAN` varchar(255) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `bus_swift_code` varchar(255) COLLATE utf8mb4_unicode_ci  DEFAULT NULL,
  `bus_acc_branch_name` varchar(255) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `bus_acc_branch_code` varchar(255) COLLATE utf8mb4_unicode_ci  DEFAULT NULL,
  `hash` varchar(255) COLLATE utf8mb4_unicode_ci  DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`bus_config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;

--
-- Dumping data for table `business_configurations`
--

LOCK TABLES `business_configurations` WRITE;
/*!40000 ALTER TABLE `business_configurations` DISABLE KEYS */;
INSERT INTO `business_configurations` VALUES (1,'Secureism Pvt Ltd','8923980','F3 Center of Technology, Zaraj Society, Islamabad Pakistan','Punjab','1752125231.svg','SECUREISM (PRIVATE) LIMITED','0010109016750017','0119999','03001234567','ZEESHAN QAMAR','PK44ABPA0010109016750017','ABPAPKKA','ABL CHAKLALA SCHEME 3 RAWALPINDI','0757','169c39ba55ca5c43c30e3faaaae9e083','2025-07-04 12:02:41','2025-08-18 04:10:42');
/*!40000 ALTER TABLE `business_configurations` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci  */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_business_configurations_after_insert` AFTER INSERT ON `business_configurations` FOR EACH ROW BEGIN
    INSERT INTO audit_logs (
        table_name,
        row_id,
        action_type,
        old_data,
        new_data,
        row_hash_old,
        row_hash_new,
        db_user,
        changed_at
    ) VALUES (
        'business_configurations',
        NEW.bus_config_id,
        'INSERT',
        NULL,
        JSON_OBJECT(
            'bus_name', NEW.bus_name,
            'bus_ntn_cnic', NEW.bus_ntn_cnic,
            'bus_address', NEW.bus_address,
            'bus_province', NEW.bus_province,
            'bus_logo', NEW.bus_logo,
            'bus_account_title', NEW.bus_account_title,
            'bus_account_number', NEW.bus_account_number,
            'bus_reg_num', NEW.bus_reg_num,
            'bus_contact_num', NEW.bus_contact_num,
            'bus_contact_person', NEW.bus_contact_person,
            'bus_IBAN', NEW.bus_IBAN,
            'bus_swift_code', NEW.bus_swift_code,
            'bus_acc_branch_name', NEW.bus_acc_branch_name,
            'bus_acc_branch_code', NEW.bus_acc_branch_code,
            'created_at', NEW.created_at,
            'updated_at', NEW.updated_at
        ),
        NULL,
        SHA2(CONCAT(
            NEW.bus_name,
            NEW.bus_ntn_cnic,
            NEW.bus_address,
            NEW.bus_province,
            NEW.bus_logo,
            NEW.bus_account_title,
            NEW.bus_account_number,
            NEW.bus_reg_num,
            NEW.bus_contact_num,
            NEW.bus_contact_person,
            NEW.bus_IBAN,
            NEW.bus_swift_code,
            NEW.bus_acc_branch_name,
            NEW.bus_acc_branch_code,
            NEW.created_at,
            NEW.updated_at
        ), 256),
        CURRENT_USER(),
        NOW()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci  */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_business_configurations_after_update` AFTER UPDATE ON `business_configurations` FOR EACH ROW BEGIN
    INSERT INTO audit_logs (
        table_name,
        row_id,
        action_type,
        old_data,
        new_data,
        row_hash_old,
        row_hash_new,
        db_user,
        changed_at
    ) VALUES (
        'business_configurations',
        OLD.bus_config_id,
        'UPDATE',
        JSON_OBJECT(
            'bus_name', OLD.bus_name,
            'bus_ntn_cnic', OLD.bus_ntn_cnic,
            'bus_address', OLD.bus_address,
            'bus_province', OLD.bus_province,
            'bus_logo', OLD.bus_logo,
            'bus_account_title', OLD.bus_account_title,
            'bus_account_number', OLD.bus_account_number,
            'bus_reg_num', OLD.bus_reg_num,
            'bus_contact_num', OLD.bus_contact_num,
            'bus_contact_person', OLD.bus_contact_person,
            'bus_IBAN', OLD.bus_IBAN,
            'bus_swift_code', OLD.bus_swift_code,
            'bus_acc_branch_name', OLD.bus_acc_branch_name,
            'bus_acc_branch_code', OLD.bus_acc_branch_code,
            'created_at', OLD.created_at,
            'updated_at', OLD.updated_at
        ),
        JSON_OBJECT(
            'bus_name', NEW.bus_name,
            'bus_ntn_cnic', NEW.bus_ntn_cnic,
            'bus_address', NEW.bus_address,
            'bus_province', NEW.bus_province,
            'bus_logo', NEW.bus_logo,
            'bus_account_title', NEW.bus_account_title,
            'bus_account_number', NEW.bus_account_number,
            'bus_reg_num', NEW.bus_reg_num,
            'bus_contact_num', NEW.bus_contact_num,
            'bus_contact_person', NEW.bus_contact_person,
            'bus_IBAN', NEW.bus_IBAN,
            'bus_swift_code', NEW.bus_swift_code,
            'bus_acc_branch_name', NEW.bus_acc_branch_name,
            'bus_acc_branch_code', NEW.bus_acc_branch_code,
            'created_at', NEW.created_at,
            'updated_at', NEW.updated_at
        ),
        SHA2(CONCAT(
            OLD.bus_name,
            OLD.bus_ntn_cnic,
            OLD.bus_address,
            OLD.bus_province,
            OLD.bus_logo,
            OLD.bus_account_title,
            OLD.bus_account_number,
            OLD.bus_reg_num,
            OLD.bus_contact_num,
            OLD.bus_contact_person,
            OLD.bus_IBAN,
            OLD.bus_swift_code,
            OLD.bus_acc_branch_name,
            OLD.bus_acc_branch_code,
            OLD.created_at,
            OLD.updated_at
        ), 256),
        SHA2(CONCAT(
            NEW.bus_name,
            NEW.bus_ntn_cnic,
            NEW.bus_address,
            NEW.bus_province,
            NEW.bus_logo,
            NEW.bus_account_title,
            NEW.bus_account_number,
            NEW.bus_reg_num,
            NEW.bus_contact_num,
            NEW.bus_contact_person,
            NEW.bus_IBAN,
            NEW.bus_swift_code,
            NEW.bus_acc_branch_name,
            NEW.bus_acc_branch_code,
            NEW.created_at,
            NEW.updated_at
        ), 256),
        CURRENT_USER(),
        NOW()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci  */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_business_configurations_after_delete` AFTER DELETE ON `business_configurations` FOR EACH ROW BEGIN
    INSERT INTO audit_logs (
        table_name,
        row_id,
        action_type,
        old_data,
        new_data,
        row_hash_old,
        row_hash_new,
        db_user,
        changed_at
    ) VALUES (
        'business_configurations',
        OLD.bus_config_id,
        'DELETE',
        JSON_OBJECT(
            'bus_name', OLD.bus_name,
            'bus_ntn_cnic', OLD.bus_ntn_cnic,
            'bus_address', OLD.bus_address,
            'bus_province', OLD.bus_province,
            'bus_logo', OLD.bus_logo,
            'bus_account_title', OLD.bus_account_title,
            'bus_account_number', OLD.bus_account_number,
            'bus_reg_num', OLD.bus_reg_num,
            'bus_contact_num', OLD.bus_contact_num,
            'bus_contact_person', OLD.bus_contact_person,
            'bus_IBAN', OLD.bus_IBAN,
            'bus_swift_code', OLD.bus_swift_code,
            'bus_acc_branch_name', OLD.bus_acc_branch_name,
            'bus_acc_branch_code', OLD.bus_acc_branch_code,
            'created_at', OLD.created_at,
            'updated_at', OLD.updated_at
        ),
        NULL,
        SHA2(CONCAT(
            OLD.bus_name,
            OLD.bus_ntn_cnic,
            OLD.bus_address,
            OLD.bus_province,
            OLD.bus_logo,
            OLD.bus_account_title,
            OLD.bus_account_number,
            OLD.bus_reg_num,
            OLD.bus_contact_num,
            OLD.bus_contact_person,
            OLD.bus_IBAN,
            OLD.bus_swift_code,
            OLD.bus_acc_branch_name,
            OLD.bus_acc_branch_code,
            OLD.created_at,
            OLD.updated_at
        ), 256),
        NULL,
        CURRENT_USER(),
        NOW()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `buyers`
--

DROP TABLE IF EXISTS `buyers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buyers` (
  `byr_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `byr_name` varchar(255) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `byr_type` tinyint unsigned NOT NULL DEFAULT '0',
  `byr_ntn_cnic` varchar(50) COLLATE utf8mb4_unicode_ci  DEFAULT NULL,
  `byr_address` varchar(255) COLLATE utf8mb4_unicode_ci  DEFAULT NULL,
  `byr_province` varchar(255) COLLATE utf8mb4_unicode_ci  DEFAULT NULL,
  `byr_logo` varchar(255) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `byr_account_title` varchar(255) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `byr_account_number` varchar(255) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `byr_reg_num` varchar(255) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `byr_contact_num` varchar(20) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `byr_contact_person` varchar(255) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `byr_IBAN` varchar(255) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `byr_swift_code` varchar(255) COLLATE utf8mb4_unicode_ci  DEFAULT NULL,
  `byr_acc_branch_name` varchar(255) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `byr_acc_branch_code` varchar(255) COLLATE utf8mb4_unicode_ci  DEFAULT NULL,
  `hash` varchar(255) COLLATE utf8mb4_unicode_ci  DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`byr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;


--
-- Dumping data for table `buyers`
--

LOCK TABLES `buyers` WRITE;
/*!40000 ALTER TABLE `buyers` DISABLE KEYS */;
INSERT INTO `buyers` VALUES (1,'F3 Technologies (Pvt) Ltd.',0,NULL,'Dr, Zaraj Housing Society Sector B Islamabad','Punjab','1755497672.jpg','F3 Technologies Pvt Ltd','00098765432100','REG-2025013','0300-5325487','Dr Ahmed Javad','PKIBAN789798978987',NULL,'F-8 Markaz Branch','0876','1d254d85e96f5896b378ceb969ba75ec','2025-08-18 01:14:32','2025-08-18 02:10:50'),(2,'Skypass Traders Pvt. Ltd.',0,NULL,'Office #12, Business Hub Plaza, MM Alam Road, Lahore','Punjab','1755596792.png','Skypass Traders Pvt. Ltd.','1234567890123','REG-2025-98765','+92-321-4567890','Ahmed Khan','PK12 HABB 0001 2345 6789 0123',NULL,'Gulberg Branch','0123','41eb1e6ea4bdd17406988ded1537a7ed','2025-08-19 04:46:32','2025-08-19 04:46:32'),(3,'Unilever Pakistan Limited',0,NULL,'Plot 12, Industrial Estate, Karachi','Sindh','1755681601.jpg','Unilever Pakistan Ltd.','0123456789012345','UPL-2023-Karachi','+92-21-34567890','Mr. A. Hassan','PK36UNIL0000001234567890',NULL,'Karachi Industrial Branch','0012','3f9c63d8a3f9ff8bfa423e2c155b7baa','2025-08-20 04:20:01','2025-08-20 05:00:45'),(4,'ICI Pakistan Limited',0,NULL,'45 Canal Road, Lahore','Punjab','1755681838.png','ICI Pakistan Ltd.','2233445566778899','ICI-2008-Lahore','+92-42-35678901','Ms. S. Khan','PK22ICIP0000002233445566',NULL,'Lahore Main Branch','0034','b7766a9284822f81905d4d22edefbfc7','2025-08-20 04:23:58','2025-08-20 05:00:30'),(5,'Ghandhara Industries Ltd. (Isuzu Pakistan)',0,NULL,'SITE Industrial Area, Karachi','Sindh','1755681976.jpg','Ghandhara Industries Ltd.','3344556677889900','GIL-1953-Karachi','+92-21-36789012','Mr. K. Khattak','PK44GHDA0000003344556677',NULL,'SITE Town Branch','0045','4d0b18516f7b0c1edd3d7d94a930f2cb','2025-08-20 04:26:16','2025-08-20 05:00:18');
/*!40000 ALTER TABLE `buyers` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci  */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_buyers_after_insert` AFTER INSERT ON `buyers` FOR EACH ROW BEGIN
    INSERT INTO audit_logs (
        table_name,
        row_id,
        action_type,
        old_data,
        new_data,
        row_hash_old,
        row_hash_new,
        db_user,
        changed_at
    ) VALUES (
        'buyers',
        NEW.byr_id,
        'INSERT',
        NULL,
        JSON_OBJECT(
            'byr_name', NEW.byr_name,
            'byr_type', NEW.byr_type,
            'byr_ntn_cnic', NEW.byr_ntn_cnic,
            'byr_address', NEW.byr_address,
            'byr_province', NEW.byr_province,
            'byr_logo', NEW.byr_logo,
            'byr_account_title', NEW.byr_account_title,
            'byr_account_number', NEW.byr_account_number,
            'byr_reg_num', NEW.byr_reg_num,
            'byr_contact_num', NEW.byr_contact_num,
            'byr_contact_person', NEW.byr_contact_person,
            'byr_IBAN', NEW.byr_IBAN,
            'byr_swift_code', NEW.byr_swift_code,
            'byr_acc_branch_name', NEW.byr_acc_branch_name,
            'byr_acc_branch_code', NEW.byr_acc_branch_code,
            'created_at', NEW.created_at,
            'updated_at', NEW.updated_at
        ),
        NULL,
        SHA2(CONCAT(
            NEW.byr_name,
            NEW.byr_type,
            NEW.byr_ntn_cnic,
            NEW.byr_address,
            NEW.byr_province,
            NEW.byr_logo,
            NEW.byr_account_title,
            NEW.byr_account_number,
            NEW.byr_reg_num,
            NEW.byr_contact_num,
            NEW.byr_contact_person,
            NEW.byr_IBAN,
            NEW.byr_swift_code,
            NEW.byr_acc_branch_name,
            NEW.byr_acc_branch_code,
            NEW.created_at,
            NEW.updated_at
        ), 256),
        CURRENT_USER(),
        NOW()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci  */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_buyers_after_update` AFTER UPDATE ON `buyers` FOR EACH ROW BEGIN
    INSERT INTO audit_logs (
        table_name,
        row_id,
        action_type,
        old_data,
        new_data,
        row_hash_old,
        row_hash_new,
        db_user,
        changed_at
    ) VALUES (
        'buyers',
        OLD.byr_id,
        'UPDATE',
        JSON_OBJECT(
            'byr_name', OLD.byr_name,
            'byr_type', OLD.byr_type,
            'byr_ntn_cnic', OLD.byr_ntn_cnic,
            'byr_address', OLD.byr_address,
            'byr_province', OLD.byr_province,
            'byr_logo', OLD.byr_logo,
            'byr_account_title', OLD.byr_account_title,
            'byr_account_number', OLD.byr_account_number,
            'byr_reg_num', OLD.byr_reg_num,
            'byr_contact_num', OLD.byr_contact_num,
            'byr_contact_person', OLD.byr_contact_person,
            'byr_IBAN', OLD.byr_IBAN,
            'byr_swift_code', OLD.byr_swift_code,
            'byr_acc_branch_name', OLD.byr_acc_branch_name,
            'byr_acc_branch_code', OLD.byr_acc_branch_code,
            'created_at', OLD.created_at,
            'updated_at', OLD.updated_at
        ),
        JSON_OBJECT(
            'byr_name', NEW.byr_name,
            'byr_type', NEW.byr_type,
            'byr_ntn_cnic', NEW.byr_ntn_cnic,
            'byr_address', NEW.byr_address,
            'byr_province', NEW.byr_province,
            'byr_logo', NEW.byr_logo,
            'byr_account_title', NEW.byr_account_title,
            'byr_account_number', NEW.byr_account_number,
            'byr_reg_num', NEW.byr_reg_num,
            'byr_contact_num', NEW.byr_contact_num,
            'byr_contact_person', NEW.byr_contact_person,
            'byr_IBAN', NEW.byr_IBAN,
            'byr_swift_code', NEW.byr_swift_code,
            'byr_acc_branch_name', NEW.byr_acc_branch_name,
            'byr_acc_branch_code', NEW.byr_acc_branch_code,
            'created_at', NEW.created_at,
            'updated_at', NEW.updated_at
        ),
        SHA2(CONCAT(
            OLD.byr_name,
            OLD.byr_type,
            OLD.byr_ntn_cnic,
            OLD.byr_address,
            OLD.byr_province,
            OLD.byr_logo,
            OLD.byr_account_title,
            OLD.byr_account_number,
            OLD.byr_reg_num,
            OLD.byr_contact_num,
            OLD.byr_contact_person,
            OLD.byr_IBAN,
            OLD.byr_swift_code,
            OLD.byr_acc_branch_name,
            OLD.byr_acc_branch_code,
            OLD.created_at,
            OLD.updated_at
        ), 256),
        SHA2(CONCAT(
            NEW.byr_name,
            NEW.byr_type,
            NEW.byr_ntn_cnic,
            NEW.byr_address,
            NEW.byr_province,
            NEW.byr_logo,
            NEW.byr_account_title,
            NEW.byr_account_number,
            NEW.byr_reg_num,
            NEW.byr_contact_num,
            NEW.byr_contact_person,
            NEW.byr_IBAN,
            NEW.byr_swift_code,
            NEW.byr_acc_branch_name,
            NEW.byr_acc_branch_code,
            NEW.created_at,
            NEW.updated_at
        ), 256),
        CURRENT_USER(),
        NOW()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci  */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_buyers_after_delete` AFTER DELETE ON `buyers` FOR EACH ROW BEGIN
    INSERT INTO audit_logs (
        table_name,
        row_id,
        action_type,
        old_data,
        new_data,
        row_hash_old,
        row_hash_new,
        db_user,
        changed_at
    ) VALUES (
        'buyers',
        OLD.byr_id,
        'DELETE',
        JSON_OBJECT(
            'byr_name', OLD.byr_name,
            'byr_type', OLD.byr_type,
            'byr_ntn_cnic', OLD.byr_ntn_cnic,
            'byr_address', OLD.byr_address,
            'byr_province', OLD.byr_province,
            'byr_logo', OLD.byr_logo,
            'byr_account_title', OLD.byr_account_title,
            'byr_account_number', OLD.byr_account_number,
            'byr_reg_num', OLD.byr_reg_num,
            'byr_contact_num', OLD.byr_contact_num,
            'byr_contact_person', OLD.byr_contact_person,
            'byr_IBAN', OLD.byr_IBAN,
            'byr_swift_code', OLD.byr_swift_code,
            'byr_acc_branch_name', OLD.byr_acc_branch_name,
            'byr_acc_branch_code', OLD.byr_acc_branch_code,
            'created_at', OLD.created_at,
            'updated_at', OLD.updated_at
        ),
        NULL,
        SHA2(CONCAT(
            OLD.byr_name,
            OLD.byr_type,
            OLD.byr_ntn_cnic,
            OLD.byr_address,
            OLD.byr_province,
            OLD.byr_logo,
            OLD.byr_account_title,
            OLD.byr_account_number,
            OLD.byr_reg_num,
            OLD.byr_contact_num,
            OLD.byr_contact_person,
            OLD.byr_IBAN,
            OLD.byr_swift_code,
            OLD.byr_acc_branch_name,
            OLD.byr_acc_branch_code,
            OLD.created_at,
            OLD.updated_at
        ), 256),
        NULL,
        CURRENT_USER(),
        NOW()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci  NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;


--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('secureism_invoicing_management_system_cache_5c785c036466adea360111aa28563bfd556b5fba','i:1;',1755680444),('secureism_invoicing_management_system_cache_5c785c036466adea360111aa28563bfd556b5fba:timer','i:1755680444;',1755680444);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;


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
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci  NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci  NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci  NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci  NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;


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
  `sale_type` varchar(255) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `sro_schedule_no` varchar(50) COLLATE utf8mb4_unicode_ci  DEFAULT NULL,
  `sro_item_serial_no` varchar(50) COLLATE utf8mb4_unicode_ci  DEFAULT NULL,
  `hash` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`invoice_detail_id`),
  KEY `invoice_details_invoice_id_foreign` (`invoice_id`),
  KEY `invoice_details_item_id_foreign` (`item_id`),
  KEY `invoice_details_hash_index` (`hash`),
  CONSTRAINT `invoice_details_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`invoice_id`) ON DELETE CASCADE,
  CONSTRAINT `invoice_details_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;


--
-- Dumping data for table `invoice_details`
--

LOCK TABLES `invoice_details` WRITE;
/*!40000 ALTER TABLE `invoice_details` DISABLE KEYS */;
INSERT INTO `invoice_details` VALUES (8,1,1,1,11600.00,10000.00,0.00,1600.00,0.00,0.00,0.00,0.00,0.00,'Services (FED in ST Mode)','','','baa26f4df700bb6d4d140dc9a0b56178681437cd624f46c8a7e8e53189d5e391','2025-08-18 01:28:05','2025-08-18 01:28:05'),(10,2,1,1,11600.00,10000.00,0.00,1600.00,0.00,0.00,0.00,0.00,0.00,'Services','','','4ab541d4e74b436989dab0cd50d5dec61f1d98211d748124a8c56834a995e1d1','2025-08-18 01:29:02','2025-08-18 01:29:02'),(15,3,1,1,17400.00,15000.00,0.00,2400.00,0.00,0.00,0.00,0.00,0.00,'Services (FED in ST Mode)','','','8253cd540aa0e083f4715cf1a1e7a063b83c2507c183ac14807cf294f8cd70b6','2025-08-18 02:11:20','2025-08-18 02:11:20'),(17,5,1,1,17400.00,15000.00,0.00,2400.00,0.00,0.00,0.00,0.00,0.00,'Services (FED in ST Mode)','','','5c160aef4a544ca39dc19ed659bb6c5c8c27c05e1f1f7936376ecbe5724aab9d','2025-08-19 04:49:16','2025-08-19 04:49:16'),(19,7,1,1,17400.00,15000.00,0.00,2400.00,0.00,0.00,0.00,0.00,0.00,'Services (FED in ST Mode)','','','408e7a970abe53f0fb0ba309b06c654db9c4819fc0141f7c066d49bd3cc3d880','2025-08-19 05:06:51','2025-08-19 05:06:51'),(20,8,1,1,17400.00,15000.00,0.00,2400.00,0.00,0.00,0.00,0.00,0.00,'Services','','','085bf4ea4b313d3d4f60f1a791fc3d2cdfd82c455d07d042b9320a72ccc6653a','2025-08-19 05:14:46','2025-08-19 05:14:46'),(28,16,1,1,17400.00,15000.00,0.00,2400.00,0.00,0.00,0.00,0.00,0.00,'Services (FED in ST Mode)','','','b76d1ec85c4c5df2ef08e23288ffd84e937e8a173a3d4d2525b93e2722e09388','2025-08-19 06:33:24','2025-08-19 06:33:24'),(30,18,2,1,290000.00,250000.00,0.00,40000.00,0.00,0.00,0.00,0.00,0.00,'Services (FED in ST Mode)','','','2abf7db45fa373b89d4ec0660cd72af0de9cd273acb4c2e8560311e3b007198b','2025-08-20 05:06:49','2025-08-20 05:06:49'),(31,19,3,1,139200.00,120000.00,0.00,19200.00,0.00,0.00,0.00,0.00,0.00,'Services (FED in ST Mode)','','','5daad49e140a4084bde420438f092820e2f5e2d6461c2df553b171aef7a55bbb','2025-08-20 05:07:28','2025-08-20 05:07:28'),(32,20,1,1,17400.00,15000.00,0.00,2400.00,0.00,300.00,150.00,300.00,0.00,'Services (FED in ST Mode)','','','f18873ea702d95d0c32ea9d0d30ae07973ec2c4787936224199c6306c2f16959','2025-08-20 05:08:58','2025-08-20 05:08:58'),(33,20,2,1,290000.00,250000.00,0.00,40000.00,0.00,5000.00,2500.00,7500.00,0.00,'Services (FED in ST Mode)','','','d8dbaa8129bef45fa0c27fdf16df527519acadaffe05aec97c1d3b5f30222e56','2025-08-20 05:08:58','2025-08-20 05:08:58');
/*!40000 ALTER TABLE `invoice_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci  */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_invoice_details_after_insert` AFTER INSERT ON `invoice_details` FOR EACH ROW BEGIN
    INSERT INTO audit_logs (
        table_name, row_id, action_type,
        old_data, new_data, row_hash_old, row_hash_new,
        db_user, changed_at
    ) VALUES (
        'invoice_details',
        NEW.invoice_detail_id,
        'INSERT',
        NULL,
        JSON_OBJECT(
            'invoice_id', NEW.invoice_id,
            'item_id', NEW.item_id,
            'quantity', NEW.quantity,
            'total_value', NEW.total_value,
            'value_excl_tax', NEW.value_excl_tax,
            'retail_price', NEW.retail_price,
            'sales_tax_applicable', NEW.sales_tax_applicable,
            'sales_tax_withheld', NEW.sales_tax_withheld,
            'extra_tax', NEW.extra_tax,
            'further_tax', NEW.further_tax,
            'fed_payable', NEW.fed_payable,
            'discount', NEW.discount,
            'sale_type', NEW.sale_type,
            'sro_schedule_no', NEW.sro_schedule_no,
            'sro_item_serial_no', NEW.sro_item_serial_no,
            'created_at', NEW.created_at,
            'updated_at', NEW.updated_at
        ),
        NULL,
        SHA2(CONCAT(
            NEW.invoice_id,
            NEW.item_id,
            NEW.quantity,
            NEW.total_value,
            NEW.value_excl_tax,
            NEW.retail_price,
            NEW.sales_tax_applicable,
            NEW.sales_tax_withheld,
            NEW.extra_tax,
            NEW.further_tax,
            NEW.fed_payable,
            NEW.discount,
            NEW.sale_type,
            NEW.sro_schedule_no,
            NEW.sro_item_serial_no,
            NEW.created_at,
            NEW.updated_at
        ), 256),
        CURRENT_USER(),
        NOW()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci  */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_invoice_details_after_update` AFTER UPDATE ON `invoice_details` FOR EACH ROW BEGIN
    INSERT INTO audit_logs (
        table_name, row_id, action_type,
        old_data, new_data, row_hash_old, row_hash_new,
        db_user, changed_at
    ) VALUES (
        'invoice_details',
        OLD.invoice_detail_id,
        'UPDATE',
        JSON_OBJECT(
            'invoice_id', OLD.invoice_id,
            'item_id', OLD.item_id,
            'quantity', OLD.quantity,
            'total_value', OLD.total_value,
            'value_excl_tax', OLD.value_excl_tax,
            'retail_price', OLD.retail_price,
            'sales_tax_applicable', OLD.sales_tax_applicable,
            'sales_tax_withheld', OLD.sales_tax_withheld,
            'extra_tax', OLD.extra_tax,
            'further_tax', OLD.further_tax,
            'fed_payable', OLD.fed_payable,
            'discount', OLD.discount,
            'sale_type', OLD.sale_type,
            'sro_schedule_no', OLD.sro_schedule_no,
            'sro_item_serial_no', OLD.sro_item_serial_no,
            'created_at', OLD.created_at,
            'updated_at', OLD.updated_at
        ),
        JSON_OBJECT(
            'invoice_id', NEW.invoice_id,
            'item_id', NEW.item_id,
            'quantity', NEW.quantity,
            'total_value', NEW.total_value,
            'value_excl_tax', NEW.value_excl_tax,
            'retail_price', NEW.retail_price,
            'sales_tax_applicable', NEW.sales_tax_applicable,
            'sales_tax_withheld', NEW.sales_tax_withheld,
            'extra_tax', NEW.extra_tax,
            'further_tax', NEW.further_tax,
            'fed_payable', NEW.fed_payable,
            'discount', NEW.discount,
            'sale_type', NEW.sale_type,
            'sro_schedule_no', NEW.sro_schedule_no,
            'sro_item_serial_no', NEW.sro_item_serial_no,
            'created_at', NEW.created_at,
            'updated_at', NEW.updated_at
        ),
        SHA2(CONCAT(
            OLD.invoice_id,
            OLD.item_id,
            OLD.quantity,
            OLD.total_value,
            OLD.value_excl_tax,
            OLD.retail_price,
            OLD.sales_tax_applicable,
            OLD.sales_tax_withheld,
            OLD.extra_tax,
            OLD.further_tax,
            OLD.fed_payable,
            OLD.discount,
            OLD.sale_type,
            OLD.sro_schedule_no,
            OLD.sro_item_serial_no,
            OLD.created_at,
            OLD.updated_at
        ), 256),
        SHA2(CONCAT(
            NEW.invoice_id,
            NEW.item_id,
            NEW.quantity,
            NEW.total_value,
            NEW.value_excl_tax,
            NEW.retail_price,
            NEW.sales_tax_applicable,
            NEW.sales_tax_withheld,
            NEW.extra_tax,
            NEW.further_tax,
            NEW.fed_payable,
            NEW.discount,
            NEW.sale_type,
            NEW.sro_schedule_no,
            NEW.sro_item_serial_no,
            NEW.created_at,
            NEW.updated_at
        ), 256),
        CURRENT_USER(),
        NOW()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci  */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_invoice_details_after_delete` AFTER DELETE ON `invoice_details` FOR EACH ROW BEGIN
    INSERT INTO audit_logs (
        table_name, row_id, action_type,
        old_data, new_data, row_hash_old, row_hash_new,
        db_user, changed_at
    ) VALUES (
        'invoice_details',
        OLD.invoice_detail_id,
        'DELETE',
        JSON_OBJECT(
            'invoice_id', OLD.invoice_id,
            'item_id', OLD.item_id,
            'quantity', OLD.quantity,
            'total_value', OLD.total_value,
            'value_excl_tax', OLD.value_excl_tax,
            'retail_price', OLD.retail_price,
            'sales_tax_applicable', OLD.sales_tax_applicable,
            'sales_tax_withheld', OLD.sales_tax_withheld,
            'extra_tax', OLD.extra_tax,
            'further_tax', OLD.further_tax,
            'fed_payable', OLD.fed_payable,
            'discount', OLD.discount,
            'sale_type', OLD.sale_type,
            'sro_schedule_no', OLD.sro_schedule_no,
            'sro_item_serial_no', OLD.sro_item_serial_no,
            'created_at', OLD.created_at,
            'updated_at', OLD.updated_at
        ),
        NULL,
        SHA2(CONCAT(
            OLD.invoice_id,
            OLD.item_id,
            OLD.quantity,
            OLD.total_value,
            OLD.value_excl_tax,
            OLD.retail_price,
            OLD.sales_tax_applicable,
            OLD.sales_tax_withheld,
            OLD.extra_tax,
            OLD.further_tax,
            OLD.fed_payable,
            OLD.discount,
            OLD.sale_type,
            OLD.sro_schedule_no,
            OLD.sro_item_serial_no,
            OLD.created_at,
            OLD.updated_at
        ), 256),
        NULL,
        CURRENT_USER(),
        NOW()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `invoice_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(255) COLLATE utf8mb4_unicode_ci  DEFAULT NULL,
  `invoice_type` varchar(50) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `invoice_date` date NOT NULL,
  `due_date` date DEFAULT NULL,
  `scenario_id` varchar(50) COLLATE utf8mb4_unicode_ci  DEFAULT NULL,
  `invoice_ref_no` varchar(100) COLLATE utf8mb4_unicode_ci  DEFAULT NULL,
  `seller_id` bigint unsigned NOT NULL,
  `buyer_id` bigint unsigned NOT NULL,
  `fbr_invoice_number` varchar(255) COLLATE utf8mb4_unicode_ci  DEFAULT NULL,
  `qr_code` varchar(255) COLLATE utf8mb4_unicode_ci  DEFAULT NULL,
  `is_posted_to_fbr` tinyint NOT NULL DEFAULT '0',
  `invoice_status` tinyint NOT NULL DEFAULT '1',
  `response_status` varchar(50) COLLATE utf8mb4_unicode_ci  DEFAULT NULL,
  `response_message` text COLLATE utf8mb4_unicode_ci ,
  `totalAmountExcludingTax` double DEFAULT NULL,
  `totalAmountIncludingTax` double DEFAULT NULL,
  `totalSalesTax` double DEFAULT NULL,
  `totalfurtherTax` double DEFAULT NULL,
  `totalextraTax` double DEFAULT NULL,
  `shipping_charges` double DEFAULT NULL,
  `other_charges` double DEFAULT NULL,
  `discount_amount` double DEFAULT NULL,
  `payment_status` varchar(50) COLLATE utf8mb4_unicode_ci  DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci ,
  `hash` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `invoices_seller_id_foreign` (`seller_id`),
  KEY `invoices_buyer_id_foreign` (`buyer_id`),
  KEY `invoices_hash_index` (`hash`),
  CONSTRAINT `invoices_buyer_id_foreign` FOREIGN KEY (`buyer_id`) REFERENCES `buyers` (`byr_id`) ON DELETE CASCADE,
  CONSTRAINT `invoices_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `business_configurations` (`bus_config_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;


--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (1,'INV-000001','Sale Invoice','2025-08-18','2025-08-20','SN018',NULL,1,1,'8923980DI1755498461992','qr_INV-000001_1755498487.png',1,2,'Success','Posted successfully to FBR SANDBOX',10000,11600,1600,0,0,0,0,0,NULL,NULL,'2091eb7a3d67d8db47d49bf78dbe1b4c0313a75cd0ef86f26c49dac4e62f3afc','2025-08-18 01:16:54','2025-08-18 01:28:08'),(2,'INV-000002','Sale Invoice','2025-08-19','2025-08-19','SN019',NULL,1,1,'8923980DI1755498519086','qr_INV-000002_1755498544.png',1,2,'Success','Posted successfully to FBR SANDBOX',10000,11600,1600,0,0,0,0,0,NULL,NULL,'37037b636b25a554718d8e92ea7c7e6213b61eb2dc57de9cdd3e7aa84a3a6ccb','2025-08-18 01:28:51','2025-08-18 01:29:05'),(3,'INV-000003','Sale Invoice','2025-08-18','2025-08-23','SN018',NULL,1,1,'8923980DI1755501057284','qr_INV-000003_1755501082.png',1,2,'Success','Posted successfully to FBR SANDBOX',15000,17400,2400,0,0,0,0,0,NULL,NULL,'88aa75e4898cb08ca2b31341da1652b8929a4a1d94b1226e1881dae425b0db58','2025-08-18 02:09:21','2025-08-18 02:11:23'),(5,'INV-000005','Sale Invoice','2025-08-19','2025-08-21','SN018',NULL,1,2,'8923980DI1755596931625','qr_INV-000005_1755596958.png',1,2,'Success','Posted successfully to FBR SANDBOX',15000,17400,2400,0,0,0,0,0,NULL,NULL,'e04268262108a7507d6800d07b8046803aedb5279bc38f3e477f7d10cd94eab8','2025-08-19 04:49:16','2025-08-19 04:49:18'),(7,'INV-000007','Sale Invoice','2025-08-19','2025-08-22','SN018',NULL,1,2,'8923980DI1755597987313','qr_INV-000007_1755598014.png',1,2,'Success','Posted successfully to FBR SANDBOX',15000,17400,2400,0,0,0,0,0,NULL,NULL,'4bd2e68788309142eb39b2aa7c9224baf5b5b9c546811881fec752e7453d69c7','2025-08-19 05:06:51','2025-08-19 05:06:54'),(8,'INV-000008','Sale Invoice','2025-08-19','2025-08-21','SN019',NULL,1,2,'8923980DI1755598462537','qr_INV-000008_1755598489.png',1,2,'Success','Posted successfully to FBR SANDBOX',15000,17400,2400,0,0,0,0,0,NULL,NULL,'4329f25a47609d0d36a7cabb3a7b4f229517610275104b61d7a43b9f50214b64','2025-08-19 05:14:46','2025-08-19 05:14:49'),(16,'INV-000016','Sale Invoice','2025-08-19','2025-08-21','SN018',NULL,1,1,'8923980DI1755603179148','qr_INV-000016_1755603205.png',1,2,'Success','Posted successfully to FBR SANDBOX',15000,17400,2400,0,0,0,0,0,NULL,NULL,'78d13c264174046ca80c178414aa8a5c9ce2f3039758531e591fe778369e3168','2025-08-19 06:33:24','2025-08-19 06:33:26'),(18,'INV-000018','Sale Invoice','2025-08-20','2025-08-21','SN018',NULL,1,3,'8923980DI1755684382924','qr_INV-000018_1755684410.png',1,2,'Success','Posted successfully to FBR SANDBOX',250000,290000,40000,0,0,0,0,0,NULL,NULL,'487f01a0edfa2c84328f05bcf304cc638f204c93aa690360e7b1f835841e7971','2025-08-20 05:06:49','2025-08-20 05:06:51'),(19,'INV-000019','Sale Invoice','2025-08-20','2025-08-22','SN018',NULL,1,4,'8923980DI1755684422905','qr_INV-000019_1755684450.png',1,2,'Success','Posted successfully to FBR SANDBOX',120000,139200,19200,0,0,0,0,0,NULL,NULL,'f0e5e956f134f9c5ab12cebe89f0132b2a61e6838bb49d4555687fc360000964','2025-08-20 05:07:28','2025-08-20 05:07:31'),(20,'INV-000020','Sale Invoice','2025-08-20','2025-08-22','SN018',NULL,1,5,'8923980DI1755684512465','qr_INV-000020_1755684540.png',1,2,'Success','Posted successfully to FBR SANDBOX',265000,307400,42400,2650,5300,0,0,0,NULL,NULL,'812a80a43377d958bb532c3faadf121984c98be9fa9ad24afeaaacfd0a681736','2025-08-20 05:08:58','2025-08-20 05:09:01');
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci  */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_invoices_after_insert` AFTER INSERT ON `invoices` FOR EACH ROW BEGIN
    INSERT INTO audit_logs (
        table_name, row_id, action_type,
        old_data, new_data, row_hash_old, row_hash_new,
        db_user, changed_at
    ) VALUES (
        'invoices',
        NEW.invoice_id,
        'INSERT',
        NULL,
        JSON_OBJECT(
            'invoice_no', NEW.invoice_no,
            'invoice_type', NEW.invoice_type,
            'invoice_date', NEW.invoice_date,
            'due_date', NEW.due_date,
            'scenario_id', NEW.scenario_id,
            'invoice_ref_no', NEW.invoice_ref_no,
            'seller_id', NEW.seller_id,
            'buyer_id', NEW.buyer_id,
            'fbr_invoice_number', NEW.fbr_invoice_number,
            'is_posted_to_fbr', NEW.is_posted_to_fbr,
            'created_at', NEW.created_at,
            'updated_at', NEW.updated_at
        ),
        NULL,
        SHA2(CONCAT(
            NEW.invoice_no,
            NEW.invoice_type,
            NEW.invoice_date,
            NEW.due_date,
            NEW.scenario_id,
            NEW.invoice_ref_no,
            NEW.seller_id,
            NEW.buyer_id,
            NEW.fbr_invoice_number,
            NEW.is_posted_to_fbr,
            NEW.created_at,
            NEW.updated_at
        ), 256),
        CURRENT_USER(),
        NOW()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci  */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_invoices_after_update` AFTER UPDATE ON `invoices` FOR EACH ROW BEGIN
    INSERT INTO audit_logs (
        table_name, row_id, action_type,
        old_data, new_data, row_hash_old, row_hash_new,
        db_user, changed_at
    ) VALUES (
        'invoices',
        OLD.invoice_id,
        'UPDATE',
        JSON_OBJECT(
            'invoice_no', OLD.invoice_no,
            'invoice_type', OLD.invoice_type,
            'invoice_date', OLD.invoice_date,
            'due_date', OLD.due_date,
            'scenario_id', OLD.scenario_id,
            'invoice_ref_no', OLD.invoice_ref_no,
            'seller_id', OLD.seller_id,
            'buyer_id', OLD.buyer_id,
            'fbr_invoice_number', OLD.fbr_invoice_number,
            'is_posted_to_fbr', OLD.is_posted_to_fbr,
            'created_at', OLD.created_at,
            'updated_at', OLD.updated_at
        ),
        JSON_OBJECT(
            'invoice_no', NEW.invoice_no,
            'invoice_type', NEW.invoice_type,
            'invoice_date', NEW.invoice_date,
            'due_date', NEW.due_date,
            'scenario_id', NEW.scenario_id,
            'invoice_ref_no', NEW.invoice_ref_no,
            'seller_id', NEW.seller_id,
            'buyer_id', NEW.buyer_id,
            'fbr_invoice_number', NEW.fbr_invoice_number,
            'is_posted_to_fbr', NEW.is_posted_to_fbr,
            'created_at', NEW.created_at,
            'updated_at', NEW.updated_at
        ),
        SHA2(CONCAT(
            OLD.invoice_no,
            OLD.invoice_type,
            OLD.invoice_date,
            OLD.due_date,
            OLD.scenario_id,
            OLD.invoice_ref_no,
            OLD.seller_id,
            OLD.buyer_id,
            OLD.fbr_invoice_number,
            OLD.is_posted_to_fbr,
            OLD.created_at,
            OLD.updated_at
        ), 256),
        SHA2(CONCAT(
            NEW.invoice_no,
            NEW.invoice_type,
            NEW.invoice_date,
            NEW.due_date,
            NEW.scenario_id,
            NEW.invoice_ref_no,
            NEW.seller_id,
            NEW.buyer_id,
            NEW.fbr_invoice_number,
            NEW.is_posted_to_fbr,
            NEW.created_at,
            NEW.updated_at
        ), 256),
        CURRENT_USER(),
        NOW()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci  */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_invoices_after_delete` AFTER DELETE ON `invoices` FOR EACH ROW BEGIN
    INSERT INTO audit_logs (
        table_name, row_id, action_type,
        old_data, new_data, row_hash_old, row_hash_new,
        db_user, changed_at
    ) VALUES (
        'invoices',
        OLD.invoice_id,
        'DELETE',
        JSON_OBJECT(
            'invoice_no', OLD.invoice_no,
            'invoice_type', OLD.invoice_type,
            'invoice_date', OLD.invoice_date,
            'due_date', OLD.due_date,
            'scenario_id', OLD.scenario_id,
            'invoice_ref_no', OLD.invoice_ref_no,
            'seller_id', OLD.seller_id,
            'buyer_id', OLD.buyer_id,
            'fbr_invoice_number', OLD.fbr_invoice_number,
            'is_posted_to_fbr', OLD.is_posted_to_fbr,
            'created_at', OLD.created_at,
            'updated_at', OLD.updated_at
        ),
        NULL,
        SHA2(CONCAT(
            OLD.invoice_no,
            OLD.invoice_type,
            OLD.invoice_date,
            OLD.due_date,
            OLD.scenario_id,
            OLD.invoice_ref_no,
            OLD.seller_id,
            OLD.buyer_id,
            OLD.fbr_invoice_number,
            OLD.is_posted_to_fbr,
            OLD.created_at,
            OLD.updated_at
        ), 256),
        NULL,
        CURRENT_USER(),
        NOW()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `item_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `item_hs_code` varchar(20) COLLATE utf8mb4_unicode_ci  DEFAULT NULL,
  `item_description` varchar(255) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `item_price` double NOT NULL,
  `item_tax_rate` varchar(10) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `item_uom` varchar(50) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `hash` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'MD5 hash to detect tampering',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;


--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'9815.6000','API Integration Services.',15000,'16','Per Month','388ae412f2b5aa5b3c3f2af7ae3201c3','2025-08-18 01:10:32','2025-08-18 01:37:49'),(2,'9815.1000','Technical / Engineering Consulting',250000,'16','Per Project','b55c2d2426032093bd03c3660dd5098d','2025-08-18 01:36:21','2025-08-20 05:06:06'),(3,'9815.6000','Software / IT System Development',120000,'16','Per Month','1bf62be5137a3a9ca55f0420ad10b213','2025-08-19 04:47:45','2025-08-20 05:05:58');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci  */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_items_after_insert` AFTER INSERT ON `items` FOR EACH ROW BEGIN
    INSERT INTO audit_logs (
        table_name,
        row_id,
        action_type,
        old_data,
        new_data,
        row_hash_old,
        row_hash_new,
        db_user,
        changed_at
    ) VALUES (
        'items',
        NEW.item_id,
        'INSERT',
        NULL,
        JSON_OBJECT(
            'item_hs_code', NEW.item_hs_code,
            'item_description', NEW.item_description,
            'item_price', NEW.item_price,
            'item_tax_rate', NEW.item_tax_rate,
            'item_uom', NEW.item_uom,
            'created_at', NEW.created_at,
            'updated_at', NEW.updated_at
        ),
        NULL,
        SHA2(CONCAT(
            NEW.item_hs_code,
            NEW.item_description,
            NEW.item_price,
            NEW.item_tax_rate,
            NEW.item_uom,
            NEW.created_at,
            NEW.updated_at
        ), 256),
        CURRENT_USER(),
        NOW()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci  */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_items_after_update` AFTER UPDATE ON `items` FOR EACH ROW BEGIN
    INSERT INTO audit_logs (
        table_name,
        row_id,
        action_type,
        old_data,
        new_data,
        row_hash_old,
        row_hash_new,
        db_user,
        changed_at
    ) VALUES (
        'items',
        OLD.item_id,
        'UPDATE',
        JSON_OBJECT(
            'item_hs_code', OLD.item_hs_code,
            'item_description', OLD.item_description,
            'item_price', OLD.item_price,
            'item_tax_rate', OLD.item_tax_rate,
            'item_uom', OLD.item_uom,
            'created_at', OLD.created_at,
            'updated_at', OLD.updated_at
        ),
        JSON_OBJECT(
            'item_hs_code', NEW.item_hs_code,
            'item_description', NEW.item_description,
            'item_price', NEW.item_price,
            'item_tax_rate', NEW.item_tax_rate,
            'item_uom', NEW.item_uom,
            'created_at', NEW.created_at,
            'updated_at', NEW.updated_at
        ),
        SHA2(CONCAT(
            OLD.item_hs_code,
            OLD.item_description,
            OLD.item_price,
            OLD.item_tax_rate,
            OLD.item_uom,
            OLD.created_at,
            OLD.updated_at
        ), 256),
        SHA2(CONCAT(
            NEW.item_hs_code,
            NEW.item_description,
            NEW.item_price,
            NEW.item_tax_rate,
            NEW.item_uom,
            NEW.created_at,
            NEW.updated_at
        ), 256),
        CURRENT_USER(),
        NOW()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci  */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_items_after_delete` AFTER DELETE ON `items` FOR EACH ROW BEGIN
    INSERT INTO audit_logs (
        table_name,
        row_id,
        action_type,
        old_data,
        new_data,
        row_hash_old,
        row_hash_new,
        db_user,
        changed_at
    ) VALUES (
        'items',
        OLD.item_id,
        'DELETE',
        JSON_OBJECT(
            'item_hs_code', OLD.item_hs_code,
            'item_description', OLD.item_description,
            'item_price', OLD.item_price,
            'item_tax_rate', OLD.item_tax_rate,
            'item_uom', OLD.item_uom,
            'created_at', OLD.created_at,
            'updated_at', OLD.updated_at
        ),
        NULL,
        SHA2(CONCAT(
            OLD.item_hs_code,
            OLD.item_description,
            OLD.item_price,
            OLD.item_tax_rate,
            OLD.item_uom,
            OLD.created_at,
            OLD.updated_at
        ), 256),
        NULL,
        CURRENT_USER(),
        NOW()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci  NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci ,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;


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
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci  NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;


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
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;


--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (7,'0001_01_01_000000_create_users_table',1),(8,'0001_01_01_000001_create_cache_table',1),(9,'0001_01_01_000002_create_jobs_table',1),(22,'2025_07_04_120046_create_business_configurations_table',2),(24,'2025_07_04_121405_create_buyers_table',3),(25,'2025_07_07_045332_create_items_table',4),(26,'2025_07_07_050034_create_invoices_table',5),(27,'2025_07_07_050036_create_invoice_details_table',5),(28,'2025_07_07_110924_add_bus_province_to_business_configurations_table',6),(29,'2025_07_07_111052_add_byr_province_to_buyers_table',7),(30,'2025_07_08_112513_add_totals_to_invoices_table',8),(31,'2025_07_10_052012_add_bus_account_title_to_business_configurations_table',9),(32,'2025_07_10_054824_add_byr_account_title_to_buyers_table',10),(33,'2025_07_10_063142_add_invoice_no_and_due_date_to_invoices_table',11),(34,'2025_07_14_071715_add_columns_to_invoices_table',12),(35,'2025_07_14_075126_make_invoice_no_nullable_in_invoices_table',13),(36,'2025_08_13_044242_alter_byr_ntn_cnic_nullable_in_buyers_table',14),(37,'2025_08_13_091004_create_activity_logs_table',15),(38,'2025_08_13_112939_add_qr_code_to_invoices_table',16),(39,'2025_08_15_072942_add_twofa_columns_to_users_table',17),(40,'2025_08_15_112612_add_hash_to_items_table',18),(41,'2025_08_18_042235_add_hash_to_buyers_table',19),(42,'2025_08_18_044921_add_hash_to_business_configurations_table',20),(43,'2025_08_18_051557_add_hash_to_invoices_and_invoice_details',21);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;


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
  `id` varchar(255) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci  DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci ,
  `payload` longtext COLLATE utf8mb4_unicode_ci  NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;


--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('Waz9k55gI2EHu26SB6t7bzxWXNAqS1dp1Y5BWNwo',2,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTklCcE5GRVV5aEpGWHpBRnhvWEJkRFZ6OVFVVFdqUnlpVGU0SHNPciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=',1755685564);
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `twofa_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `twofa_secret` varchar(255) COLLATE utf8mb4_unicode_ci  DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci  DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;


--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'Hammad Ali','hammad.ali@f3technologies.eu',NULL,'$2y$12$pJSGUTTYxPO7RIRKganrT.d5Yd.M.qT5RR7DNjlDMWfj9t7UTD0kG',0,NULL,NULL,'2025-07-02 01:29:39','2025-08-18 02:27:49'),(3,'Hammad Naseer','hammad.naseer@f3technologies.eu',NULL,'$2y$12$uUtR1dE5s3FQOYUd/2DSmOhnR64Mo/SkDT.PZ.j4CA5H0JTJDpmti',0,NULL,NULL,'2025-07-04 02:20:40','2025-07-04 02:20:40'),(4,'PRAL','admin@pral.com',NULL,'$2y$12$L.S4Y73wLI.F5tF6sbUyf.mkrEGCMbU7oh789Ba2caicyUAlK1ApW',0,NULL,NULL,'2025-07-02 01:29:39','2025-07-02 01:29:39');
