-- MySQL dump 10.13  Distrib 8.0.13, for macos10.14 (x86_64)
--
-- Host: connechub-prd.cwjmmgkouws4.us-east-1.rds.amazonaws.com    Database: connechub
-- ------------------------------------------------------
-- Server version	5.5.5-10.3.8-MariaDB-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'campus'),(2,'community'),(3,'housing'),(4,'h2f'),(5,'free'),(6,'jobs'),(9,'sale'),(10,'services'),(11,'unboxing');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listing_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `body` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_user_id` (`user_id`),
  KEY `index_comments_on_listing_id` (`listing_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `impressions`
--

DROP TABLE IF EXISTS `impressions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `impressions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `impressionable_type` varchar(32) DEFAULT NULL,
  `impressionable_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `controller_name` varchar(32) DEFAULT NULL,
  `action_name` varchar(32) DEFAULT NULL,
  `view_name` varchar(32) DEFAULT NULL,
  `request_hash` varchar(256) DEFAULT NULL,
  `ip_address` varchar(39) DEFAULT NULL,
  `session_hash` varchar(32) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `referrer` text DEFAULT NULL,
  `params` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `poly_session_index` (`impressionable_type`,`impressionable_id`,`session_hash`),
  KEY `poly_request_index` (`impressionable_type`,`impressionable_id`,`request_hash`),
  KEY `poly_ip_index` (`impressionable_type`,`impressionable_id`,`ip_address`),
  KEY `index_impressions_on_user_id` (`user_id`),
  KEY `controlleraction_session_index` (`controller_name`,`action_name`,`session_hash`),
  KEY `controlleraction_request_index` (`controller_name`,`action_name`,`request_hash`),
  KEY `controlleraction_ip_index` (`controller_name`,`action_name`,`ip_address`)
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impressions`
--

LOCK TABLES `impressions` WRITE;
/*!40000 ALTER TABLE `impressions` DISABLE KEYS */;
/*!40000 ALTER TABLE `impressions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listings`
--

DROP TABLE IF EXISTS `listings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `listings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `state` varchar(32) DEFAULT NULL,
  `zipcode` varchar(32) DEFAULT NULL,
  `price` varchar(32) DEFAULT NULL,
  `address1` varchar(32) DEFAULT NULL,
  `address2` varchar(32) DEFAULT NULL,
  `ademail` varchar(32) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `media_file_name` varchar(32) DEFAULT NULL,
  `media_content_type` varchar(32) DEFAULT NULL,
  `media_file_size` int(11) DEFAULT NULL,
  `media_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_listings_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listings`
--

LOCK TABLES `listings` WRITE;
/*!40000 ALTER TABLE `listings` DISABLE KEYS */;
/*!40000 ALTER TABLE `listings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `models`
--

DROP TABLE IF EXISTS `models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `models` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(1024) NOT NULL DEFAULT '',
  `encrypted_password` varchar(1024) NOT NULL DEFAULT '',
  `reset_password_token` varchar(1024) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT 0,
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(32) DEFAULT NULL,
  `last_sign_in_ip` varchar(32) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_models_on_email` (`email`),
  UNIQUE KEY `index_models_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `models`
--

LOCK TABLES `models` WRITE;
/*!40000 ALTER TABLE `models` DISABLE KEYS */;
/*!40000 ALTER TABLE `models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `schema_migrations` (
  `version` varchar(32) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20161201024935'),('20161207004617'),('20161207014918'),('20161211133837'),('20161212014031'),('20161213050924'),('20161225022029'),('20170101202741'),('20170102181123'),('20170102184838'),('20170115041643'),('20170115064606'),('20170604142516'),('20190122015635'),('20190122015640'),('20190426021145'),('20190515001006'),('20190515234728');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategories`
--

DROP TABLE IF EXISTS `subcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `subcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `chargable` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `subcategories_charable_index` (`chargable`)
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategories`
--

LOCK TABLES `subcategories` WRITE;
/*!40000 ALTER TABLE `subcategories` DISABLE KEYS */;
INSERT INTO `subcategories` VALUES (1,'Activities & Events',1,0),(2,'Jobs',1,0),(3,'Furniture',1,0),(4,'Electronics',1,0),(5,'Books',1,0),(6,'Activities',1,0),(7,'Appliances',1,0),(8,'Churches',2,0),(9,'Promotions',2,0),(10,'Announcements',2,0),(11,'Artists & Musicians',2,0),(12,'Carpool & Rideshare',2,0),(13,'Childcare & Babysitting',2,0),(14,'Garage Sales',2,0),(15,'Lost & Found',2,0),(16,'Apartments',3,0),(17,'Commercial',3,0),(18,'Homes',3,0),(19,'Rentals',3,0),(20,'Vacation',3,0),(21,'Condos',3,0),(22,'Farms',3,0),(23,'Lands',3,0),(24,'Ranches',3,0),(25,'Manufactured Homes',3,0),(26,'Townhomes',3,0),(27,'Odd Items',4,0),(28,'The Rarest',4,0),(29,'Collectables',4,0),(30,'Antiques',4,0),(31,'Sale Anything',5,0),(32,'Campus Life',5,0),(33,'Events & Community',5,0),(34,'Jobs pro bono',5,0),(35,'Hard to Find',5,0),(36,'Accounting',6,0),(37,'Admin/Clerical',6,0),(38,'Automotive',6,0),(39,'Banking',6,0),(40,'Biotech',6,0),(41,'Business Development',6,0),(42,'Business Opportunity',6,0),(43,'Construction',6,0),(44,'Consultant',6,0),(45,'Customer Service',6,0),(46,'Design',6,0),(47,'Distribution/Shipping',6,0),(48,'Education',6,0),(49,'Engineering',6,0),(50,'Entry Level',6,0),(51,'executive',6,0),(52,'Facilities',6,0),(53,'Finance',6,0),(54,'Franchise',6,0),(55,'General Business',6,0),(56,'General Labor',6,0),(57,'Government/Federal',6,0),(58,'Grocery Stores',6,0),(59,'Health Care',6,0),(60,'Hospitality/Hotel',6,0),(61,'Human Resources',6,0),(62,'Journalism/Newspaper',6,0),(63,'Information Technology',6,0),(64,'Installation',6,0),(65,'Insurance',6,0),(66,'Inventory',6,0),(67,'Legal',6,0),(68,'Legal Admin',6,0),(69,'Maintenance/Repair',6,0),(70,'Management',6,0),(71,'Manufacturing',6,0),(72,'Marketing',6,0),(73,'Media',6,0),(74,'Nonprofit',6,0),(75,'Nurse',6,0),(76,'Other',6,0),(77,'Pharmaceutical',6,0),(78,'Procurement',6,0),(79,'Professional Services',6,0),(80,'Purchasing',6,0),(81,'QA/Quality Control',6,0),(82,'Real Estate',6,0),(83,'Research',6,0),(84,'Restaurant',6,0),(85,'Retail',6,0),(86,'Sales',6,0),(87,'Science',6,0),(88,'Skilled Labor - Trades',6,0),(89,'Social Services',6,0),(90,'Strategy/Planning',6,0),(91,'Supply Chain',6,0),(92,'Telecommunications',6,0),(93,'Training',6,0),(94,'Transportation',6,0),(95,'Veterinary Services',6,0),(96,'Warehouse',6,0),(167,'Home & Garden',9,0),(168,'Clothing & Accessories',9,0),(169,'Flowers & Gifts',9,0),(170,'Computers',9,0),(171,'Electronics',9,0),(172,'Fragrances & Beauty',9,0),(173,'Jewelry & Watches',9,0),(174,'Sports & Outdoors',9,0),(175,'Toys & Baby',9,0),(176,'Automotive',9,0),(177,'DVD',9,0),(178,'Music',9,0),(179,'Books',9,0),(180,'Appliances',9,0),(181,'Video Games',9,0),(182,'Industrial',9,0),(183,'Tickets',9,0),(184,'Musical Instruments',9,0),(185,'Pets',9,0),(186,'Accountant',10,0),(187,'Architecture',10,0),(188,'Artists',10,0),(189,'Barber',10,0),(190,'Beauty Salons',10,0),(191,'Building Remodelling',10,0),(192,'Business Planner',10,0),(193,'Taxi Cab/UBER',10,0),(194,'Car Rental',10,0),(195,'Chef',10,0),(196,'Cleaning Services / Maids',10,0),(197,'Home Decor',10,0),(198,'Fitness Instructor',10,0),(199,'Elderly Care',10,0),(200,'IT / Programmer',10,0),(201,'Grant Writer',10,0),(202,'Health Spa',10,0),(203,'Lawn Care',10,0),(204,'Legal Services',10,0),(205,'Limousine',10,0),(206,'Repair / Handyman',10,0),(207,'Marketing Firm',10,0),(208,'nonprofit',10,0),(209,'Home Security',10,0),(210,'Structural Engineering',10,0),(211,'Home Remodelling',10,0),(212,'Auto Repair',10,0),(213,'Tutoring/Education',10,0),(214,'Website Designer',10,0),(215,'Plumber',10,0),(216,'Appliance Repair',10,0),(217,'Dog Walker',10,0),(218,'Pressure Washing',10,0),(219,'Computer Repair',10,0),(220,'Auto Insurance',10,0),(221,'Small Construction',10,0),(222,'Life Insurance',10,0),(223,'Mortgage Refinance',10,0),(224,'Photographers',10,0),(225,'Financial Planner',10,0),(226,'Music Dj & Bands',10,0),(227,'Moving Company',10,0),(228,'Dentist',10,0),(229,'Doctors',10,0),(230,'Party Bus',10,0),(231,'Pawn Shops',10,0),(232,'Gun Shops',10,0),(233,'Laundromat',10,0),(234,'Massage Therapists',10,0),(235,'Garbage Collection',10,0),(236,'Churches',10,0),(237,'Pet Grooming',10,0),(238,'Restaurants',10,0),(239,'Pest Control Services',10,0),(240,'Dumpster Rental',10,0),(241,'Reception Halls',10,0),(242,'Roofing Contractors',10,0),(243,'Tow Truck Service',10,0),(244,'Cash Services',10,0),(245,'Home & Garden',11,0),(246,'Clothing & Accessories',11,0),(247,'Computers',11,0),(248,'Electronics',11,0),(249,'Jewelry & Watches',11,0),(250,'Sports & Outdoors',11,0),(251,'Toys & Baby',11,0),(252,'Appliances',11,0),(253,'Musical Instruments',11,0);
/*!40000 ALTER TABLE `subcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(1024) NOT NULL DEFAULT '',
  `encrypted_password` varchar(1024) NOT NULL DEFAULT '',
  `reset_password_token` varchar(1024) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT 0,
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(32) DEFAULT NULL,
  `last_sign_in_ip` varchar(32) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `username` varchar(32) DEFAULT NULL,
  `bio` varchar(1024) DEFAULT NULL,
  `avatar_file_name` varchar(1024) DEFAULT NULL,
  `avatar_content_type` varchar(32) DEFAULT NULL,
  `avatar_file_size` int(11) DEFAULT NULL,
  `avatar_updated_at` datetime DEFAULT NULL,
  `stripe_token` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'test@test.com','$2a$11$55LPJotj3bLxv2W9PSPZGelABNBgwyNxsFOpUyIZScDhKgGiIeHwC',NULL,NULL,'2019-02-11 00:49:54',12,'2019-05-27 04:46:40','2019-05-19 02:56:51','47.200.23.175','70.125.10.55','2019-01-09 01:22:02','2019-05-27 04:46:40','test',NULL,NULL,NULL,NULL,NULL,NULL),(2,'davis.ron@hotmail.com','$2a$11$BRsirOvFLTymMb2DXsgEz.GOGTso8bcFDCucvUWvR5Aten1Lg9hT6','e47eb8cc891a09689589995c6a40e43f8ec5e3e64611e81f0a849f35991d18c9','2019-05-30 11:49:42',NULL,104,'2019-05-23 00:06:32','2019-05-21 11:39:49','96.58.200.191','96.58.200.191','2019-01-09 03:05:49','2019-05-30 11:49:42','myconnec','I love to buy, sell and trade anything!!',NULL,'image/jpeg',1204116,'2019-01-12 01:05:38',NULL),(3,'jjones850.jj@gmail.com','$2a$11$hSZC7klM2apdVIEXL54iXOt3lvm6eN769LCib2j0rgEGiz5RR3mPy',NULL,NULL,NULL,8,'2019-01-24 00:31:24','2019-01-22 20:37:03','96.58.200.191','107.77.253.7','2019-01-20 17:32:38','2019-01-24 00:31:24','jjones','House of Fragrance & Decor',NULL,'image/jpeg',79544,'2019-01-21 16:29:20',NULL),(4,'xaviermclean@gmail.com','$2a$11$4hMJvjSgT9BGJpdp8RQ23eBjUi1NskaG5kMWIQ4OxkB6XR.vqFKvi',NULL,NULL,NULL,1,'2019-01-24 05:41:38','2019-01-24 05:41:38','162.233.232.35','162.233.232.35','2019-01-24 05:41:38','2019-01-24 05:41:38','Xaviermclean',NULL,NULL,NULL,NULL,NULL,NULL),(5,'j_nice33614@yahoo.com','$2a$11$9GlREjpp3HD8oh.tD2QIiObT7EtYbKzluGqQ9jhV8iFqTTkw97MVm',NULL,NULL,NULL,1,'2019-01-24 17:25:34','2019-01-24 17:25:34','66.87.149.112','66.87.149.112','2019-01-24 17:25:34','2019-01-24 17:25:34','Jnice336',NULL,NULL,NULL,NULL,NULL,NULL),(6,'dontrez89@gmail.com','$2a$11$nv6POw2cKh/HMeBteQrpUOYQinxA9MvuA5ixeLy5HouFBVdjXgPH2',NULL,NULL,NULL,1,'2019-01-24 22:02:32','2019-01-24 22:02:32','71.68.104.225','71.68.104.225','2019-01-24 22:02:31','2019-01-24 22:02:32','Jon89',NULL,NULL,NULL,NULL,NULL,NULL),(7,'henderson272000@yahoo.com','$2a$11$56zS/zFBUm3SzqRVmcWtDeOxVnqRsvAphxmI3JDMa5buTd9Lfjj.y',NULL,NULL,NULL,1,'2019-01-24 22:35:29','2019-01-24 22:35:29','107.135.198.68','107.135.198.68','2019-01-24 22:35:29','2019-01-24 22:35:29','Deshon',NULL,NULL,NULL,NULL,NULL,NULL),(8,'rondavis818@gmail.com','$2a$11$8NkWNfxBuhbydhE9ONUJZurnEb4r5RM.pz09ytxloX.ZVuR49U6Bu',NULL,NULL,NULL,1,'2019-01-24 23:34:49','2019-01-24 23:34:49','174.228.129.127','174.228.129.127','2019-01-24 23:34:49','2019-01-24 23:34:49','92ways',NULL,NULL,NULL,NULL,NULL,NULL),(9,'michaelcjones40@gmail.com','$2a$11$YRKdGEQwWbOrU91XJxdJau8foC/rxecMHm0JiekSEbmuii9Ao.NpC',NULL,NULL,NULL,1,'2019-01-25 01:34:16','2019-01-25 01:34:16','73.7.60.158','73.7.60.158','2019-01-25 01:34:16','2019-01-25 01:34:16','Michael',NULL,NULL,NULL,NULL,NULL,NULL),(10,'cohila@yahoo.com','$2a$11$CfgGjy740zsBusaJDfWGauYzI55gHk9qV3nqc/km/t0M4DCZR/67S',NULL,NULL,NULL,1,'2019-01-31 05:39:03','2019-01-31 05:39:03','96.58.200.191','96.58.200.191','2019-01-31 05:39:03','2019-01-31 05:39:03','cohila@yahoo.com',NULL,NULL,NULL,NULL,NULL,NULL),(11,'atorres2kg@aol.com','$2a$11$t0C5lGrsF9G.Xx4nqAtYpO.EMToZ2GwFzrSyjzj8rKavijNS4GYUS',NULL,NULL,NULL,9,'2019-04-27 01:57:25','2019-04-18 01:35:57','47.205.129.43','47.205.129.43','2019-02-01 01:08:00','2019-04-27 01:57:25','Debton2000',NULL,NULL,NULL,NULL,NULL,NULL),(12,'test_2@test.com','$2a$11$yY7eP5s/u8eTFlh7d2hqLOE2kgLi.PfMvv9qaQvkllqP5Ao2F35ZK',NULL,NULL,NULL,2,'2019-02-02 02:07:41','2019-02-02 01:42:19','65.35.89.87','65.35.89.87','2019-02-02 01:42:19','2019-02-02 02:07:41','test_2',NULL,NULL,NULL,NULL,NULL,NULL),(13,'charlottehomeconnection@gmail.com','$2a$11$H/gmwdFBhrpwcsgat8nVQ.bz9lXoeA5oHKjrbvjZSfbOQFfXynoY6',NULL,NULL,NULL,1,'2019-02-02 02:25:42','2019-02-02 02:25:42','166.137.10.25','166.137.10.25','2019-02-02 02:25:42','2019-02-02 02:25:42','robynjefferson',NULL,NULL,NULL,NULL,NULL,NULL),(14,'davisryan863@gmail.com','$2a$11$Kv7pT4Hmij8QVxgK2x/Iy.nOiQHz.vAhCaYtjuSHvfx.6LDI4gqtG',NULL,NULL,NULL,1,'2019-02-02 02:36:17','2019-02-02 02:36:17','65.34.80.92','65.34.80.92','2019-02-02 02:36:17','2019-02-02 02:36:17','VolyNumBer6',NULL,NULL,NULL,NULL,NULL,NULL),(15,'tarraweddingplanner@yahoo.com','$2a$11$eBwvXt.rqvpjZDSieyUb5eabrBHpvq13G05iNc9gD..pV/nvZg4eW',NULL,NULL,NULL,1,'2019-02-02 06:09:23','2019-02-02 06:09:23','68.200.173.227','68.200.173.227','2019-02-02 06:09:23','2019-02-02 06:09:23','Tstapleton ',NULL,NULL,NULL,NULL,NULL,NULL),(16,'padolan1203@gmail.com','$2a$11$xE6WtZynMz5wn4wcHBSu4.EvcAQ01n25IHk5cfATezSNPE5Bbt1L6','333d60fc68946c4ff22ae290265a8d14eb6ca9f9bc92807105f8e8e8f69dcfae','2019-02-03 04:18:09',NULL,1,'2019-02-03 02:44:50','2019-02-03 02:44:50','75.178.128.32','75.178.128.32','2019-02-03 02:44:50','2019-02-03 04:18:09','Padolan',NULL,NULL,NULL,NULL,NULL,NULL),(17,'mrwillymac@gmail.com','$2a$11$oiSarBAlWJAAzcGkciNxYOUwb/uzEWNqA1oWuch/IVrbpWXS//Yky',NULL,NULL,NULL,1,'2019-02-06 03:47:55','2019-02-06 03:47:55','107.77.104.16','107.77.104.16','2019-02-06 03:47:55','2019-02-06 03:47:55','mrwillymac',NULL,NULL,NULL,NULL,NULL,NULL),(18,'williams.joseph8587@gmail.com','$2a$11$G0Nxa8X25BunxUq4b6XIceRZy5NcQIo3XEtDjIAPpgf/BOpqEDVxS','40e6fef0df54320019ad0da1f440ebc26dfbd6dafd04521a1584ba3868a95aaa','2019-02-13 15:55:27',NULL,1,'2019-02-07 15:12:44','2019-02-07 15:12:44','172.58.108.140','172.58.108.140','2019-02-07 15:12:44','2019-02-13 15:55:27','JoeCool',NULL,NULL,NULL,NULL,NULL,NULL),(19,'jazminminjares97@gmail.com','$2a$11$8UrsSrGKVkUcLO9hYb4pVeRJrUDtInTghA1oGGRsW8T.zwUsr4mJq',NULL,NULL,NULL,1,'2019-02-07 16:04:05','2019-02-07 16:04:05','47.205.76.160','47.205.76.160','2019-02-07 16:04:05','2019-02-07 16:04:05','Jazzy0604',NULL,NULL,NULL,NULL,NULL,NULL),(20,'yohone34@gmail.com','$2a$11$86MuJcEbTFDBDSdSif.vD.RpNsSweTrjBYQPjrHLJ77587Hb8Y4YG',NULL,NULL,NULL,1,'2019-02-08 05:06:44','2019-02-08 05:06:44','107.77.94.118','107.77.94.118','2019-02-08 05:06:44','2019-02-08 05:06:44','Phaded Vizionz',NULL,NULL,NULL,NULL,NULL,NULL),(21,'arwill01@gmail.com','$2a$11$YPPZOBRTrBNbzTWyZJNjou/GtZ2fScC5rRdwukUt3o42DOElGRurm',NULL,NULL,NULL,1,'2019-02-11 22:55:13','2019-02-11 22:55:13','107.137.238.8','107.137.238.8','2019-02-11 22:55:13','2019-02-11 22:55:13','arwill01',NULL,NULL,NULL,NULL,NULL,NULL),(22,'tiffany_douglas@hotmail.com','$2a$11$P7I7otrPVF/l9jsyZupXseMsm42EXpAC7CSwb7jh7g2bOMNHZolSq',NULL,NULL,NULL,1,'2019-02-13 01:28:31','2019-02-13 01:28:31','73.7.60.158','73.7.60.158','2019-02-13 01:28:31','2019-02-13 01:28:31','Tiffany Jones',NULL,NULL,NULL,NULL,NULL,NULL),(23,'samuelruth66@gamil.com','$2a$11$UU4th3qmHXTuQz.cq/9jYeoXv.c95tAVT.51oIjPFJvCWvWm5l5Aq',NULL,NULL,NULL,1,'2019-03-06 19:32:23','2019-03-06 19:32:23','197.210.54.13','197.210.54.13','2019-03-06 19:32:23','2019-03-06 19:32:23','Elohor',NULL,NULL,NULL,NULL,NULL,NULL),(24,'myfinchjones@gmail.com','$2a$11$7dpHXfVTRgR4QcozcXiX2.Zxk3dZ6sZEsKdy0RU8g6QIz5hPp.1BW',NULL,NULL,NULL,1,'2019-03-23 03:50:48','2019-03-23 03:50:48','68.200.143.127','68.200.143.127','2019-03-23 03:50:48','2019-03-23 03:50:48','OPOKUWAY',NULL,NULL,NULL,NULL,NULL,NULL),(25,'joseph.willliams8587@gmail.com','$2a$11$gwKj3RyQqwm71mo8xssIfeoBdUqgpWOOTVE9Kl1fu.twXhF7LFaua',NULL,NULL,NULL,1,'2019-04-03 05:12:53','2019-04-03 05:12:53','172.56.6.219','172.56.6.219','2019-04-03 05:12:53','2019-04-03 05:12:53','JosephWilli',NULL,NULL,NULL,NULL,NULL,NULL),(26,'ron@connechub.com','$2a$11$CRPJzpQrBQcO/Ke8qfiya.ZZjPGfCcbVDrWCdAJ6Pn4iuCuuMJ.cm',NULL,NULL,NULL,22,'2019-06-04 23:19:03','2019-06-04 01:15:33','96.58.200.191','96.58.200.191','2019-05-27 23:54:49','2019-06-04 23:19:03','Connechub CEO','I love this site','159753.png','image/png',5703,'2019-05-29 12:04:12',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votes`
--

DROP TABLE IF EXISTS `votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `votable_id` int(11) DEFAULT NULL,
  `votable_type` varchar(32) DEFAULT NULL,
  `voter_id` int(11) DEFAULT NULL,
  `voter_type` varchar(32) DEFAULT NULL,
  `vote_flag` tinyint(1) DEFAULT NULL,
  `vote_scope` varchar(32) DEFAULT NULL,
  `vote_weight` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_votes_on_voter_id_and_voter_type_and_vote_scope` (`voter_id`,`voter_type`,`vote_scope`),
  KEY `index_votes_on_votable_id_and_votable_type_and_vote_scope` (`votable_id`,`votable_type`,`vote_scope`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votes`
--

LOCK TABLES `votes` WRITE;
/*!40000 ALTER TABLE `votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'connechub'
--

--
-- Dumping routines for database 'connechub'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-04 20:58:00
