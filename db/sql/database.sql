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
INSERT INTO `comments` VALUES (1,1,2,'Nice video!','2019-01-11 00:02:15','2019-01-11 00:02:15'),(5,11,2,'Love it and thanks posting your ad..BTW do you have a company name? Or contact number where people came reach you. ','2019-02-06 09:11:58','2019-02-06 09:11:58'),(9,15,26,'Test','2019-05-28 00:05:02','2019-05-28 00:05:02'),(10,34,26,'','2019-05-31 20:44:34','2019-05-31 20:44:34');
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
INSERT INTO `impressions` VALUES (5,'Listing',1,2,'listings','show',NULL,'9a0ebdbef62b8ec06c4fdf077c1a8fd7d0725d5f488b0bc6ca59ca8415211c56','96.58.200.191','e0af1611361374e38f67428c91af6908',NULL,'http://34.238.230.98:3000/categories/1',NULL,'2019-01-11 00:01:55','2019-01-11 00:01:55'),(10,'Listing',1,1,'listings','show',NULL,'10dfea1b5b0e320275ad560533583171a976a7dabe0cc8749f89d006b5e388e9','65.35.89.87','feaca9b57f098401d1b2e0dfff3d0c39',NULL,'http://connechub.com/categories/1',NULL,'2019-01-12 02:57:28','2019-01-12 02:57:28'),(39,'Listing',8,3,'listings','show',NULL,'0795854e4e4d93f23065335055d27b4f4f23b986ff7dc55d482f2114a808f559','174.228.4.40','0008b06ff65ad64a7556bfd72a952bcf',NULL,'http://www.connechub.com/listings/new',NULL,'2019-01-20 21:14:29','2019-01-20 21:14:29'),(40,'Listing',8,2,'listings','show',NULL,'ed44fe211d21d4cbfeb76b792ca61021d7fc923bc51ac3d1109e5f252b4d2c1e','2600:1006:b020:451a:8c92:b0b5:6724:2725','10c1db3d5b54ead4925e3a66a4b323ab',NULL,'http://www.connechub.com/categories/9',NULL,'2019-01-20 21:57:04','2019-01-20 21:57:04'),(41,'Listing',8,NULL,'listings','show',NULL,'5e560ea38e6a94599e56fb109f5779efd9859966f9e31bb97b3aae5cdd740b23','96.58.200.191','17e47333e7a882b5a413c6bbb2ee8960',NULL,'http://www.connechub.com/categories/9',NULL,'2019-01-21 00:50:24','2019-01-21 00:50:24'),(42,'Listing',8,2,'listings','show',NULL,'46dfc448c9be8dbd0863594df4377f4282eca89c2e50b87b77ff9ed83ede66f2','96.58.200.191','c51d677ad8a29537bba059c9b184887a',NULL,'http://www.connechub.com/categories/9',NULL,'2019-01-21 00:52:08','2019-01-21 00:52:08'),(43,'Listing',8,NULL,'listings','show',NULL,'5f7bb408b5968cc7cc7020efd4d748ae07cf11ef574808e2776c4d3dae29daca','96.58.200.191','46092d5ac22c786ac194c3a53c0a445a',NULL,'http://www.connechub.com/categories/9',NULL,'2019-01-21 16:22:47','2019-01-21 16:22:47'),(44,'Listing',8,3,'listings','show',NULL,'68bdf7883cd75cda57db9deb0d12f40b15b92d63dc3a912d0bb838e16257d7ec','96.58.200.191','aa868cda3e70b111802320b9382da0bd',NULL,'http://www.connechub.com/jjones',NULL,'2019-01-21 16:25:05','2019-01-21 16:25:05'),(45,'Listing',8,NULL,'listings','show',NULL,'190c6db8bf3ab783d1a2c2351160c445173c3fd2efd6bdd8c59837c0135c47ae','96.58.200.191','ef17600cda1f231ec2dd498cfaef1da9',NULL,'http://www.connechub.com/categories/9',NULL,'2019-01-21 20:28:30','2019-01-21 20:28:30'),(46,'Listing',8,3,'listings','show',NULL,'86a322eef940eb76283c6fc2cc379fde47e889a33247642cde66406fcab1f845','107.77.253.7','6460ff4268a459883a3fe2f3ade38c3d',NULL,'http://www.connechub.com/categories/9',NULL,'2019-01-22 20:38:06','2019-01-22 20:38:06'),(47,'Listing',8,NULL,'listings','show',NULL,'ea9b8cc7db049a6c6f36437436ed6d1f3f57fa618b78f9ea464532de5bd51b59','96.58.200.191','d1b6856fa63dfa29e78e4866d85047e9',NULL,'http://www.connechub.com/categories/9',NULL,'2019-01-23 00:40:13','2019-01-23 00:40:13'),(48,'Listing',1,NULL,'listings','show',NULL,'29900d45c56328558955ccfb789340ac321adf2acd41ad8e34ca24b13e3f64ec','47.205.186.93','f2094585ebfc65ac92414c7dacdb57ad',NULL,'http://www.connechub.com/listings/search?utf8=%E2%9C%93&search=&category=1&commit=SEARCH',NULL,'2019-01-23 04:50:25','2019-01-23 04:50:25'),(59,'Listing',8,2,'listings','show',NULL,'a2c193d569d66b9eb78333c8c4ecce44cea3a85d40b1dc28be4692dfcda13262','96.58.200.191','b29d024f225b47ce7e2f8e44c9e29543',NULL,'http://www.connechub.com/categories/9',NULL,'2019-01-24 22:10:02','2019-01-24 22:10:02'),(72,'Listing',8,NULL,'listings','show',NULL,'e28a322681cb0f80d4f5c04ab0025bc2b1f98a6d26a524e489d9b98302c176f6','47.199.228.45','284997d388f3d97dc3ecbd0db60495d7',NULL,'http://connechub.com/categories/9/subcategories/172',NULL,'2019-01-27 22:39:08','2019-01-27 22:39:08'),(73,'Listing',8,NULL,'listings','show',NULL,'04eecc1fa910819ed95c9dd4c95428453150119f164ffa637b9983e557fbed09','96.58.200.191','fcf3ae68cd1c2638ec889b158c169be3',NULL,'http://www.connechub.com/categories/9',NULL,'2019-01-28 03:50:01','2019-01-28 03:50:01'),(75,'Listing',8,NULL,'listings','show',NULL,'fb62fd95ed11ace0ffed682fa533b17d40d35f79c4a1406eb1669c51718a35df','174.228.23.236','d159bc25b3ea81669062344b3e96a9be',NULL,'http://www.connechub.com/categories/9',NULL,'2019-01-30 02:36:54','2019-01-30 02:36:54'),(77,'Listing',8,NULL,'listings','show',NULL,'8731bbee5ac54ea7df33ca85581e802cc4b895d0744018a032179bcc894903ec','96.58.200.191','723b8cd1c2ebe15fcb5ba3a6f63b396c',NULL,'http://www.connechub.com/categories/9',NULL,'2019-01-31 00:43:05','2019-01-31 00:43:05'),(78,'Listing',8,11,'listings','show',NULL,'44be025dbc22045770bd72dd8022ed14e818943d2b9d4c231dd20dedeb7c621f','47.205.129.43','b0eb165f1da4c99a383c45692b39c659',NULL,'http://www.connechub.com/listings/search?utf8=%E2%9C%93&search=&category=9&commit=SEARCH',NULL,'2019-02-01 01:09:28','2019-02-01 01:09:28'),(79,'Listing',1,12,'listings','show',NULL,'ad8b73de9138b7189d5771146aa8d8f341f37307bdc4c40f52c3d58cc51f24e7','65.35.89.87','ece6008f78c4049282d49c4b671a1e38',NULL,'http://connechub.com/categories/1/subcategories/1',NULL,'2019-02-02 02:13:29','2019-02-02 02:13:29'),(80,'Listing',8,NULL,'listings','show',NULL,'99a17c70c34f502024dec8b2df4cab88850b0d44b9c3fc76c970e249664d77d5','96.58.200.191','d3636e37c081baae17d5a6dc310cb4f6',NULL,'http://www.connechub.com/categories/9/subcategories/172',NULL,'2019-02-02 02:16:08','2019-02-02 02:16:08'),(81,'Listing',8,NULL,'listings','show',NULL,'ca48e3086d0b3117024785848a630efdb04b444ee6b9f0f6201f0d43620158bc','69.171.251.5',NULL,NULL,NULL,NULL,'2019-02-02 16:52:51','2019-02-02 16:52:51'),(83,'Listing',8,NULL,'listings','show',NULL,'5ff9451eedc3b1414156a9a957c3fba714806382fcc7c5f5ffaadcd8d930b1d1','65.34.80.92','52c96735ceaee63408d4cf648522787a',NULL,'http://www.connechub.com/categories/9',NULL,'2019-02-02 21:25:40','2019-02-02 21:25:40'),(84,'Listing',1,2,'listings','show',NULL,'7d5950c7acf85f0b242f1c26a3c9086d6a5bbcd28628e765810f2e3d42360ae9','96.58.200.191','5271668b85bcf489263c07a612097e4b',NULL,'http://www.connechub.com/categories/1',NULL,'2019-02-03 00:40:34','2019-02-03 00:40:34'),(87,'Listing',11,17,'listings','show',NULL,'8e7eb4a2f4dbc11eeda4e43f0d52c84781f42e3109662181c4e929be22939026','107.77.104.16','391902a6507a9499f0a2b68c938a416e',NULL,'http://www.connechub.com/listings/new',NULL,'2019-02-06 03:56:01','2019-02-06 03:56:01'),(91,'Listing',8,NULL,'listings','show',NULL,'a3dbd828971d1543279595e7006d37a985e9ae9c711894eebcc61d8205982043','96.58.200.191','c097cc978a2c0a7793b245e752b674c0',NULL,'http://www.connechub.com/categories/9',NULL,'2019-02-06 05:04:56','2019-02-06 05:04:56'),(94,'Listing',11,NULL,'listings','show',NULL,'733b1808d3d1a1606fee5683585dc02cb48ab5c466e1b2087ebe7711c4f2cf9d','96.58.200.191','9d5bfd85ff03c8bc96df20f5339914f1',NULL,'http://www.connechub.com/categories/10',NULL,'2019-02-06 08:54:53','2019-02-06 08:54:53'),(95,'Listing',11,2,'listings','show',NULL,'5203c8a78dfbcf6f407cf9a72c385c02dc87a9c3a3ad55ba45c4f3637d458f53','96.58.200.191','9b8273ec85bc7ffaa43aff726035994f',NULL,'http://www.connechub.com/categories/10',NULL,'2019-02-06 09:09:27','2019-02-06 09:09:27'),(96,'Listing',11,NULL,'listings','show',NULL,'1dadf941df7437d4a378fb67ce917b2988f8548207fdd4069e8e3329135bbb2c','2600:1006:b007:889d:c8fa:837c:1f8b:7da7','2bc2f88408622ae1e7e0ebca0451204e',NULL,'http://www.connechub.com/categories/10',NULL,'2019-02-06 10:48:15','2019-02-06 10:48:15'),(97,'Listing',11,NULL,'listings','show',NULL,'3548e6d86192bb20d52fdd0c53567b97fefa733d0f516d6f9eb03feb30abcbde','96.58.200.191','b7171ecdcad244b4bc39c12700aa8fb5',NULL,'http://www.connechub.com/categories/10',NULL,'2019-02-06 12:16:37','2019-02-06 12:16:37'),(98,'Listing',11,NULL,'listings','show',NULL,'c5365b78d3b2b97e75be774d8eb2245d9e5642aaa3ad443e5aaabf3c52d37faf','96.58.200.191','00b0241380d12c0c9e76e976793a090d',NULL,'http://www.connechub.com/categories/10',NULL,'2019-02-06 18:57:47','2019-02-06 18:57:47'),(99,'Listing',11,NULL,'listings','show',NULL,'9f630bbabc3d07c533b28b24c26504cb58866513285dc993b220cc5c62a05fd5','50.234.35.172','ae464da91beb0bac1332fd5fceae8af5',NULL,'http://www.connechub.com/categories/10',NULL,'2019-02-07 01:40:08','2019-02-07 01:40:08'),(103,'Listing',11,1,'listings','show',NULL,'a1b9931dd795289874e900d8015b6492249c70ee9c08815013f7986a4c940a1e','65.35.89.87','803d6c9eced90e785a3f9f70dc7655ea',NULL,'http://connechub.com/listings/search?utf8=%E2%9C%93&search=drywall&category=10&commit=SEARCH',NULL,'2019-02-11 01:37:11','2019-02-11 01:37:11'),(108,'Listing',1,NULL,'listings','show',NULL,'6ad245187c87117caab7df0bc2ba83797235a9903fa72c0f3c3114409c46e6e8','65.35.89.87','98520b1df3cda79285cc7319c9e4a97d',NULL,'http://connechub.com/listings/search?utf8=%E2%9C%93&search=&category=1&commit=SEARCH',NULL,'2019-02-15 23:51:32','2019-02-15 23:51:32'),(114,'Listing',11,NULL,'listings','show',NULL,'363a385024b0163a7119285bce69f59003b5ccead41328718a6c21b2d890b8bd','96.58.200.191','7e2c925130d4867d11e0aca780506383',NULL,'http://www.connechub.com/categories/10',NULL,'2019-02-17 22:20:45','2019-02-17 22:20:45'),(121,'Listing',8,2,'listings','show',NULL,'76dea90015890fb511ecb335e63cdc43b81b5a02f7abfa4786695db71e277b69','96.58.200.191','4ef8fdb2426091965c493ca87a27e6ea',NULL,'http://www.connechub.com/jjones',NULL,'2019-02-23 14:18:25','2019-02-23 14:18:25'),(122,'Listing',8,NULL,'listings','show',NULL,'d04af6815764f8e64eb6e65ea4889df2114213425f308f42f2f0b4fdd0a19c94','96.58.200.191','a7e4011e0cd97ff349a022498fbd8ec8',NULL,'http://www.connechub.com/categories/9',NULL,'2019-02-23 14:27:04','2019-02-23 14:27:04'),(127,'Listing',15,11,'listings','show',NULL,'5d286ee12fe14178e6a25fff5653b6816713bd5da770d91c63f954765a87a146','47.205.129.43','83d2e4a7298a3560e567ce1162b10133',NULL,'http://www.connechub.com/listings',NULL,'2019-02-27 00:59:10','2019-02-27 00:59:10'),(128,'Listing',15,NULL,'listings','show',NULL,'a131f27dfbd7abb61a16024d39d44c81dfe51ab8dadc6393bac9357901cad16e','174.228.141.218','8b44979c335c871e7a53a3752969c813',NULL,'http://www.connechub.com/categories/9',NULL,'2019-02-28 01:56:50','2019-02-28 01:56:50'),(129,'Listing',15,2,'listings','show',NULL,'91aa50de537c1dfe85e826be1189b08afb707b5ae0aa1b9a070b9b12bd4c78fa','174.228.141.218','f153738aeb93e7516103714b4221e4ac',NULL,'http://www.connechub.com/categories/9',NULL,'2019-02-28 01:59:04','2019-02-28 01:59:04'),(130,'Listing',15,NULL,'listings','show',NULL,'4460b57a463646f42392f1fab3c783b0ae2c97301c66bbe886ec11f2e04d6cd5','174.228.2.253','83cc672aeb4cc9d14941eddb20711d0a',NULL,'http://www.connechub.com/categories/9',NULL,'2019-03-01 01:44:50','2019-03-01 01:44:50'),(131,'Listing',1,NULL,'listings','show',NULL,'1a4b50fe5aaf8835d33fb2e5afdf76d18c82843c58ac20b6cfbe81391d863454','96.58.200.191','35cfe6ddb72bded3a510ebb2001f69e2',NULL,'http://www.connechub.com/categories/1',NULL,'2019-03-03 01:40:26','2019-03-03 01:40:26'),(132,'Listing',15,11,'listings','show',NULL,'a7e544e65e089a701e184b1c149c39fe168f9737eb8cf11696032c805a6ae428','107.77.68.32','36cbe9babceb7898c56c796b2aead754',NULL,'http://www.connechub.com/Debton2000',NULL,'2019-03-06 00:10:02','2019-03-06 00:10:02'),(133,'Listing',15,NULL,'listings','show',NULL,'02873eca0225718ba72a09df87695ee7b6c15488672489e5da6121ae1a6b8480','96.58.200.191','9a98636398ab88a1ffee7b2dbf324cef',NULL,'http://www.connechub.com/categories/9',NULL,'2019-03-06 02:38:59','2019-03-06 02:38:59'),(134,'Listing',15,NULL,'listings','show',NULL,'9d98dfca3122ceba20c443d6f17f2ec5a1a9be41b625752f11b8f3326534f0ae','96.58.200.191','8b44d59f34c5a2105ff58e9b6de58bb4',NULL,'http://www.connechub.com/categories/9',NULL,'2019-03-06 11:57:56','2019-03-06 11:57:56'),(136,'Listing',15,2,'listings','show',NULL,'5fff2f16a7630dbd8b09bf35ad593faa9c1e72e93d72309e6a3dfc7b89e3a2a0','96.58.200.191','a111b80ad5a36d9c0a42ff8e051e2bfc',NULL,'http://www.connechub.com/categories/9',NULL,'2019-03-08 03:28:53','2019-03-08 03:28:53'),(140,'Listing',8,NULL,'listings','show',NULL,'5f242f3fbdabddd0d005c0c1e9b4b54f9ee4eb5a1c952f10abeb240de95fa088','174.255.198.229','6ff10d9c24cadd3fa0231e320c858a31',NULL,'http://www.connechub.com/categories/9',NULL,'2019-03-10 18:33:52','2019-03-10 18:33:52'),(142,'Listing',15,NULL,'listings','show',NULL,'1ad00305a25cf2bc524c68085c5205c31994183ea6c1f30c714014292eb079eb','96.58.200.191','c633a37c5f54f98306a228f0af60926d',NULL,'http://www.connechub.com/categories/9',NULL,'2019-03-20 17:29:26','2019-03-20 17:29:26'),(143,'Listing',15,NULL,'listings','show',NULL,'39b2addcdb729eb38d2b98e04e26df7818dbfdfe9afd2d91c9dc695e77ac83ca','96.58.200.191','147249c604856957debe807ea9cfdbb1',NULL,'http://www.connechub.com/categories/9',NULL,'2019-03-21 10:42:39','2019-03-21 10:42:39'),(146,'Listing',15,NULL,'listings','show',NULL,'a63fb33a54259703ab0f7b83fcc86fd03514eee79f84b98224132b0eaec6d5ab','96.58.200.191','8264bc04f86200cfddf99b901dfaddfd',NULL,'http://www.connechub.com/categories/9',NULL,'2019-03-28 11:40:25','2019-03-28 11:40:25'),(149,'Listing',15,NULL,'listings','show',NULL,'ed130c3791f4e9097479c6397d74c39576b3f2d14a5114e3ce9951fb33b8426a','96.58.200.191','02350e0c4965d58468c615b9cf2ab2ed',NULL,'http://www.connechub.com/categories/9',NULL,'2019-04-03 01:08:20','2019-04-03 01:08:20'),(150,'Listing',15,2,'listings','show',NULL,'503d1b5a8b289cfb9dcc63275cd701d79cdac6b4392d23ca76466bca3eccdabc','96.58.200.191','a68b1b6f545904034d28bd22e58dcdc3',NULL,'http://www.connechub.com/categories/9',NULL,'2019-04-03 01:09:36','2019-04-03 01:09:36'),(151,'Listing',15,NULL,'listings','show',NULL,'93e8f01b9d2c2a55da99e4216063086fecdbe498b6b9a3067fdf757462808c38','174.228.129.229','5f84b8f04ecc6971aa860e1406fa03d9',NULL,'http://www.connechub.com/categories/9',NULL,'2019-04-03 01:17:08','2019-04-03 01:17:08'),(152,'Listing',15,NULL,'listings','show',NULL,'f80743eacc91713af7548a099fc8e59bc814ec9b3015af4d38b4a1c8492d77a9','96.58.200.191','0e3a6fa00ede308de17f30cc6225ea75',NULL,'http://www.connechub.com/categories/9',NULL,'2019-04-03 23:58:14','2019-04-03 23:58:14'),(154,'Listing',15,NULL,'listings','show',NULL,'4f2c71dc5fe5afb6e92ed3b274855f3d2e8dab8a089c78579ae6a8a3ac928f6e','96.58.200.191','18fb2caa586edf4457d5477a743c002f',NULL,'http://www.connechub.com/categories/9',NULL,'2019-04-04 02:22:04','2019-04-04 02:22:04'),(155,'Listing',15,NULL,'listings','show',NULL,'abd4fe52f5a55a95ff51a894aa00d09ddf47d23f6b970680cbb7e1702fa6b7c3','96.58.200.191','7f3e27d7fe2cf8f92cbb22abbd5f3733',NULL,'http://www.connechub.com/categories/9',NULL,'2019-04-04 23:51:40','2019-04-04 23:51:40'),(156,'Listing',8,2,'listings','show',NULL,'1557a538477ff75f03175088f54c4d20b8b50d4e7567ff08f26aae01b5e2f191','96.58.200.191','632dd1f7d4c68bf57ebf99296baba44f',NULL,'http://www.connechub.com/categories/9',NULL,'2019-04-04 23:53:30','2019-04-04 23:53:30'),(157,'Listing',15,NULL,'listings','show',NULL,'1f8b38dcd1d8ae1cc4e8b46d1893d85d6fce3adb294a088008bf2de6ed027064','96.58.200.191','c2a4b0f6a6236bde7efd317c5551b466',NULL,'http://www.connechub.com/categories/9',NULL,'2019-04-05 02:04:37','2019-04-05 02:04:37'),(158,'Listing',15,NULL,'listings','show',NULL,'d82b44403b480782a77253bcfa53bec89a7e4822a4dbaad8b78adeb7af7af6db','96.58.200.191','7b33c3acb1d0392344085c04571fb136',NULL,'http://www.connechub.com/categories/9',NULL,'2019-04-05 23:43:04','2019-04-05 23:43:04'),(160,'Listing',15,NULL,'listings','show',NULL,'ce09845e9fd700a9484fe095cfd09b1c506840b3548b49d0521a98c3ffa35dc4','96.58.200.191','ac714b5b1534747bfbfbf032cc35a018',NULL,'http://www.connechub.com/categories/9',NULL,'2019-04-06 13:08:47','2019-04-06 13:08:47'),(162,'Listing',15,11,'listings','show',NULL,'3475881a7572d2a2af347d89e565b81aee159fcb55a71d61b6c2af2dcde3b80e','47.205.129.43','48ac8b9a5bd1884059775929a305f0ea',NULL,'http://www.connechub.com/Debton2000',NULL,'2019-04-06 23:55:48','2019-04-06 23:55:48'),(164,'Listing',15,NULL,'listings','show',NULL,'edfa7de04d88605f20752ee1f91a3c2686f62f5345dc471929005963dfaccf3b','96.58.200.191','6cb7486d75f6f0bfa62ce0d91683cc97',NULL,'http://www.connechub.com/categories/9',NULL,'2019-04-08 23:56:01','2019-04-08 23:56:01'),(165,'Listing',15,NULL,'listings','show',NULL,'b4434df6379a058d8f10ff6f8e4c4172577277888f69dfee052d973c0fd52e5a','199.253.243.18','ced7d6dfb0f07603fd6adeb9fb4a7d1b',NULL,'http://www.connechub.com/categories/9',NULL,'2019-04-09 18:52:14','2019-04-09 18:52:14'),(167,'Listing',8,NULL,'listings','show',NULL,'fd22d807209f53c078b78ff8b399878a339f2e0580db2377a18298b015f98af9','199.253.243.18','e9481db4be9514572c0424d563c71b9f',NULL,'http://www.connechub.com/categories/9',NULL,'2019-04-09 20:28:40','2019-04-09 20:28:40'),(171,'Listing',15,NULL,'listings','show',NULL,'dea16f37b2539e8dcedd887e6608eb98d253c63b618b1ba66cc7d99fc9d8c680','199.253.243.18','796753108cbbcb1099b2f5a656da79a0',NULL,'http://www.connechub.com/categories/9',NULL,'2019-04-11 19:04:31','2019-04-11 19:04:31'),(174,'Listing',15,11,'listings','show',NULL,'32ea3de4722d02b4b5dad857d123da4e8ea5209d90156c855f731a9694d7f3fd','47.205.129.43','7725d6dce0a0516f3fd0a89c66c630a8',NULL,'http://www.connechub.com/Debton2000',NULL,'2019-04-16 22:43:24','2019-04-16 22:43:24'),(175,'Listing',15,NULL,'listings','show',NULL,'aec1f1d33747a7561bbac2710dd7339a9df7e67091c866c2f116d992e9b96a16','47.205.129.43','da9729883efbbbd13d0456da41f3a3d9',NULL,'http://m.facebook.com/',NULL,'2019-04-16 22:53:31','2019-04-16 22:53:31'),(178,'Listing',11,NULL,'listings','show',NULL,'3bc3a5967c8bbe714342040552f55fe9b59db3cbc7c5b9d0d34ac82c156f9171','70.125.10.55','cd6156e166124feb7acfe2f374e3d699',NULL,'http://connechub.com/categories/10',NULL,'2019-04-23 00:43:04','2019-04-23 00:43:04'),(179,'Listing',17,1,'listings','show',NULL,'ed4f4e43b6d5ea823fc897ca7e91614b7f72d856cbd8994e2184dfbd33c33221','70.125.10.55','a07ac77040c9b332d5940b3028e2301d',NULL,'http://connechub.com/listings/new',NULL,'2019-04-23 02:54:58','2019-04-23 02:54:58'),(180,'Listing',15,NULL,'listings','show',NULL,'3e18db3ebbeb630af941bedd5755726d401a151d6f282937362e9104b8f34c03','96.58.200.191','c3e36d02266e9f24fa7c508c15a95953',NULL,'http://www.connechub.com/categories/9',NULL,'2019-04-23 03:23:09','2019-04-23 03:23:09'),(181,'Listing',15,NULL,'listings','show',NULL,'8f6fb401683d82094249217b3a6e11a4a7ecddad3b623ca297a8efe9e8d4754f','2603:9000:ec13:1300:17:159c:e137:2bf4','7041be72ff7194272d00b342ac2aa279',NULL,'http://www.connechub.com/categories/9',NULL,'2019-04-24 11:59:14','2019-04-24 11:59:14'),(182,'Listing',1,NULL,'listings','show',NULL,'06e01910fc8bf0add5a8237ae8dfd8251acc9b6d80de895e995086f1ff6ec266','70.125.10.55','cae68c49e6e95d6ded66cc92d4212dcc',NULL,'http://connechub.com/listings/search?utf8=%E2%9C%93&search=test&category=1&commit=SEARCH',NULL,'2019-04-24 22:26:50','2019-04-24 22:26:50'),(184,'Listing',11,NULL,'listings','show',NULL,'2987b9f5b491ca92a11fcc433a368ec8dceb9a8d4bbf2fbec7819c8b7f45651b','174.255.201.175','23584f7e799d0e7c5f8e719f99771443',NULL,'http://www.connechub.com/categories/10',NULL,'2019-04-26 21:15:22','2019-04-26 21:15:22'),(218,'Listing',17,NULL,'listings','show',NULL,'f8eec5688404606c12c523a17d6abdbf104cddd51d0f8ed83ea8053fed89f64f','47.200.23.175','e637a5e242df8f512b392ca0ae7249a4',NULL,'http://connechub.com/categories/2',NULL,'2019-05-10 00:31:13','2019-05-10 00:31:13'),(220,'Listing',17,NULL,'listings','show',NULL,'022d1c14444d9f1c258934ef26599a8c7d54da0eb8a9d149ecd069e6d1fafae5','2603:9000:ec13:1300:8593:5cf9:611a:6a72','d2a86c0af7e28a4545cd395ce9e44c76',NULL,'http://www.connechub.com/categories/2',NULL,'2019-05-11 10:29:29','2019-05-11 10:29:29'),(222,'Listing',1,2,'listings','show',NULL,'ebec68d59a5c4a32864c825650431a3db894d6e5afca232e98b6a00212094ec5','96.58.200.191','c1c738208779410d71a0df59b24e2409',NULL,'http://www.connechub.com/categories/1',NULL,'2019-05-13 04:07:08','2019-05-13 04:07:08'),(225,'Listing',1,2,'listings','show',NULL,'411b7ebbcc89f1adc618b918b6676732d2a515f5a07bd5bca574568d9b56b0e8','2603:9000:ec13:1300:8593:5cf9:611a:6a72','6f6fc3700d20680ba7c4bda95c874d68',NULL,'http://www.connechub.com/test',NULL,'2019-05-14 10:59:13','2019-05-14 10:59:13'),(230,'Listing',27,1,'listings','show',NULL,'491b34e7cdb911ed0d09bd16530b1a30ec55de223007f4412d77123374666060','70.125.10.55','481710fb42cb077b8f73d0b67ba316b2',NULL,'http://connechub.com/listings/new',NULL,'2019-05-19 03:03:45','2019-05-19 03:03:45'),(234,'Listing',27,2,'listings','show',NULL,'d92343ba94cf651a764decfe26e024c4466d925292db1a95922aa6ab51b7fe13','96.58.200.191','8e6c478fc3081353f0fb7423a282902f',NULL,'http://www.connechub.com/categories/1',NULL,'2019-05-19 22:26:28','2019-05-19 22:26:28'),(235,'Listing',28,1,'listings','show',NULL,'ec17832f7b97160bc4de114b9a4c8d8d39c6a70ac6e36f6b31607cc76764fcd3','47.200.23.175','cd7d4b3f5af4ef28c468d6d8a179576a',NULL,'http://connechub.com/listings/new',NULL,'2019-05-27 04:50:24','2019-05-27 04:50:24'),(236,'Listing',28,NULL,'listings','show',NULL,'1e0a7704e419247ce3f3673eee42a4727108373a43a2d79b4ae358d114e0d9ac','96.58.200.191','d55c22273161e1adc4bc53ebc103ccc6',NULL,'http://connechub.com/categories/1',NULL,'2019-05-27 05:19:11','2019-05-27 05:19:11'),(237,'Listing',15,NULL,'listings','show',NULL,'26c26b098a777c0bafb63ab1c08cd741841f4fd407a67cee93828cebcc3257e5','96.58.200.191','901a5b606ae580fe4f7ffc49902c1906',NULL,'http://www.connechub.com/categories/9',NULL,'2019-05-27 19:07:09','2019-05-27 19:07:09'),(238,'Listing',15,26,'listings','show',NULL,'a505636f0862b3135c999101c56ff8d5bb59bd5f89990a3ffdc70304f3f272a3','96.58.200.191','0c4ecdaab1f0419c882b02053b37d7d5',NULL,'http://www.connechub.com/categories/9',NULL,'2019-05-28 00:04:53','2019-05-28 00:04:53'),(242,'Listing',33,26,'listings','show',NULL,'7d6e9a519d9088259645f0633cfb02ce5e9054fa49d0131a21eb75ed917f2a15','96.58.200.191','f53abe93b89b2e7fc626c4b252a331d6',NULL,'http://www.connechub.com/Connechub%20CEO',NULL,'2019-05-28 23:29:09','2019-05-28 23:29:09'),(243,'Listing',34,26,'listings','show',NULL,'b94b2a36e0dc3860a8c80f0552924501fa00786e2379143caeb361c0c47c9ba0','96.58.200.191','c70bc88c112522736a448ac73ab64bd2',NULL,'http://www.connechub.com/listings/new',NULL,'2019-05-29 00:59:27','2019-05-29 00:59:27'),(244,'Listing',32,26,'listings','show',NULL,'c2cfbeb6c5d8b0e519e2ec52bb6aeb30a13554efd41e0581ab2b3d42916c33e2','96.58.200.191','72f923f26d5747f768b5af81e7eb1169',NULL,'http://www.connechub.com/Connechub%20CEO',NULL,'2019-05-29 04:02:01','2019-05-29 04:02:01'),(245,'Listing',15,NULL,'listings','show',NULL,'992ab60df316299df76c21cbb8f65dccf13da342797077bead9b2635eb9a6f10','199.253.243.18','8c051f4a08d9e01f2bd8f1f81c74c680',NULL,'http://www.connechub.com/categories/9',NULL,'2019-05-29 16:06:32','2019-05-29 16:06:32'),(246,'Listing',34,26,'listings','show',NULL,'bd25ec3ed1b2839a6c20277a43a1b46b47562efa010d463cfcd0395f52a1647f','199.253.243.19','e9c1d5496c0af6debf70d505a5b4ab5f',NULL,'http://www.connechub.com/categories/3/subcategories/16',NULL,'2019-05-30 19:50:31','2019-05-30 19:50:31'),(247,'Listing',34,NULL,'listings','show',NULL,'f3512972ee6ef9660284bc9bbb978c3c90e380d6faf7dbb3ceaa914d37b346bf','96.58.200.191','efbfc92faafbadcfb522afe73269ccd1',NULL,'http://www.connechub.com/categories/3',NULL,'2019-05-30 23:01:23','2019-05-30 23:01:23'),(248,'Listing',34,26,'listings','show',NULL,'c3dea81f7561690576a21bdc1818a75a5e73deabd85fe6ffbf0e43a5b080ee81','2603:9000:ec13:1300:3179:e964:a7f9:7edb','f66d8d4e329b5d52ed5e9f0262cd4dd4',NULL,'http://www.connechub.com/categories/3',NULL,'2019-05-31 01:11:52','2019-05-31 01:11:52'),(249,'Listing',34,26,'listings','show',NULL,'45bd6bc909179760fda6cf4b00054de6eb1a36dfb9d75ce77601023ccdc6cbfd','96.58.200.191','b8baa76bf7f167189782a0710d901b7e',NULL,'http://www.connechub.com/categories/3',NULL,'2019-05-31 03:59:56','2019-05-31 03:59:56'),(250,'Listing',34,NULL,'listings','show',NULL,'cdcfed3e07858429499d8f4a9bb4bc4484f62eb18e03223ba1707cbc0f9759c1','96.58.200.191','751e3c296427f03d61d47f25a7e67e4c',NULL,'http://www.connechub.com/categories/3',NULL,'2019-05-31 23:48:27','2019-05-31 23:48:27'),(251,'Listing',34,26,'listings','show',NULL,'dc171f380c4c7a6b822f1aaac435d1cc1f6be26161d573bc44d4eaab7c14861e','96.58.200.191','7e0f6dfedab5d251e85bcac221281dd0',NULL,'http://www.connechub.com/categories/3',NULL,'2019-06-01 03:07:15','2019-06-01 03:07:15'),(255,'Listing',34,26,'listings','show',NULL,'08b9f6ae4557a876efbdd51f5b36adc59398a11f8bc2244dc6b06850940e1af1','96.58.200.191','d57f8187fefd12fed6801a5413376cb0',NULL,'http://www.connechub.com/Connechub%20CEO',NULL,'2019-06-01 18:16:40','2019-06-01 18:16:40'),(256,'Listing',34,26,'listings','show',NULL,'51cbee1cdd6f109f35d38b8f37fa8978d4d016ac1263a55051d358d6eaf00d2b','96.58.200.191','1f0a3cb763876f8f6cc2a93ad6dcbca7',NULL,'http://www.connechub.com/categories/3',NULL,'2019-06-03 01:51:33','2019-06-03 01:51:33');
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
INSERT INTO `listings` VALUES (1,'test','Testing for zip geolocation','Tampa','Florida','33612','20.00',NULL,NULL,'test.com','2019-01-09 01:50:39','2019-01-09 01:50:39',1,1,NULL,NULL,1,'MOVIE.mp4','video/mp4',3302168,'2019-01-09 01:50:39'),(8,'House of Fragrance & Decor','Body oils, Air fresheners, Black soap, Incense, Oil burners and much more \nLocated @: \nTampa Flea Market\n11612 N Nebraska Ave\nTampa, FL 33612','Tampa ','FL','33612','5.00',NULL,NULL,'','2019-01-20 21:14:28','2019-01-24 00:32:02',9,172,28.0564,-82.4428,3,'20190120_160056.mp4','video/mp4',90368622,'2019-01-20 21:14:25'),(11,'drywall finisher','The best you will get!','Dothan','Al','36303','1.00',NULL,NULL,'','2019-02-06 03:56:00','2019-02-06 03:56:00',10,197,31.2484,-85.3756,17,'VID_20190205_133922672.mp4','video/mp4',54825015,'2019-02-06 03:56:00'),(15,'Elite  ES  Jazzy Electric Scooter','Elite  ES  Jazzy Electric Scooter. Slightly used. Works excellent','LAKELAND','FL','33809','1500.00',NULL,NULL,'atorres2kg@aol.com','2019-02-27 00:59:09','2019-02-27 00:59:09',9,4,NULL,NULL,11,'Fizzer_Electric_Wheelchair.mp4','video/3gpp',52761231,'2019-02-27 00:59:09'),(17,'Robot Restaurant','Robot Restaurant is amazing.','Tokyo','Japan','12345','75.00',NULL,NULL,'https://www.tripadvisor.com/','2019-04-23 02:54:54','2019-04-23 02:54:54',2,1,NULL,NULL,1,'test.mp4','video/mp4',9018244,'2019-04-23 02:54:54'),(27,'testing','test desc','Sometown','Fl','12345','1.23',NULL,NULL,'test@connechub.com','2019-05-19 03:03:45','2019-05-19 03:03:45',1,1,27.6648,-81.5158,1,'MVI_6084.MP4','video/mp4',165930175,'2019-05-19 03:03:44'),(28,'Test Title','test desc','Tampa','FL','33613','1.23',NULL,NULL,'test@test.com','2019-05-27 04:50:09','2019-05-27 04:50:09',1,1,NULL,NULL,1,'example.mp4','video/mp4',16982243,'2019-05-27 04:50:09'),(32,'test','Test','Tampa','FL','33626','0.00',NULL,NULL,'ron@connechub.com','2019-05-28 18:48:28','2019-05-28 18:48:28',1,6,NULL,NULL,26,'20190528_140034.mp4','video/mp4',40972045,'2019-05-28 18:48:27'),(33,'test','Test','tampa','fl','33626','70.00',NULL,NULL,'ron@connechub.com','2019-05-28 19:01:01','2019-05-28 19:01:01',9,167,NULL,NULL,26,'20190528_140034.mp4','video/mp4',40972045,'2019-05-28 19:01:01'),(34,'test','Test','Tampa','FL','33626','1630.00 per month',NULL,NULL,'ron@connechub.com','2019-05-29 00:58:06','2019-05-29 00:58:06',3,16,NULL,NULL,26,'20190528_204111.mp4','video/mp4',249541099,'2019-05-29 00:58:05'),(36,'Test Title','test desc','Tampa','FL','33613','1.23',NULL,NULL,'test@test.com','2019-06-02 21:35:30','2019-06-02 21:35:30',1,1,28.087,-82.4699,1,'test_video_360p.mp4','video/mp4',552999,'2019-06-02 21:35:30');
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
INSERT INTO `votes` VALUES (2,1,'Listing',2,'User',1,NULL,1,'2019-01-12 07:00:44','2019-01-12 07:00:44'),(3,8,'Listing',2,'User',1,NULL,1,'2019-01-21 00:52:11','2019-01-21 00:52:11'),(5,11,'Listing',2,'User',1,NULL,1,'2019-02-06 09:09:37','2019-02-06 09:09:37'),(8,17,'Listing',2,'User',1,NULL,1,'2019-05-08 11:51:22','2019-05-08 11:51:22'),(9,34,'Listing',26,'User',1,NULL,1,'2019-05-30 00:18:23','2019-05-30 00:18:23');
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
