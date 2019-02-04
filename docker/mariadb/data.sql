DROP TABLE IF EXISTS `votes`;
CREATE TABLE IF NOT EXISTS `votes` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`votable_id`	integer,
	`votable_type`	varchar(255),
	`voter_id`	integer,
	`voter_type`	varchar(255),
	`vote_flag`	boolean,
	`vote_scope`	varchar(255),
	`vote_weight`	integer,
	`created_at`	datetime,
	`updated_at`	datetime
);
INSERT INTO `votes` (id,votable_id,votable_type,voter_id,voter_type,vote_flag,vote_scope,vote_weight,created_at,updated_at) VALUES (2,1,'Listing',2,'User',1,NULL,1,'2019-01-12 07:00:44.430893','2019-01-12 07:00:44.430893');
INSERT INTO `votes` (id,votable_id,votable_type,voter_id,voter_type,vote_flag,vote_scope,vote_weight,created_at,updated_at) VALUES (3,8,'Listing',2,'User',1,NULL,1,'2019-01-21 00:52:11.064053','2019-01-21 00:52:11.064053');
INSERT INTO `votes` (id,votable_id,votable_type,voter_id,voter_type,vote_flag,vote_scope,vote_weight,created_at,updated_at) VALUES (4,9,'Listing',2,'User',1,NULL,1,'2019-01-24 00:34:13.340535','2019-01-24 00:34:13.340535');


DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`email`	varchar(255) NOT NULL DEFAULT '',
	`encrypted_password`	varchar(255) NOT NULL DEFAULT '',
	`reset_password_token`	varchar(255),
	`reset_password_sent_at`	datetime,
	`remember_created_at`	datetime,
	`sign_in_count`	integer NOT NULL DEFAULT 0,
	`current_sign_in_at`	datetime,
	`last_sign_in_at`	datetime,
	`current_sign_in_ip`	varchar(255),
	`last_sign_in_ip`	varchar(255),
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL,
	`username`	varchar(255),
	`bio`	varchar(255),
	`avatar_file_name`	varchar(255),
	`avatar_content_type`	varchar(255),
	`avatar_file_size`	integer,
	`avatar_updated_at`	datetime
);
INSERT INTO `users` (id,email,encrypted_password,reset_password_token,reset_password_sent_at,remember_created_at,sign_in_count,current_sign_in_at,last_sign_in_at,current_sign_in_ip,last_sign_in_ip,created_at,updated_at,username,bio,avatar_file_name,avatar_content_type,avatar_file_size,avatar_updated_at) VALUES (1,'test@test.com','$2a$11$55LPJotj3bLxv2W9PSPZGelABNBgwyNxsFOpUyIZScDhKgGiIeHwC',NULL,NULL,NULL,6,'2019-01-27 22:41:17.261107','2019-01-17 01:16:19.810392','47.199.228.45','65.35.89.87','2019-01-09 01:22:02.046192','2019-01-27 22:41:17.262007','test',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `users` (id,email,encrypted_password,reset_password_token,reset_password_sent_at,remember_created_at,sign_in_count,current_sign_in_at,last_sign_in_at,current_sign_in_ip,last_sign_in_ip,created_at,updated_at,username,bio,avatar_file_name,avatar_content_type,avatar_file_size,avatar_updated_at) VALUES (2,'davis.ron@hotmail.com','$2a$11$Nl7Yzie1MZf/VqdPvI5G1.Of4QmAp4rxXpCT10mQ.wDdexX2xpHly',NULL,NULL,NULL,41,'2019-02-02 01:04:50.324391','2019-01-27 22:09:52.084383','96.58.200.191','47.199.228.45','2019-01-09 03:05:49.292047','2019-02-02 01:04:50.325180','myconnec','I love to buy, sell and trade anything!!','20934075_10154892561461732_7408660784958975640_o.jpg','image/jpeg',1204116,'2019-01-12 01:05:38.814504');
INSERT INTO `users` (id,email,encrypted_password,reset_password_token,reset_password_sent_at,remember_created_at,sign_in_count,current_sign_in_at,last_sign_in_at,current_sign_in_ip,last_sign_in_ip,created_at,updated_at,username,bio,avatar_file_name,avatar_content_type,avatar_file_size,avatar_updated_at) VALUES (3,'jjones850.jj@gmail.com','$2a$11$hSZC7klM2apdVIEXL54iXOt3lvm6eN769LCib2j0rgEGiz5RR3mPy',NULL,NULL,NULL,8,'2019-01-24 00:31:24.344587','2019-01-22 20:37:03.256009','96.58.200.191','107.77.253.7','2019-01-20 17:32:38.980074','2019-01-24 00:31:24.345392','jjones','House of Fragrance & Decor','27026_110697555627239_8387849_n.jpg','image/jpeg',79544,'2019-01-21 16:29:20.510475');
INSERT INTO `users` (id,email,encrypted_password,reset_password_token,reset_password_sent_at,remember_created_at,sign_in_count,current_sign_in_at,last_sign_in_at,current_sign_in_ip,last_sign_in_ip,created_at,updated_at,username,bio,avatar_file_name,avatar_content_type,avatar_file_size,avatar_updated_at) VALUES (4,'xaviermclean@gmail.com','$2a$11$4hMJvjSgT9BGJpdp8RQ23eBjUi1NskaG5kMWIQ4OxkB6XR.vqFKvi',NULL,NULL,NULL,1,'2019-01-24 05:41:38.664924','2019-01-24 05:41:38.664924','162.233.232.35','162.233.232.35','2019-01-24 05:41:38.651000','2019-01-24 05:41:38.665491','Xaviermclean',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `users` (id,email,encrypted_password,reset_password_token,reset_password_sent_at,remember_created_at,sign_in_count,current_sign_in_at,last_sign_in_at,current_sign_in_ip,last_sign_in_ip,created_at,updated_at,username,bio,avatar_file_name,avatar_content_type,avatar_file_size,avatar_updated_at) VALUES (5,'j_nice33614@yahoo.com','$2a$11$9GlREjpp3HD8oh.tD2QIiObT7EtYbKzluGqQ9jhV8iFqTTkw97MVm',NULL,NULL,NULL,1,'2019-01-24 17:25:34.096094','2019-01-24 17:25:34.096094','66.87.149.112','66.87.149.112','2019-01-24 17:25:34.082739','2019-01-24 17:25:34.096635','Jnice336',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `users` (id,email,encrypted_password,reset_password_token,reset_password_sent_at,remember_created_at,sign_in_count,current_sign_in_at,last_sign_in_at,current_sign_in_ip,last_sign_in_ip,created_at,updated_at,username,bio,avatar_file_name,avatar_content_type,avatar_file_size,avatar_updated_at) VALUES (6,'dontrez89@gmail.com','$2a$11$nv6POw2cKh/HMeBteQrpUOYQinxA9MvuA5ixeLy5HouFBVdjXgPH2',NULL,NULL,NULL,1,'2019-01-24 22:02:32.001308','2019-01-24 22:02:32.001308','71.68.104.225','71.68.104.225','2019-01-24 22:02:31.988279','2019-01-24 22:02:32.001876','Jon89',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `users` (id,email,encrypted_password,reset_password_token,reset_password_sent_at,remember_created_at,sign_in_count,current_sign_in_at,last_sign_in_at,current_sign_in_ip,last_sign_in_ip,created_at,updated_at,username,bio,avatar_file_name,avatar_content_type,avatar_file_size,avatar_updated_at) VALUES (7,'henderson272000@yahoo.com','$2a$11$56zS/zFBUm3SzqRVmcWtDeOxVnqRsvAphxmI3JDMa5buTd9Lfjj.y',NULL,NULL,NULL,1,'2019-01-24 22:35:29.643468','2019-01-24 22:35:29.643468','107.135.198.68','107.135.198.68','2019-01-24 22:35:29.629971','2019-01-24 22:35:29.644075','Deshon',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `users` (id,email,encrypted_password,reset_password_token,reset_password_sent_at,remember_created_at,sign_in_count,current_sign_in_at,last_sign_in_at,current_sign_in_ip,last_sign_in_ip,created_at,updated_at,username,bio,avatar_file_name,avatar_content_type,avatar_file_size,avatar_updated_at) VALUES (8,'rondavis818@gmail.com','$2a$11$8NkWNfxBuhbydhE9ONUJZurnEb4r5RM.pz09ytxloX.ZVuR49U6Bu',NULL,NULL,NULL,1,'2019-01-24 23:34:49.993672','2019-01-24 23:34:49.993672','174.228.129.127','174.228.129.127','2019-01-24 23:34:49.980607','2019-01-24 23:34:49.994233','92ways',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `users` (id,email,encrypted_password,reset_password_token,reset_password_sent_at,remember_created_at,sign_in_count,current_sign_in_at,last_sign_in_at,current_sign_in_ip,last_sign_in_ip,created_at,updated_at,username,bio,avatar_file_name,avatar_content_type,avatar_file_size,avatar_updated_at) VALUES (9,'michaelcjones40@gmail.com','$2a$11$YRKdGEQwWbOrU91XJxdJau8foC/rxecMHm0JiekSEbmuii9Ao.NpC',NULL,NULL,NULL,1,'2019-01-25 01:34:16.432154','2019-01-25 01:34:16.432154','73.7.60.158','73.7.60.158','2019-01-25 01:34:16.419134','2019-01-25 01:34:16.432656','Michael',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `users` (id,email,encrypted_password,reset_password_token,reset_password_sent_at,remember_created_at,sign_in_count,current_sign_in_at,last_sign_in_at,current_sign_in_ip,last_sign_in_ip,created_at,updated_at,username,bio,avatar_file_name,avatar_content_type,avatar_file_size,avatar_updated_at) VALUES (10,'cohila@yahoo.com','$2a$11$CfgGjy740zsBusaJDfWGauYzI55gHk9qV3nqc/km/t0M4DCZR/67S',NULL,NULL,NULL,1,'2019-01-31 05:39:03.157139','2019-01-31 05:39:03.157139','96.58.200.191','96.58.200.191','2019-01-31 05:39:03.144069','2019-01-31 05:39:03.157637','cohila@yahoo.com',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `users` (id,email,encrypted_password,reset_password_token,reset_password_sent_at,remember_created_at,sign_in_count,current_sign_in_at,last_sign_in_at,current_sign_in_ip,last_sign_in_ip,created_at,updated_at,username,bio,avatar_file_name,avatar_content_type,avatar_file_size,avatar_updated_at) VALUES (11,'atorres2kg@aol.com','$2a$11$t0C5lGrsF9G.Xx4nqAtYpO.EMToZ2GwFzrSyjzj8rKavijNS4GYUS',NULL,NULL,NULL,1,'2019-02-01 01:08:00.488483','2019-02-01 01:08:00.488483','47.205.129.43','47.205.129.43','2019-02-01 01:08:00.473885','2019-02-01 01:08:00.489022','Debton2000',NULL,NULL,NULL,NULL,NULL);
DROP TABLE IF EXISTS `subcategories`;
CREATE TABLE IF NOT EXISTS `subcategories` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`name`	varchar(255),
	`category_id`	integer
);
INSERT INTO `subcategories` (id,name,category_id) VALUES (1,'Activities & Events',1);
INSERT INTO `subcategories` (id,name,category_id) VALUES (2,'Jobs',1);
INSERT INTO `subcategories` (id,name,category_id) VALUES (3,'Furniture',1);
INSERT INTO `subcategories` (id,name,category_id) VALUES (4,'Electronics',1);
INSERT INTO `subcategories` (id,name,category_id) VALUES (5,'Books',1);
INSERT INTO `subcategories` (id,name,category_id) VALUES (6,'Activities',1);
INSERT INTO `subcategories` (id,name,category_id) VALUES (7,'Appliances',1);
INSERT INTO `subcategories` (id,name,category_id) VALUES (8,'Churches',2);
INSERT INTO `subcategories` (id,name,category_id) VALUES (9,'Promotions',2);
INSERT INTO `subcategories` (id,name,category_id) VALUES (10,'Announcements',2);
INSERT INTO `subcategories` (id,name,category_id) VALUES (11,'Artists & Musicians',2);
INSERT INTO `subcategories` (id,name,category_id) VALUES (12,'Carpool & Rideshare',2);
INSERT INTO `subcategories` (id,name,category_id) VALUES (13,'Childcare & Babysitting',2);
INSERT INTO `subcategories` (id,name,category_id) VALUES (14,'Garage Sales',2);
INSERT INTO `subcategories` (id,name,category_id) VALUES (15,'Lost & Found',2);
INSERT INTO `subcategories` (id,name,category_id) VALUES (16,'Apartments',3);
INSERT INTO `subcategories` (id,name,category_id) VALUES (17,'Commercial',3);
INSERT INTO `subcategories` (id,name,category_id) VALUES (18,'Homes',3);
INSERT INTO `subcategories` (id,name,category_id) VALUES (19,'Rentals',3);
INSERT INTO `subcategories` (id,name,category_id) VALUES (20,'Vacation',3);
INSERT INTO `subcategories` (id,name,category_id) VALUES (21,'Condos',3);
INSERT INTO `subcategories` (id,name,category_id) VALUES (22,'Farms',3);
INSERT INTO `subcategories` (id,name,category_id) VALUES (23,'Lands',3);
INSERT INTO `subcategories` (id,name,category_id) VALUES (24,'Ranches',3);
INSERT INTO `subcategories` (id,name,category_id) VALUES (25,'Manufactured Homes',3);
INSERT INTO `subcategories` (id,name,category_id) VALUES (26,'Townhomes',3);
INSERT INTO `subcategories` (id,name,category_id) VALUES (27,'Odd Items',4);
INSERT INTO `subcategories` (id,name,category_id) VALUES (28,'The Rarest',4);
INSERT INTO `subcategories` (id,name,category_id) VALUES (29,'Collectables',4);
INSERT INTO `subcategories` (id,name,category_id) VALUES (30,'Antiques',4);
INSERT INTO `subcategories` (id,name,category_id) VALUES (31,'Sale Anything',5);
INSERT INTO `subcategories` (id,name,category_id) VALUES (32,'Campus Life',5);
INSERT INTO `subcategories` (id,name,category_id) VALUES (33,'Events & Community',5);
INSERT INTO `subcategories` (id,name,category_id) VALUES (34,'Jobs pro bono',5);
INSERT INTO `subcategories` (id,name,category_id) VALUES (35,'Hard to Find',5);
INSERT INTO `subcategories` (id,name,category_id) VALUES (36,'Accounting',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (37,'Admin/Clerical',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (38,'Automotive',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (39,'Banking',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (40,'Biotech',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (41,'Business Development',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (42,'Business Opportunity',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (43,'Construction',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (44,'Consultant',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (45,'Customer Service',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (46,'Design',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (47,'Distribution/Shipping',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (48,'Education',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (49,'Engineering',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (50,'Entry Level',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (51,'executive',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (52,'Facilities',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (53,'Finance',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (54,'Franchise',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (55,'General Business',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (56,'General Labor',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (57,'Government/Federal',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (58,'Grocery Stores',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (59,'Health Care',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (60,'Hospitality/Hotel',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (61,'Human Resources',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (62,'Journalism/Newspaper',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (63,'Information Technology',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (64,'Installation',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (65,'Insurance',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (66,'Inventory',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (67,'Legal',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (68,'Legal Admin',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (69,'Maintenance/Repair',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (70,'Management',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (71,'Manufacturing',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (72,'Marketing',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (73,'Media',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (74,'Nonprofit',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (75,'Nurse',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (76,'Other',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (77,'Pharmaceutical',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (78,'Procurement',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (79,'Professional Services',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (80,'Purchasing',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (81,'QA/Quality Control',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (82,'Real Estate',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (83,'Research',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (84,'Restaurant',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (85,'Retail',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (86,'Sales',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (87,'Science',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (88,'Skilled Labor - Trades',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (89,'Social Services',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (90,'Strategy/Planning',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (91,'Supply Chain',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (92,'Telecommunications',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (93,'Training',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (94,'Transportation',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (95,'Veterinary Services',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (96,'Warehouse',6);
INSERT INTO `subcategories` (id,name,category_id) VALUES (167,'Home & Garden',9);
INSERT INTO `subcategories` (id,name,category_id) VALUES (168,'Clothing & Accessories',9);
INSERT INTO `subcategories` (id,name,category_id) VALUES (169,'Flowers & Gifts',9);
INSERT INTO `subcategories` (id,name,category_id) VALUES (170,'Computers',9);
INSERT INTO `subcategories` (id,name,category_id) VALUES (171,'Electronics',9);
INSERT INTO `subcategories` (id,name,category_id) VALUES (172,'Fragrances & Beauty',9);
INSERT INTO `subcategories` (id,name,category_id) VALUES (173,'Jewelry & Watches',9);
INSERT INTO `subcategories` (id,name,category_id) VALUES (174,'Sports & Outdoors',9);
INSERT INTO `subcategories` (id,name,category_id) VALUES (175,'Toys & Baby',9);
INSERT INTO `subcategories` (id,name,category_id) VALUES (176,'Automotive',9);
INSERT INTO `subcategories` (id,name,category_id) VALUES (177,'DVD',9);
INSERT INTO `subcategories` (id,name,category_id) VALUES (178,'Music',9);
INSERT INTO `subcategories` (id,name,category_id) VALUES (179,'Books',9);
INSERT INTO `subcategories` (id,name,category_id) VALUES (180,'Appliances',9);
INSERT INTO `subcategories` (id,name,category_id) VALUES (181,'Video Games',9);
INSERT INTO `subcategories` (id,name,category_id) VALUES (182,'Industrial',9);
INSERT INTO `subcategories` (id,name,category_id) VALUES (183,'Tickets',9);
INSERT INTO `subcategories` (id,name,category_id) VALUES (184,'Musical Instruments',9);
INSERT INTO `subcategories` (id,name,category_id) VALUES (185,'Pets',9);
INSERT INTO `subcategories` (id,name,category_id) VALUES (186,'Accountant',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (187,'Architecture',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (188,'Artists',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (189,'Barber',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (190,'Beauty Salons',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (191,'Building Remodelling',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (192,'Business Planner',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (193,'Taxi Cab/UBER',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (194,'Car Rental',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (195,'Chef',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (196,'Cleaning Services / Maids',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (197,'Home Decor',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (198,'Fitness Instructor',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (199,'Elderly Care',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (200,'IT / Programmer',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (201,'Grant Writer',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (202,'Health Spa',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (203,'Lawn Care',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (204,'Legal Services',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (205,'Limousine',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (206,'Repair / Handyman',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (207,'Marketing Firm',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (208,'nonprofit',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (209,'Home Security',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (210,'Structural Engineering',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (211,'Home Remodelling',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (212,'Auto Repair',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (213,'Tutoring/Education',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (214,'Website Designer',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (215,'Plumber',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (216,'Appliance Repair',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (217,'Dog Walker',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (218,'Pressure Washing',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (219,'Computer Repair',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (220,'Auto Insurance',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (221,'Small Construction',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (222,'Life Insurance',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (223,'Mortgage Refinance',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (224,'Photographers',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (225,'Financial Planner',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (226,'Music Dj & Bands',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (227,'Moving Company',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (228,'Dentist',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (229,'Doctors',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (230,'Party Bus',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (231,'Pawn Shops',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (232,'Gun Shops',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (233,'Laundromat',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (234,'Massage Therapists',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (235,'Garbage Collection',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (236,'Churches',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (237,'Pet Grooming',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (238,'Restaurants',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (239,'Pest Control Services',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (240,'Dumpster Rental',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (241,'Reception Halls',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (242,'Roofing Contractors',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (243,'Tow Truck Service',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (244,'Cash Services',10);
INSERT INTO `subcategories` (id,name,category_id) VALUES (245,'Home & Garden',11);
INSERT INTO `subcategories` (id,name,category_id) VALUES (246,'Clothing & Accessories',11);
INSERT INTO `subcategories` (id,name,category_id) VALUES (247,'Computers',11);
INSERT INTO `subcategories` (id,name,category_id) VALUES (248,'Electronics',11);
INSERT INTO `subcategories` (id,name,category_id) VALUES (249,'Jewelry & Watches',11);
INSERT INTO `subcategories` (id,name,category_id) VALUES (250,'Sports & Outdoors',11);
INSERT INTO `subcategories` (id,name,category_id) VALUES (251,'Toys & Baby',11);
INSERT INTO `subcategories` (id,name,category_id) VALUES (252,'Appliances',11);
INSERT INTO `subcategories` (id,name,category_id) VALUES (253,'Musical Instruments',11);
DROP TABLE IF EXISTS `schema_migrations`;
CREATE TABLE IF NOT EXISTS `schema_migrations` (
	`version`	varchar(255) NOT NULL
);
INSERT INTO `schema_migrations` (version) VALUES ('20170604142516');
INSERT INTO `schema_migrations` (version) VALUES ('20170115064606');
INSERT INTO `schema_migrations` (version) VALUES ('20161207014918');
INSERT INTO `schema_migrations` (version) VALUES ('20170102181123');
INSERT INTO `schema_migrations` (version) VALUES ('20170102184838');
INSERT INTO `schema_migrations` (version) VALUES ('20161201024935');
INSERT INTO `schema_migrations` (version) VALUES ('20161212014031');
INSERT INTO `schema_migrations` (version) VALUES ('20170101202741');
INSERT INTO `schema_migrations` (version) VALUES ('20161225022029');
INSERT INTO `schema_migrations` (version) VALUES ('20170115041643');
INSERT INTO `schema_migrations` (version) VALUES ('20161213050924');
INSERT INTO `schema_migrations` (version) VALUES ('20161211133837');
INSERT INTO `schema_migrations` (version) VALUES ('20161207004617');
INSERT INTO `schema_migrations` (version) VALUES ('20190122015635');
INSERT INTO `schema_migrations` (version) VALUES ('20190122015640');
DROP TABLE IF EXISTS `models`;
CREATE TABLE IF NOT EXISTS `models` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`email`	varchar(255) NOT NULL DEFAULT '',
	`encrypted_password`	varchar(255) NOT NULL DEFAULT '',
	`reset_password_token`	varchar(255),
	`reset_password_sent_at`	datetime,
	`remember_created_at`	datetime,
	`sign_in_count`	integer NOT NULL DEFAULT 0,
	`current_sign_in_at`	datetime,
	`last_sign_in_at`	datetime,
	`current_sign_in_ip`	varchar(255),
	`last_sign_in_ip`	varchar(255),
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL
);
DROP TABLE IF EXISTS `listings`;
CREATE TABLE IF NOT EXISTS `listings` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`title`	varchar(255),
	`description`	text,
	`city`	varchar(255),
	`state`	varchar(255),
	`zipcode`	varchar(255),
	`price`	varchar(255),
	`address1`	varchar(255),
	`address2`	varchar(255),
	`ademail`	varchar(255),
	`created_at`	datetime,
	`updated_at`	datetime,
	`category_id`	integer,
	`subcategory_id`	integer,
	`latitude`	float,
	`longitude`	float,
	`user_id`	integer,
	`pin_image_file_name`	varchar(255),
	`pin_image_content_type`	varchar(255),
	`pin_image_file_size`	integer,
	`pin_image_updated_at`	datetime
);
INSERT INTO `listings` (id,title,description,city,state,zipcode,price,address1,address2,ademail,created_at,updated_at,category_id,subcategory_id,latitude,longitude,user_id,pin_image_file_name,pin_image_content_type,pin_image_file_size,pin_image_updated_at) VALUES (1,'test','Testing for zip geolocation','Tampa','Florida','33612','20.00',NULL,NULL,'test.com','2019-01-09 01:50:39.290471','2019-01-09 01:50:39.290471',1,1,NULL,NULL,1,'MOVIE.mp4','video/mp4',3302168,'2019-01-09 01:50:39.245464');
INSERT INTO `listings` (id,title,description,city,state,zipcode,price,address1,address2,ademail,created_at,updated_at,category_id,subcategory_id,latitude,longitude,user_id,pin_image_file_name,pin_image_content_type,pin_image_file_size,pin_image_updated_at) VALUES (8,'House of Fragrance & Decor','Body oils, Air fresheners, Black soap, Incense, Oil burners and much more 
Located @: 
Tampa Flea Market
11612 N Nebraska Ave
Tampa, FL 33612','Tampa ','FL','33612','5.00',NULL,NULL,'','2019-01-20 21:14:28.817718','2019-01-24 00:32:02.451467',9,172,28.0563834,-82.4427769,3,'20190120_160056.mp4','video/mp4',90368622,'2019-01-20 21:14:25.820155');
INSERT INTO `listings` (id,title,description,city,state,zipcode,price,address1,address2,ademail,created_at,updated_at,category_id,subcategory_id,latitude,longitude,user_id,pin_image_file_name,pin_image_content_type,pin_image_file_size,pin_image_updated_at) VALUES (9,'Olympus OM-D E-M5 16.1 MP Digital Camera Black Micro 4/3 Mount','The silver Olympus OM-D E-M5 is a camera with an effective pixel resolution of 16.1 MP. The digital camera features an electronic viewfinder that enables users to view the shutter speed, aperture, exposure compensation value, and the spot metering area, among many other options. This Olympus camera also features a live-view option so that users can see what is being shot or recorded as it happens. The body is made of a magnesium alloy material, and it offers 24 screen modes to choose from. 

I am also including three vintage lens 

- 50mm 
- 28mm
- 35 - 105mm

In addition, editing can take place right on the screen of the Olympus OM-D E-M5. Some of the other features on this 16.1 MP camera include a 9-fps shooting sequence option, an internal flash, a four-channel wireless flash system, and a touch panel LCD monitor. The Olympus camera also offers five aspect ratios in order to select the proper format for the task at hand. 

Overall, this Olympus camera comes loaded with features to make taking high-definition digital photos and videos easy.

Product Identifiers
Brand	Olympus
Model	E-M5

Product Key Features
Battery Type	Lithium-Ion
Color	Silver
Series	Olympus OM-D
Type	Mirrorless Interchangeable Lens
Connectivity	USB
Megapixels	16.1MP

Dimensions
Weight	13oz.
Width	4.8in.
Height	3.5in.
Depth	1.7in.

Additional Product Features
Viewfinder Type	Electronic
Exterior Color	Black
Viewfinder Magnification	0.92x
MAX Video Resolution	1920x1080
Still Image Format	Raw + JPEG
Touchscreen	Yes
Sensor Resolution	16.1MP
Features	16:9 Widescreen Mode, USB, 1080i Full HD Movie Recording, High Iso NR
Camera Type	Mirrorless Interchangeable Lens
Display Type	OLED
Sensor Type	Mos
Screen Size	3in.
Light Sensitivity	200-25600, Auto
Waterproof	Yes
Viewfinder-Field Coverage	100%
Lens for Sd	Body only
Additional Features	16:9 Widescreen Mode, USB, 1080i Full HD Movie Recording, High Iso NR
Display Size	3in.
Supported Flash Memory	SDHC Card, SDXC Memory Card, SDHC Memory Card, Eye-Fi Card, SDXC Card, SD Memory Card
Focus Adjustment	Autofocus & Manual Focus','Tampa','FL','33626','150.00',NULL,NULL,'www.connechub.com','2019-01-24 00:25:46.474673','2019-01-24 00:25:46.474673',9,171,28.0658088,-82.6159271,2,'MVI_6086.MP4','video/mp4',73882537,'2019-01-24 00:25:45.883004');
DROP TABLE IF EXISTS `impressions`;
CREATE TABLE IF NOT EXISTS `impressions` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`impressionable_type`	varchar(255),
	`impressionable_id`	integer,
	`user_id`	integer,
	`controller_name`	varchar(255),
	`action_name`	varchar(255),
	`view_name`	varchar(255),
	`request_hash`	varchar(255),
	`ip_address`	varchar(255),
	`session_hash`	varchar(255),
	`message`	text,
	`referrer`	text,
	`params`	text,
	`created_at`	datetime,
	`updated_at`	datetime
);
INSERT INTO `impressions` (id,impressionable_type,impressionable_id,user_id,controller_name,action_name,view_name,request_hash,ip_address,session_hash,message,referrer,params,created_at,updated_at) VALUES (5,'Listing',1,2,'listings','show',NULL,'9a0ebdbef62b8ec06c4fdf077c1a8fd7d0725d5f488b0bc6ca59ca8415211c56','96.58.200.191','e0af1611361374e38f67428c91af6908',NULL,'http://34.238.230.98:3000/categories/1',NULL,'2019-01-11 00:01:55.426615','2019-01-11 00:01:55.426615');
INSERT INTO `impressions` (id,impressionable_type,impressionable_id,user_id,controller_name,action_name,view_name,request_hash,ip_address,session_hash,message,referrer,params,created_at,updated_at) VALUES (10,'Listing',1,1,'listings','show',NULL,'10dfea1b5b0e320275ad560533583171a976a7dabe0cc8749f89d006b5e388e9','65.35.89.87','feaca9b57f098401d1b2e0dfff3d0c39',NULL,'http://connechub.com/categories/1',NULL,'2019-01-12 02:57:28.754438','2019-01-12 02:57:28.754438');
INSERT INTO `impressions` (id,impressionable_type,impressionable_id,user_id,controller_name,action_name,view_name,request_hash,ip_address,session_hash,message,referrer,params,created_at,updated_at) VALUES (39,'Listing',8,3,'listings','show',NULL,'0795854e4e4d93f23065335055d27b4f4f23b986ff7dc55d482f2114a808f559','174.228.4.40','0008b06ff65ad64a7556bfd72a952bcf',NULL,'http://www.connechub.com/listings/new',NULL,'2019-01-20 21:14:29.273280','2019-01-20 21:14:29.273280');
INSERT INTO `impressions` (id,impressionable_type,impressionable_id,user_id,controller_name,action_name,view_name,request_hash,ip_address,session_hash,message,referrer,params,created_at,updated_at) VALUES (40,'Listing',8,2,'listings','show',NULL,'ed44fe211d21d4cbfeb76b792ca61021d7fc923bc51ac3d1109e5f252b4d2c1e','2600:1006:b020:451a:8c92:b0b5:6724:2725','10c1db3d5b54ead4925e3a66a4b323ab',NULL,'http://www.connechub.com/categories/9',NULL,'2019-01-20 21:57:04.364096','2019-01-20 21:57:04.364096');
INSERT INTO `impressions` (id,impressionable_type,impressionable_id,user_id,controller_name,action_name,view_name,request_hash,ip_address,session_hash,message,referrer,params,created_at,updated_at) VALUES (41,'Listing',8,NULL,'listings','show',NULL,'5e560ea38e6a94599e56fb109f5779efd9859966f9e31bb97b3aae5cdd740b23','96.58.200.191','17e47333e7a882b5a413c6bbb2ee8960',NULL,'http://www.connechub.com/categories/9',NULL,'2019-01-21 00:50:24.985576','2019-01-21 00:50:24.985576');
INSERT INTO `impressions` (id,impressionable_type,impressionable_id,user_id,controller_name,action_name,view_name,request_hash,ip_address,session_hash,message,referrer,params,created_at,updated_at) VALUES (42,'Listing',8,2,'listings','show',NULL,'46dfc448c9be8dbd0863594df4377f4282eca89c2e50b87b77ff9ed83ede66f2','96.58.200.191','c51d677ad8a29537bba059c9b184887a',NULL,'http://www.connechub.com/categories/9',NULL,'2019-01-21 00:52:08.412975','2019-01-21 00:52:08.412975');
INSERT INTO `impressions` (id,impressionable_type,impressionable_id,user_id,controller_name,action_name,view_name,request_hash,ip_address,session_hash,message,referrer,params,created_at,updated_at) VALUES (43,'Listing',8,NULL,'listings','show',NULL,'5f7bb408b5968cc7cc7020efd4d748ae07cf11ef574808e2776c4d3dae29daca','96.58.200.191','46092d5ac22c786ac194c3a53c0a445a',NULL,'http://www.connechub.com/categories/9',NULL,'2019-01-21 16:22:47.677746','2019-01-21 16:22:47.677746');
INSERT INTO `impressions` (id,impressionable_type,impressionable_id,user_id,controller_name,action_name,view_name,request_hash,ip_address,session_hash,message,referrer,params,created_at,updated_at) VALUES (44,'Listing',8,3,'listings','show',NULL,'68bdf7883cd75cda57db9deb0d12f40b15b92d63dc3a912d0bb838e16257d7ec','96.58.200.191','aa868cda3e70b111802320b9382da0bd',NULL,'http://www.connechub.com/jjones',NULL,'2019-01-21 16:25:05.338459','2019-01-21 16:25:05.338459');
INSERT INTO `impressions` (id,impressionable_type,impressionable_id,user_id,controller_name,action_name,view_name,request_hash,ip_address,session_hash,message,referrer,params,created_at,updated_at) VALUES (45,'Listing',8,NULL,'listings','show',NULL,'190c6db8bf3ab783d1a2c2351160c445173c3fd2efd6bdd8c59837c0135c47ae','96.58.200.191','ef17600cda1f231ec2dd498cfaef1da9',NULL,'http://www.connechub.com/categories/9',NULL,'2019-01-21 20:28:30.893267','2019-01-21 20:28:30.893267');
INSERT INTO `impressions` (id,impressionable_type,impressionable_id,user_id,controller_name,action_name,view_name,request_hash,ip_address,session_hash,message,referrer,params,created_at,updated_at) VALUES (46,'Listing',8,3,'listings','show',NULL,'86a322eef940eb76283c6fc2cc379fde47e889a33247642cde66406fcab1f845','107.77.253.7','6460ff4268a459883a3fe2f3ade38c3d',NULL,'http://www.connechub.com/categories/9',NULL,'2019-01-22 20:38:06.778527','2019-01-22 20:38:06.778527');
INSERT INTO `impressions` (id,impressionable_type,impressionable_id,user_id,controller_name,action_name,view_name,request_hash,ip_address,session_hash,message,referrer,params,created_at,updated_at) VALUES (47,'Listing',8,NULL,'listings','show',NULL,'ea9b8cc7db049a6c6f36437436ed6d1f3f57fa618b78f9ea464532de5bd51b59','96.58.200.191','d1b6856fa63dfa29e78e4866d85047e9',NULL,'http://www.connechub.com/categories/9',NULL,'2019-01-23 00:40:13.576867','2019-01-23 00:40:13.576867');
INSERT INTO `impressions` (id,impressionable_type,impressionable_id,user_id,controller_name,action_name,view_name,request_hash,ip_address,session_hash,message,referrer,params,created_at,updated_at) VALUES (48,'Listing',1,NULL,'listings','show',NULL,'29900d45c56328558955ccfb789340ac321adf2acd41ad8e34ca24b13e3f64ec','47.205.186.93','f2094585ebfc65ac92414c7dacdb57ad',NULL,'http://www.connechub.com/listings/search?utf8=%E2%9C%93&search=&category=1&commit=SEARCH',NULL,'2019-01-23 04:50:25.566935','2019-01-23 04:50:25.566935');
INSERT INTO `impressions` (id,impressionable_type,impressionable_id,user_id,controller_name,action_name,view_name,request_hash,ip_address,session_hash,message,referrer,params,created_at,updated_at) VALUES (51,'Listing',9,2,'listings','show',NULL,'736fbb42e39d952107e23d9713fa46a5da0c8b0144fcdf02e2064138adf163ed','96.58.200.191','5f163d37319b6ece9ed3ea1ef274164c',NULL,'http://www.connechub.com/listings/new',NULL,'2019-01-24 00:25:46.660976','2019-01-24 00:25:46.660976');
INSERT INTO `impressions` (id,impressionable_type,impressionable_id,user_id,controller_name,action_name,view_name,request_hash,ip_address,session_hash,message,referrer,params,created_at,updated_at) VALUES (52,'Listing',9,3,'listings','show',NULL,'0200002eec80d1bba0e7b424af1c35c7924be09da2d483f2c2d380a6418aa9b3','96.58.200.191','0205f1dc5656b5ef5e23373035732246',NULL,'http://www.connechub.com/categories/9',NULL,'2019-01-24 00:31:32.421860','2019-01-24 00:31:32.421860');
INSERT INTO `impressions` (id,impressionable_type,impressionable_id,user_id,controller_name,action_name,view_name,request_hash,ip_address,session_hash,message,referrer,params,created_at,updated_at) VALUES (54,'Listing',9,2,'listings','show',NULL,'bcd1796eb7e957c2147bee59ee8186d3ab72876fe1abbef22188babd3de88bf0','96.58.200.191','f27a4e0e8afcf46b88e8752003e923e1',NULL,'http://www.connechub.com/myconnec',NULL,'2019-01-24 00:34:02.441332','2019-01-24 00:34:02.441332');
INSERT INTO `impressions` (id,impressionable_type,impressionable_id,user_id,controller_name,action_name,view_name,request_hash,ip_address,session_hash,message,referrer,params,created_at,updated_at) VALUES (55,'Listing',9,2,'listings','show',NULL,'cbfb071be6e894773e6cf86287b1eee2b58f61b26a98b8abb78a004138092c6c','96.58.200.191','b348693784b593fceb178965203490b4',NULL,'http://www.connechub.com/categories/9',NULL,'2019-01-24 03:15:57.380388','2019-01-24 03:15:57.380388');
INSERT INTO `impressions` (id,impressionable_type,impressionable_id,user_id,controller_name,action_name,view_name,request_hash,ip_address,session_hash,message,referrer,params,created_at,updated_at) VALUES (56,'Listing',9,NULL,'listings','show',NULL,'b6fe1613873d0dde5a6a98e86bef61aace562c3a6dc5cd6bc926af2b5ab6ede2','96.58.200.191','081ef012563ce3f8c8e1c0bbb2c06f83',NULL,'http://www.connechub.com/listings/9',NULL,'2019-01-24 03:21:09.907291','2019-01-24 03:21:09.907291');
INSERT INTO `impressions` (id,impressionable_type,impressionable_id,user_id,controller_name,action_name,view_name,request_hash,ip_address,session_hash,message,referrer,params,created_at,updated_at) VALUES (57,'Listing',9,5,'listings','show',NULL,'5dae2e301d4593b0b7db7737c63c6015f6457143701efe68483f16d875ab39a3','66.87.149.112','de47aee7d73f2de015a9882a811314a9',NULL,'http://www.connechub.com/categories/9',NULL,'2019-01-24 17:26:34.743994','2019-01-24 17:26:34.743994');
INSERT INTO `impressions` (id,impressionable_type,impressionable_id,user_id,controller_name,action_name,view_name,request_hash,ip_address,session_hash,message,referrer,params,created_at,updated_at) VALUES (58,'Listing',9,NULL,'listings','show',NULL,'005747c8ca8d9c90c3cc560bffbc457f28643f110e38e87c64f08f56489e5dbc','96.58.200.191','547c6a6260f4761ca38946547cb3c216',NULL,'http://www.connechub.com/categories/9',NULL,'2019-01-24 21:20:49.729434','2019-01-24 21:20:49.729434');
INSERT INTO `impressions` (id,impressionable_type,impressionable_id,user_id,controller_name,action_name,view_name,request_hash,ip_address,session_hash,message,referrer,params,created_at,updated_at) VALUES (59,'Listing',8,2,'listings','show',NULL,'a2c193d569d66b9eb78333c8c4ecce44cea3a85d40b1dc28be4692dfcda13262','96.58.200.191','b29d024f225b47ce7e2f8e44c9e29543',NULL,'http://www.connechub.com/categories/9',NULL,'2019-01-24 22:10:02.910024','2019-01-24 22:10:02.910024');
INSERT INTO `impressions` (id,impressionable_type,impressionable_id,user_id,controller_name,action_name,view_name,request_hash,ip_address,session_hash,message,referrer,params,created_at,updated_at) VALUES (61,'Listing',9,NULL,'listings','show',NULL,'78fb5b1e910f422be3566d1278208a5ae028d5e4062ca4f3a1fb9546f304f62d','2600:1006:b023:825c:188f:cc3a:7237:f708','e7dfbfd217ebefec0b95c77e49745e33',NULL,'http://www.connechub.com/categories/9',NULL,'2019-01-26 02:42:20.497137','2019-01-26 02:42:20.497137');
INSERT INTO `impressions` (id,impressionable_type,impressionable_id,user_id,controller_name,action_name,view_name,request_hash,ip_address,session_hash,message,referrer,params,created_at,updated_at) VALUES (62,'Listing',9,NULL,'listings','show',NULL,'79dd6be66e12ce3b19b80575a5a4c3dd3b5b7d9dddc37433befa4dd4079bb794','174.228.5.42','59b079d28552fbf3cf939609c93f3e16',NULL,'http://www.connechub.com/categories/9',NULL,'2019-01-26 15:19:10.446313','2019-01-26 15:19:10.446313');
INSERT INTO `impressions` (id,impressionable_type,impressionable_id,user_id,controller_name,action_name,view_name,request_hash,ip_address,session_hash,message,referrer,params,created_at,updated_at) VALUES (64,'Listing',9,NULL,'listings','show',NULL,'950b9071478d6b825501f9356aa207c8034a7236205b31121a4ed610a4ca48f9','96.58.200.191','86a356ba175c0c01e56589cc3304500f',NULL,'http://www.connechub.com/categories/9',NULL,'2019-01-27 16:31:13.490563','2019-01-27 16:31:13.490563');
INSERT INTO `impressions` (id,impressionable_type,impressionable_id,user_id,controller_name,action_name,view_name,request_hash,ip_address,session_hash,message,referrer,params,created_at,updated_at) VALUES (65,'Listing',9,2,'listings','show',NULL,'2c03459030182aad8637784e4d5b304a5bca3aaee8d5fc4d954496ac7ec55ca8','96.58.200.191','3ddb0d80ce7f07db3a9738fd93fe68df',NULL,'http://www.connechub.com/myconnec',NULL,'2019-01-27 18:23:33.965237','2019-01-27 18:23:33.965237');
INSERT INTO `impressions` (id,impressionable_type,impressionable_id,user_id,controller_name,action_name,view_name,request_hash,ip_address,session_hash,message,referrer,params,created_at,updated_at) VALUES (70,'Listing',9,2,'listings','show',NULL,'27c09cca6e766aeddeda2185c091d52a1b9ef1d2074c99db6b99306c2d4f7a07','47.199.228.45','c6b9d2d388305afbbfaf7a4693f280d1',NULL,'http://www.connechub.com/myconnec',NULL,'2019-01-27 22:12:00.570440','2019-01-27 22:12:00.570440');
INSERT INTO `impressions` (id,impressionable_type,impressionable_id,user_id,controller_name,action_name,view_name,request_hash,ip_address,session_hash,message,referrer,params,created_at,updated_at) VALUES (71,'Listing',9,NULL,'listings','show',NULL,'2e0be7bde3e05d2ea7460cc6eb5a57cd6c2939819c5b25088fd858fadeedd6d4','174.228.128.70','5dca7a8d71411059869f5ed1ee986e9d',NULL,'http://www.connechub.com/categories/9',NULL,'2019-01-27 22:37:31.455602','2019-01-27 22:37:31.455602');
INSERT INTO `impressions` (id,impressionable_type,impressionable_id,user_id,controller_name,action_name,view_name,request_hash,ip_address,session_hash,message,referrer,params,created_at,updated_at) VALUES (72,'Listing',8,NULL,'listings','show',NULL,'e28a322681cb0f80d4f5c04ab0025bc2b1f98a6d26a524e489d9b98302c176f6','47.199.228.45','284997d388f3d97dc3ecbd0db60495d7',NULL,'http://connechub.com/categories/9/subcategories/172',NULL,'2019-01-27 22:39:08.531699','2019-01-27 22:39:08.531699');
INSERT INTO `impressions` (id,impressionable_type,impressionable_id,user_id,controller_name,action_name,view_name,request_hash,ip_address,session_hash,message,referrer,params,created_at,updated_at) VALUES (73,'Listing',8,NULL,'listings','show',NULL,'04eecc1fa910819ed95c9dd4c95428453150119f164ffa637b9983e557fbed09','96.58.200.191','fcf3ae68cd1c2638ec889b158c169be3',NULL,'http://www.connechub.com/categories/9',NULL,'2019-01-28 03:50:01.568991','2019-01-28 03:50:01.568991');
INSERT INTO `impressions` (id,impressionable_type,impressionable_id,user_id,controller_name,action_name,view_name,request_hash,ip_address,session_hash,message,referrer,params,created_at,updated_at) VALUES (74,'Listing',9,NULL,'listings','show',NULL,'417fa9ef6388fee246913b5fa716900bec32558a7ba9893c86703914942343e9','96.58.200.191','c9ab38bac29c5ebc3e9b65fc7f094a41',NULL,'http://www.connechub.com/categories/9',NULL,'2019-01-29 06:14:40.780796','2019-01-29 06:14:40.780796');
INSERT INTO `impressions` (id,impressionable_type,impressionable_id,user_id,controller_name,action_name,view_name,request_hash,ip_address,session_hash,message,referrer,params,created_at,updated_at) VALUES (75,'Listing',8,NULL,'listings','show',NULL,'fb62fd95ed11ace0ffed682fa533b17d40d35f79c4a1406eb1669c51718a35df','174.228.23.236','d159bc25b3ea81669062344b3e96a9be',NULL,'http://www.connechub.com/categories/9',NULL,'2019-01-30 02:36:54.115324','2019-01-30 02:36:54.115324');
INSERT INTO `impressions` (id,impressionable_type,impressionable_id,user_id,controller_name,action_name,view_name,request_hash,ip_address,session_hash,message,referrer,params,created_at,updated_at) VALUES (76,'Listing',9,NULL,'listings','show',NULL,'cf830d22062e054c99ccebc37d488340e12763f584d0d8ae59e4ef668de5ce5a','174.228.23.236','a6175e2c36692b1a1aae913bab4cfb2c',NULL,'http://www.connechub.com/categories/9',NULL,'2019-01-30 12:29:13.049752','2019-01-30 12:29:13.049752');
INSERT INTO `impressions` (id,impressionable_type,impressionable_id,user_id,controller_name,action_name,view_name,request_hash,ip_address,session_hash,message,referrer,params,created_at,updated_at) VALUES (77,'Listing',8,NULL,'listings','show',NULL,'8731bbee5ac54ea7df33ca85581e802cc4b895d0744018a032179bcc894903ec','96.58.200.191','723b8cd1c2ebe15fcb5ba3a6f63b396c',NULL,'http://www.connechub.com/categories/9',NULL,'2019-01-31 00:43:05.383199','2019-01-31 00:43:05.383199');
INSERT INTO `impressions` (id,impressionable_type,impressionable_id,user_id,controller_name,action_name,view_name,request_hash,ip_address,session_hash,message,referrer,params,created_at,updated_at) VALUES (78,'Listing',8,11,'listings','show',NULL,'44be025dbc22045770bd72dd8022ed14e818943d2b9d4c231dd20dedeb7c621f','47.205.129.43','b0eb165f1da4c99a383c45692b39c659',NULL,'http://www.connechub.com/listings/search?utf8=%E2%9C%93&search=&category=9&commit=SEARCH',NULL,'2019-02-01 01:09:28.175152','2019-02-01 01:09:28.175152');
DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`listing_id`	integer,
	`user_id`	integer,
	`body`	text,
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL
);
INSERT INTO `comments` (id,listing_id,user_id,body,created_at,updated_at) VALUES (1,1,2,'lol
hijacked ','2019-01-11 00:02:15.610350','2019-01-11 00:02:15.616529');
DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`name`	varchar(255)
);
INSERT INTO `categories` (id,name) VALUES (1,'campus');
INSERT INTO `categories` (id,name) VALUES (2,'community');
INSERT INTO `categories` (id,name) VALUES (3,'housing');
INSERT INTO `categories` (id,name) VALUES (4,'h2f');
INSERT INTO `categories` (id,name) VALUES (5,'free');
INSERT INTO `categories` (id,name) VALUES (6,'jobs');
INSERT INTO `categories` (id,name) VALUES (9,'sale');
INSERT INTO `categories` (id,name) VALUES (10,'services');
INSERT INTO `categories` (id,name) VALUES (11,'unboxing');