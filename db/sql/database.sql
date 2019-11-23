CREATE DATABASE  IF NOT EXISTS `connechub`
/*!40100 DEFAULT CHARACTER SET latin1 */;

USE `connechub`;
-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: connechub-www.cwjmmgkouws4.us-east-1.rds.amazonaws.com    Database: connechub
-- ------------------------------------------------------
-- Server version	5.5.5-10.3.8-MariaDB-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `categories` VALUES
(1, 'campus'),
(2,'community'),
(3,'housing'),
(4,'h2f'),
(5,'free'),
(6,'jobs'),
(9,'sale'),
(10,'services'),
(11,'unboxing');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=459 DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
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
  `media_file_name` varchar(128) DEFAULT NULL,
  `media_content_type` varchar(32) DEFAULT NULL,
  `media_file_size` int(11) DEFAULT NULL,
  `media_updated_at` datetime DEFAULT NULL,
  `ending_at` int(11) NOT NULL DEFAULT 1566166263,
  `charge_amount` int(11) DEFAULT 0,
  `charge_complete` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `index_listings_on_user_id` (`user_id`),
  KEY `index_listings_on_ending_at` (`ending_at`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `schema_migrations` VALUES ('20161201024935'),
('20161207004617'),
('20161207014918'),
('20161211133837'),
('20161212014031'),
('20161213050924'),
('20161225022029'),
('20170101202741'),
('20170102181123'),
('20170102184838'),
('20170115041643'),
('20170115064606'),
('20170604142516'),
('20190122015635'),
('20190122015640'),
('20190426021145'),
('20190515001006'),
('20190515234728'),
('20190606115012'),
('20190721118000'),
('20190722000001'),
('20190724000001'),
('20190805000001');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategories`
--

DROP TABLE IF EXISTS `subcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `subcategories` VALUES
(1,'Activities & Events',1,0),
(2,'Jobs',1,0),
(3,'Furniture',1,0),
(4,'Electronics',1,0),
(5,'Books',1,0),
(6,'Activities',1,0),
(7,'Appliances',1,0),
(8,'Churches',2,0),
(9,'Promotions',2,0),
(10,'Announcements',2,0),
(11,'Artists & Musicians',2,0),
(12,'Carpool & Rideshare',2,0),
(13,'Childcare & Babysitting',2,0),
(14,'Garage Sales',2,0),
(15,'Lost & Found',2,0),
(16,'Apartments',3,1000),
(17,'Commercial',3,1000),
(18,'Homes',3,1000),
(19,'Rentals',3,1000),
(20,'Vacation',3,1000),
(21,'Condos',3,1000),
(22,'Farms',3,1000),
(23,'Lands',3,1000),
(24,'Ranches',3,1000),
(25,'Manufactured Homes',3,1000),
(26,'Townhomes',3,1000),
(27,'Odd Items',4,0),
(28,'The Rarest',4,0),
(29,'Collectables',4,0),
(30,'Antiques',4,0),
(31,'Sale Anything',5,0),
(32,'Campus Life',5,0),
(33,'Events & Community',5,0),
(34,'Jobs pro bono',5,0),
(35,'Hard to Find',5,0),
(36,'Accounting',6,3500),
(37,'Admin/Clerical',6,3500),
(38,'Automotive',6,3500),
(39,'Banking',6,3500),
(40,'Biotech',6,3500),
(41,'Business Development',6,3500),
(42,'Business Opportunity',6,3500),
(43,'Construction',6,3500),
(44,'Consultant',6,3500),
(45,'Customer Service',6,3500),
(46,'Design',6,3500),
(47,'Distribution/Shipping',6,3500),
(48,'Education',6,3500),
(49,'Engineering',6,3500),
(50,'Entry Level',6,3500),
(51,'executive',6,3500),
(52,'Facilities',6,3500),
(53,'Finance',6,3500),
(54,'Franchise',6,3500),
(55,'General Business',6,3500),
(56,'General Labor',6,3500),
(57,'Government/Federal',6,3500),
(58,'Grocery Stores',6,3500),
(59,'Health Care',6,3500),
(60,'Hospitality/Hotel',6,3500),
(61,'Human Resources',6,3500),
(62,'Journalism/Newspaper',6,3500),
(63,'Information Technology',6,3500),
(64,'Installation',6,3500),
(65,'Insurance',6,3500),
(66,'Inventory',6,3500),
(67,'Legal',6,3500),
(68,'Legal Admin',6,3500),
(69,'Maintenance/Repair',6,3500),
(70,'Management',6,3500),
(71,'Manufacturing',6,3500),
(72,'Marketing',6,3500),
(73,'Media',6,3500),
(74,'Nonprofit',6,3500),
(75,'Nurse',6,3500),
(76,'Other',6,3500),
(77,'Pharmaceutical',6,3500),
(78,'Procurement',6,3500),
(79,'Professional Services',6,3500),
(80,'Purchasing',6,3500),
(81,'QA/Quality Control',6,3500),
(82,'Real Estate',6,3500),
(83,'Research',6,3500),
(84,'Restaurant',6,3500),
(85,'Retail',6,3500),
(86,'Sales',6,3500),
(87,'Science',6,3500),
(88,'Skilled Labor - Trades',6,3500),
(89,'Social Services',6,3500),
(90,'Strategy/Planning',6,3500),
(91,'Supply Chain',6,3500),
(92,'Telecommunications',6,3500),
(93,'Training',6,3500),
(94,'Transportation',6,3500),
(95,'Veterinary Services',6,3500),
(96,'Warehouse',6,3500),
(167,'Home & Garden',9,0),
(168,'Clothing & Accessories',9,0),
(169,'Flowers & Gifts',9,0),
(170,'Computers',9,0),
(171,'Electronics',9,0),
(172,'Fragrances & Beauty',9,0),
(173,'Jewelry & Watches',9,0),
(174,'Sports & Outdoors',9,0),
(175,'Toys & Baby',9,0),
(176,'Automotive',9,1000),
(177,'DVD',9,0),
(178,'Music',9,0),
(179,'Books',9,0),
(180,'Appliances',9,0),
(181,'Video Games',9,0),
(182,'Industrial',9,0),
(183,'Tickets',9,1000),
(184,'Musical Instruments',9,0),
(185,'Pets',9,0),
(186,'Accountant',10,500),
(187,'Architecture',10,500),
(188,'Artists',10,500),
(189,'Barber',10,500),
(190,'Beauty Salons',10,500),
(191,'Building Remodelling',10,500),
(192,'Business Planner',10,500),
(193,'Taxi Cab/UBER',10,500),
(194,'Car Rental',10,500),
(195,'Chef',10,500),
(196,'Cleaning Services / Maids',10,500),
(197,'Home Decor',10,500),
(198,'Fitness Instructor',10,500),
(199,'Elderly Care',10,500),
(200,'IT / Programmer',10,500),
(201,'Grant Writer',10,500),
(202,'Health Spa',10,500),
(203,'Lawn Care',10,500),
(204,'Legal Services',10,500),
(205,'Limousine',10,500),
(206,'Repair / Handyman',10,500),
(207,'Marketing Firm',10,500),
(208,'nonprofit',10,500),
(209,'Home Security',10,500),
(210,'Structural Engineering',10,500),
(211,'Home Remodelling',10,500),
(212,'Auto Repair',10,500),
(213,'Tutoring/Education',10,500),
(214,'Website Designer',10,500),
(215,'Plumber',10,500),
(216,'Appliance Repair',10,500),
(217,'Dog Walker',10,500),
(218,'Pressure Washing',10,500),
(219,'Computer Repair',10,500),
(220,'Auto Insurance',10,500),
(221,'Small Construction',10,500),
(222,'Life Insurance',10,500),
(223,'Mortgage Refinance',10,500),
(224,'Photographers',10,500),
(225,'Financial Planner',10,500),
(226,'Music Dj & Bands',10,500),
(227,'Moving Company',10,500),
(228,'Dentist',10,500),
(229,'Doctors',10,500),
(230,'Party Bus',10,500),
(231,'Pawn Shops',10,500),
(232,'Gun Shops',10,500),
(233,'Laundromat',10,500),
(234,'Massage Therapists',10,500),
(235,'Garbage Collection',10,500),
(236,'Churches',10,500),
(237,'Pet Grooming',10,500),
(238,'Restaurants',10,500),
(239,'Pest Control Services',10,500),
(240,'Dumpster Rental',10,500),
(241,'Reception Halls',10,500),
(242,'Roofing Contractors',10,500),
(243,'Tow Truck Service',10,500),
(244,'Cash Services',10,500),
(245,'Home & Garden',11,0),
(246,'Clothing & Accessories',11,0),
(247,'Computers',11,0),
(248,'Electronics',11,0),
(249,'Jewelry & Watches',11,0),
(250,'Sports & Outdoors',11,0),
(251,'Toys & Baby',11,0),
(252,'Appliances',11,0),
(253,'Musical Instruments',11,0);
/*!40000 ALTER TABLE `subcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
-- Password hashes have been replaces w/ random string hashes and then truncated. No real passwords are in here.
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'test@test.com','$2a$11$55LPJotj3bLxv2W9PSPZGelABNBgwyNxsFOpUyIZScDhKgGiIeHwC',NULL,NULL,'2019-02-11 00:49:54',13,'2019-09-23 01:15:10','2019-05-27 04:46:40','47.200.2.224','47.200.23.175','2019-01-09 01:22:02','2019-09-23 01:15:10','test',NULL,NULL,NULL,NULL,NULL),
(2,'davis.ron@hotmail.com','$2a$11$BRsirOvFLTymMb2DXsgEz.','89cf836a03240998bac7beb6493018747842eda5bf647ed8af18768f019d8b86','2019-09-10 11:54:28',NULL,104,'2019-05-23 00:06:32','2019-05-21 11:39:49','96.58.200.191','96.58.200.191','2019-01-09 03:05:49','2019-09-10 11:54:28','myconnec','I love to buy, sell and trade anything!!',NULL,'image/jpeg',1204116,'2019-01-12 01:05:38')
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votes`
--

DROP TABLE IF EXISTS `votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
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

-- Dump completed on 2019-11-17 11:44:57
