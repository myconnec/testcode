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
(1'campus'),
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
INSERT INTO `comments` VALUES
(11,2,'Nice video!','2019-01-11 00:02:15','2019-01-11 00:02:15'),
(5,11,2,'Love it and thanks posting your ad..BTW do you have a company name? Or contact number where people came reach you. ','2019-02-06 09:11:58','2019-02-06 09:11:58'),
(9,15,26,'Test','2019-05-28 00:05:02','2019-05-28 00:05:02'),
(10,34,26,'','2019-05-31 20:44:34','2019-05-31 20:44:34'),
(11,44,26,'Where is your video bro ','2019-08-22 19:09:00','2019-08-22 19:09:00'),
(13,43,26,'How do I get this ','2019-08-25 21:56:41','2019-08-25 21:56:41'),
(17,43,52,'nice','2019-09-08 10:35:53','2019-09-08 10:35:53'),
(20,62,26,'I want','2019-09-25 01:21:16','2019-09-25 01:21:16'),
(21,62,26,'I need this','2019-09-25 01:26:45','2019-09-25 01:26:45'),
(22,76,26,'Damn not my size','2019-10-10 00:41:14','2019-10-10 00:41:14'),
(23,79,26,'Ffg dududhsh','2019-10-13 18:40:13','2019-10-13 18:40:13');
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
INSERT INTO `listings` VALUES (8,'House of Fragrance & Decor','Body oils, Air fresheners, Black soap, Incense, Oil burners and much more \nLocated @: \nTampa Flea Market\n11612 N Nebraska Ave\nTampa, FL 33612','Tampa ','FL','33612','5.00',NULL,NULL,'','2019-01-20 21:14:28','2019-01-24 00:32:02',9,172,28.0564,-82.4428,3,'20190120_160056.mp4','video/mp4',90368622,'2019-01-20 21:14:25',1566166263,0,0),
(11,'drywall finisher','The best you will get!','Dothan','Al','36303','1.00',NULL,NULL,'','2019-02-06 03:56:00','2019-02-06 03:56:00',10,197,31.2484,-85.3756,17,'VID_20190205_133922672.mp4','video/mp4',54825015,'2019-02-06 03:56:00',1566166263,0,0),
(15,'Elite  ES  Jazzy Electric Scooter','Elite  ES  Jazzy Electric Scooter. Slightly used. Works excellent','LAKELAND','FL','33809','1500.00',NULL,NULL,'atorres2kg@aol.com','2019-02-27 00:59:09','2019-02-27 00:59:09',9,4,NULL,NULL,11,'Fizzer_Electric_Wheelchair.mp4','video/3gpp',52761231,'2019-02-27 00:59:09',1566166263,0,0),
(17,'Robot Restaurant','Robot Restaurant is amazing.','Tokyo','Japan','12345','75.00',NULL,NULL,'https://www.tripadvisor.com/','2019-04-23 02:54:54','2019-04-23 02:54:54',2,1,NULL,NULL,1,'test.mp4','video/mp4',9018244,'2019-04-23 02:54:54',1566166263,0,0),
(38,'SD Card holder','I have a blue sd card holder that will up to 20 cards','Tampa','FL','33626','5.00',NULL,NULL,'ron@connechub.com','2019-08-19 15:59:18','2019-08-19 16:01:02',9,171,28.0658,-82.6159,26,'93e8e6b7-4bce-4291-ba77-53f051aa196f/20190507_140117.mp4',NULL,NULL,NULL,1568822358,0,0),
(39,'Targus TG-50TR 50-Inch 3-Way Pan Head Tripod','- Product description - Targus 50 inch 3 Way Pan Head Tripod \r\n- Product Dimensions - 3.1 x 3.1 x 16.9 inches \r\n- Item Weight - 1.45 pounds \r\n- Shipping Weight - 1.45 pounds \r\n- Item model number - TG-50TR \r\n','Tampa','FL','33626','19.99',NULL,NULL,'ron@connechub.com','2019-08-21 01:16:24','2019-08-21 01:18:49',9,171,NULL,NULL,26,'356baffb-4cc7-4174-9c37-f9acb8f00f3a/20190507_124951.mp4',NULL,NULL,NULL,1568942184,0,0),
(41,'Butterfly Blouses','Sheer flowing floor length ruffle blouses available in multiple colors.  One Size Fits Most. The prices are for remaining inventory at sample pricing. ','ROCK HILL','South Carolina','29730','$30 to $40',NULL,NULL,'ncobi1@gmail.com','2019-08-21 10:56:14','2019-08-21 11:05:21',9,168,NULL,NULL,30,'d1cb96ba-82d9-4dcf-b9f4-12f8c3143f4c/Flutter_Blouses_HD 720p.mp4',NULL,NULL,NULL,0,0,0),
(42,'test','test','test','Tampa','33626','10.00',NULL,NULL,'ron@connechub.com','2019-08-21 22:19:58','2019-08-21 22:19:58',1,1,NULL,NULL,26,NULL,NULL,NULL,NULL,1569017998,0,0),
(43,'Xbox 360 250GB Slim Console','Xbox 360 250GB Slim Console\r\n\r\n- This product shows limited or no wear, and includes all original accessories \r\n- Built-in Wi-Fi for easy connection to Xbox LIVE \r\n- Xbox 360 has blockbuster games, HD movies and controller-free fun for everyone \r\n- Ready for the controller-free fun of Kinect \r\n- Super quiet with sleek new design plus matching controller \r\n\r\n\r\nThe new Xbox 360 250GB Console. Here today, ready for tomorrow with a brand new, leaner machine. Wi-Fi is built-in for easier connection to the world of entertainment on Xbox LIVE, where HD movies and TV stream in an instant. It\'s ready for the controller-free experiences of Kinect - you don\'t just play the game, you are the game. Xbox 360 is more games, entertainment and fun. What\'s In The Box? Xbox 360 4GB S Console Xbox 360 Black Wireless Controller Xbox 360 Composite A/V cable (standard definition) Xbox 360 HDMI Cable Xbox 360 Gaming Headset Built-in Wi-Fi: The new Xbox 360 is the only console with 802.11n Wi-Fi built-in for a faster and easier connection to Xbox LIVE. Stream HD movies and TV or download games from Xbox LIVE in 1080p and 5.1 surround sound from anywhere in the house. Compatible with b/g/n networks. Xbox LIVE: Xbox LIVE brings a world of entertainment to you. Instantly watch movies and TV streaming from Netflix. In crystal-clear HD, or download game add-ons like new levels, characters, maps and songs. Easily jump right into online multiplayer fun and play along with friends around the world. Plus, get your favorite music from Last.fm, connect with friends on Facebook and post Tweets on Twitter. Xbox LIVE is your connection to more games, entertainment and fun. Kinect Ready: Featuring a dedicated, specialized port, the Xbox 360 4GB is built to connect seamlessly with the Kinect Sensor. Kinect brings games and entertainment to life in extraordinary new ways - no controller required. Easy to use and instantly fun, Kinect gets everyone off the couch moving, laughing and cheering. See a ball? Kick it. Want to join a friend in the fun? Simply jump in. Even control an HD movie with a wave of your hand. Xbox 360 Wireless Controller (black): This award-winning, high-performance wireless controller features a range of up to 30 feet and a battery life of up to 30 hours on two AA batter','Tampa','FL','33626','150.00',NULL,NULL,'ron@connechub.com','2019-08-22 02:28:02','2019-08-22 02:29:34',9,171,NULL,NULL,26,'1305c0de-bfd5-4fd3-805a-e5ee7818730c/20190507_202911.mp4',NULL,NULL,NULL,1569032882,0,0),
(44,'test','test','bartow','FL','33830','0.00',NULL,NULL,'roadkilvx@gmail.com','2019-08-22 14:15:40','2019-08-22 14:15:51',5,32,27.8916,-81.8006,34,'c706fc50-b254-4f44-9eb9-6834dba0bddc/IMG_20181012_183935.mp4',NULL,NULL,NULL,1569075339,0,0),
(45,'Test','Test','Bartow','Fl','33830','0.00',NULL,NULL,'roadkilvx@gmail.com','2019-08-23 18:24:23','2019-08-23 18:25:10',5,35,27.8916,-81.8006,34,'3bb76806-fa1c-4641-aaec-d22b32d5e712/KVID0159.mp4',NULL,NULL,NULL,1569176663,0,0),
(49,'Ceiling fans','Brand new ceiling fans','charlotte','NC','28278','35.00',NULL,NULL,'xaviermclean@gmail.com','2019-08-25 23:04:59','2019-08-25 23:05:53',9,167,35.134,-81.0203,4,'be20e2cb-9c0a-4af7-86eb-60bffca79fa2/20190820_135743.mp4',NULL,NULL,NULL,1569366298,0,0),
(50,'Test','Test','Tampa','Florida ','33626','Test',NULL,NULL,'ron@connechub.com','2019-08-26 00:01:58','2019-08-26 00:01:58',1,1,NULL,NULL,26,NULL,NULL,NULL,NULL,1569369718,0,0),
(51,'Tangie’s Trinkets - Everything $5!','La’Tangela Bellamy is an Independent Consultant of Paparazzi Accessories. Tune into to her videos LIVE Sunday Lunch Party @ 12pm and Evening Bling Party @ 7pm, and Mondays, Wednesdays and Fridays @ 7pm. #TangiesTrinkets #TangieBlings2 https://www.facebook.com/1321692107/posts/10219872546347021?sfns=mo','Longs','SC','29526','5.00',NULL,NULL,'paul.b.bellamy@gmail.com','2019-09-04 02:31:30','2019-09-04 02:31:30',9,173,NULL,NULL,48,NULL,NULL,NULL,NULL,1570156289,0,0),
(52,'Punching bag','Nice punching bag great for working out. ','Lakeland ','Fl','33815','70',NULL,NULL,'ryan863davis@gmail.com','2019-09-05 15:50:43','2019-09-05 15:50:43',9,174,NULL,NULL,50,NULL,NULL,NULL,NULL,1570290643,0,0),
(53,'test a','test b','tampa','fl','33617','test a',NULL,NULL,'apurkett23@gmail.com','2019-09-08 10:31:52','2019-09-08 10:31:52',1,4,NULL,NULL,52,NULL,NULL,NULL,NULL,1570530712,0,0),
(55,'Test','Test','Tampa','FL','33626','5.00',NULL,NULL,'ron@connechub.com','2019-09-09 13:39:13','2019-09-09 13:39:13',1,2,NULL,NULL,26,NULL,NULL,NULL,NULL,1570628353,0,0),
(59,'blah','qafwevsdfwef','asdfawe','qseafqwe','fweqf','aserwefaw',NULL,NULL,'jonathanrcrozier@gmail.com','2019-09-10 02:14:19','2019-09-10 02:14:19',6,44,NULL,NULL,60,NULL,NULL,NULL,NULL,1570673659,3500,0),
(62,'Mirriroless camera ','I am selling my camera as is. as you see in the video it works. ','Tampa','Florida ','33626','150.00',NULL,NULL,'ron@connechub.com','2019-09-14 13:05:33','2019-09-14 13:07:54',9,171,NULL,NULL,26,'a92938c2-78f9-4e1e-9398-512c0aaf3f31/MVI_6084.mp4',NULL,NULL,NULL,1571058333,0,0),
(63,'DURAGADGET Rugged \'Urban Dweller\' SLR Camera Shoulder \'Sling\' Carry Bag','Introducing DURAGADGET\'s all new protective shoulder carry bag for Digital Cameras and accompanying accessories - perfect for keeping your Camera and desired Equipment close by and easily accessible.\r\n\r\nFeaturing multiple storage compartments, including three external pockets in addition to a netted bottle holder - the lightweight over the shoulder design is a perfect yet versatile way to transport your Camera and small accessories! The fully adjustable interior enables you to customize the sections to the desired size, through the use of velcro fastened memory foam partitions - perfect for protecting your expensive equipment from light drops, bumps or accidental damage.\r\n\r\nMade from durable polytex and formed into a semi-rigid protective shell, the water-resistant material helps to protect your camera if you get caught in a rain shower.\r\n\r\nThousands of cameras are broken each year when dropped whether during use or whilst in a case that does not provide enough protection. Our case comes with removable and adjustable partitions so you can provide custom padding for your camera or create your own custom compartments. Don\'t risk your expensive camera! \r\n\r\nInterior dimensions: 250 x 200 x 100 mm\r\n\r\n- Lightweight protective case that doesn\'t add too much bulk - perfect for daytrips!\r\n- Partitioned shock absorbing memory foam interior can be removed and adjusted to suit your needs\r\n- Adjustable padded shoulder strap enables comfortable transportation of your SLR & Accessories\r\n- Multiple storage compartments including an external Tablet pocket and netted water bottle holder\r\n- Hardwearing water-resistant and wipeable outer material, finished in a striking Black & Orange design\r\n','Tampa','FL','33626','20.00',NULL,NULL,'ron@connechub.com','2019-09-15 22:13:17','2019-09-15 22:16:10',9,171,NULL,NULL,26,'f73973ba-d7ee-4541-9c9d-85ea81a1302a/20190915_180456.mp4',NULL,NULL,NULL,1571177597,0,0),
(64,'UTLK® Galaxy Note 5 /S6 Edge+ Armband Orange Sports Arm band','UTLK® Galaxy Note 5 /S6 Edge+ Armband Orange Sports Arm band Defender Cases for Samsung Galaxy Note 5 or S6 Edge+ Plus with Key Holder Slot Easy Earphone Connection \r\n\r\n- Compatible with Samsung Galaxy Note 5 / Galaxy S6 Edge+ Plus. Lightweit slim armband keeps your smartphone insecure and protective condition \r\n\r\n- Comfortable and soft touch; Full HD Clear screen protector allows full functionality. Adjustable and strong elastic velcro with two slots ensures the armband protected and stabilizes device without slipping or constricting. and provides an easy on and off access; fits a variety of arm circumference sizes 10.24\"- 16.14\" (26cm to 41cm)and keeps your phone safe during exercise; Built in key pocket holder \r\n\r\n- Material: Lightweight soft neoprene that is molded to twist and bend but will not stretch out of shape. Washable with gentle soap and water, then air dry. Can keep sweat away from your phone \r\n\r\n- Access to all ports and functions.Quality neoprene back of the case resists sweat from exercise and will not stick to the skin; Earphone jack openings on the back for different smartphones \r\n\r\n- Built-in Reflective strip for safe running in low light Environment.You place order, we send you free gift Stylus pen \r\n\r\nProduct Description \r\n- Samsung Galaxy Note 5 / Galaxy S6 Edge+ but this armband still can be used for the device with below 5.5 inch screen \r\n\r\nColor: Orange as shown in the video\r\n\r\nThis arm band will keep your phone in safe custody and protect it from scratches, dusts, water resistant, sweat Proof and other elements. This Sport Armband is adjustable to fit your arm. It has a built-in screen clear protector that provides the total protection and easy access to the touch screen. The Armband with a fully adjustable Armband Velcro straps allow you to get the best position if you running/cycling etc. \r\n1 x Armband For Samsung Galaxy Note 5 / Galaxy S6 Edge+ \r\n\r\nCrystal Clear Window, perfect for Running and Workout, keep your device dry, full touch screen functionality \r\n\r\nProtects you Smartphones against rain, sweat, dust, dirt sand and snow. \r\nLight reflector feature allows to increase visibility in darkness. \r\nConvenient and easy to use. Easy access to ear phones and controls. Includes convenient key holder. ','Tampa','FL','33626','10.00',NULL,NULL,'ron@connechub.com','2019-09-15 22:18:04','2019-09-15 22:20:00',9,174,NULL,NULL,26,'0edde866-8549-47a3-97ba-a9038c313a55/20190507_141140.mp4',NULL,NULL,NULL,1571177884,0,0),
(68,'Brand new Yeezy Boost 700','Brand new Yeezy Boost 700 V2 **Never worn** men’s size 9','Charlotte ','NC','28269','350',NULL,NULL,'drew.boulder@gmail.com','2019-09-21 11:19:33','2019-09-21 11:20:57',9,168,NULL,NULL,57,'82beded1-4b32-418f-a7b9-05de4eb09817/trim.600532D3-C20A-492D-B3C9-28F69644B08D.mp4',NULL,NULL,NULL,1571656773,0,0),
(69,'Test','This is actedt','Tampa','Florida ','33626','Test',NULL,NULL,'ron@connechub.com','2019-09-21 11:27:39','2019-09-21 11:27:39',9,168,NULL,NULL,26,NULL,NULL,NULL,NULL,1571657259,0,0),
(71,'Idler pulley 2007 ls 460l and up','Idler pulley fornlexus ls 460 2007 and up brand new if you have over 100k you should change it voluntarily instead of letting is snap','charlotte','NC','28278','35.00',NULL,NULL,'xaviermclean@gmail.com','2019-09-24 22:13:47','2019-09-24 22:13:47',9,176,NULL,NULL,4,NULL,NULL,NULL,NULL,1571955227,1000,0),
(75,'Targus TG-50TR 50-Inch 3-Way Pan Head Tripod','Targus TG-50TR 50-Inch 3-Way Pan Head Tripod\r\n\r\n- Product description - Targus 50 inch 3 Way Pan Head Tripod \r\n- Product Dimensions - 3.1 x 3.1 x 16.9 inches \r\n- Item Weight - 1.45 pounds \r\n- Shipping Weight - 1.45 pounds \r\n- Item model number - TG-50TR ','Tampa','FL','33626','13.00',NULL,NULL,'ron@connechub.com','2019-09-29 02:08:54','2019-09-29 02:11:32',9,171,NULL,NULL,26,'c5a31cbd-53b6-4ff6-806f-586d9f48f53a/20190507_124951.mp4',NULL,NULL,NULL,1572314933,0,0),
(76,'Air max 720','Size 8.5 worn once most comfortable sneaker out there ','charlotte','NC','28278','100.00',NULL,NULL,'xaviermclean@gmail.com','2019-10-09 18:05:19','2019-10-09 18:05:54',9,168,NULL,NULL,4,'ea348b57-d5b6-42db-9f4f-f76436692731/20191009_135357.mp4',NULL,NULL,NULL,1573236319,0,0),
(77,'SD Card holder','Memory Card Carrying Case - Suitable for SDHC and SD Cards, 5 Pages and 22 Slots Memory Card Holder Bag Wallet Bag for Media Storage Organization (Blue)','Tampa','FL','33626','6.50',NULL,NULL,'ron@connechub.com','2019-10-13 16:20:58','2019-10-13 16:23:18',9,171,NULL,NULL,26,'fe5d3e39-652d-4896-8b9f-617837c89fbe/20190507_140117.mp4',NULL,NULL,NULL,1573575658,0,0),
(78,'Microsoft Xbox 360 4GB Black Console','- This product shows limited or no wear, and includes all original accessories \r\n- Built-in Wi-Fi for easy connection to Xbox LIVE \r\n- Xbox 360 has blockbuster games, HD movies and controller-free fun for everyone \r\n- Ready for the controller-free fun of Kinect \r\n- Super quiet with sleek new design plus matching controller \r\n\r\n\r\nThe new Xbox 360 250GB Console. Here today, ready for tomorrow with a brand new, leaner machine. Wi-Fi is built-in for easier connection to the world of entertainment on Xbox LIVE, where HD movies and TV stream in an instant. It\'s ready for the controller-free experiences of Kinect - you don\'t just play the game, you are the game. Xbox 360 is more games, entertainment and fun. What\'s In The Box? Xbox 360 4GB S Console Xbox 360 Black Wireless Controller Xbox 360 Composite A/V cable (standard definition) Xbox 360 HDMI Cable Xbox 360 Gaming Headset Built-in Wi-Fi: The new Xbox 360 is the only console with 802.11n Wi-Fi built-in for a faster and easier connection to Xbox LIVE. Stream HD movies and TV or download games from Xbox LIVE in 1080p and 5.1 surround sound from anywhere in the house. Compatible with b/g/n networks. Xbox LIVE: Xbox LIVE brings a world of entertainment to you. Instantly watch movies and TV streaming from Netflix. In crystal-clear HD, or download game add-ons like new levels, characters, maps and songs. Easily jump right into online multiplayer fun and play along with friends around the world. Plus, get your favorite music from Last.fm, connect with friends on Facebook and post Tweets on Twitter. Xbox LIVE is your connection to more games, entertainment and fun. Kinect Ready: Featuring a dedicated, specialized port, the Xbox 360 4GB is built to connect seamlessly with the Kinect Sensor. Kinect brings games and entertainment to life in extraordinary new ways - no controller required. Easy to use and instantly fun, Kinect gets everyone off the couch moving, laughing and cheering. See a ball? Kick it. Want to join a friend in the fun? Simply jump in. Even control an HD movie with a wave of your hand. Xbox 360 Wireless Controller (black): This award-winning, high-performance wireless controller features a range of up to 30 feet and a battery life of up to 30 hours on two AA batter','Tampa','FL','33626','150.00',NULL,NULL,'ron@connechub.com','2019-10-13 16:25:43','2019-10-13 16:27:28',9,181,NULL,NULL,26,'547a5a7d-61f9-4803-90e0-4509af05f05e/20190507_202911.mp4',NULL,NULL,NULL,1573575943,0,0),
(79,'Samsung Gear VR Virtual Reality Headset White Lightweight Easy to Use Wide FOV ','Samsung Gear VR Virtual Reality Headset White Lightweight Easy to Use Wide FOV \r\n\r\nLight weight so you can play and watch more comfortably \r\n\r\nEasy to use touch pad \r\n\r\nwide field of view, precise head-tracking and low latency brings reality to the virtual, Be transported to amazing new worlds, in games, video and images, Thousands of 360 degree panoramic photos \r\n\r\nCompatible with: Samsung Galaxy S7, S7 edge,Note5,S6 edge+,S6,S6 edge \r\n\r\nImproved fit, including room for most eyeglasses and improved padding for extra comfort and durability \r\n','Tampa','FL','33626','30.00',NULL,NULL,'ron@connechub.com','2019-10-13 16:41:58','2019-10-13 16:43:55',9,171,NULL,NULL,26,'e5322b0b-8390-454e-8b88-f5c4972567b4/20190714_204539.mp4',NULL,NULL,NULL,1573576918,0,0),
(80,'2 matching black end tables','2 matching black end tables','charlotte','NC','28278','60.00',NULL,NULL,'xaviermclean@gmail.com','2019-10-14 07:54:10','2019-10-14 07:54:29',9,167,NULL,NULL,4,'a5f806d9-8363-4cc1-a14c-89950c360e32/20191014_035101.mp4',NULL,NULL,NULL,1573631649,0,0),
(81,'Lady foamposite ones','8.5 lady foamposite ones brand new ','charlotte','NC','28278','150.00',NULL,NULL,'xaviermclean@gmail.com','2019-11-06 22:20:42','2019-11-06 22:20:42',9,168,NULL,NULL,4,NULL,NULL,NULL,NULL,1575670842,0,0),
(82,'DURAGADGET Rugged \'Urban Dweller\' SLR Camera Shoulder \'Sling\' Carry Bag','Introducing DURAGADGET\'s all new protective shoulder carry bag for Digital Cameras and accompanying accessories - perfect for keeping your Camera and desired Equipment close by and easily accessible.\r\n\r\nFeaturing multiple storage compartments, including three external pockets in addition to a netted bottle holder - the lightweight over the shoulder design is a perfect yet versatile way to transport your Camera and small accessories! The fully adjustable interior enables you to customize the sections to the desired size, through the use of velcro fastened memory foam partitions - perfect for protecting your expensive equipment from light drops, bumps or accidental damage.\r\n\r\nMade from durable polytex and formed into a semi-rigid protective shell, the water-resistant material helps to protect your camera if you get caught in a rain shower.\r\n\r\nThousands of cameras are broken each year when dropped whether during use or whilst in a case that does not provide enough protection. Our case comes with removable and adjustable partitions so you can provide custom padding for your camera or create your own custom compartments. Don\'t risk your expensive camera! \r\n\r\nInterior dimensions: 250 x 200 x 100 mm\r\n\r\n- Lightweight protective case that doesn\'t add too much bulk - perfect for daytrips!\r\n- Partitioned shock absorbing memory foam interior can be removed and adjusted to suit your needs\r\n- Adjustable padded shoulder strap enables comfortable transportation of your SLR & Accessories\r\n- Multiple storage compartments including an external Tablet pocket and netted water bottle holder\r\n- Hardwearing water-resistant and wipeable outer material, finished in a striking Black & Orange design','Tampa','FL','33626','30.00',NULL,NULL,'ron@connechub.com','2019-11-14 19:50:57','2019-11-14 19:50:57',9,171,NULL,NULL,26,NULL,NULL,NULL,NULL,1576353057,0,0),
(83,'Xbox 360 250GB Slim Console','Xbox 360 250GB Slim Console\r\n\r\n- This product shows limited or no wear, and includes all original accessories \r\n- Built-in Wi-Fi for easy connection to Xbox LIVE \r\n- Xbox 360 has blockbuster games, HD movies and controller-free fun for everyone \r\n- Ready for the controller-free fun of Kinect \r\n- Super quiet with sleek new design plus matching controller \r\n\r\n\r\nThe new Xbox 360 250GB Console. Here today, ready for tomorrow with a brand new, leaner machine. Wi-Fi is built-in for easier connection to the world of entertainment on Xbox LIVE, where HD movies and TV stream in an instant. It\'s ready for the controller-free experiences of Kinect - you don\'t just play the game, you are the game. Xbox 360 is more games, entertainment and fun. What\'s In The Box? Xbox 360 4GB S Console Xbox 360 Black Wireless Controller Xbox 360 Composite A/V cable (standard definition) Xbox 360 HDMI Cable Xbox 360 Gaming Headset Built-in Wi-Fi: The new Xbox 360 is the only console with 802.11n Wi-Fi built-in for a faster and easier connection to Xbox LIVE. Stream HD movies and TV or download games from Xbox LIVE in 1080p and 5.1 surround sound from anywhere in the house. Compatible with b/g/n networks. Xbox LIVE: Xbox LIVE brings a world of entertainment to you. Instantly watch movies and TV streaming from Netflix. In crystal-clear HD, or download game add-ons like new levels, characters, maps and songs. Easily jump right into online multiplayer fun and play along with friends around the world. Plus, get your favorite music from Last.fm, connect with friends on Facebook and post Tweets on Twitter. Xbox LIVE is your connection to more games, entertainment and fun. Kinect Ready: Featuring a dedicated, specialized port, the Xbox 360 4GB is built to connect seamlessly with the Kinect Sensor. Kinect brings games and entertainment to life in extraordinary new ways - no controller required. Easy to use and instantly fun, Kinect gets everyone off the couch moving, laughing and cheering. See a ball? Kick it. Want to join a friend in the fun? Simply jump in. Even control an HD movie with a wave of your hand. Xbox 360 Wireless Controller (black): This award-winning, high-performance wireless controller features a range of up to 30 feet and a battery life of up to 30 hours on two AA batter','Tampa','FL','33626','150.00',NULL,NULL,'ron@connechub.com','2019-11-15 17:03:14','2019-11-15 17:07:23',9,171,NULL,NULL,26,'1eeaa289-eb89-4468-a192-54de281a61b6/20190507_202911.mp4',NULL,NULL,NULL,1576429394,0,0);
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
(1'Activities & Events',1,0),
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
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/* Password hashes have been replaces w/ random string hashes and then truncated. No real passwords are in here. */
INSERT INTO `users` VALUES
(1,'test@test.com','$2a$11$55LPJotj3bLxv2W9PSPZGelABNBgwyNxsFOpUyIZScDhKgGiIeHwC',NULL,NULL,'2019-02-11 00:49:54',13,'2019-09-23 01:15:10','2019-05-27 04:46:40','47.200.2.224','47.200.23.175','2019-01-09 01:22:02','2019-09-23 01:15:10','test',NULL,NULL,NULL,NULL,NULL),
(2,'davis.ron@hotmail.com','$2a$11$BRsirOvFLTymMb2DXsgEz.','89cf836a03240998bac7beb6493018747842eda5bf647ed8af18768f019d8b86','2019-09-10 11:54:28',NULL,104,'2019-05-23 00:06:32','2019-05-21 11:39:49','96.58.200.191','96.58.200.191','2019-01-09 03:05:49','2019-09-10 11:54:28','myconnec','I love to buy, sell and trade anything!!',NULL,'image/jpeg',1204116,'2019-01-12 01:05:38'),
(3,'jjones850.jj@gmail.com','$2a$11$',NULL,NULL,NULL,8,'2019-01-24 00:31:24','2019-01-22 20:37:03','96.58.200.191','107.77.253.7','2019-01-20 17:32:38','2019-01-24 00:31:24','jjones','House of Fragrance & Decor',NULL,'image/jpeg',79544,'2019-01-21 16:29:20'),
(4,'xaviermclean@gmail.com','$2a$11$/QQ6sjnqLVHRJgyIwPVYUm5GEhkn4C',NULL,NULL,'2019-09-24 22:12:01',7,'2019-11-06 22:19:03','2019-10-14 07:53:04','75.182.129.75','75.182.129.75','2019-01-24 05:41:38','2019-11-06 22:19:03','Xaviermclean',NULL,NULL,NULL,NULL,NULL),
(5,'j_nice33614@yahoo.com','$2a$11$9GlREjpp3HD8oh.',NULL,NULL,NULL,2,'2019-09-09 03:17:40','2019-01-24 17:25:34','174.228.130.194','66.87.149.112','2019-01-24 17:25:34','2019-09-09 03:17:40','Jnice336',NULL,NULL,NULL,NULL,NULL),
(6,'dontrez89@gmail.com','$2a$11$nv6POw2cKh/',NULL,NULL,NULL,1,'2019-01-24 22:02:32','2019-01-24 22:02:32','71.68.104.225','71.68.104.225','2019-01-24 22:02:31','2019-01-24 22:02:32','Jon89',NULL,NULL,NULL,NULL,NULL),
(7,'henderson272000@yahoo.com','$2a$11$56zS/.y','60dd16cbb26bbc9a50be28e04cd9b58f6dc548510b7bcc5127da5216c100d9ba','2019-08-26 11:08:26',NULL,4,'2019-11-08 18:10:41','2019-08-29 14:12:52','173.125.92.112','173.115.16.246','2019-01-24 22:35:29','2019-11-08 18:10:41','Deshon',NULL,NULL,NULL,NULL,NULL),
(8,'rondavis818@gmail.com','$2a$11$.pz09ytxloX.ZVuR49U6Bu',NULL,NULL,NULL,4,'2019-08-25 23:45:47','2019-08-25 13:51:19','96.58.200.191','96.58.200.191','2019-01-24 23:34:49','2019-08-25 23:45:47','92ways',NULL,NULL,NULL,NULL,NULL),
(9,'michaelcjones40@gmail.com','$2a$11$/rxecMHm0JiekSEbmuii9Ao.NpC',NULL,NULL,NULL,1,'2019-01-25 01:34:16','2019-01-25 01:34:16','73.7.60.158','73.7.60.158','2019-01-25 01:34:16','2019-01-25 01:34:16','Michael',NULL,NULL,NULL,NULL,NULL),
(10,'cohila@yahoo.com','$2a$11$',NULL,NULL,NULL,7,'2019-08-26 03:25:31','2019-08-25 04:47:54','96.58.200.191','96.58.200.191','2019-01-31 05:39:03','2019-08-26 03:25:31','cohila',NULL,NULL,NULL,NULL,NULL),
(11,'atorres2kg@aol.com','$2a$11$t0C5lGrsF9G.Xx4nqAtYpO.',NULL,NULL,NULL,9,'2019-04-27 01:57:25','2019-04-18 01:35:57','47.205.129.43','47.205.129.43','2019-02-01 01:08:00','2019-04-27 01:57:25','Debton2000',NULL,NULL,NULL,NULL,NULL),
(12,'test_2@test.com','$2a$11$yY7eP5s/u8eTFlh7d2hqLOE2kgLi.',NULL,NULL,NULL,2,'2019-02-02 02:07:41','2019-02-02 01:42:19','65.35.89.87','65.35.89.87','2019-02-02 01:42:19','2019-02-02 02:07:41','test_2',NULL,NULL,NULL,NULL,NULL),
(13,'charlottehomeconnection@gmail.com','$2a$11$H/.bz9lXoeA5oHKjrbvjZSfbOQFfXynoY6',NULL,NULL,NULL,1,'2019-02-02 02:25:42','2019-02-02 02:25:42','166.137.10.25','166.137.10.25','2019-02-02 02:25:42','2019-02-02 02:25:42','robynjefferson',NULL,NULL,NULL,NULL,NULL),
(14,'davisryan863@gmail.com','$2a$11$Kv7pT4Hmij8QVxgK2x/Iy..vAhCaYtjuSHvfx.6LDI4gqtG',NULL,NULL,NULL,1,'2019-02-02 02:36:17','2019-02-02 02:36:17','65.34.80.92','65.34.80.92','2019-02-02 02:36:17','2019-02-02 02:36:17','VolyNumBer6',NULL,NULL,NULL,NULL,NULL),
(15,'tarraweddingplanner@yahoo.com','$2a$11$eBwvXt...pV/nvZg4eW',NULL,NULL,NULL,1,'2019-02-02 06:09:23','2019-02-02 06:09:23','68.200.173.227','68.200.173.227','2019-02-02 06:09:23','2019-02-02 06:09:23','Tstapleton ',NULL,NULL,NULL,NULL,NULL),
(16,'padolan1203@gmail.com','$2a$11$xE6WtZynMz5wn4wcHBSu4.','333d60fc68946c4ff22ae290265a8d14eb6ca9f9bc92807105f8e8e8f69dcfae','2019-02-03 04:18:09',NULL,1,'2019-02-03 02:44:50','2019-02-03 02:44:50','75.178.128.32','75.178.128.32','2019-02-03 02:44:50','2019-02-03 04:18:09','Padolan',NULL,NULL,NULL,NULL,NULL),
(17,'mrwillymac@gmail.com','$2a$11$oiSarBAlWJAAzcGkciNxYOUwb//IVrbpWXS//Yky',NULL,NULL,NULL,1,'2019-02-06 03:47:55','2019-02-06 03:47:55','107.77.104.16','107.77.104.16','2019-02-06 03:47:55','2019-02-06 03:47:55','mrwillymac',NULL,NULL,NULL,NULL,NULL),
(18,'williams.joseph8587@gmail.com','$2a$11$.VeGUvu',NULL,NULL,'2019-09-11 02:52:16',2,'2019-09-11 02:52:16','2019-02-07 15:12:44','172.58.102.216','172.58.108.140','2019-02-07 15:12:44','2019-09-11 02:56:27','JoeCool','','20190305_191029.jpg','image/jpeg',1825384,'2019-09-11 02:56:26'),
(19,'jazminminjares97@gmail.com','$2a$11$.zwUsr4mJq',NULL,NULL,NULL,1,'2019-02-07 16:04:05','2019-02-07 16:04:05','47.205.76.160','47.205.76.160','2019-02-07 16:04:05','2019-02-07 16:04:05','Jazzy0604',NULL,NULL,NULL,NULL,NULL),
(20,'yohone34@gmail.com','$2a$11$.vD.RpNsSweTrjBYQPjrHLJ77587Hb8Y4YG',NULL,NULL,NULL,1,'2019-02-08 05:06:44','2019-02-08 05:06:44','107.77.94.118','107.77.94.118','2019-02-08 05:06:44','2019-02-08 05:06:44','Phaded Vizionz',NULL,NULL,NULL,NULL,NULL),
(21,'arwill01@gmail.com','$2a$11$/GtZ2fScC5rRdwukUt3o42DOElGRurm',NULL,NULL,NULL,1,'2019-02-11 22:55:13','2019-02-11 22:55:13','107.137.238.8','107.137.238.8','2019-02-11 22:55:13','2019-02-11 22:55:13','arwill01',NULL,NULL,NULL,NULL,NULL),
(22,'tiffany_douglas@hotmail.com','$2a$11$/l9jsyZupXseMsm42EXpAC7CSwb7jh7g2bOMNHZolSq',NULL,NULL,NULL,2,'2019-08-22 00:41:51','2019-02-13 01:28:31','73.7.60.158','73.7.60.158','2019-02-13 01:28:31','2019-08-22 00:41:51','Tiffany Jones',NULL,NULL,NULL,NULL,NULL),
(23,'samuelruth66@gamil.com','$2a$11$.cq/9jYeoXv.c95tAVT.51oIjPFJvCWvWm5l5Aq',NULL,NULL,NULL,1,'2019-03-06 19:32:23','2019-03-06 19:32:23','197.210.54.13','197.210.54.13','2019-03-06 19:32:23','2019-03-06 19:32:23','Elohor',NULL,NULL,NULL,NULL,NULL),
(24,'myfinchjones@gmail.com','$2a$11$.Zxk3dZ6sZEsKdy0RU8g6QIz5hPp.1BW',NULL,NULL,'2019-08-22 20:33:18',2,'2019-08-22 20:33:18','2019-03-23 03:50:48','205.145.107.77','68.200.143.127','2019-03-23 03:50:48','2019-08-22 20:33:18','OPOKUWAY',NULL,NULL,NULL,NULL,NULL),
(25,'joseph.willliams8587@gmail.com','$2a$11$.twXhF7LFaua',NULL,NULL,NULL,1,'2019-04-03 05:12:53','2019-04-03 05:12:53','172.56.6.219','172.56.6.219','2019-04-03 05:12:53','2019-04-03 05:12:53','JosephWilli',NULL,NULL,NULL,NULL,NULL),
(26,'ron@connechub.com','$2a$11$SgMEseGcZzy2W2n..42gX0vx3CPK6CUVSF1W',NULL,NULL,NULL,115,'2019-11-16 17:24:48','2019-11-16 16:24:12','96.58.200.191','96.58.200.191','2019-05-27 23:54:49','2019-11-16 17:24:48','Connechub CEO','Connecting you with jobs, goods, and services in your community. ','connechub-facebook-icon-2019.png','image/png',1267,'2019-08-21 01:12:35'),
(27,'me@davidjeddy.com','$2a$11$.MyrlwYpLCRNbGFkCwfdm',NULL,NULL,NULL,6,'2019-08-25 04:20:32','2019-08-25 04:04:54','47.200.2.224','47.200.2.224','2019-08-18 22:20:02','2019-08-25 04:20:32','David','It\'s me, Mario','IMG_0113.JPG','image/jpeg',738756,'2019-08-19 04:37:08'),
(28,'desiwithers.dw@gmail.com','$2a$11$.yXn7QA8m0r2qx/XukcF94Rzq2bMKtMy',NULL,NULL,NULL,1,'2019-08-21 05:23:54','2019-08-21 05:23:54','208.69.133.72','208.69.133.72','2019-08-21 05:23:54','2019-08-21 05:23:54','desiwithers',NULL,NULL,NULL,NULL,NULL),
(29,'cdavis7023@gmail.com','$2a$11$2YGq6Yh0gFav4yvVVvadY.',NULL,NULL,NULL,1,'2019-08-21 07:13:25','2019-08-21 07:13:25','172.58.173.112','172.58.173.112','2019-08-21 07:13:25','2019-08-21 07:13:25','CARLA0702',NULL,NULL,NULL,NULL,NULL),
(30,'_ncobi1@gmail.com','','',NULL,NULL,4,'2019-08-22 02:16:30','2019-08-22 02:15:06','67.197.190.12','67.197.190.12','2019-08-21 08:01:34','2019-08-22 02:16:30','Ncobi1','Fashion Designer of UnDaunted custom clothing,  NicCouture edgy luxury clothing,  and ThickUMS women\'s lingerie. ','IMG_20190704_172756_257.jpg','image/jpeg',159273,'2019-08-21 11:07:54'),
(31,'rashondalafaye1006@yahoo.com','$2a$11$.bIwZ4e1Pb3ZmppYfKQgyT9uzdpLXlm',NULL,NULL,NULL,2,'2019-11-13 13:01:12','2019-08-21 11:28:38','23.124.90.226','172.58.105.20','2019-08-21 11:28:38','2019-11-13 13:01:12','Lafaye1006',NULL,NULL,NULL,NULL,NULL),
(32,'maddoxwillie026@gmail.com','$2a$11$',NULL,NULL,NULL,1,'2019-08-22 01:31:19','2019-08-22 01:31:19','172.58.153.67','172.58.153.67','2019-08-22 01:31:19','2019-08-22 01:31:19','Willie',NULL,NULL,NULL,NULL,NULL),
(33,'sillyviet@gmail.com','$2a$11$YuNU/sznJA2fLTxzXcv9/',NULL,NULL,NULL,2,'2019-08-30 23:52:15','2019-08-22 07:57:31','108.193.49.82','108.193.49.82','2019-08-22 07:57:31','2019-08-30 23:52:15','Sillyviet',NULL,NULL,NULL,NULL,NULL),
(34,'roadkilvx@gmail.com','$2a$11$',NULL,NULL,NULL,4,'2019-08-23 18:23:06','2019-08-22 14:08:38','199.253.243.19','73.55.111.248','2019-08-22 14:06:25','2019-08-23 18:23:06','roadkilvx','geeegegegegge','PANO_20181012_184035jpeg.jpg','image/jpeg',104258,'2019-08-22 14:14:09'),
(35,'myconnec@gmail.com','$2a$11$/cBh67Q0iMoQfPEq',NULL,NULL,NULL,1,'2019-08-22 23:48:03','2019-08-22 23:48:03','96.58.200.191','96.58.200.191','2019-08-22 23:48:03','2019-08-22 23:48:03','Ronald ',NULL,NULL,NULL,NULL,NULL),
(36,'darrenhenderson3@gmail.com','$2a$11$T7I3BBymXNf5nxZw7dEbOefFugFwJXa0P9ZMbaSPJ8EksBUw8Hg.',NULL,NULL,NULL,1,'2019-08-23 00:38:39','2019-08-23 00:38:39','73.122.130.228','73.122.130.228','2019-08-23 00:38:39','2019-08-23 00:38:39','dh226326',NULL,NULL,NULL,NULL,NULL),
(37,'shalondajefferson76@gmail.com','$2a$11$.8h.thluB4h4hsy9kSyYnfFc5Ps/j3FoqU1idMa',NULL,NULL,NULL,1,'2019-08-24 14:01:23','2019-08-24 14:01:23','174.49.122.143','174.49.122.143','2019-08-24 14:01:23','2019-08-24 14:01:23','Shalonda Jefferson ',NULL,NULL,NULL,NULL,NULL),
(38,'808knock@gmail.com','$2a$11$',NULL,NULL,NULL,1,'2019-08-24 21:15:05','2019-08-24 21:15:05','68.200.143.127','68.200.143.127','2019-08-24 21:15:05','2019-08-24 21:17:15','finchjones','',NULL,NULL,NULL,NULL),
(39,'lkstimp3@gmail.com','$2a$11$.acA55xI88F.WKqUPsZ8W',NULL,NULL,NULL,1,'2019-08-25 16:19:44','2019-08-25 16:19:44','99.181.46.18','99.181.46.18','2019-08-25 16:19:44','2019-08-25 16:19:44','2bjustme ',NULL,NULL,NULL,NULL,NULL),
(40,'tamikaplant@yahoo.com','$2a$11$',NULL,NULL,NULL,1,'2019-08-25 22:22:48','2019-08-25 22:22:48','70.180.167.10','70.180.167.10','2019-08-25 22:22:48','2019-08-25 22:22:48','Tamika Plant',NULL,NULL,NULL,NULL,NULL),
(41,'keithdbarnwell@gmail.com','$2a$11$/ByzmZRIKwJ5vU/.zfBbW',NULL,NULL,'2019-08-26 20:55:34',2,'2019-08-26 20:55:34','2019-08-26 02:10:31','99.203.4.68','98.192.104.224','2019-08-26 02:10:31','2019-08-26 20:55:34','Kbarnw01 ',NULL,NULL,NULL,NULL,NULL),
(42,'allochka-sergeeva-1984@mail.ru','$2a$11$.7U8oAWJr/MnzLez3a3p2o54QzOBpHDS',NULL,NULL,NULL,1,'2019-08-26 10:18:55','2019-08-26 10:18:55','185.214.187.253','185.214.187.253','2019-08-26 10:18:55','2019-08-26 10:18:55','',NULL,NULL,NULL,NULL,NULL),
(43,'insctiptbox@gmail.com','$2a$11$vwJ/4/',NULL,NULL,NULL,1,'2019-08-26 10:53:25','2019-08-26 10:53:25','105.155.250.63','105.155.250.63','2019-08-26 10:53:25','2019-08-26 10:53:25','hugunyhyn',NULL,NULL,NULL,NULL,NULL),
(44,'tlinkageihs@gmail.com','$2a$11$2ThEpRH06C49q9.0uhHnZ./7Q9BCLxvC',NULL,NULL,NULL,1,'2019-08-26 16:22:50','2019-08-26 16:22:50','47.205.137.4','47.205.137.4','2019-08-26 16:22:50','2019-08-26 16:22:50','Tlemmon',NULL,NULL,NULL,NULL,NULL),
(45,'simon.earleace@gmail.com','$2a$11$y..uPxtjRlJTlg7cXWtHMoDZqk5z36Cf.i',NULL,NULL,NULL,1,'2019-08-27 15:08:30','2019-08-27 15:08:30','107.77.204.145','107.77.204.145','2019-08-27 15:08:30','2019-08-27 15:08:30','Searle',NULL,NULL,NULL,NULL,NULL),
(46,'vasya.nikolayenko1@mail.ru','$2a$11$8870wVv3fek6i31bd/',NULL,NULL,NULL,1,'2019-08-30 12:33:16','2019-08-30 12:33:16','188.130.136.84','188.130.136.84','2019-08-30 12:33:16','2019-08-30 12:33:16','56KsHhnkxiQ',NULL,NULL,NULL,NULL,NULL),
(47,'the_red_spot@yahoo.com','$2a$11$U2NkmgODYtha5KF2VObsK..fU/lm8OH2OhBt.',NULL,NULL,NULL,2,'2019-09-10 00:36:57','2019-08-31 22:28:38','172.58.7.7','70.89.255.109','2019-08-31 22:28:38','2019-09-10 00:36:57','The Red Spot Salon',NULL,NULL,NULL,NULL,NULL),
(48,'paul.b.bellamy@gmail.com','$2a$11$6QO./Hqku.hehf6BMamAq.',NULL,NULL,NULL,1,'2019-09-04 02:19:01','2019-09-04 02:19:01','75.183.168.244','75.183.168.244','2019-09-04 02:19:01','2019-09-04 02:19:01','Iammyself ',NULL,NULL,NULL,NULL,NULL),
(49,'junahday01@gmail.com','$2a$11$.zPVmbxcVJdnvsqAWpNhnG',NULL,NULL,NULL,1,'2019-09-05 12:38:54','2019-09-05 12:38:54','71.203.171.93','71.203.171.93','2019-09-05 12:38:54','2019-09-05 12:38:54','Cousins',NULL,NULL,NULL,NULL,NULL),
(50,'ryan863davis@gmail.com','$2a$11$so3uTl0enJ0QQ7U/.c1oLrUhLWBs1ah2',NULL,NULL,NULL,3,'2019-09-05 16:03:31','2019-09-05 15:31:56','174.253.162.173','174.253.162.173','2019-09-05 15:26:25','2019-09-05 16:03:31','VOLY_NUMBER_6 ','My PAGE is about networking ','Screenshot_20190901-173901_Drive.jpg','image/jpeg',197700,'2019-09-05 15:31:25'),
(51,'eddieesco@gmail.com','$2a$11$vtq8bRKYUhUlBD.//6GTq7Jjb6OnDO0BG.y',NULL,NULL,NULL,1,'2019-09-05 23:53:02','2019-09-05 23:53:02','69.132.87.168','69.132.87.168','2019-09-05 23:53:02','2019-09-05 23:53:02','eddieescoqc',NULL,NULL,NULL,NULL,NULL),
(52,'apurkett23@gmail.com','$2a$11$.GCEnSvBqN./8WvdFJziDGNxX.6',NULL,NULL,NULL,4,'2019-09-08 10:29:11','2019-09-08 10:28:50','159.53.110.144','199.253.243.17','2019-09-08 10:27:18','2019-09-08 10:30:42','apurkett23','uki ni nam','Scottie_Pippen_Charlotte_Bobcats_v_Chicago_R9IFfzZhTy1l.jpg','image/jpeg',64148,'2019-09-08 10:30:42'),
(53,'jmuntner@gmail.com','$2a$11$roGMyZAgUG.9KXzOoorM..',NULL,NULL,NULL,3,'2019-09-09 14:38:31','2019-09-08 16:48:00','199.253.243.18','47.196.13.173','2019-09-08 16:46:55','2019-09-09 14:38:31','Jasonmuntner',NULL,NULL,NULL,NULL,NULL),
(54,'mscraft27@yahoo.com','$2a$11$j45cV9UsByzjfI/',NULL,NULL,NULL,1,'2019-09-08 22:11:01','2019-09-08 22:11:01','72.186.49.95','72.186.49.95','2019-09-08 22:11:01','2019-09-08 22:11:01','mscraft27',NULL,NULL,NULL,NULL,NULL),
(55,'baybay1958@yahoo.com','$2a$11$wiN4p.Ttkw4D54ZhP/',NULL,NULL,NULL,1,'2019-09-09 03:08:23','2019-09-09 03:08:23','172.73.37.236','172.73.37.236','2019-09-09 03:08:23','2019-09-09 03:08:23','Tkenne08',NULL,NULL,NULL,NULL,NULL),
(56,'guiade143@gmail.com','$2a$11$',NULL,NULL,NULL,1,'2019-09-09 03:16:51','2019-09-09 03:16:51','172.58.102.145','172.58.102.145','2019-09-09 03:16:51','2019-09-09 03:16:51','Naturally_sweet',NULL,NULL,NULL,NULL,NULL),
(57,'drew.boulder@gmail.com','$2a$11$wMdlRv8Zrlk7AgJtxlTo/.kCL9rxN5okb8TUeqqm',NULL,NULL,NULL,2,'2019-09-20 23:11:33','2019-09-09 13:49:43','99.24.216.14','99.24.216.14','2019-09-09 13:49:43','2019-09-20 23:11:33','lamarcd',NULL,NULL,NULL,NULL,NULL),
(58,'lkstimp1@gmail.com','$2a$11$.RWoI6IO',NULL,NULL,NULL,7,'2019-09-11 20:56:10','2019-09-10 00:22:16','99.181.46.18','99.181.46.18','2019-09-09 14:49:00','2019-09-11 20:56:10','2bjustme2','','IMG_0061_(1).JPG','image/jpeg',69215,'2019-09-09 16:39:27'),
(59,'amccoy80@hotmail.com','$2a$11$n5o..E3G5/5ixe',NULL,NULL,NULL,1,'2019-09-09 22:26:52','2019-09-09 22:26:52','75.74.102.24','75.74.102.24','2019-09-09 22:26:52','2019-09-09 22:26:52','Alexlm',NULL,NULL,NULL,NULL,NULL),
(60,'jonathanrcrozier@gmail.com','$2a$11$.X5sPJd6Vhs/p2pr5ouS0HxoFjjaPCqO',NULL,NULL,NULL,4,'2019-09-10 01:54:58','2019-09-10 01:47:44','68.207.249.5','68.207.249.5','2019-09-10 01:28:33','2019-09-10 02:06:18','jonnyfcr','ABC ASDFLKAJWEFOPAIWFEJ',NULL,NULL,NULL,NULL),
(61,'tcritchie305@gmail.com','$2a$11$TuNkVhVWd/',NULL,NULL,NULL,1,'2019-09-10 05:58:45','2019-09-10 05:58:45','66.87.9.205','66.87.9.205','2019-09-10 05:58:45','2019-09-10 05:58:45','Thomasbe12',NULL,NULL,NULL,NULL,NULL),
(62,'mzyoyo1970@yahoo.com','$2a$11$.r.6BG',NULL,NULL,NULL,1,'2019-09-11 01:04:28','2019-09-11 01:04:28','172.58.172.177','172.58.172.177','2019-09-11 01:04:28','2019-09-11 01:04:28','Mzyoyo1',NULL,NULL,NULL,NULL,NULL),
(63,'verafolkovagio@mail.ru','$2a$11$lOPagNJsyyjpwJyo3Lu1R.',NULL,NULL,NULL,1,'2019-09-11 19:36:35','2019-09-11 19:36:35','178.162.69.162','178.162.69.162','2019-09-11 19:36:35','2019-09-11 19:36:35','wXKQ2Fqf',NULL,NULL,NULL,NULL,NULL),
(64,'cwwil851@gmail.com','$2a$11$BVwWwX9///lmnTjtbj.',NULL,NULL,NULL,1,'2019-09-19 00:06:08','2019-09-19 00:06:08','172.56.21.109','172.56.21.109','2019-09-19 00:06:08','2019-09-19 00:06:08','Cwwil851',NULL,NULL,NULL,NULL,NULL),
(65,'shopandreviewdiva@gmail.com','$2a$11$foAkXmZ./TKe',NULL,NULL,NULL,1,'2019-09-20 01:15:54','2019-09-20 01:15:54','69.132.2.10','69.132.2.10','2019-09-20 01:15:54','2019-09-20 01:15:54','misskiaj',NULL,NULL,NULL,NULL,NULL),
(66,'ee277148@gmail.com','$2a$11$/43P4zY67y.2uqLF9Px6',NULL,NULL,NULL,2,'2019-09-30 11:45:22','2019-09-30 11:33:49','41.203.73.177','41.203.73.177','2019-09-30 11:33:49','2019-09-30 11:45:22','vvide',NULL,NULL,NULL,NULL,NULL),
(67,'nitalecep1981@mail.ru','$2a$11$/lEB4LK',NULL,NULL,NULL,1,'2019-10-01 15:46:24','2019-10-01 15:46:24','167.86.117.115','167.86.117.115','2019-10-01 15:46:24','2019-10-01 15:46:24',' kGq0dHJ1Zm',NULL,NULL,NULL,NULL,NULL),
(68,'tangieblings2@gmail.com','$2a$11$r0./nO9kmccgdwC6nyphu',NULL,NULL,NULL,1,'2019-10-05 01:03:13','2019-10-05 01:03:13','75.183.168.244','75.183.168.244','2019-10-05 01:03:13','2019-10-05 01:03:13','TangiesTrinkets',NULL,NULL,NULL,NULL,NULL),
(69,'dwade993@gmail.com','$2a$11$o6hZlMGJu8LofKgtAxz5w.',NULL,NULL,NULL,1,'2019-10-07 09:35:03','2019-10-07 09:35:03','65.34.77.200','65.34.77.200','2019-10-07 09:35:03','2019-10-07 09:35:03','Derek wade',NULL,NULL,NULL,NULL,NULL),
(70,'cenatuslawrens@gmail.com','$2a$11$',NULL,NULL,NULL,1,'2019-10-15 20:59:12','2019-10-15 20:59:12','172.58.172.219','172.58.172.219','2019-10-15 20:59:12','2019-10-15 20:59:12','Donmecca',NULL,NULL,NULL,NULL,NULL),
(71,'dmitrievasa1988@bk.ru','$2a$11$uZSbw/AOWFbDMzG9n7eZg..',NULL,NULL,NULL,1,'2019-10-28 11:49:58','2019-10-28 11:49:58','109.248.139.89','109.248.139.89','2019-10-28 11:49:58','2019-10-28 11:49:58','NI3G1P1 www.yandex.ru',NULL,NULL,NULL,NULL,NULL),
(72,'dianochka.sergeeva.88@list.ru','$2a$11$..1qv4qXmN//rO1vYB4xS',NULL,NULL,NULL,1,'2019-10-30 23:51:33','2019-10-30 23:51:33','79.133.186.4','79.133.186.4','2019-10-30 23:51:33','2019-10-30 23:51:33','6B9TzHer7Hj www.google.ru',NULL,NULL,NULL,NULL,NULL),
(73,'binar5496@mail.ru','$2a$11$/B6o6cuEl8NU5e',NULL,NULL,NULL,1,'2019-11-02 16:51:25','2019-11-02 16:51:25','79.133.186.4','79.133.186.4','2019-11-02 16:51:25','2019-11-02 16:51:25','ZHAZG4TeyB www.yandex.ru',NULL,NULL,NULL,NULL,NULL),
(74,'onestoptaxes101@gmail.com','$2a$11$.',NULL,NULL,NULL,1,'2019-11-12 02:02:15','2019-11-12 02:02:15','104.139.34.158','104.139.34.158','2019-11-12 02:02:15','2019-11-12 02:02:15','DuvalTaxService',NULL,NULL,NULL,NULL,NULL),
(75,'d_hoge@bk.ru','$2a$11$',NULL,NULL,NULL,1,'2019-11-14 17:49:11','2019-11-14 17:49:11','185.214.187.253','185.214.187.253','2019-11-14 17:49:11','2019-11-14 17:49:11','w7gClOc0lH www.yandex.ru',NULL,NULL,NULL,NULL,NULL);
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
INSERT INTO `votes` VALUES
(2,1,'Listing',2,'User',1,NULL,1,'2019-01-12 07:00:44','2019-01-12 07:00:44'),
(3,8,'Listing',2,'User',1,NULL,1,'2019-01-21 00:52:11','2019-01-21 00:52:11'),
(5,11,'Listing',2,'User',1,NULL,1,'2019-02-06 09:09:37','2019-02-06 09:09:37'),
(8,17,'Listing',2,'User',1,NULL,1,'2019-05-08 11:51:22','2019-05-08 11:51:22'),
(9,34,'Listing',26,'User',1,NULL,1,'2019-05-30 00:18:23','2019-05-30 00:18:23'),
(10,41,'Listing',30,'User',1,NULL,1,'2019-08-21 11:08:49','2019-08-21 11:08:49'),
(11,41,'Listing',26,'User',1,NULL,1,'2019-08-21 22:17:41','2019-08-21 22:17:41'),
(13,43,'Listing',26,'User',1,NULL,1,'2019-08-25 21:56:49','2019-08-25 21:56:49'),
(14,43,'Listing',52,'User',1,NULL,1,'2019-09-08 10:35:18','2019-09-08 10:35:18'),
(17,75,'Listing',26,'User',1,NULL,1,'2019-09-29 02:12:42','2019-09-29 02:12:42'),
(18,80,'Listing',26,'User',1,NULL,1,'2019-10-16 03:04:07','2019-10-16 03:04:07'),
(19,83,'Listing',26,'User',1,NULL,1,'2019-11-15 18:41:21','2019-11-15 18:41:21');
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
